FROM mcr.microsoft.com/windows/server:ltsc2022

# sets the github runner version
ARG RUNNER_VERSION="2.289.1"

COPY ./windows/scripts/start.bat start.bat
ENTRYPOINT ["start.bat"]