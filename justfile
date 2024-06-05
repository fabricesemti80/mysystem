# Declaratively set shell recipes a.k.a commands should run in
set shell := ["bash", "-uc"]

# Load environment variables
set dotenv-load := true
# apikey:
#    echo " from .env"

# set positional-arguments := true
# foo:
#   echo justinit
#   echo

# Colours

RED:= "\\033[31m"
GREEN:= "\\033[32m"
YELLOW:= "\\033[33m"
BLUE:= "\\033[34m"
MAGNETA:= "\\033[35m"
CYAN:= "\\033[36m"
WHITE:= "\\033[37m"
BOLD:= "\\033[1m"
UNDERLINE:= "\\033[4m"
INVERTED_COLOURS:= "\\033[7m"
RESET := "\\033[0m"
NEWLINE := "\n"

# Recipes

default:
    @#This recipe will be the default if you run just without an argument, e.g list out available commands
    @just --list --unsorted --list-heading $'{{BOLD}}{{GREEN}}Available recipes:{{NEWLINE}}{{RESET}}'

add-git:    
    git add .

#? this next one is equivalent of --> sudo nixos-rebuild switch --show-trace --flake .#$HOSTNAME
#? make sure to declare "dotfilesDir" and use it to set FLAKE env var!
rebuild-system:
    just add-git
    nh os switch --update

#? this is equivalent of --> home-manager switch --flake .#$USER@$HOSTNAME
rebuild-home:
    just add-git
    nh home switch --update

rebuild-full:
    just rebuild-system
    just rebuild-home

update:
    just add-git
    nix flake update    

# ? replaces --> nix-collect-garbage --delete-old 
gc:
    nh clean all --keep 5
	   