#!/bin/bash

# systemctl is the command-line tool for controlling services on modern Linux systems.
sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
