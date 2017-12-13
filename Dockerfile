FROM centos:centos7

MAINTAINER Baptiste <baptistezegre@gmail.com>

RUN yum -y update && yum clean all

RUN yum install -y java systat git-core maven which && yum clean all

WORKDIR /

RUN git clone -b BLAZEGRAPH_RELEASE_2_1_0 --single-branch https://github.com/blazegraph/database.git BLAZEGRAPH_RELEASE_2_1_0

WORKDIR BLAZEGRAPH_RELEASE_2_1_0/scripts/

RUN chmod +x mavenInstall.sh 

RUN chmod +x startBlazegraph.sh

RUN chmod +x prog.sh

RUN ./mavenInstall.sh

RUN ./startBlazegraph.sh


# Exec on start
ENTRYPOINT ["/BLAZEGRAPH_RELEASE_2_1_0/scripts/startBlazegraph.sh"]

# Expose Default Port
EXPOSE 9999
