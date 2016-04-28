FROM dataplatform/hadoop:latest
MAINTAINER Binh Van Nguyen

# Running Hive Server 2
EXPOSE 10000
CMD ["bin/hive", "--config", "/etc/hive/conf", "--service", "hiveserver2"]

ENV TERM xterm
ENV HIVE_VERSION 1.2.1
ENV HIVE_HOME /usr/local/hive
ENV PATH ${PATH}:${HIVE_HOME}/bin
WORKDIR ${HIVE_HOME}

RUN mkdir -p /etc/hive/conf
COPY conf/hive-site.xml /etc/hive/conf/

ENV HIVE_URL http://mirrors.advancedhosters.com/apache/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz
# Install Hive
RUN mkdir -p ${HIVE_HOME} && curl -L ${HIVE_URL} | tar -xzC ${HIVE_HOME} --strip-components=1
