FROM mback2k/alpine:latest
RUN apk --no-cache --update upgrade && apk --no-cache add gitolite openssh sed

VOLUME /etc/ssh/keys
VOLUME /var/lib/git

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]
