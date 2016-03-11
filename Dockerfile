FROM ryotamurakami/blog_base:ver1.0

RUN mkdir /blog
WORKDIR /blog

# bundle install キャッシュを有効にする記法
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --without test development

ADD . /blog

ENV SECRET_KEY_BASE RUN ["bundle", "exec", "rake", "secret"]

RUN bundle exec rake assets:precompile RAILS_ENV=production

RUN bundle exec rake db:migrate RAILS_ENV=production

COPY config/supervisord.conf /etc/supervisor/config.d/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 22 80

# @TODO supervisordで上手くnginxとunicornが起動しないので一旦保留
# CMD ["/usr/bin/supervisord"]

RUN sudo chmod +x /blog/bin/docker_run.sh
CMD ["/blog/bin/docker_run.sh"]
