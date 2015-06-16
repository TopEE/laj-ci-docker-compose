docker run -d --name ateam_mysql ^
-v /c/Users/Lars/dockervolumes/ateam/mysql:/var/lib/mysql ^
-e MYSQL_ROOT_PASSWORD=my-secret-pw ^
-e MYSQL_DATABASE=sonar ^
-e MYSQL_USER=sonar ^
-e MYSQL_PASSWORD=sonar ^
-p 50002:3306 ^
mysql

docker run -d --name ateam_sonarqube ^
-p 50001:9000 ^
--link ateam_mysql:mysql ^
-e SONARQUBE_JDBC_URL="jdbc:mysql://mysql/sonar?useUnicode=true&characterEncoding=utf8" ^
sonarqube

docker run -d --name ateam_jenkins ^
-p 50000:8080 ^
--link ateam_sonarqube:sonarqube ^
-v /c/Users/Lars/dockervolumes/ateam/jenkins:/var/jenkins_home ^
lars1974/jenkins:beta