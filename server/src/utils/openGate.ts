import { Gpio } from "onoff";
import { sleep } from "./sleep";

let lock = false;
export function openGate() {
  if (!Gpio.accessible) {
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
    const remote = new Gpio(18, "out");
    remote.setActiveLow(true);
    return sleep(1000)
      .then(() => {
        try {
          return remote.write(Gpio.LOW);
        } catch (e) {
          return Promise.reject(e);
        }
      })
      .then(() => {
        try {
          remote.unexport();
          lock = false;
          return;
        } catch (e) {
          return Promise.reject(e);
        }
      });
  } catch (e) {
    return Promise.reject(e);
  }
}
