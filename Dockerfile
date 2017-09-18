FROM daocloud.io/rails:onbuild

RUN apt-get -y update && apt-get install redis-server