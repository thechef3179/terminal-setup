#! /bin/zsh

# update zshrc
cp ./ohmyzsh/zshrc ~/.zshrc

# install tpm
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install plugins for .zsh-autosuggestions and .zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions

# update neovim
mkdir -p ~/.config/nvim/lua/{plugins,config}
mkdir -p ~/.config/nvim/after/ftplugin
cp ./nvim/init.lua ~/.config/nvim/init.lua
cp ./nvim/after/ftplugin/* ~/.config/nvim/after/ftplugin/
cp ./nvim/lua/*.lua ~/.config/nvim/lua/
cp ./nvim/lua/config/* ~/.config/nvim/lua/config/
cp ./nvim/lua/plugins/* ~/.config/nvim/lua/plugins/

# update tmux
cp ./tmux/tmux.conf ~/.tmux.conf

