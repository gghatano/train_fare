#!/bin/bash

dir=$(dirname $0)
stations=$(cat $dir/stations.txt.part)

for station1 in $stations
do
  for station2 in $stations 
  do
    if [ $station1 != $station2 ]; then
      echo $station1 $station2 $(curl http://www.navitime.co.jp/transfer/searchlist?orvStationName=$station1\&dnvStationName=$station2\&sort=1\&from=view.transfer.searchlist.tab.fare | 
      grep "summary_fare_ic" | 
      head -n 1 | 
      sed -e 's/.*\([0-9]\{3,4\}円\).*/\1/') >> result.txt &
    fi
  done
done

