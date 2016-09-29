#!/bin/bash

# 1. Install Git
sudo apt-get install git -y

# 2. Install Curl
sudo apt-get install curl -y

# 3. Install Zsh
sudo apt-get install zsh -y

# 4. Make Zsh your default shell
chsh -s $(which zsh)

# 5. Install Oh My Zsh: https://github.com/robbyrussell/oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# 6. Install (for Oh-My-Zsh) Powerlevel9k theme for ZSH: https://github.com/bhilburn/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "" >> $HOME/.zshrc
echo "# Powerlvel9k theme (Oh-My-Zsh)" >> $HOME/.zshrc
echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\"" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# ISO-8601 time format" >> $HOME/.zshrc
echo "POWERLEVEL9K_TIME_FORMAT='%D{%FT%T-%z}'" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Double-Lined Prompt" >> $HOME/.zshrc
echo "POWERLEVEL9K_PROMPT_ON_NEWLINE=true" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Font compatibility" >> $HOME/.zshrc
echo "# POWERLEVEL9K_MODE='compatible'" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "plugins=(git tmux history-substring-search)" >> $HOME/.zshrc
echo "Review your .zshrc and do appropriate modifications, e.g. ZSH_THEME section, plugins section, Base16 section"
read -n1 -r -p "Press space to continue..." key

# 7. Install Powerline Fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# 8. Install Base16 Shell: https://github.com/chriskempson/base16-shell
# NOTE: ONLY ON LOCAL PHYSICAL MACHINE, OTHERWISE AN ERROR SIMILAR TO -> http://superuser.com/questions/864364/tmux-printing-u0x001b-and-112-randomly
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# 9. Configure Base16 Shell in Zsh
echo "" >> $HOME/.zshrc
echo "# Base16 Shell" >> $HOME/.zshrc
echo "BASE16_SHELL=\$HOME/.config/base16-shell/" >> $HOME/.zshrc
echo "[ -n \"\$PS1\" ] && [ -s \$BASE16_SHELL/profile_helper.sh ] && eval \"\$(\$BASE16_SHELL/profile_helper.sh)\"" >> $HOME/.zshrc
# base16_atelier-dune
base16_google-dark

# 10. Install Vim
sudo apt-get install vim -y

# 11. Install vim-pathogen: https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 12. Configure vim-pathogen
echo "execute pathogen#infect()" > $HOME/.vimrc
echo "syntax on" >> $HOME/.vimrc
echo "filetype plugin indent on" >> $HOME/.vimrc

# 13. Install vim-sensible: https://github.com/tpope/vim-sensible
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git

# 14. Install (with Pathogen) vim-airline: https://github.com/bling/vim-airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# 15. Install (with Pathogen) vim-airline-themes
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

# 16. Configure vim-airline
echo "" >> $HOME/.vimrc
echo "\" vim-airline Theme" >> $HOME/.vimrc
echo ":let g:airline_theme = 'bubblegum'" >> $HOME/.vimrc
echo ":let g:airline#extensions#tmuxline#enabled = 0" >> $HOME/.vimrc

# 17. Install (with Pathogen) tmuxline.vim: https://github.com/edkolev/tmuxline.vim
git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim

# 18. Configure tmuxline.vim
echo "" >> $HOME/.vimrc
echo "\" tmuxline.vim Preset" >> $HOME/.vimrc
echo "\" NOTE: need to modify '~/.tmux.conf' file" >> $HOME/.vimrc
echo "let g:tmuxline_preset = {" >> $HOME/.vimrc
echo "        \\ 'a': '[#S]'," >> $HOME/.vimrc
echo "        \\ 'win': '#I:#W#F'," >> $HOME/.vimrc
echo "        \\ 'cwin': '#I:#W#F'," >> $HOME/.vimrc
echo "        \\ 'z': '\"#22T\" %FT%T-%z'," >> $HOME/.vimrc
echo "        \\ 'options': {" >> $HOME/.vimrc
echo "        \\'status-justify': 'left'}" >> $HOME/.vimrc
echo "        \\}" >> $HOME/.vimrc
echo "" >> $HOME/.vimrc
echo "\" tmuxline.vim Theme" >> $HOME/.vimrc
echo "\" NOTE: need to modify '~/.tmux.conf' file" >> $HOME/.vimrc
echo "let g:tmuxline_theme = {" >> $HOME/.vimrc
echo "        \\   'bg'   : [ 244, 236 ]," >> $HOME/.vimrc
echo "        \\   'a'    : [ 236, 150 ]," >> $HOME/.vimrc
echo "        \\   'b'    : [ 253, 239 ]," >> $HOME/.vimrc
echo "        \\   'c'    : [ 244, 236 ]," >> $HOME/.vimrc
echo "        \\   'win'  : [ 150, 236 ]," >> $HOME/.vimrc
echo "        \\   'cwin' : [ 236, 150 ]," >> $HOME/.vimrc
echo "        \\   'x'    : [ 244, 236 ]," >> $HOME/.vimrc
echo "        \\   'y'    : [ 253, 239 ]," >> $HOME/.vimrc
echo "        \\   'z'    : [ 236, 150 ]" >> $HOME/.vimrc
echo "        \\}" >> $HOME/.vimrc

# 19. Install Tmux
sudo apt-get install tmux -y

# 20. Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 21. Configure Tmux plugins
echo "# List of plugins" > $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tpm'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-pain-control'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-sessionist'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-copycat'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-yank'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-logging'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-resurrect'" >> $HOME/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-continuum'" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# Other examples:" >> $HOME/.tmux.conf
echo "# set -g @plugin 'github_username/plugin_name'" >> $HOME/.tmux.conf
echo "# set -g @plugin 'git@github.com/user/plugin'" >> $HOME/.tmux.conf
echo "# set -g @plugin 'git@bitbucket.com/user/plugin'" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# emacs key bindings in tmux command prompt" >> $HOME/.tmux.conf
echo "set -gw xterm-keys on" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# vi key bindings in tmux copy/choice mode" >> $HOME/.tmux.conf
echo "set -gw mode-keys vi" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# tmuxline.vim Theme" >> $HOME/.tmux.conf
echo "# How To:" >> $HOME/.tmux.conf
echo "#   1. Open '~/.vimrc' file with vim editor." >> $HOME/.tmux.conf
echo "#" >> $HOME/.tmux.conf
echo "#   2. Update 'tmuxline.vim Preset' and/or 'tmuxline.vim Theme' section" >> $HOME/.tmux.conf
echo "#      according to your needs and save changes." >> $HOME/.tmux.conf
echo "#" >> $HOME/.tmux.conf
echo "#   3. Within vim type the following command:" >> $HOME/.tmux.conf
echo "#" >> $HOME/.tmux.conf
echo "#     :TmuxlineSnapshot /tmp/tmuxline.conf" >> $HOME/.tmux.conf
echo "#" >> $HOME/.tmux.conf
echo "#   4. Replace content from below with content from '/tmp/tmuxline.conf' file." >> $HOME/.tmux.conf
echo "#" >> $HOME/.tmux.conf
echo "#   5. Save changes and restart shell." >> $HOME/.tmux.conf
echo "set -g status-bg \"colour236\"" >> $HOME/.tmux.conf
echo "set -g message-command-fg \"colour236\"" >> $HOME/.tmux.conf
echo "set -g status-justify \"left\"" >> $HOME/.tmux.conf
echo "set -g status-left-length \"100\"" >> $HOME/.tmux.conf
echo "set -g status \"on\"" >> $HOME/.tmux.conf
echo "set -g pane-active-border-fg \"colour150\"" >> $HOME/.tmux.conf
echo "set -g message-bg \"colour150\"" >> $HOME/.tmux.conf
echo "set -g status-right-length \"100\"" >> $HOME/.tmux.conf
echo "set -g status-right-attr \"none\"" >> $HOME/.tmux.conf
echo "set -g message-fg \"colour236\"" >> $HOME/.tmux.conf
echo "set -g message-command-bg \"colour150\"" >> $HOME/.tmux.conf
echo "set -g status-attr \"none\"" >> $HOME/.tmux.conf
echo "set -g status-utf8 \"on\"" >> $HOME/.tmux.conf
echo "set -g pane-border-fg \"colour239\"" >> $HOME/.tmux.conf
echo "set -g status-left-attr \"none\"" >> $HOME/.tmux.conf
echo "setw -g window-status-fg \"colour150\"" >> $HOME/.tmux.conf
echo "setw -g window-status-attr \"none\"" >> $HOME/.tmux.conf
echo "setw -g window-status-activity-bg \"colour236\"" >> $HOME/.tmux.conf
echo "setw -g window-status-activity-attr \"underscore\"" >> $HOME/.tmux.conf
echo "setw -g window-status-activity-fg \"colour150\"" >> $HOME/.tmux.conf
echo "setw -g window-status-separator \"\"" >> $HOME/.tmux.conf
echo "setw -g window-status-bg \"colour236\"" >> $HOME/.tmux.conf
echo "set -g status-left \"#[fg=colour236,bg=colour150] [#S] #[fg=colour150,bg=colour236,nobold,nounderscore,noitalics]\"" >> $HOME/.tmux.conf
echo "set -g status-right \"#[fg=colour150,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] %FT%T-%z \"" >> $HOME/.tmux.conf
echo "setw -g window-status-format \"#[fg=colour236,bg=colour236,nobold,nounderscore,noitalics]#[default] #I:#W#F #[fg=colour236,bg=colour236,nobold,nounderscore,noitalics]\"" >> $HOME/.tmux.conf
echo "setw -g window-status-current-format \"#[fg=colour236,bg=colour150,nobold,nounderscore,noitalics]#[fg=colour236,bg=colour150] #I:#W#F #[fg=colour150,bg=colour236,nobold,nounderscore,noitalics]\"" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# Automatically restore last saved tmux session" >> $HOME/.tmux.conf
echo "# set -g @continuum-restore 'on'" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
echo "# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)" >> $HOME/.tmux.conf
echo "run '~/.tmux/plugins/tpm/tpm'" >> $HOME/.tmux.conf
echo "" >> $HOME/.tmux.conf
tmux source ~/.tmux.conf
echo "In another shell with Tmux running, press prefix + I (capital I, as in Install) to fetch the plugin"
read -n1 -r -p "Press space to continue..." key

# 22. Install Inconsolata fonts
sudo apt-get install fonts-inconsolata -y
