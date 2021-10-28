FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS <dbname>;

SELECT user, host, authentication_string FROM mysql.user ORDER BY user ASC, host ASC;

CREATE USER IF NOT EXISTS '<db_username>'@'localhost';
ALTER USER IF EXISTS '<db_username>'@'localhost' IDENTIFIED BY '<db_password>';
GRANT ALL ON *.* to '<db_username>'@'localhost';
SHOW GRANTS FOR '<db_username>'@'localhost';

FLUSH PRIVILEGES;

SELECT user, host, authentication_string FROM mysql.user ORDER BY user ASC, host ASC;
