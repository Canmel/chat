FROM daocloud.io/rails:onbuild

RUN bundle exec rake assets:precompile

RUN apt-get update && apt-get -y install redis-server

CMD /bin/bash docker_web_run.sh