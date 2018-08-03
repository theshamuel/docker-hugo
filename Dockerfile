FROM alpine:3.4

LABEL maintainer="Alex Gladkikh <theshamuel@gmail.com>"


ENV HUGO_VERSION=0.46
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit
ADD scripts/entrypoint.sh /entrypoint.sh
RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache curl && \
    apk add --no-cache git openssh && \
    apk add --no-cache python && \
    apk add --no-cache py-pip && \
    pip install --upgrade pip && \
    apk add --update --no-cache tzdata openssl && \
    mkdir -p /${SITE_NAME} && \
    mkdir -p /blog.${SITE_NAME} && \
    curl -Lko /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -zxf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp && \
    mkdir -p /usr/local/sbin && \
    mv /tmp/hugo /usr/local/sbin/hugo && \
    ln -s /usr/local/hugo/hugo /usr/local/bin/hugo && \
    chmod +x /entrypoint.sh && \
    rm -rf /tmp/hugo_${HUGO_VERSION}_linux_amd64 && \
    rm -rf /var/cache/apk/*



EXPOSE 1313



CMD ["/entrypoint.sh"]
