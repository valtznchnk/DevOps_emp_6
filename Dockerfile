FROM ubuntu:18.04
EXPOSE 8080
RUN apt update && apt install tomcat9 -y && apt install maven -y && apt install git -y
WORKDIR /tmp/
RUN mkdir -p /tmp/boxfuse/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /boxfuse-sample-java-war-hello/
RUN mvn package
WORKDIR /tmp/boxfuse/boxfuse-sample-java-war-hello/target/
RUN pwd
COPY hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
