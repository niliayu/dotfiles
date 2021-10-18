log_file=~/install_progress_log.txt

# Remove existing dotfiles
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1

dotfiles_dir=~/repos/dotfiles

# Create symlinks to new dotfiles
ln -sf $dotfiles_dir ~/.vim
ln -sf $dotfiles_dir ~/.vimrc
ln -sf $dotfiles_dir ~/.bashrc
ln -sf $dotfiles_dir ~/.tmux
ln -sf $dotfiles_dir ~/.tmux.conf

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Finished installing dotfiles!"
rm $log_file

