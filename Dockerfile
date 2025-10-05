FROM scalified/dind:debian

LABEL maintainer="Scalified <scalified@gmail.com>"

ARG ACTIONS_RUNNER_VERSION="2.328.0"

ENV RUNNER_ALLOW_RUNASROOT="1"

WORKDIR /opt/actions-runner

RUN curl -sSLo actions-runner.tar.gz "https://github.com/actions/runner/releases/download/v${ACTIONS_RUNNER_VERSION}/actions-runner-linux-x64-${ACTIONS_RUNNER_VERSION}.tar.gz" \
    && tar -zxvf actions-runner.tar.gz \
    && rm -rf actions-runner.tar.gz

COPY rootfs /

