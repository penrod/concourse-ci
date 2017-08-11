
FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y wget git \
  && rm -rf /var/lib/apt/lists/*

Run wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.28-linux-amd64 \
  && chmod 755 bosh-cli-2.0.28-linux-amd64 \
  && mkdir -p /usr/local/bin/ \
  && mv bosh-cli-* /usr/local/bin/bosh \
  && echo "Bosh version: $(bosh -v)" \
  && mkdir /opt/concourse_workspace/
