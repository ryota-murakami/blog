# coding: utf-8

from fabric.api import cd, env, local, run, task, sudo, shell_env
from fabric.contrib.project import rsync_project

env.hosts = ('malloc.tokyo')
env.use_ssh_config = True

env.remote_project_dir = ('/blog')

@task
def deploy():
    _rsync()
    _bundle_install()
    _rails_up()

def _bundle_install():
    with cd(env.remote_project_dir):
        run('bundle install --without test development')

def _rails_up():
    with cd(env.remote_project_dir):
        res = run('bundle exec rake secret', warn_only=True)
        with shell_env(SECRET_KEY_BASE=res):
            run('bundle exec rake assets:precompile RAILS_ENV=production')
            run('bundle exec rake db:migrate RAILS_ENV=production')
            is_unicorn_running = run("ps -ef | grep unicorn_rails | grep -v 'grep' | wc -l")
            if int(is_unicorn_running) == 0:
                run('rake unicornctl:start')
            else :
                run('rake unicornctl:restart')

def _rsync():
    rsync_project(
        local_dir='.',
        remote_dir=env.remote_project_dir,
        exclude=(
            '.bundle',
            '.idea',
            '.git',
            'ansible',
            '.DS_Store',
            'db/development.sqlite3',
            'db/test.sqlite3',
            'log',
            'tmp',
            'vendor',
            'public/assets/*'
        ),
        delete=True
    )

