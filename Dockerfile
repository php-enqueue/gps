# the different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target


# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG PHP_VERSION=7.3
ARG CADDY_VERSION=2.5.1
# ARG GITHUB_TOKEN

# "php" stage
FROM php:${PHP_VERSION}-fpm-alpine AS api_platform_php

COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .