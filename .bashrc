# ICONS
UBUNTU_ICON=$'\uf31b'
FOLDER_ICON=$'\uE5FE'
GIT_ICON=$'\uE725'
RIGHT_ARROW=$'\uE0B0'

# COLORES
COLOR_RESET='\e[m'
COLORFG_NEGRO='\e[0;30m'
COLORFG_BLANCO='\e[0;97m'
COLORFG_LIGHTGRAY='\e[38;5;239m'
COLORFG_AMARILLO='\e[0;33m'
COLORFG_BLUE='\e[0;34m'

COLORBG_AMARILLO='\e[43m'
COLORBG_LIGHTGRAY='\e[48;5;239m'
COLORBG_BLUE='\e[44m'

# GIT Function
BRANCH=""
CLEANCOLOR=
# Cheka si hay untracket files, o estan en staged
function checkGitClean(){
  COMMITS=`git status --porcelain`
  if [ -z  "$COMMITS" ];
  then
      echo "IT IS CLEAN"
  else
      echo "PLEASE COMMIT YOUR CHANGE FIRST!!!"
  fi
}
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/*/$GIT_ICON/"
}
get_branch(){
    BRANCH=$(parse_git_branch)
    NO_EXISTE="$COLORFG_AMARILLO$RIGHT_ARROW$COLOR_RESET"
    EXISTE="$COLORFG_AMARILLO$COLORBG_BLUE$RIGHT_ARROW $COLORFG_BLANCO$COLORBG_BLUE$BRANCH $COLOR_RESET$COLORFG_BLUE$RIGHT_ARROW$COLOR_RESET"
    [ -z "$BRANCH" ] && BRANCH="$NO_EXISTE" || BRANCH="$EXISTE"
    echo -e "$BRANCH"
}
# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ $RIGHT_ARROW "
export PS1="\n$COLORFG_NEGRO$COLORBG_AMARILLO $FOLDER_ICON \w $COLOR_RESET\$(get_branch)\n$COLORFG_BLANCO$COLORBG_LIGHTGRAY $UBUNTU_ICON \u@\h $COLOR_RESET$COLORFG_LIGHTGRAY$RIGHT_ARROW$COLOR_RESET"
