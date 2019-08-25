FROM mono:6

RUN apt update && apt install -y wget gnupg \
    && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && wget -q https://packages.microsoft.com/config/debian/9/prod.list \
    && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
    && apt install apt-transport-https
    && apt update
    && apt install dotnet-sdk-2.2
    && dotnet tool install -g dotnet-t4
