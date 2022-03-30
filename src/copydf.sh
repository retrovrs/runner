OS=$1
ARCH=$2
FILENAME=$3

cp "$OS/$ARCH/$FILENAME" ../Dockerfile
echo "current dir"
ls
echo "../"
ls ../