FROM ubuntu:latest

## Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ARG GID=1000
ARG UID=1000
ARG USER=user

RUN groupadd --gid ${GID} ${USER} \
    && useradd --uid ${UID} --gid ${USER} --shell /bin/bash --create-home ${USER} \
    && apt-get update \
    ## Install deps
    && apt-get install -y --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get install -y make node-typescript libglib2.0-bin zip git \
    ## Cleanup
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

## Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

COPY [ "./run-build.sh", "/usr/bin/" ]
RUN chmod +x /usr/bin/run-build.sh

WORKDIR /dist
USER ${USER}
CMD run-build.sh
