FROM daocloud.io/rails:onbuild

RUN yum -y update && yum -y install redis