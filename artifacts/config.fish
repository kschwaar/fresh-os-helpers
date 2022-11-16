# fresh-os-helpers START

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

# fresh-os-helpers END