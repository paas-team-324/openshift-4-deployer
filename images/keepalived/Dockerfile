# rhel8 is required with higher versions of keepalived
FROM registry.redhat.io/ubi8:8.5

# subscribe to RedHat repos
ARG SM_USER
ARG SM_PASSWORD

# install tools from RedHat repos
RUN subscription-manager register --username ${SM_USER} --password ${SM_PASSWORD} --auto-attach && \
    yum install -y \
    \
    keepalived-2.1.5-6.el8.x86_64 \
    psmisc-23.1-5.el8.x86_64 \
    procps-ng-3.3.15-6.el8.x86_64 \
    \
    && yum clean all && subscription-manager unsubscribe --all && subscription-manager unregister && rm -rf /var/cache/yum /etc/yum.repos.d/*

RUN useradd keepalived_script

ENTRYPOINT [ "keepalived" ]
CMD [ "--help" ]
