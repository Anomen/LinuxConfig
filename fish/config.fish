set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_TIME_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_DOCKER_SHOW false

bind -k ppage history-search-backward
bind -k npage history-search-forward

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
