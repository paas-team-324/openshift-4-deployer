FROM registry.redhat.io/ubi8:8.5

# subscribe to RedHat repos
ARG SM_USER
ARG SM_PASSWORD

# install tools from RedHat repos
RUN subscription-manager register --username ${SM_USER} --password ${SM_PASSWORD} --auto-attach && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    yum install -y \
    \
    python39-3.9.7 \
    python39-pip-20.2.4 \
    iproute-5.15.0 \
    less-530 \
    vim-enhanced-8.0.1763 \
    openssh-clients-8.0p1 \
    sshpass-1.06 \
    rsync-3.1.3 \
    \
    && yum remove -y epel-release \
    && yum clean all && subscription-manager unsubscribe --all && subscription-manager unregister && rm -rf /var/cache/yum

# install ansible and other python packages with pip
RUN python3 -m pip install --no-cache --upgrade pip && \
    LANG=en_US.UTF-8 pip3 install --no-cache \
    \
    openshift==0.11.2 \
    ansible==5.7.1 \
    docker==4.4.3 \
    shtab==1.3.4 \
    passlib==1.7.4 \
    bcrypt==3.2.0 \
    dnspython==2.2.1 \
    boto3==1.21.34 \
    botocore==1.24.34

# install relevant ansible collections
COPY collections/* /tmp/collections/
RUN ansible-galaxy collection install \
    \
    kubernetes.core:==2.2.3 \
    community.docker:==2.2.1 \
    /tmp/collections/*
