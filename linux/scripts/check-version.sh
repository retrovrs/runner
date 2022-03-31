LATEST_VER=$(curl -k -s https://cssudii-data.pages.dev/new_data/txt/version/gh_runner_latest_version.txt)
CURRENT_VER=$(cat version.txt)

ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }

if [ $LATEST_VER == $CURRENT_VER ]
then
   greenprint "Version is up to date."
else
   redprint "Outdated version!"
   cyanprint "Latest version is: $LATEST_VER"
fi