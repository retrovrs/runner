PS3="Select CPU architecture: "

select arch in x86_64 x86
do
    echo "Selected architecture: $arch"
    echo "Selected number: $REPLY"
done
