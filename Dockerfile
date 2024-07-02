FROM ubuntu:18.04
RUN apt update && apt install tomcat9 -y && apt install maven -y && apt install git -y
RUN mkdir -p /home/boxfuse/
WORKDIR /home/boxfuse/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /boxfuse-sample-java-war-hello/
RUN mvn package
RUN cd /target/
RUN file="$(ls -1 /home/boxfuse/boxfuse-sample-java-war-hello/target/)" && echo $file
COPY hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
