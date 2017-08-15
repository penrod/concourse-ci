
FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y wget git golang \
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/anynines/a9s-go-example.git \
  && pwd; ls -al \
  && PORT=3000 go run a9s-go-example/main.go &

RUN wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.28-linux-amd64 \
  && chmod 755 bosh-cli-2.0.28-linux-amd64 \
  && mkdir -p /usr/local/bin/ \
  && mv bosh-cli-* /usr/local/bin/bosh \
  && echo "Bosh version: $(bosh -v)" \
  && mkdir /opt/concourse_workspace/ \
  && echo "TEST!"
