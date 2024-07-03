# Use a minimal base image
FROM ubuntu:20.04

# Set the Tomcat version
ENV TOMCAT_VERSION 10.1.25

# Install dependencies
RUN apt update && \
    apt install -y openjdk-11-jdk wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Tomcat
RUN wget -O /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar xf /tmp/tomcat.tar.gz -C /opt && \
    rm /tmp/tomcat.tar.gz && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Expose Tomcat port
EXPOSE 8080

# Clean up unnecessary files
RUN apt purge -y openjdk-11-jdk wget && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /opt/tomcat/webapps/*

# Start Tomcat
CMD ["catalina.sh", "run"]