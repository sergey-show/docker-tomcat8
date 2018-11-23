FROM sergeyshow/oracle-java8
MAINTAINER Sergey Chugay <sergey@chugay.ru>

#Tomcat 8
ENV tomcat="tomcat-8.tar.gz"
ADD $tomcat /opt/
RUN mv /opt/tomcat* /opt/tomcat
ENV CATALINA_HOME=/opt/tomcat \
    JAVA_HOME=/usr/java/default \
    LANG=ru_RU.UTF-8 \
    TZ="Europe/Moscow" \
    PATH="$PATH:/opt/tomcat/bin"

COPY tomcat-users.xml $CATALINA_HOME/conf

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh","run"]