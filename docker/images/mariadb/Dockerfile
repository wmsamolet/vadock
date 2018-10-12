ARG version

FROM mariadb:$version

COPY mariadb.conf.d/* /etc/mysql/mariadb.conf.d/
COPY conf.d/* /etc/mysql/conf.d/

RUN chmod -R 644 /etc/mysql/mariadb.conf.d
RUN chmod -R 644 /etc/mysql/conf.d

RUN apt-get update && apt-get install -y faketime

WORKDIR /host

# Костыль с указанием кодировки (через конфиги данное значение не задаётся)
CMD []

