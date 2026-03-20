FROM rust:1.83 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/release/aibtc-rust /usr/local/bin/aibtc-rust
CMD ["aibtc-rust", "0x5C2DD513E17C7369730cF918F17C77f01cC67199"]
