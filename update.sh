#! /bin/zsh

# install oh-my-zsh if not installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "install oh my zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# update zshrc
echo "copying .zshrc file"
cp ./ohmyzsh/zshrc ~/.zshrc
echo "copying custom prompt theme"
cp ./ohmyzsh/custom-amuse.zsh-theme ~/.oh-my-zsh/custom/themes/

# install tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "cloning tpm plugin for tmux"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# install plugins for .zsh-autosuggestions, .zsh-completions, and .zsh-syntax-highlighting
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "cloning zsh-autosuggestions plugin for oh-my-zsh"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "cloning zsh-syntax-highlighting plugin for oh-my-zsh"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
    echo "cloning zsh-completions plugin for oh-my-zsh"
    git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

# creating nvim directories 
if [ ! -d ~/.config/nvim/lua/plugins ]; then
    echo "creating directory ~/.config/nvim/lua/plugins"
    mkdir -p ~/.config/nvim/lua/plugins
fi
if [ ! -d ~/.config/nvim/lua/config ]; then
    echo "creating directory ~/.config/nvim/lua/config"
    mkdir -p ~/.config/nvim/lua/config
fi
if [ ! -d ~/.config/nvim/after/ftplugin ]; then
    echo "creating directory ~/.config/nvim/after/ftplugin"
    mkdir -p ~/.config/nvim/after/ftplugin
fi
# copying nvim files
echo "copying init file for nvim"
cp ./nvim/init.lua ~/.config/nvim/init.lua
echo "copying ftplugin files for nvim"
cp ./nvim/after/ftplugin/* ~/.config/nvim/after/ftplugin/
echo "copying all lua files from .config/nvim/lua"
cp ./nvim/lua/*.lua ~/.config/nvim/lua/
echo "copying all config files (for lazy plugin) for nvim"
cp ./nvim/lua/config/* ~/.config/nvim/lua/config/
echo "copying all plugin files for nvim"
cp ./nvim/lua/plugins/* ~/.config/nvim/lua/plugins/

# update tmux
echo "copying tmux config file"
cp ./tmux/tmux.conf ~/.tmux.conf

source ~/.zshrc

