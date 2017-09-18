FROM daocloud.io/rails:onbuild

RUN apt-get update && apt-get -y install redis-server

RUN service redis-server start