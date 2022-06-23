#! usr/bin/bash

echo "====Getting and Installing Updates===="
apt update
apt upgrade -y

echo "====Installing prerequisites for iPXE===="
#installs pre-req for iPXE
apt install gcc binutils make perl liblzma-dev mtools -y

echo "====Installing git===="
apt install git -y

echo "====Change Directory to /opt/===="
cd /opt/

echo "====Use git to clone iPXE Repo===="
  git clone https://github.com/ipxe/ipxe.git

echo "====cd to ipxe/src===="
cd ipxe/src

echo "====Make the ipxe.efi file for the tftp server"
make bin-x86_64-efi/ipxe.efi

echo "Copy to /opt directory"
cp /opt/ipxe/src/bin-x86_64-efi/ipxe.efi /opt/ipxe.efi
