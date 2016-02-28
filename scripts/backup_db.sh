#!/bin/bash
BLOG_DIR=/home/ec2-user/blog
PROD_DB_FILE=$BLOG_DIR/db/production.sqlite3
LOCAL_ROOT_DIR=$(cd $(dirname $0)/..; pwd)
BACKUP_DEST=$LOCAL_ROOT_DIR/db/

scp malloc.tokyo:$PROD_DB_FILE $BACKUP_DEST
