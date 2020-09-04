#!/bin/bash

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

#curl --proxy <proxy_address>:<port> -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh && \
curl  -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh && \
sh install.sh --unattended && \
rm -rf install.sh && \
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && \
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' ~/.zshrc && \
sed -i 's/plugins=(git)/plugins=(git colorize colored-man-pages python zsh_reload zsh-syntax-highlighting)/g' ~/.zshrc && \
sed -i 's/# alias zshconfig="mate ~\/.zshrc"/alias zshconfig="nano ~\/.zshrc"/g' ~/.zshrc && \
sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc && \
sed -i 's/# COMPLETION_WAITING_DOTS="true"/COMPLETION_WAITING_DOTS="true"/g' ~/.zshrc && \
echo ZSH_COLORIZE_STYLE=\"solarized-dark\" >> ~/.zshrc && \
echo alias grep-filter-comments=\"grep -vE '^$|^#'\" >> ~/.zshrc && \
echo alias view-syslog=\"cless /var/log/syslog\" >> ~/.zshrc && \
echo export EDITOR=nano >> ~/.zshrc && \
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
chmod +x ~/Miniconda3-latest-Linux-x86_64.sh
chsh -s /usr/bin/zsh