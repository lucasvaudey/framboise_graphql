export function sleep(millisec: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, millisec));
}
