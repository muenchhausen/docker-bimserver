FROM tomcat:9-jre8
MAINTAINER derk@muenchhausen.de 

ENV BIMSERVER_VERSION "1.5.117"

#RUN mkdir -p /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# RUN wget "https://github.com/opensourceBIM/BIMserver/releases/download/v$BIMSERVER_VERSION/bimserverwar-$BIMSERVER_VERSION.war" -O /usr/local/tomcat/webapps/ROOT.war
COPY bimserverwar-$BIMSERVER_VERSION.war /usr/local/tomcat/webapps/ROOT.war


COPY ./default.policy /usr/local/tomcat/conf/default.policy
COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./context.xml /usr/local/tomcat/conf/context.xml

EXPOSE 8080
VOLUME /var/bimserver/home
CMD ["catalina.sh", "run"]

