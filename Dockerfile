FROM alpine:3.5

ADD configure.sh /configure.sh

RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && chmod +x /configure.sh

CMD /configure.sh
