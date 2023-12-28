HISTSIZE=1000000
SAVEHIST=1000000

export UPDATE_ZSH_DAYS=13
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export MANPAGER='nvim + Man!'
export MANWIDTH=999
export XDG_CURRENT_DESKTOP="Wayland"
eval "$(fnm env)"
eval "$(zoxide init zsh)"
export ZSH="$HOME/.oh-my-zsh"
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# FZF stuff
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | xclip -selection -in)+abort'
--bind 'ctrl-e:execute(echo {} | xargs -o  nvim)+abort'
--bind 'ctrl-v:execute(code {+})+abort'
"
export PDSH_RCMD_TYPE=ssh
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules' --exclude '.npm' --exclude '.nuget' --exclude '.pyenv' --exclude '.electron-gyp' --exclude '.cache' --exclude '.vscode*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
eval "$(fasd --init auto)"

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



export PATH="$HOME/.cargo/bin:$HOME/.local/share/go/bin:$HOME/.fnm:$HOME/.local/share/neovim/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/lib/ccache/bin/:$PYENV_ROOT/bin:/home/aaron/perl5/bin:$(echo $PATH | tr ':' '\n' | awk '!x[$0]++' | tr '\n' ':' | sed 's/:$//')"
export PYTHONPATH=$(echo $PYTHONPATH | awk -v RS=: -v ORS=: '/\/usr\/lib\/python3.11\/site-packages/ || /\/home\/aaron\/\.pyenv\/versions\/3.9.16\/python3.9\/site-packages/ {next} {print}' | sed 's/:$//')
export PYTHONPATH="/usr/lib/python3.11/site-packages:/home/aaron/.pyenv/versions/3.9.16/python3.9/site-packages:$PYTHONPATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(direnv hook bash)"

export OPENAI_API_KEY="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"
export OpenAI_Organization="org-Bosb7GthOv8gkz7xpuShclJw"

