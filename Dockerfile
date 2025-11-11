FROM ubuntu:24.04 AS base

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ca-certificates curl unzip tar git \
  golang nodejs npm jq file wget && \
  rm -rf /var/lib/apt/lists/*

ARG TARGETARCH=arm64
ARG OPENCODE_VERSION=1.0.57

WORKDIR /tmp

RUN wget https://github.com/sst/opencode/releases/download/v${OPENCODE_VERSION}/opencode-linux-${TARGETARCH}.zip && \
  unzip opencode-linux-${TARGETARCH}.zip && \
  mv opencode /usr/bin/opencode && \
  chmod +x /usr/bin/opencode && \
  rm -rf /tmp/*

WORKDIR /opt

CMD ["/usr/bin/opencode"]
