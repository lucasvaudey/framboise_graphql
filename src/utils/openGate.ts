import { Gpio } from "onoff";
import { sleep } from "./sleep";

export async function openGate() {
  if (!Gpio.accessible) {
    console.log("NO GPIO on device");
    return Promise.resolve(false);
  }
  const remote = new Gpio(18, "out");
  remote.setActiveLow(true);
  await sleep(1000);
  await remote.write(Gpio.LOW);
  return remote.unexport();
}
