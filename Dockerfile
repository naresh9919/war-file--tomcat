FROM maven as Build
WORKDIR /app
COPY ./app
RUN mvn install

FROM open jdk:11.0
WORKDIR /app
COPY --from-build /app/target/
