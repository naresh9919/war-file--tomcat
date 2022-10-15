FROM openjdk:11.0
EXPOSE 8080
ADD target/SimpleTomcatWebApp.war SimpleTomcatWebApp.war
ENTRYPOINT ["java","-war","/SimpleTomcatWebApp.war"]
