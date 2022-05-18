"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sleep = void 0;
function sleep(millisec) {
    return new Promise((resolve) => setTimeout(resolve, millisec));
}
exports.sleep = sleep;
//# sourceMappingURL=sleep.js.map