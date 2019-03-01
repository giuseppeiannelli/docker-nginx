FROM nginx:stable-alpine

ENV VHOST_ROOT=/app/code/public
ENV VHOST_INDEX=index.php
ENV NGINX_CLIENTMAXBODYSIZE=16M
ENV FPM_LISTEN_ADDRESS=127.0.0.1:9000

COPY docker /docker
COPY docker-nginx-entrypoint /usr/local/bin/docker-nginx-entrypoint
RUN chmod +x /usr/local/bin/docker-nginx-entrypoint

ENTRYPOINT ["/usr/local/bin/docker-nginx-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]
