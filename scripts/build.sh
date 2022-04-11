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

python3 -m pip install --upgrade pip

pip3 install \
    -r "/tmp/$app/requirements.txt"
