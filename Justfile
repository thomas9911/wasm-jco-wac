# global_target := "/home/thomas/builds/rust-target"
global_target := shell('cargo +nightly config get -Z unstable-options build.target-dir --format json-value')

build:
  - cd components/cli-simple && cargo build --release --target wasm32-wasip2
  - cd components/simple && cargo build --release --target wasm32-wasip2
  # - cd components/cli-simple && cargo +nightly build --release --target wasm32-wasip2 --artifact-dir out -Z unstable-options
  # - cd components/simple && cargo +nightly build --release --target wasm32-wasip2 --artifact-dir out -Z unstable-options

build-js:
  - cd components/simple-js && npm install && npm run build

wac:
  # - wac plug -o here.wasm --plug {{global_target}}/wasm32-wasip2/debug/simple.wasm {{global_target}}/wasm32-wasip2/debug/cli_simple.wasm
  - wac plug -o here.wasm --plug {{global_target}}/wasm32-wasip2/release/simple.wasm {{global_target}}/wasm32-wasip2/release/cli_simple.wasm
  # - wac plug -o here.wasm --plug ./components/simple/out/simple.wasm ./components/cli-simple/out/cli_simple.wasm

wac-js:
  - wac plug -o here-js.wasm --plug ./components/simple-js/dist/simple-js.wasm ./components/cli-simple-js/dist/cli-simple-js.wasm

run-wac:
  - wasmtime run -S common here.wasm

run-wac-js:
  - wasmtime run -S common here-js.wasm
