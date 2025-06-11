#!/bin/bash

# This script safely stops web server services by first checking if they're running. 
# It uses pgrep to check for running processes of Apache (httpd) and Tomcat, 
# and only attempts to stop the services if they are actually active.
# This prevents errors that could occur from trying to stop services that aren't running.

isExistApp="$(pgrep httpd)"
if [[ -n $isExistApp ]]; then
sudo systemctl stop httpd.service
fi

isExistApp="$(pgrep tomcat)"
if [[ -n $isExistApp ]]; then
sudo systemctl stop tomcat.service
fi
