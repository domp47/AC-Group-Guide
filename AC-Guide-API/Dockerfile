FROM rustlang/rust:nightly as build

COPY ./ ./AC-Guide-API/

RUN cargo build --manifest-path AC-Guide-API/Cargo.toml --release

RUN mkdir -p /build-out

RUN cp ./AC-Guide-API/target/release/ac_guide_api /build-out

FROM ubuntu:bionic

RUN apt-get update && apt-get -y install libpq-dev libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=build /build-out/ac_guide_api /

CMD /ac_guide_api