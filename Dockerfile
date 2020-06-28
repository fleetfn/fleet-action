FROM node:12
ENV XDG_CONFIG_HOME /github/workspace
ENV FLEET_HOME /github/workspace
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]