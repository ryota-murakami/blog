# coding: utf-8

from fabric.api import cd, env, local, run, task, sudo
from fabric.contrib.project import rsync_project

env.hosts = ('malloc.tokyo')
env.use_ssh_config = True

env.remote_project_dir = ('/blog')

@task
def deploy():
    _rsync()
    _bundle_install()

def _bundle_install():
    with cd(env.remote_project_dir):
        run('bundle install --without test development')

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

