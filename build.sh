
CANISTER="c2pa_backend"
TARGET="wasm32-unknown-unknown"
SRC_DIR="$PWD/src/$CANISTER"
cargo_build_args=(
    --manifest-path "$SRC_DIR/Cargo.toml"
    --target "$TARGET"
    --release
    -j1
)
echo "Starting clean"
dfx stop
dfx start --background --clean
dfx canister create $CANISTER
echo "Building $CANISTER"
cargo build "${cargo_build_args[@]}"
cp target/wasm32-unknown-unknown/release/c2pa_backend.wasm ./c2pa_backend.wasm
echo "Optimizing $CANISTER"
ic-wasm ./c2pa_backend.wasm shrink
gzip c2pa_backend.wasm 
echo "Installing $CANISTER"
dfx canister install c2pa_backend --wasm ./c2pa_backend.wasm.gz
rm c2pa_backend.wasm.gz
