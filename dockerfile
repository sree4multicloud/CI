FROM centos
RUN yum update -y
RUN yum install java -y
RUN yum install wget -y
RUN yum install unzip -y
RUN wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51-windows-x64.zip -O /tmp/tomcat.zip
RUN cd /tmp/ && unzip tomcat.zip
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN  mv /tmp/apache*/* /opt/tomcat/
RUN cd /opt/tomcat/bin/ && chmod 755 *
EXPOSE 8080
RUN cd /opt/tomcat/bin/
CMD ["/opt/tomcat/bin/catalina.sh","run"]
RUN wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/cluster/session_state/files/shoppingcart.zip -O /tmp/shoppingcart.zip
RUN cd /tmp/ && unzip shoppingcart.zip
RUN cp /tmp/shoppingcart.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh","run"]

