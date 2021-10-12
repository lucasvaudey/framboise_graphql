"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.openGate = void 0;
const onoff_1 = require("onoff");
const sleep_1 = require("./sleep");
async function openGate() {
    if (!onoff_1.Gpio.accessible) {
        console.log("NO GPIO on device");
        return Promise.resolve(false);
    }
    const remote = new onoff_1.Gpio(18, "out");
    remote.setActiveLow(true);
    await (0, sleep_1.sleep)(1000);
    await remote.write(onoff_1.Gpio.LOW);
    return remote.unexport();
}
exports.openGate = openGate;
//# sourceMappingURL=openGate.js.map