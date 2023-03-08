#!/bin/bash

# Remove old project folder if it existed
if [ -d project ]
then
	echo "Removing old project folder ..."
	rm -drf project
fi	
echo "Creating directory structure ..."

# Create basic folder structure and print
basic="project/srcs/requirements"
mkdir -p $basic
mkdir -p setup/scripts

# Create makefile & gitignore
cd project
touch Makefile

# Create docker compose file & .env
cd srcs
touch docker-compose.yml .env

# Create subfolders for the docker containers
cd requirements
requirements="nginx mariadb wordpress"
for container in $requirements
do
	mkdir $container
	cd $container
	touch Dockerfile
	mkdir tools
	mkdir conf
	touch tools/.gitkeep
	touch conf/.gitkeep
	cd ..
done
cd ../..

# Show directory structure
echo "ls -laR -I.git"
ls -laR

#Copy this script to the project folder
cp ../directory_structure.sh setup/scripts
