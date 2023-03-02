#! /bin/bash
touch .env
echo "DOMAIN_NAME=<your_nickname>.42.fr" > .env
echo "CERT_=./requirements/tools/<your_nickname>.42.fr.crt" >> .env
echo "KEY_=./requirements/tools/<your_nickname>.42.fr.key" >> .env
echo "DB_NAME=wordpress" >> .env
echo "DB_ROOT=rootpass" >> .env
echo "DB_USER=wpuser" >> .env
echo "DB_PASS=wppass" >> .env