FROM debian:8
MAINTAINER Martin Holmin <martin@streamanalyze.com>

RUN \
  dpkg --add-architecture i386 && \
  apt-get update && apt-get install -y wget unzip libncurses5:i386 libstdc++6:i386 zlib1g:i386

RUN \
  wget --quiet -P /tmp --no-check-certificate https://dl.streamanalyze.com/sa.amos/sa-amos-linux-i386-jre-1.7.zip

RUN \
  mkdir -p /opt && \
  unzip /tmp/*.zip -d /opt && \
  mv /opt/sa.amos /opt/sa-amos

ENV AMOS_HOME /opt/sa-amos
ENV PATH $PATH:$AMOS_HOME/bin

CMD ["sa.amos"]
