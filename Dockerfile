FROM openjdk:11.0
EXPOSE 8080
ADD target/simpletomcatwebapp.war simpletomcatwebapp.war
ENTRYPOINT ["java","-war","/simpletomcatwebapp.war"]
