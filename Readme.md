# Notify Service

> [Core notification sending service](http://notify.code-wizards.dev)

This is still a work in progress. Do not try to use it on production.

# Required software

```bash
# Install mysql:
$ sudo apt-get install mysql-server mysql-client libmysqlclient-dev

# Answer yes to all:
$ sudo mysql_secure_installation

# Install nginx:
$ sudo apt-get install nginx
```

# Database configuration

Keep in mind this is only for local development database.

```bash
$ mysql -u root -p
> create database if not exists notify;
> grant all on notify . * to cw@localhost identified by 'password';
```

# Virtual host configuration

_Hosts file:_

```bash
$ sudo vi /etc/hosts

# Add line:
127.0.0.1 notify.code-wizards.dev
```

_Nginx proxy:_

```bash
$ sudo vi /etc/nginx/sites-available/notify

# Add content:
server {
    listen                      notify.code-wizards.dev:80;
    server_name                 notify.code-wizards.dev;

    location / {
        proxy_pass              http://127.0.0.1:3010;
        proxy_redirect          http://127.0.0.1:3010/ /;
        proxy_read_timeout 60s;

        proxy_set_header        Host            $host;
        proxy_set_header        X-Real-IP       $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

# Reload server config:
$ sudo ln -s /etc/nginx/sites-available/notify /etc/nginx/sites-enabled/notify
$ sudo service nginx reload
```

# Service usage

```bash
# Cloning repository
$ git clone git@codebasehq.com:code-wizards/core/notify-service.git

# Installing dependencies
$ bundle install

# Running service on local
$ padrino s

# Running integration tests
$ padrino rake test

# Running specification tests
$ padrino rake spec

# Running database migrations
$ padrino rake db:migrate

# Reconstructing database
$ padrino rake db:reset
```
