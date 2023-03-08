#!/bin/bash

cd project

git init

git config --global init.defaultBranch main
git config user.email hoomen@student.42heilbronn.de
git config user.name hoomen

touch .gitignore
echo ".gitignore" >> .gitignore
echo "**/.env" >> .gitignore

git add .
git commit -m "directory structure"

cp ../git_init.sh setup/scripts
