"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
let statusBarItem = null;
let isEnable = false;
let revealType;
let scrollAllOpenedFiles = false;
const activeEditors = new Map();
function activate(context) {
    onChangeConfiguration();
    setStatus(true);
    context.subscriptions.push(vscode.commands.registerCommand("autoScroll.enable", () => {
        setStatus(true);
    }));
    context.subscriptions.push(vscode.commands.registerCommand("autoScroll.toggle", () => {
        setStatus(!isEnable);
    }));
    vscode.workspace.onDidChangeConfiguration(onChangeConfiguration, this, context.subscriptions);
    vscode.workspace.onDidOpenTextDocument(onOpen, this, context.subscriptions);
    vscode.window.onDidChangeActiveTextEditor(onChangeActiveEditor);
    vscode.workspace.onDidChangeTextDocument(onChange, this, context.subscriptions);
}
exports.activate = activate;
function deactivate() { }
exports.deactivate = deactivate;
function onChangeActiveEditor(editor) {
    if (!scrollAllOpenedFiles) {
        setStatus(activeEditors.has(editor.document.uri.toString()));
    }
}
function onChangeConfiguration() {
    const config = vscode.workspace.getConfiguration("autoscroll");
    const keepLastLineInCenter = config.get("keepLastLineInCenter");
    scrollAllOpenedFiles = config.get("autoScrollAllOpenedFiles");
    if (keepLastLineInCenter) {
        revealType = vscode.TextEditorRevealType.InCenterIfOutsideViewport;
    }
    else {
        revealType = vscode.TextEditorRevealType.Default;
    }
}
function onOpen() {
    if (isEnable === true)
        goToLastLine(vscode.window.activeTextEditor);
}
function onChange(e) {
    if (isEnable === true && !e.document.isDirty)
        goToLastLineForDocument(e.document);
}
function goToLastLineForDocument(changedDoc) {
    vscode.window.visibleTextEditors
        .filter((editor) => editor.document === changedDoc)
        .filter((editor) => scrollAllOpenedFiles ||
        activeEditors.has(editor.document.uri.toString()))
        .forEach(goToLastLine);
}
function goToLastLine(textEditor) {
    if (!textEditor)
        return;
    const position = new vscode.Position(textEditor.document.lineCount - 1, 0);
    textEditor.selection = new vscode.Selection(position, position);
    textEditor.revealRange(new vscode.Range(position, position), revealType);
}
function setStatus(enabled) {
    if (isEnable === enabled) {
        return;
    }
    if (!statusBarItem) {
        statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right, 100);
        statusBarItem.command = "autoScroll.toggle";
        statusBarItem.show();
    }
    if (enabled) {
        statusBarItem.text = "$(check) Auto Scroll";
        goToLastLine(vscode.window.activeTextEditor);
        vscode.window.visibleTextEditors.forEach((editor) => activeEditors.set(editor.document.uri.toString(), editor));
    }
    else {
        statusBarItem.text = "$(x) Auto Scroll";
        vscode.window.visibleTextEditors.forEach((editor) => activeEditors.delete(editor.document.uri.toString()));
    }
    isEnable = enabled;
}
//# sourceMappingURL=extension.js.map