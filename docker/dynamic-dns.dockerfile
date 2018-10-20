FROM arm32v6/alpine:latest

RUN apk update && \
  apk --no-cache add \
    ca-certificates curl make bash \
    perl \
    perl-digest-sha1 \
    perl-io-socket-ssl \
    perl-json

RUN curl -L http://cpanmin.us | perl - App::cpanminus --no-wget && \
    cpanm --no-wget Data::Validate::IP JSON::Any && \
    rm -rf /config/.cpanm /root/.cpanm

RUN curl -s -o /usr/local/bin/ddclient \
  https://raw.githubusercontent.com/ddclient/ddclient/v3.9.0/ddclient && \
  chmod +x /usr/local/bin/ddclient

RUN mkdir -p /var/cache/ddclient/
