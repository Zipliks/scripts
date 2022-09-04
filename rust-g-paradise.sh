#!/bin/bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
YELLOW='\033[1;32m'
GREEN='\033[0;32m'

echo -e "${GREEN}Install the Rust compiler's dependencies${NOCOLOR}"
sudo apt-get -y install gcc-multilib

echo -e "${GREEN}Installing the ${RED}Rust...${NOCOLOR}"
curl https://sh.rustup.rs -sSfo rustup-init.sh
chmod +x rustup-init.sh
./rustup-init.sh

echo -e "${GREEN}Set the default compiler to ${YELLOW}32-bit${NOCOLOR}"
git clone https://github.com/ss220-space/rust-g-paradise.git
cd rust-g-paradise
rustup override add stable-i686-unknown-linux-gnu

echo -e "${GREEN}Make sure we have all system libraries needed${NOCOLOR}"
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install zlib1g-dev:i386 libssl-dev:i386 pkg-config:i386

echo -e "${GREEN}Update lexical-core to prevent possible compile errors${NOCOLOR}"
cargo update -p lexical-core

echo -e "${GREEN}Download and compile all Rust dependencies${NOCOLOR}"
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu

echo -e "${GREEN}Copy files to the Paradise directory${NOCOLOR}"
find . -type f -name "librust_g.so" -exec ldd {} \;
find . -type f -name "librust_g.so" -exec cp {} ~/Paradise/ \;
find . -type f -name "rust_g.dm" -exec cp {} ~/Paradise/ \;
