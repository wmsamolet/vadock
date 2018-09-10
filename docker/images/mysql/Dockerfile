ARG version

FROM mysql:$version

COPY conf.d/* /etc/mysql/conf.d/

RUN chmod -R 644 /etc/mysql/conf.d

WORKDIR /host

# Костыль с указанием кодировки (через конфиги данное значение не задаётся)
CMD ["--character-set-server=utf8", "--collation-server=utf8_general_ci"]

