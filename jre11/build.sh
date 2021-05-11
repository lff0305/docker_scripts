set -e
wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.11%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
tar xzvf OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
rm -rf OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz
m=$(tr '\n' ',' < modules ) 
rm -rf ./openjdk
./jdk-11.0.11+9/bin/jlink --output ./openjdk --add-modules $m
docker build .
