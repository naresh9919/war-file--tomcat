FROM maven 3.8.6 as Build
WORKDIR /app
COPY ./app
RUN mvn install

FROM open jdk:11.0
WORKDIR /app
COPY --from-build /app/target/SimpleTomcatWebApp.war /app
EXPOSE 9090
CMD ["java","-war","SimpleTomcatWebApp.war"]
