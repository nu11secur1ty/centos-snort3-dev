# centos-snort3-dev
# WORKING...
Snort++ build quick start (inside the container) with unit test support:


- - - Run docker

```bash
docker run -t -i nu11secur1ty/centos-snort3-dev /bin/bash
```
# building...

```
cd $HOME
git clone https://github.com/cpputest/cpputest.git
cd cpputest
mkdir obj
cd obj
cmake -DC++11=ON ..
make -j$(nproc) install

cd $HOME
wget http://www.openfst.org/twiki/pub/FST/FstDownload/openfst-1.7.7.tar.gz
dnf -y install install graphviz
tar -xzf openfst-1.7.7.tar.gz
cd openfst-1.7.7
./configure --enable-far=true
make -j1
make install
echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib" >> ~/.bashrc
source ~/.bashrc
fstinfo --help

cd $HOME
curl -LO https://snort.org/downloads/snortplus/daq-3.0.0-alpha5.tar.gz
tar xf daq-3.0.0-alpha5.tar.gz
cd daq-3.0.0
./configure
make install
ldconfig

cd $HOME
git clone https://github.com/snort3/snort3.git
cd snort3
./configure_cmake.sh --prefix=$HOME/install/snort3 --enable-unit-tests
cd build
make -j$(nproc) install
make -j$(nproc) check

$HOME/install/snort3/bin/snort -V
$HOME/install/snort3/bin/snort --catch-test all
```
