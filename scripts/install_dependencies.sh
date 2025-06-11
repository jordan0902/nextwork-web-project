#!/bin/bash  

sudo yum install tomcat -y #Installs Tomcat (our Java application server) - the -y means "yes to all prompts" so it won't stop and ask questions.
sudo yum -y install httpd  #Installs Apache HTTP server - this is like the front desk receptionist for our web application.
# This starts a special block that writes multiple lines to a configuration file at once - like dictating a whole letter instead of typing it line by line.
#create a configuration file for Apache to act as a reverse proxy for Tomcat. This is like telling Apache: 
#"When visitors come to our website, don't talk to them directly - instead, silently pass their requests to Tomcat who's running our actual application."
# ProxyRequests off: Tells Apache not to act as a general proxy for any website (a security measure).
# ProxyPreserveHost On: Makes sure Apache remembers who the original request was for.
# ProxyPass and ProxyPassReverse: These are the magic lines that actually connect Apache to our Tomcat application.
# EOF: Marks the end of our configuration block - everything between the first EOF and this one gets written to the file.
sudo cat << EOF > /etc/httpd/conf.d/tomcat_manager.conf 
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  DefaultType text/html
  ProxyRequests off 
  ProxyPreserveHost On
  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF

