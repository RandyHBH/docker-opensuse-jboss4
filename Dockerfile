# Use latest opensuse image as the base
FROM rromerogar/opensuse:jdk6

MAINTAINER Raúl Romero García <rromerogar@uoc.edu>

LABEL version="1.0.0"
LABEL description="Latest openSUSE image with JDK6 + JBoss 4.2.3 GA"

RUN zypper -n install unzip 

ADD  http://www.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/j/jb/jboss/JBoss/JBoss-4.2.3.GA/jboss-4.2.3.GA-jdk6.zip /opt

RUN cd /opt \
    && unzip jboss-4.2.3.GA-jdk6.zip \
    && mv jboss-4.2.3.GA jboss \
    && rm jboss-4.2.3.GA-jdk6.zip

EXPOSE 8080 8787

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8787,suspend=n,server=y $JAVA_OPTS"

ENTRYPOINT /opt/jboss/bin/run.sh -b 0.0.0.0
