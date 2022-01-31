# Pull base image 
FROM maven as build 
WORKDIR /app 
COPY . .
RUN mvn install

FROM openjdk:8-jde8 
WORKDIR /app 
COPY --from=build /app/target/maven-project-1.0-SNAPSHOT.war /app 
CMD ["java", "-war","maven-project-1.0-SNAPSHOT.war"]
#From tomcat:8-jre8 

# Maintainer 
#MAINTAINER "valaxytech@gmail.com" 
#COPY ./webapp.war /usr/local/tomcat/webapps

