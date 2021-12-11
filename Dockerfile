FROM maven:3.8.4-jdk-8
COPY . /usr/src/poc
WORKDIR /usr/src/poc
ENV CLASSPATH=/usr/src/poc/target/classes
RUN mvn clean && mvn install
RUN find .
CMD ["java", "/root/.m2/repository/org/example/log4j-rce/1.0-SNAPSHOT/log4j-rce-1.0-SNAPSHOT.jar"]
