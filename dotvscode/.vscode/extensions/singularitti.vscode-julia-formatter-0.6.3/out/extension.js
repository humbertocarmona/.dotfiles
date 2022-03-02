"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = exports.hunksToEdits = exports.format = exports.alertFormattingError = exports.installDocformatter = exports.buildFormatArgs = exports.getJulia = exports.registration = exports.promiseExec = void 0;
const vscode = require("vscode");
const util = require("util");
const cp = require("child_process");
const diff = require("diff");
const untildify = require("untildify");
const stringio_1 = require("@rauschma/stringio");
const on_exit_1 = require("./on-exit");
exports.promiseExec = util.promisify(cp.exec);
const progressBar = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, -1);
progressBar.text = "Formatting...";
let outputChannel = vscode.window.createOutputChannel("Julia Formatter");
function getJulia() {
    return __awaiter(this, void 0, void 0, function* () {
        // From https://github.com/julia-vscode/julia-vscode/blob/dd94db5/src/settings.ts#L8-L14
        let section = vscode.workspace.getConfiguration("julia");
        let jlpath = section
            ? untildify(section.get("executablePath", "julia"))
            : null;
        if (jlpath === "") {
            jlpath = null;
        }
        // From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L15-L45
        if (jlpath !== null) {
            try {
                yield exports.promiseExec(`"${jlpath}" --version`);
                return jlpath;
            }
            catch (err) {
                vscode.window.showErrorMessage(`
          The Julia path set in the "julia.executablePath" setting is invalid. Check
          the value or clear the setting to use the global Julia installation.
        `);
                throw err;
            }
        }
        try {
            yield exports.promiseExec("julia --version");
            return "julia";
        }
        catch (_a) {
            try {
                yield exports.promiseExec("jl --version");
                return "jl";
            }
            catch (err) {
                vscode.window.showErrorMessage(`
          Julia is either not installed or not properly configured. Check that
          the Julia location is set in VSCode or provided in the system
          environment variables.
        `);
                throw err;
            }
        }
    });
}
exports.getJulia = getJulia;
// From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L54-L72
function buildFormatArgs(path) {
    return __awaiter(this, void 0, void 0, function* () {
        const settings = vscode.workspace.getConfiguration("juliaFormatter");
        const overwriteFlags = settings.get("overwriteFlags");
        const compile = settings.get("compile");
        const margin = settings.get("margin");
        const indent = settings.get("indent");
        const normalizeLineEndings = settings.get("normalizeLineEndings");
        const formattingFlagsKeyMap = {
            alwaysForIn: "always_for_in",
            whitespaceTypedefs: "whitespace_typedefs",
            whitespaceOpsInIndices: "whitespace_ops_in_indices",
            removeExtraNewlines: "remove_extra_newlines",
            importToUsing: "import_to_using",
            pipeToFunctionCall: "pipe_to_function_call",
            shortToLongFunctionDef: "short_to_long_function_def",
            alwaysUseReturn: "always_use_return",
            whitespaceInKwargs: "whitespace_in_kwargs",
            annotateUntypedFieldsWithAny: "annotate_untyped_fields_with_any",
            formatDocstrings: "format_docstrings",
            alignAssignment: "align_assignment",
            alignStructField: "align_struct_field",
            alignConditional: "align_conditional",
            alignPairArrow: "align_pair_arrow",
            conditionalToIf: "conditional_to_if",
        };
        let style;
        switch (settings.get("style")) {
            case "yas":
                style = "YASStyle()";
                break;
            case "blue":
                style = "BlueStyle()";
                break;
            default:
                style = "DefaultStyle()";
                break;
        }
        const optionsList = [
            `style = ${style}`,
            `indent = ${indent}`,
            `margin = ${margin}`,
            `normalize_line_endings = "${normalizeLineEndings}"`,
            ...(overwriteFlags
                ? Object.entries(formattingFlagsKeyMap).map(([jsKey, juliaKwarg]) => {
                    // All flags have defaults set in package.json, so this can't return undefined
                    const value = settings.get(jsKey);
                    // JS and Julia use the same representation for `true` and `false`
                    return `${juliaKwarg} = ${value}`;
                })
                : []),
        ];
        // Remove extra whitespace (helps with tests)
        const options = optionsList.join(",").trim().replace(/\s+/, " ");
        const sysimagePath = settings.get("sysimagePath");
        const systemImageArgs = sysimagePath.length > 0 ? ["--sysimage", sysimagePath] : [];
        const cmdArgs = [
            `--compile=${compile}`,
            ...systemImageArgs,
            "-e",
            `using JuliaFormatter

        function throw_if_parse_err(ex)
            ex.head !== :toplevel && return
            for (i, arg) in pairs(ex.args)
                !(arg isa Expr && (arg.head === :error || arg.head === :incomplete)) && continue
                line_node = ex.args[i-1]
                line = line_node.line
                file = line_node.file
                msg = join(arg.args, ", ")
                throw(Meta.ParseError(
                    replace("Error in line $line of $file: $msg", "\\"" => '\`')
                    )
                )
            end
        end

        const file_contents = read(stdin, String)
        const ex = Meta.parseall(file_contents;
            filename="${vscode.workspace.asRelativePath(path)}"
            )
        throw_if_parse_err(ex)

        function format_stdin()
            print(format_text(file_contents; ${options}))
        end

        format_stdin()
        `,
        ];
        outputChannel.appendLine(`Running Julia with args: ${JSON.stringify(cmdArgs)}`);
        return cmdArgs;
    });
}
exports.buildFormatArgs = buildFormatArgs;
// From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L78-L90
function installDocformatter() {
    return __awaiter(this, void 0, void 0, function* () {
        const julia = yield getJulia();
        try {
            yield exports.promiseExec(`${julia} -e "using Pkg; Pkg.update(); Pkg.add(\\\"JuliaFormatter\\\")"`);
        }
        catch (err) {
            vscode.window.showErrorMessage(`
        Could not install JuliaFormatter automatically. Make sure that it
        is installed correctly and try manually installing with
        'julia -e \"using Pkg; Pkg.add(\\\"JuliaFormatter\\\")\". \n\n Full error: ${err}'.
      `);
            throw err;
        }
    });
}
exports.installDocformatter = installDocformatter;
// From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L101-L132
function alertFormattingError(err) {
    return __awaiter(this, void 0, void 0, function* () {
        outputChannel.appendLine(err.message);
        if (err.message.includes("Package JuliaFormatter not found")) {
            const installButton = "Install Module";
            const response = yield vscode.window.showErrorMessage(`The Julia package 'JuliaFormatter' must be installed to format files.`, installButton);
            if (response === installButton) {
                installDocformatter();
            }
        }
        else {
            const bugReportButton = "Submit Bug Report";
            const err_header_match = err.message.match(/^(ERROR:.*)/m);
            const err_body = err_header_match !== null
                ? err_header_match[1]
                : `Unknown Error: Could not format file. Full error:\n\n${err.message}`;
            const response = yield vscode.window.showErrorMessage(err_body, bugReportButton);
            if (response === bugReportButton) {
                vscode.commands.executeCommand("vscode.open", vscode.Uri.parse("https://github.com/singularitti/vscode-julia-formatter/issues/new"));
            }
        }
    });
}
exports.alertFormattingError = alertFormattingError;
// From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L142-L152
function format(path, content) {
    return __awaiter(this, void 0, void 0, function* () {
        const julia = yield getJulia();
        const args = yield buildFormatArgs(path);
        progressBar.show();
        try {
            const juliaFormatter = cp.spawn(julia, args);
            yield stringio_1.streamWrite(juliaFormatter.stdin, content);
            yield stringio_1.streamEnd(juliaFormatter.stdin);
            const formattedContent = yield stringio_1.readableToString(juliaFormatter.stdout);
            // TODO: capture stderr output from JuliaFormatter on error
            yield on_exit_1.onExit(juliaFormatter);
            // It would be nicer if we could combine these two lines somehow
            const patch = diff.createPatch(path, content, formattedContent);
            const parsed = diff.parsePatch(patch);
            return parsed[0].hunks;
        }
        catch (err) {
            alertFormattingError(err);
            throw err;
        }
        finally {
            progressBar.hide();
        }
    });
}
exports.format = format;
// From https://github.com/iansan5653/vscode-format-python-docstrings/blob/0135de8/src/extension.ts#L159-L180
function hunksToEdits(hunks) {
    return hunks.map((hunk) => {
        const startPos = new vscode.Position(hunk.oldStart - 1, 0);
        const endPos = new vscode.Position(hunk.oldStart - 1 + hunk.oldLines, 0);
        const editRange = new vscode.Range(startPos, endPos);
        const newTextFragments = [];
        hunk.lines.forEach((line, i) => {
            var _a;
            const firstChar = line.charAt(0);
            if (firstChar === " " || firstChar === "+") {
                // hunk.linedelimiters[i] should always exist, but you never know
                newTextFragments.push(line.substr(1), (_a = hunk.linedelimiters[i]) !== null && _a !== void 0 ? _a : "\n");
            }
        });
        const newText = newTextFragments.join("");
        return vscode.TextEdit.replace(editRange, newText);
    });
}
exports.hunksToEdits = hunksToEdits;
function activate(context) {
    vscode.languages.registerDocumentFormattingEditProvider("julia", {
        provideDocumentFormattingEdits(document) {
            return __awaiter(this, void 0, void 0, function* () {
                const hunks = yield format(document.fileName, document.getText());
                return hunksToEdits(hunks);
            });
        },
    });
    outputChannel.appendLine("Initialized Julia Formatter extension");
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
    if (exports.registration) {
        exports.registration.dispose();
    }
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map