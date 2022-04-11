#!/bin/bash
while getopts app: flag
do
    case "${flag}" in
        app) app=${OPTARG};;
    esac
done

if [ -z $app ] 
then
    app="app"
fi

python3 /usr/src/$app/src/manage.py runserver "0.0.0.0:80"
