ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }

PS3="Select CPU architecture: "

select arch in x86_64 x86 exit
do  
    case $arch in
    x86_64)
      # greenprint "Selected architecture: $arch"
      ARCH=$arch
      break
      ;;
    x86)
      # greenprint "Selected architecture: $arch"
      ARCH=$arch
      break
      ;;
    exit)
      redprint "exiting..."
      break
      ;;
    *) 
      redprint "Invalid option $REPLY"
      ;;
  esac
done

echo ""

PS3="Select OS: "

select os in linux osx windows exit
do  
    case $os in
    linux)
      # greenprint "Selected os: $os"
      OS=$os
      break
      ;;
    osx)
      # greenprint "Selected os: $os"
      OS=$os
      break
      ;;
    windows)
      # greenprint "Selected os: $os"
      OS=$os
      break
      ;;
    exit)
      redprint "exiting..."
      break
      ;;
    *) 
      redprint "Invalid option $REPLY"
      ;;
  esac
done

echo ""

read -p 'Enter number of runners: ' RUNNERS
read -p 'Enter github token: ' GH_TOKEN

sed -i '' "8s/.*/      - ACCESS_TOKEN=$GH_TOKEN/" docker-compose.yml

echo ""
greenprint "Done!"
echo ""

greenprint "
Next run the following commands to startup the runners

$ docker-compose build
$ docker-compose up --scale runner=$RUNNERS -d
"