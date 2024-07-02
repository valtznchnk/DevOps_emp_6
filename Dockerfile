FROM ubuntu:18.04
EXPOSE 8080
RUN apt update && apt install tomcat9 -y && apt install maven -y && apt install git -y
WORKDIR /tmp/
RUN mkdir -p /tmp/myapp/
RUN git clone https://github.com/vinayakrj/java-war-project.git
WORKDIR /java-war-project/
RUN mvn package
WORKDIR /tmp/boxfuse/java-war-project/target/
RUN pwd
COPY my-app.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
