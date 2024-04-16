FROM maven:3.6.3-jdk-8 as builder

WORKDIR /builder
COPY . .

RUN mvn package

FROM tomcat:latest as final

COPY --from=builder /builder/target/*.war  /usr/local/tomcat/webapps/app.war
