A script to tag all images under all `docker-compose.yml` in sub-directories.

Users should change the line 19 to change the repo host name to your own repo host. This is used to tag / push the images for interanl images only (Skip the public images for dockerhub)

Usage:
```seal.sh <tag>```

For example
```seal.sh dev_201907```

The script will iterate all `docker-compose.yml`, starts from current directory, and tag all images whose repo is the interl repo with the given `tag` argument and push.



