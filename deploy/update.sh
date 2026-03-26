#!/bin/bash

RUNTIME_DIR="/opt/lost-n-found"
REPO_DIR="$HOME/se-lost-and-found/src/Lost_n_Found"
CURRENT_USER="{$(whoami)}"

find "$RUNTIME_DIR" -mindepth 1 ! -name 'uwsgi.ini' -exec rm -rf {} +

cp "$REPO_DIR/manage.py" "$RUNTIME_DIR/"
cp "$REPO_DIR/requirements.txt" "$RUNTIME_DIR/"
cp -r "$REPO_DIR/app" "$RUNTIME_DIR/"
cp -r "$REPO_DIR/Lost_n_Found" "$RUNTIME_DIR/"
cp "$REPO_DIR/db.sqlite3" "$RUNTIME_DIR/"

chown -R "$CURRENT_USER:$CURRENT_USER" "$RUNTIME_DIR"


