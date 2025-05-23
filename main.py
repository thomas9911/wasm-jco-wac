import wasmtime
import wasmtime.loader

import simple  # type: ignore

def main():
    store = wasmtime.Store()
    component = simple.Root(store)
    assert component.add(store, 1, 2) == 3

if __name__ == "__main__":
    main()


# import wasmtime 

# # Engine with component model enabled
# engine = wasmtime.Engine()
# store = wasmtime.Store(engine)

# # Load a wasm component (.wasm file compiled as a component, not module)
# with open("simple.wasm", "rb") as f:
#     wasm_bytes = f.read()

# # Create a component (requires component-model-compiled WASM)
# component = wasmtime.Component(engine, wasm_bytes)

# # Create a linker and instantiate
# linker = wasmtime.Linker(engine)
# instance = linker.instantiate(store, component)

# # Access the exported functions/values
# exports = instance.exports(store)
# my_func = exports['add']

# # Call the function
# result = my_func(store, 1, 2)
# print(result)
