FROM ubuntu:22.10

RUN apt upgrade \
    && apt update \
    && apt install --no-install-recommends --no-install-suggests -y \
         vim git curl \
         python3-dev python-is-python3 python3-pip \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
RUN mkdir /usr/local/lib/rust && \
    chmod 0755 ${RUST_HOME}
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh \
    && chmod +x ${RUST_HOME}/rustup.sh \
    && ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path
ENV PATH ${PATH}:${CARGO_HOME}/bin