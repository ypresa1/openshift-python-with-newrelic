FROM registry.access.redhat.com/rhel7.3:latest
MAINTAINER Red Hat Systems Engineering <refarch-feedback@redhat.com>

### Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels
LABEL name="newrelic-admin-rhel73/python-agent" \
      maintainer="vvydier@newrelic.com" \
      vendor="NewRelic" \
      version="1.0" \
      release="1" \
      summary="Newrelic's Python agent starter image" \
      description="Newrelic's Python agent starter image" \
      url="https://newrelic.com"

### Atomic Help File - Write in Markdown, it will be converted to man format at build time.
### https://github.com/projectatomic/container-best-practices/blob/master/creating/help.adoc
COPY help.1 /

### add licenses to this directory
RUN mkdir -p /licenses
COPY licenses /licenses

#Needed EPEL for pip - not included with RHEL
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

### Add necessary Red Hat repos here
RUN yum -y update-minimal --disablerepo "*" --enablerepo rhel-7-server-rpms --setopt=tsflags=nodocs \
      --security --sec-severity=Important --sec-severity=Critical \
# clean yum cache
   yum clean all

#Installing pip and python for the test script/agent
RUN yum -y install python2-pip

# upgrade pip
RUN pip install --upgrade pip

#The INI file - make sure you put your license in here or it won't work!
COPY newrelic.ini /

#Install the NewRelic Agent
RUN pip install newrelic

#The agent needs to know where the INI file is
ENV NEW_RELIC_CONFIG_FILE=/newrelic.ini

#Script to run the Python Agent test 5 times to make sure you get a good reading in the web UI
COPY runit5times.py /

#When you launch the container, it runs the script and then exits
ENTRYPOINT ./runit5times.py
