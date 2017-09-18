FROM daocloud.io/rails:onbuild

CMD apt-get update && apt-get -y install redis-server