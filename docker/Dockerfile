FROM nginx:1.17.3-alpine

LABEL maintainer=mhavelant

HEALTHCHECK --interval=20s --timeout=3s --retries=3 \
    CMD sh /bin/healthcheck.sh

CMD ["sh", "/bin/startup.sh"]

RUN mkdir -p /etc/nginx/sites-enabled

COPY ["bin/", "/bin/"]
COPY ["config/", "/etc/nginx/"]
