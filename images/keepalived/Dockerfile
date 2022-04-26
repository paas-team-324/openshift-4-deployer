# rhel8 is required with higher versions of keepalived
FROM registry.redhat.io/ubi8:8.5

# subscribe to RedHat repos
ARG SM_USER
ARG SM_PASSWORD

# install tools from RedHat repos
RUN subscription-manager register --username ${SM_USER} --password ${SM_PASSWORD} --auto-attach && \
    yum install -y \
    \
    keepalived-2.1.5-6.el8 \
    \
    && yum clean all && subscription-manager unsubscribe --all && subscription-manager unregister && rm -rf /var/cache/yum /etc/yum.repos.d/*

# TODO entrypoint and cmd
