FROM tomcat:9-jre8
MAINTAINER derk@muenchhausen.de 

ENV VERSION "1.5.117"

#RUN mkdir -p /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/*

RUN wget "https://github.com/opensourceBIM/BIMserver/releases/download/v$VERSION/bimserverwar-$VERSION.war" -O /usr/local/tomcat/webapps/ROOT.war
# COPY bimserverwar-$VERSION.war /usr/local/tomcat/webapps/ROOT.war


COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./context.xml /usr/local/tomcat/conf/context.xml
COPY ./default.policy /usr/local/tomcat/conf/default.policy

EXPOSE 8080
VOLUME /var/bimserver/home
HEALTHCHECK --interval=5s --timeout=500ms --retries=1 CMD curl --fail http://localhost:8080/ || exit 1

CMD ["catalina.sh", "run"]

