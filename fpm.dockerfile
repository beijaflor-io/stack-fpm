FROM cybercode/alpine-ruby:2.3
MAINTAINER Pedro Tacla Yamada <tacla.yamada@gmail.com>
# RUN apk add ruby-dev gcc make ruby libffi-dev build-base ruby-bundler && \*/
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers libffi-dev \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
    gem install fpm && \
    apk del build_deps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add --update --upgrade rpm tar binutils
ENTRYPOINT ["fpm"]
