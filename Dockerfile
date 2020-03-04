FROM composer
RUN apk update
RUN apk add --no-cache bash
RUN mkdir /opt/app
COPY . /opt/app
WORKDIR /opt/app
RUN composer require phpunit/phpunit ^5 --prefer-source --no-interaction
RUN composer update
#RUN composer require phpunit/php-invoker --prefer-source --no-interaction
WORKDIR /opt/app
RUN ln -s /opt/app/vendor/bin/phpunit /usr/local/bin/phpunit
ENTRYPOINT ["tail", "-f", "/dev/null"]
