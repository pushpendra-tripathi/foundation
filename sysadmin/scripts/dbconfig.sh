#!/usr/bin/env bash

packagelist=(
    python3-mysqldb
    python3-mysql
    python3-mysqlclient
    mysql-server
    mysql-client-core-5.7
    mysql-client-5.7
    mysql
)

# Install packages
for p in "${packagelist[@]}"; do
    apt install -y "${p}"
done

# Secure the server in production mode
# Would you like to setup VALIDATE PASSWORD plugin? Y
# PASSWORD_VALIDATION_POLICY LEVEL = 1
# Remove anonymous users? Y
# Disallow root login remotely? Y
# Remove test database and access to it? Y
# Reload privilege tables now? Y
mysql_secure_installation

#
mysql < config/dbconfig.sql

# Edit $HOME/.my.cnf for the following:
cat > "$HOME/.my.cnf" << EOF
[mysql]
prompt='(\u@\h:\d) '
auto-rehash

[client]
user = root
password = <rootpassword>
user = <username>
password = <password>
EOF

vi "$HOME/.my.cnf"
