FROM sergeyshow/oracle-java8
MAINTAINER Sergey Chugay <sergey@chugay.ru>

#Tomcat 8
ADD apache-tomcat-8.5.35.zip /opt/
RUN mv /opt/apache-tomcat-8.5.35 /opt/tomcat
RUN rm -f /opt/apache-tomcat-8.5.35
ENV CATALINA_HOME=/opt/tomcat \
    JAVA_HOME=/usr/java/default \
    LANG=ru_RU.UTF-8 \
    TZ="Europe/Moscow" \
    PATH="$PATH:/opt/tomcat/bin"

COPY tomcat-users.xml $CATALINA_HOME/conf

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh","run"]