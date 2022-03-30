FROM ubuntu:18.04

# sets the github runner version
ARG RUNNER_VERSION="2.289.1"

RUN apt-get update -y && apt-get upgrade -y && useradd -m actionsdockeruser

RUN cd /home/actionsdockeruser && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
    
COPY ./linux/scripts/start.sh start.sh
RUN chmod +x start.sh
USER actionsdockeruser

ENTRYPOINT ["./start.sh"]
