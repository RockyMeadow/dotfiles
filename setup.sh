BASE_DIR = "$(cd "$(dirname  "$0")" && pwd)"

ln -fsv "${BASE_DIR}/.zshrc" "$HOME/.zshrc"
ln -fsv "${BASE_DIR}/.xinirc" "$HOME/.xinitrc"
ln -fsv "${BASE_DIR}/.Xresources" "$HOME/.Xresources"
ln -fsv "${BASE_DIR}/.emacs" "$HOME/.emacs"
ln -fsv "${BASE_DIR}/.i3" "$HOME/.i3"
