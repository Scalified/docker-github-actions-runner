FROM debian:bookworm-slim

LABEL maintainer="Scalified <scalified@gmail.com>"

ARG ACTIONS_RUNNER_VERSION="2.328.0"

ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_ALLOW_RUNASROOT="1"

RUN apt update && \
    apt install -y --no-install-recommends \
        ca-certificates \
        curl \
        cron \
        wget \
        git \
        gnupg \
        lsb-release \
        libicu72 \
        supervisor && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update && \
    apt install -y --no-install-recommends \
        docker-ce \
        docker-buildx-plugin && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/actions-runner

RUN curl -sSLo actions-runner.tar.gz "https://github.com/actions/runner/releases/download/v${ACTIONS_RUNNER_VERSION}/actions-runner-linux-x64-${ACTIONS_RUNNER_VERSION}.tar.gz" \
    && tar -zxvf actions-runner.tar.gz \
    && rm -rf actions-runner.tar.gz

COPY rootfs /

ENTRYPOINT ["/usr/local/bin/entrypoint"]

