# Docker PHP Playground

![](https://img.shields.io/github/v/release/AymDev/docker-php-playground)
![](https://img.shields.io/github/downloads/AymDev/docker-php-playground/total)
![](https://img.shields.io/github/license/AymDev/docker-php-playground)

This repository offers a very simple environment to play with **PHP** with **Docker**. It aims to be easy for beginners.
**Requirements:** Docker & Docker Compose.

**Stack details:**

 - **Apache** with mod_rewrite enabled
 - **PHP** 7.4 with some extensions (exif, gd, imagick, intl, pdo_mysql, pdo_pgsql, xdebug, xsl, zip)
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
The **Apache** web server is running on [http://localhost](http://localhost).

The **PhpMyAdmin** is running on [http://localhost:8888](http://localhost:8888).

Put your **PHP** files in the `/app/` directory.

The **MySQL** container exposes the `3306` port if you want to connect from other tools.

Stop the stack:
```shell
docker-compose down
```

## How to add other PHP extensions
Edit the `Dockerfile` and add your extensions to the `install-php-extensions` command.
The extensions name can be found on the [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer#supported-php-extensions) page.

Then rebuild the image:
```shell
docker-compose build
```