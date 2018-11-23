FROM sergeyshow/oracle-java8
MAINTAINER Sergey Chugay <sergey@chugay.ru>

#Tomcat 8.5.35
WORKDIR /opt/
ADD apache-tomcat-8.5.35.zip .
ENV CATALINA_HOME=/opt/apache-tomcat-8.5.35 \
    JAVA_HOME=/usr/java/default \
    LANG=ru_RU.UTF-8 \
    TZ="Europe/Moscow" \
    PATH="$PATH:$CATALINA_HOME/bin"

COPY tomcat-users.xml $CATALINA_HOME/conf

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh","run"]