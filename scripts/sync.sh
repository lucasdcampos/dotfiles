CURRENT_DIR=$(pwd)

cd ~/.dotfiles || exit

git pull origin master

python3 scripts/reload.py

cd "$CURRENT_DIR"
