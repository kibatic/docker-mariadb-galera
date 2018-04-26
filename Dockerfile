FROM mariadb:10.2.14

RUN DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confnew' -qqy install galera rsync && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh

CMD ["/start.sh"]
