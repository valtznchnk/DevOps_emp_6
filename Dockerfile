FROM tomcat:latest
RUN mkdir -p /home/boxfuse/
RUN cd /home/boxfuse/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn clean package
RUN cd target
COPY /home/boxfuse/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
