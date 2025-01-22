ARG OPENHANDS_VERSION=0.21.0

FROM docker.all-hands.dev/all-hands-ai/runtime:${OPENHANDS_VERSION}-nikolaik

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG WGET_VERSION=1.*
ARG CURL_VERSION=7.*
ARG GH_VERSION=2.*
# Based on https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl=${CURL_VERSION} \
    && mkdir -p /etc/apt/keyrings \
    && chmod 755 /etc/apt/keyrings \
        && out=$(mktemp) && curl -fsSL -o "$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && tee /etc/apt/keyrings/githubcli-archive-keyring.gpg < "$out" > /dev/null \
    && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install gh=${GH_VERSION} -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Based on https://github.com/casey/just#pre-built-binaries
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin
