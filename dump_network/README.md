Run `tcpdump` to grab the packages for later analysis (Wireshark https://www.wireshark.org/ , Fiddler https://www.telerik.com/fiddler )

Requirement: `docker`, `tcpdump`, `nsenter`

Usage:

```enter.sh <part of the name of the docker container; or container id> ```

*The name pattern must be long enough to locate one docker container*

This script will get which port this docker container opens, and run `tcpdump` to sniff the packages.

The dumped file will be saved to `/tmp/dump.pcap`
