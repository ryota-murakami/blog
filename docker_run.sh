#!/bin/bash

# docker run コマンドでコンテナが作成される時、nginxとunicornを起動する
service nginx start
unicorn_rails -c config/unicorn.conf -E production -D

exec /bin/bash
