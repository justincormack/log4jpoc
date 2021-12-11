FROM maven:3.8.4-jdk-8
COPY . /usr/src/poc
WORKDIR /usr/src/poc
RUN mvn clean && mvn package
RUN ls /usr/src/poc/target/
CMD ["java", "-jar", "/usr/src/poc/target/log4j-rce-1.0-SNAPSHOT-jar-with-dependencies.jar"]
