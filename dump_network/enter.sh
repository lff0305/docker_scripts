counter=`docker ps | grep $1 | awk '{print $1}' | wc -l`
if [ $counter -ne 1 ] ;then
  echo '0 or More than one found for pattern '$1
  exit 1
fi
d=`docker ps | grep $1 | awk '{print $1}'`
image=`docker ps | grep $1 | awk '{print $2}'`
echo 'docker container id='$d' ('$image')'

pid=`docker inspect --format "{{.State.Pid}}" $d`
echo 'pid is' $pid
port=`docker port $d | awk '{print $1}' | sed 's/\([0-9]\+\)\/tcp/\1/g'`
counter=0
cmd=""
for p in ${port}; do
 echo 'port is' $p
 let counter++
 if [ $counter -ne 1 ]; then
   cmd="$cmd or port $p"
 else
   cmd="port $p"
 fi
done;

echo $cmd
sudo nsenter -t $pid --uts --ipc --net --pid tcpdump -i eth0 tcp and  "( ${cmd} )"  -w /tmp/dump.pcap