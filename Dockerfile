FROM ghcr.io/mback2k/docker-alpine:latest

RUN addgroup -g 9418 -S git
RUN adduser -u 9418 -h /var/lib/git -s /bin/sh -S -D -G git git

RUN apk --no-cache --update upgrade && apk --no-cache add gitolite openssh sed

EXPOSE 22

VOLUME /etc/ssh/keys
VOLUME /var/lib/git

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/sbin/sshd", "-D", "-e"]
