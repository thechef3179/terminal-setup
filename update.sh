#! /bin/zsh

# update zshrc
cp ~/Documents/Codes/terminal-setup/ohmyzsh/zshrc ~/.zshrc

# update neovim
mkdir -p ~/.config/nvim/{after,lua}
mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/nvim/lua/{plugins,config}
cp ~/Documents/Codes/terminal-setup/nvim/init.lua ~/.config/nvim/init.lua
cp ~/Documents/Codes/terminal-setup/nvim/after/ftplugin/* ~/.config/nvim/after/plugin/*
cp ~/Documents/Codes/terminal-setup/nvim/lua/keybinds.lua ~/.config/nvim/lua/keybinds.lua
cp ~/Documents/Codes/terminal-setup/nvim/lua/lsp.lua ~/.config/nvim/lua/lsp.lua
cp ~/Documents/Codes/terminal-setup/nvim/lua/config/* ~/.config/nvim/lua/config/
cp ~/Documents/Codes/terminal-setup/nvim/lua/plugins/* ~/.config/nvim/lua/plugins/

# update tmux
cp ~/Documents/Codes/terminal-setup/tmux/tmux.conf ~/.tmux.conf
