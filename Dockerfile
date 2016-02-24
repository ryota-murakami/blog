FROM ryotamurakami/blog_base:ver1.0

RUN mkdir /blog
WORKDIR /blog

# bundle install キャッシュを有効にする記法
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --without test development

ADD . /blog

RUN RAILS_ENV=production rake assets:precompile

ENV SECRET_KEY_BASE=0116024014a37f8df25c49108436ed837d720cb8d56ee00ff84b603c782c6407e028e2a8c75ca9a11bbfa1768d351d7df58309ac73d1a727c6f804f69fef487f

RUN rake db:migrate RAILS_ENV=production

COPY config/supervisord.conf /etc/supervisor/config.d/supervisord.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 22 80

# @TODO supervisordで上手くnginxとunicornが起動しないので一旦保留
# CMD ["/usr/bin/supervisord"]

RUN chmod u+x /blog/docker_run.sh
CMD ["/blog/docker_run.sh"]
