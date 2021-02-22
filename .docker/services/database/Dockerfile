FROM mariadb:10

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends --no-install-suggests --yes \
    net-tools procps vim \
    && apt-get dist-upgrade -y \
    && rm -rf /var/lib/apt/lists/*

RUN ls -al /etc/mysql/conf.d
RUN rm -rf /etc/mysql/conf.d
COPY ./config /etc/mysql/conf.d
