FROM alpine

RUN apk add curl; \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init; \
    chmod u+x rustup-init; \
    sed -i 's/bash/sh/g' rustup-init; \
    ./rustup-init -y --default-toolchain none; \
    cp /root/.cargo/bin/rustup /usr/bin/rustup; \
    mkdir /.rustup; \
    chmod 777 /.rustup

VOLUME /.rustup
