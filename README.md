[![Build Status](https://travis-ci.org/ryota-murakami/blog.svg)](https://travis-ci.org/ryota-murakami/blog)

### 私個人用のブログです。  
###  http://malloc.tokyo  

## ドキュメントどもき

#### <a href="https://github.com/ryota-murakami/blog/blob/master/lib/tasks/unicornctl.rake" target="_blank">unicornctl.rake</a>

unicorn操作タスクをまとめています。

- `bundle exec rake -vT unicornctl` unicorn操作コマンドの使い方を表示

#### Dockerコンテナ

このアプリは`Nginx + Unicorn + Rails + Sqlite`を一台のサーバで動かしていて、
それを一つのDockerコンテナイメージにして管理しています。

開発には2つのコンテナを使用しており、
ubuntu 14.04に必須ライブラリ、Nginx、Ruby(bundler)のインストールまで行ったものを`base_docker_container`として管理し、

- <a href="https://github.com/ryota-murakami/blog/blob/master/base_docker_container/Dockerfile" target="_blank">base_docker_containerの`Dockerfile`</a>

- <a href="https://hub.docker.com/r/ryotamurakami/blog_base/" target="_blank">DockerHub</a>

そのコンテナを読み込んだ上で`Bundle install`とサーバ設定ファイルの設置、アプリケーション起動までを行うアプリケーションコンテナを作成します。



- <a href="https://github.com/ryota-murakami/blog/blob/master/Dockerfile" target="_blank">アプリケーションコンテナの`Dockerfile`</a>

##### base_docker_containerの更新手順

1. docker-machineなどでdockerホストにsshログイン
1. `/blog/base_docker_container/Dockerfile`を編集
1. `blog/base_docker_container`ディレクトリで`docker build -t ryotamurakami/blog_base:<version> .`を叩きDockerimageを作成
1. `docker login`でDockerhub認証
1. `docker push ryotamurakami/blog_base:<version>`でDockerhubにpush

##### アプリケーションコンテナの更新手順
1. docker-machineなどでdockerホストにsshログイン
1. `/blog/Dockerfile`やアプリケーションコードを編集
1. `/blog`ディレクトリで`docker build -t ryotamurakami/blog:<version> .`を叩きDockerimageを作成
1. `docker login`でDockerhub認証
1. `docker push ryotamurakami/blog_base:<version>`でDockerhubにpush(DBファイルが含まれるのでprivateリポジトリ)
