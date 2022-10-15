FROM openjdk:11.0
EXPOSE 8080
ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-war","/devops-integration.jar"]
