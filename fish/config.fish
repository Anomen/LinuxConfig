set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_TIME_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_DOCKER_SHOW false

bind -k ppage history-search-backward
bind -k npage history-search-forward

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

