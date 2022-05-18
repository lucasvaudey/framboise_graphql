"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.openGate = void 0;
const onoff_1 = require("onoff");
const sleep_1 = require("./sleep");
let lock = false;
function openGate() {
    if (!onoff_1.Gpio.accessible) {
        console.log("NO GPIO on device");
        return Promise.resolve(false);
    }
    if (lock) {
        return;
    }
    try {
        lock = true;
        setTimeout(() => {
            lock = false;
        }, 2500);
        const remote = new onoff_1.Gpio(18, "out");
        remote.setActiveLow(true);
        return (0, sleep_1.sleep)(1000)
            .then(() => {
            try {
                return remote.write(onoff_1.Gpio.LOW);
            }
            catch (e) {
                return Promise.reject(e);
            }
        })
            .then(() => {
            try {
                remote.unexport();
                lock = false;
                return;
            }
            catch (e) {
                return Promise.reject(e);
            }
        });
    }
    catch (e) {
        return Promise.reject(e);
    }
}
exports.openGate = openGate;
//# sourceMappingURL=openGate.js.map