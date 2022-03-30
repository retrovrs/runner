FROM ubuntu:18.04

# sets the github runner version
ARG RUNNER_VERSION="2.289.1"

RUN apt-get update -y && apt-get upgrade -y && useradd -m actionsdockeruser
RUN DEBIAN_FRONTEND=noninteractive TZ=America/New_York apt-get -y install tzdata
RUN apt-get install -y --no-install-recommends \
    curl \
    tar \
    unzip \
    apt-transport-https \
    ca-certificates \
    sudo \
    gpg-agent \
    software-properties-common \
    build-essential \
    zlib1g-dev \
    zstd \
    gettext \
    libcurl4-openssl-dev \
    inetutils-ping \
    jq \
    wget \
    dirmngr \
    openssh-client \
    locales \
    python3-pip \
    python3-setuptools \
    python3 \
    dumb-init \
    build-essential \
    gnupg2 \
    make \
    git \
    gcc \
    g++ \
    openssh-client \
    locales \
    python3-pip \
    python3-setuptools \
    python3 \
    dumb-init

# Install nodejs & yarn
RUN curl -sL https://deb.nodesource.com/setup_17.x | bash -
RUN sudo apt-get install -y nodejs
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install yarn

# Install go
RUN wget https://go.dev/dl/
RUN tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin


RUN cd /home/actionsdockeruser && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

COPY ./linux/scripts/start.sh start.sh
RUN chmod +x start.sh
USER actionsdockeruser

ENTRYPOINT ["./start.sh"]
