GOSU_VERSION=1.7

set -x

# install wget
apt-get update
apt-get install -y --no-install-recommends ca-certificates wget
rm -rf /var/lib/apt/lists/*

# install gosu
wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)"
wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc"
export GNUPGHOME="$(mktemp -d)"
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu
rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu
gosu nobody true
apt-get purge -y --auto-remove ca-certificates wget

# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
apt-get update
apt-get install -y perl pwgen --no-install-recommends
rm -rf /var/lib/apt/lists/*

set -ex;
# gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
key='A4A9406876FCBD3C456770C88C718D3B5072E1F5';
export GNUPGHOME="$(mktemp -d)";
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key";
gpg --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg;
rm -r "$GNUPGHOME";
apt-key list > /dev/null


MYSQL_MAJOR=5.6
MYSQL_VERSION=5.6.35-1debian8

echo "deb http://repo.mysql.com/apt/debian/ jessie mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

{ \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections
apt-get update && apt-get install -y mysql-server="${MYSQL_VERSION}" && rm -rf /var/lib/apt/lists/*
rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld
# chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
chmod 777 /var/run/mysqld

sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf
echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf