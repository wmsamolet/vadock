ARG version

# Для начала указываем исходный образ, он будет использован как основа
FROM php:$version

# Доступные имена расширений PHP
# Possible values for ext-name:
#
# bcmath bz2 
# calendar ctype curl 
# dba dom enchant 
# exif 
# fileinfo filter ftp 
# gd gettext gmp hash 
# iconv imap interbase intl 
# json 
# ldap 
# mbstring mcrypt mysqli 
# oci8 odbc opcache 
# pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell 
# readline recode reflection 
# session shmop simplexml snmp soap sockets spl standard sysvmsg sysvsem sysvshm 
# tidy tokenizer 
# wddx 
# xml xmlreader xmlrpc xmlwriter xsl 
# zip

# RUN выполняет идущую за ней команду в контексте нашего образа.
# В данном случае мы установим некоторые зависимости и модули PHP.
# Для установки модулей используем команду docker-php-ext-install.
# На каждый RUN создается новый слой в образе, поэтому рекомендуется объединять команды.

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        zip \
        unzip \
        zlib1g-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        mysql-client \
        sshpass \
        faketime \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring mysqli pdo_mysql zip \
    && docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install APCu
RUN pecl install apcu && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini

# Куда же без composer'а.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Добавим свой php.ini, можем в нем определять свои значения конфига
ADD conf.d/* /usr/local/etc/php/conf.d/

# Указываем рабочую директорию для PHP
WORKDIR /host

# FIX проблемы с правами (для запуска через docker exec)
RUN usermod --non-unique --uid 1000 www-data \
    && groupmod --non-unique --gid 1000 www-data \
    && chown -R www-data:www-data /var/www \
    && chown -R www-data:www-data /host

# Запускаем контейнер
# Из документации: The main purpose of a CMD is to provide defaults for an executing container. These defaults can include an executable,
# or they can omit the executable, in which case you must specify an ENTRYPOINT instruction as well.
CMD []