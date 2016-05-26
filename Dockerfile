FROM mariadb:10.1

RUN DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confnew' -qqy install galera rsync && \
    rm -rf /var/lib/apt/lists/*

COPY debian.cnf /etc/mysql/
COPY galera.cnf /etc/mysql/conf.d/
