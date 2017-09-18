FROM daocloud.io/rails:onbuild

RUN apt-get update && apt-get -y install redis-server
EXPOSE 6379 3000