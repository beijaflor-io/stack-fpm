# Example Usage:
# docker run -v `pwd`:/work -e name=stack-fpm -e version=0.1.0.0 beijaflorio/stack-fpm-ci
FROM beijaflorio/fpm
MAINTAINER Pedro Tacla Yamada <tacla.yamada@gmail.com>
ADD ./stack-fpm-ci /stack-fpm-ci
WORKDIR /work
ARG name=package-name
ARG version=0.0.0.1
ENTRYPOINT /stack-fpm-ci
