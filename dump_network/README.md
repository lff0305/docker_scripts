Run tcpdump to grab the packages for later analysis (Wireshark, Fiddle)

Usage:

enter.sh <part of the name of the docker container; or container id> 

This script will get which port this docker container opens, and run `tcpdump` to sniff the packages.

The dumped file will be saved to `/tmp/dump.pcap`
