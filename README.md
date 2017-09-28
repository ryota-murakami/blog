[![Build Status](https://travis-ci.org/ryota-murakami/blog.svg)](https://travis-ci.org/ryota-murakami/blog)

個人用のブログです。 <a href="https://malloc.tokyo" target="_blank">https://malloc.tokyo</a>

## コマンドなど

#### `bundle exec rake secret`

<a href="https://github.com/ryota-murakami/blog/blob/master/config/secrets.yml" target="_blank">blog/config/secrets.yml</a>にある通り、railsはproduction環境で動かす際**SECRET_KEY_BASE**という環境変数にハッシュを格納しておく必要があるので
`bundle exec rake secret`でハッシュを生成して環境変数に登録しておく。
現在はDockerfile内でコンテナビルド時にこのコマンドが実行されるように設定している。

#### `bundle exec rake assets:precompile RAILS_ENV=production`

<a href="https://github.com/ryota-murakami/blog/tree/master/app/assets" target="_blank">blog/app/assets</a>のファイルをコンパイルして<a href="https://github.com/ryota-murakami/blog/tree/master/public" target="_blank">blog/public</a>に展開する。
productionに適用するには`RAILS_ENV=production`を忘れないよう注意。

#### `bundle exec rake db:migrate RAILS_ENV=production`

<a href="https://github.com/ryota-murakami/blog/tree/master/db" target="_blank">DB設定ファイル</a>に沿ってマイグレーションする。
productionに適用するには`RAILS_ENV=production`を忘れないよう注意。

#### `./bin/backup_db.sh`

producitonのsqliteファイルをローカルに`production.sqlite3`,`development.sqlite3`としてコピーする。
`~/.ssh/config`に`malloc.tokyo`の接続情報を準備しておくこと。
<a href="https://github.com/ryota-murakami/blog/blob/master/bin/backup_db.sh" target="_blank">blog/bin/backup_db.sh</a>
