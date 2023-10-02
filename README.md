
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# MySQL Packet Too Large Error.
---

This incident type occurs when a MySQL server receives a packet that is larger than the maximum size allowed for the packet. This can happen when a client attempts to send data to the server that surpasses the limit set by the server configuration. As a result, the MySQL server terminates the connection and generates an error message indicating that the packet is too large. This error can impact the availability and performance of the application that relies on the MySQL database.

### Parameters
```shell
export USERNAME="PLACEHOLDER"
export NEW_PACKET_SIZE="PLACEHOLDER"
export MAX_ALLOWED_PACKET_SIZE="PLACEHOLDER"
export PASSWORD="PLACEHOLDER"
```

## Debug

### Check MySQL service status
```shell
systemctl status mysql
```

### Check MySQL log for errors
```shell
tail -f /var/log/mysql/error.log
```

### Check MySQL max_allowed_packet value
```shell
mysql -u ${USERNAME} -p ${PASSWORD} -e "SHOW VARIABLES LIKE 'max_allowed_packet';"
```



## Repair

### Increase the `max_allowed_packet` value in the MySQL configuration file. This is the maximum size of a packet that MySQL can receive or send.
```shell
#!/bin/bash

# Set the new value for `max_allowed_packet`
NEW_PACKET_SIZE=${NEW_PACKET_SIZE}

# Update the MySQL configuration file with the new value
sudo sed -i "s/^max_allowed_packet=.*/max_allowed_packet=$NEW_PACKET_SIZE/g" /etc/mysql/my.cnf

# Restart the MySQL service to apply the changes
sudo systemctl restart mysql


```