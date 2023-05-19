FROM maven:3.8.4-jdk-8

COPY . /usr/src/poc
WORKDIR /usr/src/poc
RUN mvn clean && mvn package

# set this to disable the exploit
#ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true
ENV SECRET_VALUE='if you can read this this code is vulnerable'
ENTRYPOINT ["/usr/src/poc/entry.sh"]
# CMD ["/usr/local/bin/mvn-entrypoint.sh", "java", "-jar", "/usr/src/poc/target/log4j-rce-1.0-SNAPSHOT-jar-with-dependencies.jar", ";", "tail", "-f", "/dev/null"]
#CMD ["java", "-Dlog4j.formatMsgNoLookups=true", "-jar", "/usr/src/poc/target/log4j-rce-1.0-SNAPSHOT-jar-with-dependencies.jar"]
