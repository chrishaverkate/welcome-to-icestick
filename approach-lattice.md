# Official Lattice Development
Lattice obviously supports development of the iCEstick however, it's
not straight-forward to get running on modern Linux.

Here are some notes about getting going.

# Development Software
* [iCEcube2](https://www.latticesemi.com/Products/DesignSoftwareAndIP/FPGAandLDS/iCEcube2) design software
* [DDiamond Programmer](https://www.latticesemi.com/Products/DesignSoftwareAndIP/ProgrammingAndConfigurationSw/Programmer)

## iCEcube2 Setup
1. Create an account with Lattice
2. Downlaod

In order to run iCEcube2, I needed to install:

```bash
sudo apt install build-essential zlib1g-dev
cd
mkdir src
wget https://ppa.launchpadcontent.net/linuxuprising/libpng12/ubuntu/pool/main/libp/libpng/libpng_1.2.54.orig.tar.xz
tar Jxfv libpng_1.2.54.orig.tar.xz
cd libpng-1.2.54
./configure
make
sudo make install
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so
sudo ln -s /usr/local/lib/libpng12.so.0.54.0 /usr/lib/libpng12.so.0
```
