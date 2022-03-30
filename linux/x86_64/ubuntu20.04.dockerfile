FROM ubuntu:20.04

# sets the github runner version
ARG RUNNER_VERSION="2.289.1"

RUN apt-get update -y && apt-get upgrade -y && useradd -m ubuntu2004_user_docker_gh_self_hosted_runners

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
    
COPY ../scripts/start.sh start.sh
RUN chmod +x start.sh
USER ubuntu2004_user_docker_gh_self_hosted_runners

ENTRYPOINT ["./start.sh"]
