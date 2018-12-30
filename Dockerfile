FROM composer/composer:latest

COPY conf /app/
COPY sonoffServer.php /app/sonoffServer.php
COPY script/entrypoint.sh /entrypoint.sh
COPY template /app/template/


RUN \
  composer require workerman/workerman workerman/channel && \
  chmod +x /entrypoint.sh

ENTRYPOINT '/entrypoint.sh'
#ENTRYPOINT php ./sonoffServer.php start -d
#CMD ["/bin/sh /entrypoint.sh"]