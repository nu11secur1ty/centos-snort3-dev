FROM centos:8
MAINTAINER Ventsislav Varbanovski <penetrateoffensive@gmail.com>

# Add /usr/local/lib and /usr/local/lib64 to the ldconfig caching paths
ADD ldconfig-local.conf /etc/ld.so.conf.d/local.conf

# Enable EPEL for access to updated packages
RUN dnf -y install epel-release && \
# Update the image's pre-installed packages
dnf -y upgrade && \
# Installing tools
dnf -y groupinstall "Development Tools" \
       cmake \
       fribidi-devel \
       git \
       jansson-devel \
       libxml2-devel \
       numactl-devel \
       python3 \
       xz-devel \
# Enable Power tools
dnf -y config-manager --set-enabled PowerTools \
        lame-devel \
        libogg-devel \
        libsamplerate-devel \
        libtheora-devel \
        libvorbis-devel \
        libvpx-devel \
        meson \
        nasm 
        ninja-build \
        opus-devel \
        speex-devel

# Install the Snort build dependencies
dnf install -y \
    bison \
    cmake3 \
    cmake \
    make \
    file \
    flex \
    gcc-c++ \
    hwloc-devel \
    libdnet-devel \
    libpcap-devel \
    libuuid-devel \
    luajit-devel \
    make \
    openssl-devel \
    pcre-devel \
    ragel \
    xz-devel \
    wget \
    curl \
    git \
# Install the Snort developer requirements
    gdb \
    git \
    lcov \
    vim 
# Clean out the Yum cache
RUN dnf clean all

# Add CMake3 to alternatives for cmake
RUN alternatives --install /usr/bin/cmake cmake /usr/bin/cmake3 10
