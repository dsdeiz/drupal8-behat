# Drupal 8 Behat Demo

## Usage

1. `composer install`
2. `docker-compose up -d --force-recreate`

## Behat

To run `behat` tests, simply do `docker-compose run -w "/var/www" --rm drupal vendor/bin/behat`.

**TODO:** `--force-recreate` is an existing issue with [`selenium/standalone`](https://github.com/SeleniumHQ/docker-selenium/issues/91). Only happens when the container already exists.
