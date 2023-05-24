FROM ghcr.io/aliasproject/docker-baseimage-s6-overlay-alpine:3.16

LABEL maintainer="Michael Aguiar <mike@aliasproject.com>"

ENV COMMANDS=

RUN apk --no-cache add dnsmasq

# Copy S6-Overlay Scripts
COPY etc/s6-rc.d/ /etc/s6-overlay/s6-rc.d

# Copy DNSMasq Config
COPY config/test /config/resolver/test

EXPOSE 53 53/udp

# Run S6
ENTRYPOINT ["/init"]