# Automatic
```
wget https://github.com/Zipliks/scripts/blob/master/rust-g-paradise.sh
chmod +x rust-g-paradise.sh
./rust-g-paradise.sh
```
# Manual
### Dependencies
1. Install the Rust compiler's dependencies: `sudo apt -y install gcc-multilib`
2. Install the Rust installer:
```
curl https://sh.rustup.rs -sSfo rustup-init.sh
chmod +x rustup-init.sh
./rustup-init.sh
```
3. Set the default compiler to 32-bit:
```
git clone https://github.com/ss220-space/rust-g-paradise.git
cd rust-g-paradise
rustup override add stable-i686-unknown-linux-gnu
```
4. Make sure all the system libraries are installed:
```
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install zlib1g-dev:i386 libssl-dev:i386 pkg-config:i386
```
5. Update the lexical-core to prevent possible compile errors: `cargo update -p lexical-core`
6. Compile 32-bit binary (BYOND does not support 64):
```
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
```
7. Check that the relevant runtime libraries are installed:
```
find . -type f -name "librust_g.so" -exec ldd {} \;
```
8. Copy `librust_g.so` and `rust_g.dm` to Paradise root folder:
```
find . -type f -name "librust_g.so" -exec cp {} ~/Paradise/ \;
find . -type f -name "rust_g.dm" -exec cp {} ~/Paradise/ \;
```
