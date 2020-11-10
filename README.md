# Docker PHP Playground

![](https://img.shields.io/github/v/release/AymDev/docker-php-playground)
![](https://img.shields.io/github/downloads/AymDev/docker-php-playground/total)
![](https://img.shields.io/github/license/AymDev/docker-php-playground)

This repository offers a very simple environment to play with **PHP** with **Docker**. 
It aims to be easy for beginners.<br>
**Requirements:** Docker & Docker Compose.

**Stack details:**

 - **Apache** with mod_rewrite enabled
 - **PHP** 7.4 with **Composer** & some extensions (exif, gd, imagick, intl, pdo_mysql, pdo_pgsql, xdebug, xsl, zip)
 - **MySQL** 5.7
 - **PhpMyAdmin**

## Installation
Clone this repository:
```shell
git clone https://github.com/AymDev/docker-php-playground.git
```

First build the `app` container:
```shell
docker-compose build
```

## Usage
Start the stack:
```shell
docker-compose up -d
```
The **Apache** web server is running on [http://localhost](http://localhost).<br>
The **PhpMyAdmin** is running on [http://localhost:8888](http://localhost:8888).

Put your **PHP** files in the `/app/` directory.<br>
The **MySQL** container exposes the `3306` port if you want to connect from other tools.

Stop the stack:
```shell
docker-compose down
```

## Execute commands in container
To execute commands into the container, use an interactive shell:
```shell
docker exec -it app bash
```

Then execute your commands:
```shell
root@c92451e3f4f5:/var/www/html# php --version
PHP 7.4.12 (cli) (built: Nov  5 2020 20:15:41) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Xdebug v2.9.8, Copyright (c) 2002-2020, by Derick Rethans

root@35c221b633d4:/var/www/html# composer --version
Composer version 2.0.6 2020-11-07 11:21:17
```

To stop the interactive shell and return to your computer, use `exit`:
```shell
root@35c221b633d4:/var/www/html# exit
$
```

## How to add other PHP extensions
Edit the `Dockerfile` and add your extensions to the `install-php-extensions` command.
The extensions name can be found on the [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer#supported-php-extensions) page.

Then rebuild the image:
```shell
docker-compose build
```