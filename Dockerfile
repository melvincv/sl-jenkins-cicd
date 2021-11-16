FROM tomcat:10-jdk17
WORKDIR /usr/local/tomcat/webapps
COPY target/*.jar .