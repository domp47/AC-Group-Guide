FROM rustlang/rust:nightly as build

COPY ./AC-Guide-API ./.

RUN cargo build --release

RUN mkdir -p /build-out

RUN cp target/release/ac_guide_api /build-out

FROM ubuntu:bionic

RUN apt-get update && apt-get -y install libpq-dev libssl-dev && rm -rf /var/lib/apt/lists/*

COPY --from=build /build-out/ac_guide_api /

CMD /ac_guide_api