FROM openjdk:17-jdk
COPY target/Thankful-aws-0.0.1-SNAPSHOT.jar Thankful-aws-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/Thankful-aws-0.0.1-SNAPSHOT.jar"]