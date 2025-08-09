# GitHub Actions Runner Docker Image

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Scalified/helm-jboss/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/github-actions-runner.svg)](https://hub.docker.com/r/scalified/github-actions-runner)
[![Release](https://img.shields.io/github/v/release/Scalified/docker-github-actions-runner?style=flat-square)](https://github.com/Scalified/docker-github-actions-runner/releases/latest)

## Overview

**Docker** image with **Docker-in-Docker (DinD)** and **GitHub Actions Runner** managed by **Supervisor**, enabling container execution without extra setup

## Usage

1. Add a new [`GitHub Actions Runner`](https://github.com/organizations/${GITHUB_ORG_NAME}/settings/actions/runners)
2. Copy the runner token (`$GITHUB_ACTIONS_RUNNER_TOKEN`) from the runner’s details page
3. Run the `scalified/github-actions-runner` Docker image:

```
docker run \
    -d \
    --name ghar-runner-1 \
    --hostname ghar-runner-1 \
    --restart unless-stopped \
    --privileged \
    -e URL=https://github.com/$GITHUB_ORG_NAME \
    -e TOKEN=AAAAAAAAAAAAAAAAAAAAAAAAAAAAA \
    -e LABELS=ghar-runner-1 \
    -e GROUP=group-1 \
    scalified/github-actions-runner
```

| Environment Variable | Description                                                         |
|----------------------|---------------------------------------------------------------------|
| `URL`                | **GitHub** organization URL: `https://github.com/$GITHUB_ORG_NAME`  |
| `TOKEN`              | **GitHub** Actions Runner token displayed after adding a new runner |
| `LABELS`             | Labels assigned to the **GitHub Actions Runner**                    |
| `GROUP`              | **GitHub** Actions Runner group                                     |


---

**Made with ❤️ by [Scalified](http://www.scalified.com)**

