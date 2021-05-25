Some Docker Scripts.

- dump_network : sniff network packages for a container with tcpdump
- get_log_size : list all container log size
- seal_images : tag all images for docker-compose recursively
- jre11 : build your own small size jre base image, without some uneeded modules, and with some 3rd party tools (Gosu, Athars). The reason for this, is that for some widely used base jre images, some modules are removed which makes it impossible to run some useful java tools (jmap, jstack, jps, etc) and 3rd party tools (Athars, etc).
 
