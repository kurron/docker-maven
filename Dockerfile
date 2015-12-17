FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Apache Ant" org.kurron.ide.version=1.9.6

ADD http://mirrors.ibiblio.org/apache/ant/binaries/apache-ant-1.9.6-bin.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ant && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ant && \
    rm /tmp/ide.tar.gz

ENV ANT_HOME=/opt/ant

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ant/bin/ant"]
CMD ["-version"]
