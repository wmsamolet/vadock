# Для начала указываем исходный образ, он будет использован как основа
FROM mysql:5.6

COPY conf.d/* /etc/mysql/conf.d/

RUN chmod -R 644 /etc/mysql/conf.d

WORKDIR /host

# Костыль с указанием кодировки (через конфиги данное значение не задаётся)
CMD ["--character-set-server=utf8", "--collation-server=utf8_general_ci"]

