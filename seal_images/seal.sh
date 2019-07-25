#!/bin/bash

if [ -z "$1" ]; then
   echo "Please specify tag."
   exit 1
fi

for FILE in `find . -name docker-compose.yml`; do
  echo "Processing ${FILE}"
  IFS=$'\n'
  for IMAGE in `docker-compose -f ${FILE} images 2>/dev/null |awk '{if (NR>2){print $2 "," $3 "," $4}}'`; do
     # echo " -> ${IMAGE}"
     IFS=","
     arr=($IMAGE)
     if [ ${#arr[@]} -ne 3 ]; then
        echo "Length invalid. ${#arr[@]} Skip"
        continue;
     fi;
     if [[ "${arr[0]}" =~ abc\.internal\.com ]]; then

             CMD="docker tag ${arr[2]} ${arr[0]}:$1"
             eval $CMD
             rc=$?; if [[ $rc != 0 ]]; then
                 echo "Failed to tag ${arr[2]} ${arr[0]}:$1" 
                 exit $rc;
             fi
             CMD="docker push ${arr[2]} ${arr[0]}:$1"
             echo "Pushing $CMD"
             eval $CMD
             rc=$?; if [[ $rc != 0 ]]; then
                 echo "Failed to push ${arr[2]} ${arr[0]}:$1" 
                 exit $rc;
             fi
     fi
  IFS=$'\n'
  done;
done;
