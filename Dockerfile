FROM daocloud.io/skio_dep/rails_5.0.0.1:v3_onbuild

RUN bundle exec rake assets:precompile

CMD /bin/bash docker_web_run.sh