FROM ubuntu:18.04
EXPOSE 8080
RUN apt update && apt install tomcat9 -y && apt install maven -y && apt install git -y
WORKDIR /tmp/
RUN git clone https://github.com/vinayakrj/java-war-project.git
WORKDIR /tmp/java-war-project/
RUN mvn package
WORKDIR /tmp/java-war-project/target/
RUN cp /tmp/java-war-project/target/my-app.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]
