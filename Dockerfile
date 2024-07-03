FROM ubuntu:latest

ENV TOMCAT_VERSION 9.0.71
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /usr/lib/jvm/java-18-openjdk-amd64
ENV PATH $CATALINA_HOME/bin:$PATH

RUN apt-get -y update
RUN apt-get -y install openjdk-18-jdk wget


RUN mkdir $CATALINA_HOME
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-${TOMCAT_VERSION}/* $CATALINA_HOME
RUN rm -rf /tmp/apache-tomcat-${TOMCAT_VERSION}
RUN rm -rf /tmp/tomcat.tar.gz

# Expose Tomcat port.
EXPOSE 80

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
