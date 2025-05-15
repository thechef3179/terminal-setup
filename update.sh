#! /bin/zsh

# update zshrc
cp ./ohmyzsh/zshrc ~/.zshrc

# update neovim
mkdir -p ~/.config/nvim/{after,lua}
mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/nvim/lua/{plugins,config}
cp ./nvim/init.lua ~/.config/nvim/init.lua
cp ./nvim/after/ftplugin/* ~/.config/nvim/after/ftplugin/
cp ./nvim/lua/*.lua ~/.config/nvim/lua/
cp ./nvim/lua/config/* ~/.config/nvim/lua/config/
cp ./nvim/lua/plugins/* ~/.config/nvim/lua/plugins/

# update tmux
cp ./tmux/tmux.conf ~/.tmux.conf

