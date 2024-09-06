time3=$(date "+%m-%d-%H-%M")

path="/backup/$time3-docker.tar.gz"


tar -zcf $path "/docker" --exclude *.tar.gz

echo "备份完毕!$time3"
