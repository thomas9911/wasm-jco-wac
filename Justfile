# global_target := "/home/thomas/builds/rust-target"
global_target := shell('cargo +nightly config get -Z unstable-options build.target-dir --format json-value')

build:
  - cd components/cli-simple && cargo build --release --target wasm32-wasip2
  - cd components/simple && cargo build --release --target wasm32-wasip2
  # - cd components/cli-simple && cargo +nightly build --release --target wasm32-wasip2 --artifact-dir out -Z unstable-options
  # - cd components/simple && cargo +nightly build --release --target wasm32-wasip2 --artifact-dir out -Z unstable-options

build-js:
  - cd components/simple-js && npm install && npm run build
  - cd components/cli-simple-js && npm install && npm run build
  - cd components/http-simple-js && npm install && npm run build

wac:
  # - wac plug -o here.wasm --plug {{global_target}}/wasm32-wasip2/debug/simple.wasm {{global_target}}/wasm32-wasip2/debug/cli_simple.wasm
  - wac plug -o here.wasm --plug {{global_target}}/wasm32-wasip2/release/simple.wasm {{global_target}}/wasm32-wasip2/release/cli_simple.wasm
  # - wac plug -o here.wasm --plug ./components/simple/out/simple.wasm ./components/cli-simple/out/cli_simple.wasm

wac-js:
  - wac plug -o here-js.wasm --plug ./components/simple-js/dist/simple-js.wasm ./components/cli-simple-js/dist/cli-simple-js.wasm
  - wac plug -o here-http-js.wasm --plug ./components/simple-js/dist/simple-js.wasm ./components/http-simple-js/dist/http-simple-js.wasm

wac-wash:
  - wash build --config-path components/simple-js
  - wash build --config-path components/http-simple-js
  - wac plug -o here-wash-http-js.wasm --plug ./components/simple-js/dist/simple_js_s.wasm ./components/http-simple-js/dist/http_simple_js_s.wasm

run-wac:
  - wasmtime run -S common here.wasm

run-wac-js:
  - wasmtime run -S common here-js.wasm
