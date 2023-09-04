# magicTool
Bash script for connect to Apple magic keyboard and mouse on startup

# How to use:
- Replace MAC addresses in connectToBluetooth.sh with MAC address of magic keyboard and mouse
- Run script as sudo

# How to run on start up:
- Make `connectToBluetooth.sh` executable: `chmod +x connectToBluetooth.sh`
- Create a file in `/etc/systemd/system/magicTool.service`
```
[Unit]
Description=Magic Tool Script

[Service]
ExecStart=/path/to/connectToBluetooth.sh

[Install]
WantedBy=multi-user.target
```
- Enable the service to run: `systemctl enable magicTool`

- *For best results power cycle magic keyboard and mouse on startup*