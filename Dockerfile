FROM sergeyshow/oracle-java8
MAINTAINER Sergey Chugay <sergey@chugay.ru>

#Tomcat 8
ADD http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz /opt/
RUN mv /opt/apache-tomcat-* /opt/tomcat
ENV CATALINA_HOME=/opt/tomcat \
    JAVA_HOME=/usr/java/default \
    LANG=ru_RU.UTF-8 \
    TZ="Europe/Moscow" \
    PATH="$PATH:/opt/tomcat/bin"

COPY tomcat-users.xml $CATALINA_HOME/conf

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh","run"]