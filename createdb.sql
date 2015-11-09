CREATE DATABASE artdb CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL on artdb.* TO 'artifactory'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
