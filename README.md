[![Build Status](https://travis-ci.org/ryota-murakami/blog.svg)](https://travis-ci.org/ryota-murakami/blog)

個人用のブログです。  

###  <a href="http://malloc.tokyo" target="_blank">http://malloc.tokyo</a>

## ドキュメントどもき

## Dockerコンテナ

このアプリは`Nginx + Unicorn + Rails + Sqlite`を一台のサーバで動かしていて、
それを一つのDockerコンテナイメージにして管理しています。

開発には

- ベースコンテナ
- アプリケーションコンテナ

2つのコンテナを使用しており、
ubuntu 14.04に必須ライブラリ、Nginx、Ruby(bundler)のインストールまで行ったものを`ベースコンテナ`、

- <a href="https://github.com/ryota-murakami/blog/blob/master/base_docker_container/Dockerfile" target="_blank">ベースコンテナの`Dockerfile`</a>

- <a href="https://hub.docker.com/r/ryotamurakami/blog_base/" target="_blank">DockerHub</a>

ベースコンテナの上に`Bundle install`とサーバ設定ファイルの設置、アプリケーション起動までを行うアプリケーションコンテナを作成します。



- <a href="https://github.com/ryota-murakami/blog/blob/master/Dockerfile" target="_blank">アプリケーションコンテナの`Dockerfile`</a>

##### ベースコンテナイメージの更新手順

1. docker-machineなどでdockerホストにsshログイン
1. `/blog/base_docker_container/Dockerfile`を編集
1. `blog/base_docker_container`ディレクトリで`docker build -t ryotamurakami/blog_base:<version> .`を叩きDockerimageを作成
1. `docker login`でDockerhub認証
1. `docker push ryotamurakami/blog_base:<version>`でDockerhubにpush

##### アプリケーションコンテナイメージの更新手順
1. docker-machineなどでdockerホストにsshログイン
1. `/blog/Dockerfile`やアプリケーションコードを編集
1. `/blog`ディレクトリで`docker build -t ryotamurakami/blog:<version> .`を叩きDockerimageを作成
1. `docker login`でDockerhub認証
1. `docker push ryotamurakami/blog_base:<version>`でDockerhubにpush(DBファイルが含まれるのでprivateリポジトリ)

#### コンテナの起動方法
1. docker-machineなどでdockerホストにsshログイン
1. `docker run -itd -p 80:80 -v blog ryotamurakami/blog:<version> --name blog`
1. ポートフォワードしているので、dockerホストにhttp接続すればコンテナ上のアプリにアクセスできる


## コマンドなど

### unicornctl.rake

- <a href="https://github.com/ryota-murakami/blog/blob/master/lib/tasks/unicornctl.rake" target="_blank">unicornctl.rake</a>

unicorn操作タスクをまとめています。

- `bundle exec rake -vT unicornctl` unicorn操作コマンドの使い方を表示

### bundle exec rake secret
<a href="https://github.com/ryota-murakami/blog/blob/master/config/secrets.yml" target="_blank">blog/config/secrets.yml</a>にある通り、railsはproduction環境で動かす際**SECRET_KEY_BASE**という環境変数にハッシュを格納しておく必要があるので  
`bundle exec rake secret`でハッシュを生成して環境変数に登録しておく。  
現在はDockerfile内でコンテナビルド時にこのコマンドが実行されるように設定している。
