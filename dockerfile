# Use Node.js as the base image
FROM node:14

# Update and install Shadowsocks-libev
RUN apt-get update && \
    apt-get install -y shadowsocks-libev

# Install Shadowsocks Manager
RUN npm i -g shadowsocks-manager --unsafe-perm

# Create directory for configuration files
RUN mkdir /configs

# Expose necessary ports (6001 for ss-manager, 6002 for ssmgr, 8388-8390 for Shadowsocks)
EXPOSE 6001 6002 8388-8390

# Run Shadowsocks and Shadowsocks Manager
CMD ["sh", "-c", "ss-manager -m aes-256-gcm -u --manager-address 127.0.0.1:6001 & ssmgr -c /.ssmgr/default.yml"]
