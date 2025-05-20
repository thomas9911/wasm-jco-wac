import { add } from "bb:simple/add@0.1.0";

async function runFunction() {
  console.log(add(189,23));
}

export const run = {
  run: runFunction,
};
