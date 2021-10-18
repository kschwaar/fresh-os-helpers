alias ll="ls -al"
alias di="docker images"         # shows a list of images on your system
alias dl="docker logs -f"        # usage: dl <container name> # shows the logs for the given container
alias dps="docker ps"            # shows the current running containers
alias dpsa="docker ps -a"        # shows all of the containers, running or not
alias dcd="docker-compose down"  # stops containers in the docker-compose.yml file and removes them
alias dcs="docker-compose stop"  # stops containers in the docker-compose.yml file (can be restarted)
alias dcu="docker-compose up -d" # starts containers in the docker-compose.yml file
alias dcr="dcd && dcu"           # rebuilds containers in the docker-compose.yml file
alias gstat='git status'
alias glog='git log'
alias gdif='git diff'
alias ssql='mysql -u root -h 127.0.0.1 -p'
alias lock='xflock4'
alias todo='todoist q'
alias todolist='todoist l'
alias todoup='todoist m'
alias awsprs='aws --profile personal'
alias gmfresh='git checkout master && git pull'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias xclip='xclip -selection clipboard -rmlastnl'
alias slss='serverless'
alias dprune='docker system prune --all --force --volumes'
function codefish
	set theme_powerline_fonts no
end
. /usr/share/powerline/bindings/fish/powerline-setup.fish

set -U theme_display_git yes
set -U theme_display_git_dirty yes
set -U theme_title_display_process yes
set -U theme_title_use_abbreviated_path no
set -U theme_use_abbreviated_branch_name no
set -U theme_display_k8s_context yes
set -U theme_display_virtualenv yes
set -U theme_display_node yes
set -U theme_title_display_path yes
set -U theme_title_display_user yes
set -U theme_title_use_abbreviated_path no
set -U theme_avoid_ambiguous_glyphs yes
set -U theme_show_exit_status yes
set -U theme_display_jobs_verbose yes
set -U theme_color_scheme dark
set -U fish_prompt_pwd_dir_length 0
set -U theme_project_dir_length 0

source "$HOME/anaconda3/etc/fish/conf.d/conda.fish"


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

alias sonar-scanner='~/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner'
alias laws='aws --endpoint-url=http://localhost:4566'
