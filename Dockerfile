FROM openjdk:11.0
EXPOSE 8080
ADD target/simpletomcatwebApp.war simpletomcatwebApp.war
ENTRYPOINT ["java","-war","/simpletomcatwebApp.war"]
