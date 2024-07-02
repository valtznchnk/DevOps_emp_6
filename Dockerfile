FROM ubuntu:18.04
RUN apt update & apt install tomcat9 -y & apt install maven -y
RUN mkdir /home/boxfuse
RUN cd /home/boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd /boxfuse-sample-java-war-hello
RUN mvn package
RUN cd /target
COPY /home/boxfuse/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
