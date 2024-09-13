set -x

# Remove existing dotfiles
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1

dotfiles_dir=~/repos/dotfiles

# Create symlinks to new dotfiles
# ln -sf $dotfiles_dir/.vim ~/.vim
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.bash_profile ~/.bash_profile
ln -sf $dotfiles_dir/.tmux ~/.tmux
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf

