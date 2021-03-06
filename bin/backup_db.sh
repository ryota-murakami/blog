#!/bin/bash
BLOG_DIR=/blog
PROD_DB_FILE=$BLOG_DIR/db/production.sqlite3
LOCAL_ROOT_DIR=$(cd $(dirname $0)/..; pwd)
DB_DIR=$LOCAL_ROOT_DIR/db

scp malloc.tokyo:$PROD_DB_FILE $DB_DIR
cp $DB_DIR/production.sqlite3 $DB_DIR/development.sqlite3
