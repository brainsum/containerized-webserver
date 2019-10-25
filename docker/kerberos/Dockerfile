ARG BASE_IMAGE_TAG

FROM brainsum/containerized-webserver:${BASE_IMAGE_TAG}

# From: https://github.com/fclmman/alpine-nginx-spnego/blob/master/Dockerfile
# See: https://github.com/stnoonan/spnego-http-auth-nginx-module

COPY ["config/", "/etc/nginx/"]

RUN \
    set -ex \
    && apk add --no-cache \
        krb5 \
        krb5-libs \
        krb5-dev \
        ca-certificates \
        libressl \
        pcre \
        zlib \
    && apk add --no-cache --virtual .build-deps \
        git \
        build-base \
        linux-headers \
        libressl-dev \
        pcre-dev \
        zlib-dev \
    && mkdir -p /usr/src/nginx \
    && cd /usr/src/nginx \
    && wget -O nginx.tar.gz https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar -xzf nginx.tar.gz --strip-components=1 \
    && git clone https://github.com/stnoonan/spnego-http-auth-nginx-module.git \
    && ./configure --with-compat --add-dynamic-module=spnego-http-auth-nginx-module \
    && make modules \
    && cp objs/ngx_http_auth_spnego_module.so /etc/nginx/modules/ \
    && apk del .build-deps
