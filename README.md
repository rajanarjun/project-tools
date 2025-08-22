## project tools

scripts that improve and automate my workflow..

#### intiproj
bash script that initializes a tmux session the way I like it when I want to start working on a project, I dont have to manually create tmux session, windows, etc

- creates a tmux session with session name as the project name and 3 windows
- 1st and 2nd window in the project directory
- 3rd window in the $HOME directory
- puts u in 1st window where u can just start working
- if session already exists, it attaches to it

how to use this script?

1. save this without .sh
2. rename it to whatever command u want (I chose "start")
2. chmod +x start
3. move this to $PATH
4. cli command: start "project\_name"

