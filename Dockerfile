FROM frolvlad/alpine-java:jdk8-slim
VOLUME /tmp
ADD spring-petclinic-rest-system-1.7.jar app.jar
RUN sh -c 'touch /app.jar'
RUN apk add --no-cache py-pip python jq && pip install awscli
ENTRYPOINT java -Dspring.datasource.url=$SPRING_DATASOURCE_URL -Dspring.datasource.username=$SPRING_DATASOURCE_USERNAME -Dspring.datasource.password=$(aws ssm get-parameters --name $DBPasswordSSMKey --with-decryption --query Parameters[0].Value --region $AWS_Region|sed -e 's/\"//g') -Djava.security.egd=file:/dev/./urandom -jar app.jar