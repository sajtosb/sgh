#!/bin/bash

# ------------------------------------------------------------
# SGH install script: sgh_isntall.sh - version: 20230322_2115
# For the latest version visit: https://github.com/sajtosb/sgh
# ------------------------------------------------------------

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"&

# Enlarge swap file to 1024 MB
sudo sed -i 's/CONF_SWAPSIZE=.*$/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile restart

# Enable I2C protocol
sudo raspi-config nonint do_i2c 0

# I2C clock stretching
new_values="# Clock stretching by slowing down to 10 kHz\n\
dtparam=i2c_arm_baudrate=10000"
sudo sed -i '/dtparam=i2c_arm=on/a\'"$new_values" 	

# Add Telegraf, Grafana repository
curl -sSL https://packages.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/grafana.gpg >/dev/null
echo "deb https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
curl -sSL https://repos.influxdata.com/influxdata-archive.key |  gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive-keyring.gpg >/dev/null
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

# Update and upgrade OS packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install required OS packages
sudo apt-get install -y vim mc htop influxdb telegraf grafana python3-pip fswebcam i2c-tools iptables

# Install required Python packages
sudo pip3 install adafruit-blinka influxdb adafruit-circuitpython-tsl2591 adafruit-circuitpython-ccs811 adafruit-circuitpython-bme680 adafruit-circuitpython-bme280 adafruit-circuitpython-seesaw RPLCD smbus2
#### - RPi.GPIO

# Set up basic firewall rules
### - nem mukodik restart elott
# sudo iptables -F &&
# sudo iptables -X &&
# sudo iptables -Z &&
# sudo iptables -P INPUT DROP &&
# sudo iptables -P FORWARD ACCEPT &&
# sudo iptables -P OUTPUT ACCEPT &&
# sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT &&
# sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT &&
# sudo iptables -A INPUT -p tcp --dport 3000 -j ACCEPT

# Add Telegraf config
new_values='
# SGH project config
[[outputs.influxdb]]
urls = ["http://127.0.0.1:8086"]
database = "sghdb"

[[inputs.file]]
  files = ["/sys/class/thermal/thermal_zone0/temp"]
  name_override = "cpu_temperature"
  data_format = "value"
  data_type = "integer"

[[inputs.exec]]
  commands = ["/usr/bin/vcgencmd measure_temp"]
  name_override = "gpu_temperature"
  data_format = "grok"
  grok_patterns = ["%{NUMBER:value:float}"]

[[inputs.net]]

[[inputs.netstat]]

[[inputs.ping]]
# Override default interval for ping testing
interval = "60s"

# ## Hosts to send ping packets to. Google, Google DNS and OpenDNS
urls = ["google.com", "8.8.8.8", "208.67.222.222", "teams.microsoft.com", "80.244.96.135"]

# ## Number of ping packets to send per interval.  Corresponds to the "-c"
# ## option of the ping command.
count = 3

# ## If set, the time to wait for a ping response in seconds.  Operates like
# ## the "-W" option of the ping command.
timeout = 2.0

[[inputs.system]]

[[inputs.mem]]
'
echo "$new_values" | sudo tee -a /etc/telegraf/telegraf.d/sgh.conf >/dev/null

# Enable and start Telegraf, Influxdb, Grafana server
sudo systemctl enable telegraf influxdb grafana-server
sudo systemctl start telegraf influxdb grafana-server

# Create sghdb in Influxdb
echo "create database sghdb" | influx -host localhost -port 8086
