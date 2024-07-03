FROM tomcat
ENV JAVA_HOME /opt/java/openjdk
RUN export JAVA_HOME
COPY my-app.war /usr/local/tomcat/webapps/