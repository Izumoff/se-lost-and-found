#!/bin/bash

set -e

RUNTIME_DIR="/opt/lost-n-found"
REPO_DIR="$HOME/se-lost-and-found/src/Lost_n_Found"
CURRENT_USER="${SUDO_USER:-$(whoami)}"

# Clean runtime (keep uwsgi.ini)
find "$RUNTIME_DIR" -mindepth 1 ! -name 'uwsgi.ini' -exec rm -rf {} +

# Copy project files
cp "$REPO_DIR/manage.py" "$RUNTIME_DIR/"
cp "$REPO_DIR/requirements.txt" "$RUNTIME_DIR/"
cp -r "$REPO_DIR/app" "$RUNTIME_DIR/"
cp -r "$REPO_DIR/Lost_n_Found" "$RUNTIME_DIR/"
cp "$REPO_DIR/db.sqlite3" "$RUNTIME_DIR/"

# Fix ownership
chown -R "$CURRENT_USER:$CURRENT_USER" "$RUNTIME_DIR"

# Move into runtime directory
cd "$RUNTIME_DIR"

# Recreate database (optional but safe)
#rm -f db.sqlite3

# Create virtual environment
python3 -m venv env
source env/bin/activate

# Fix pip tooling
python -m ensurepip --upgrade
python -m pip install --upgrade pip setuptools wheel

# Install dependencies
pip install -r requirements.txt
python -m pip install uwsgi

# Django setup
python manage.py migrate
python manage.py collectstatic --noinput

# Deactivate environment
deactivate

echo "Deployment update completed successfully."




