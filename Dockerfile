FROM nginx:1.10.1-alpine

ENV VHOST_ROOT=/app/code/public
ENV VHOST_INDEX=index.php
ENV NGINX_CLIENTMAXBODYSIZE=16M
ENV NGINX_CONST_URI='$uri'
ENV NGINX_CONST_QUERY_STRING='$query_string'
ENV NGINX_CONST_DOLLAR='$'
ENV NGINX_CONST_REQUEST_FILENAME='$request_filename'

ENV NGINX_FPM_LISTEN=php-fpm:9000

COPY docker /docker
COPY docker-nginx-entrypoint /usr/local/bin/docker-nginx-entrypoint
RUN chmod +x /usr/local/bin/docker-nginx-entrypoint

ENTRYPOINT ["/usr/local/bin/docker-nginx-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]
