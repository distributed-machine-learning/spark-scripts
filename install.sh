sudo apt update
sudo apt upgrade -y

# install java 8 and check version
sudo apt install openjdk-8-jdk openjdk-8-jre -y
java -version

# set JAVA-* env vars
sudo cat >> /etc/environment <<EOL
JAVA_HOME= /usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
EOL

# download and extract spark 2.4 with hadoop 2.7
wget http://mirrors.estointernet.in/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz -O ~/spark-2.4.4-bin-hadoop2.7.tgz
tar xvzf ~/spark-2.4.4-bin-hadoop2.7.tgz -C ~/
sudo ln -s ~/spark-2.4.4-bin-hadoop2.7 /usr/bin/spark

if [ $? -eq 0 ]; then
    rm ~/spark-2.4.4-bin-hadoop2.7.tgz
else
    echo "There were errors installing spark"
fi

# set env variables
echo "SPARK_HOME=/idr00t/spark" >> ~/.bashrc
echo "export PATH=$SPARK_HOME/bin:$PATH" >> ~/.bashrc
