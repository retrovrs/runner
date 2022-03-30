FROM ubuntu:18.04

# sets the github runner version
# TODO: add auto update script
ARG RUNNER_VERSION="2.289.1"

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
    
COPY scripts/start.sh start.sh
RUN chmod +x start.sh
USER docker

ENTRYPOINT ["./start.sh"]
