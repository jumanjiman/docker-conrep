FROM centos:7

MAINTAINER Mohashin Azad <mohashin.azad@yahoo.com>

COPY . /

RUN yum install -y \
      hwdata \
      pciutils \
      pciutils-libs \
      && \
    yum update -y \
      && \
    rpm -i /assets/*.rpm \
      && \
    yum -y clean all \
      && \
    ln -fs /data/conrep_5.48.xml /opt/hp/hp-scripting-tools/etc/conrep.xml

WORKDIR /opt/hp/hp-scripting-tools/etc/

CMD /bios-config.sh
