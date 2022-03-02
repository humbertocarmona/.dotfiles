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
exports.onExit = void 0;
const stringio_1 = require("@rauschma/stringio");
function onExit(childProcess) {
    return __awaiter(this, void 0, void 0, function* () {
        return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
            childProcess.once('exit', (code, signal) => __awaiter(this, void 0, void 0, function* () {
                if (code === 0) {
                    resolve(undefined);
                }
                else {
                    if (childProcess.stderr === null) {
                        reject(new Error('Exit with error code: ' + code));
                    }
                    else {
                        const errorOutput = yield stringio_1.readableToString(childProcess.stderr);
                        reject(new Error('Exit with error code: ' + code + '\n' + errorOutput));
                    }
                }
            }));
            childProcess.once('error', (err) => __awaiter(this, void 0, void 0, function* () {
                if (childProcess.stderr === null) {
                    reject(err);
                }
                else {
                    const errorOutput = yield stringio_1.readableToString(childProcess.stderr);
                    reject(`${err.name}: ${err.message} \n` + errorOutput);
                }
            }));
        }));
    });
}
exports.onExit = onExit;
//# sourceMappingURL=on-exit.js.map