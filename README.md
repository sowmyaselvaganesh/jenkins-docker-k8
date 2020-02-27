# jenkins-pipeline2

## Install java on ubuntu 16.04  


$ sudo apt install openjdk-8-jdk
OR
$ sudo apt install openjdk-11-jdk

## Install maven  ##


Very good artical which help me to install java and maven on ubunut 16.04 is listed here
```
 cd /opt/
 wget http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
 sudo tar -zxvf apache-maven-3.5.4-bin.tar.gz
 sudo mv apache-maven-3.5.4 maven 
 
 sudo vi /etc/profile.d/mavenenv.sh
 
 export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}


sudo chmod +x /etc/profile.d/mavenenv.sh
sudo source /etc/profile.d/mavenenv.sh

mvn --version

https://www.mkyong.com/java/how-to-install-java-jdk-on-ubuntu-linux/
```
# Install Jenkins on ubuntu 16.04 #

```
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install jenkins
systemctl status jenkins
 ```
 
 # Install Sonar on Ubuntu 16.04 #
```
https://developerinsider.co/install-sonarqube-on-ubuntu/


# Run the java application directly from Dockerfile #


1.) Write Dockerfile for a Java code/application which is performing below task -
a.) Pulling the code and other dependent files from GIT 
b.) Compiling through maven 
c.) Running the Java application

****Starting of a Dockerfile**** 
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/mhali922/jenkins-pipeline2.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/jenkins-pipeline2 /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/gs-spring-boot-docker-0.1.0.jar /app
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar gs-spring-boot-docker-0.1.0.jar"]
EXPOSE 8082
****End of a Dockerfile****

2.) Using above Dockerfile, create an image of the java application using below command - 
Syntax : docker build -t :<Version, It could also be your choice> 
example/exact command : docker build -t myjavaapp:v1.0 .

3.) Using the above docker image as mujavaapp, run this java application into a docker container - 

example/exact command : docker run -d --name randomname -p 8082:8082 myjavaapp:v1.0



