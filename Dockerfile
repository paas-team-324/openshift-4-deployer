FROM registry.redhat.io/rhel7:7.9

# subscribe to RedHat repos
ARG SM_USER
ARG SM_PASSWORD
RUN subscription-manager register --username ${SM_USER} --password ${SM_PASSWORD} --auto-attach

# install python and pip
RUN yum install -y \
    \
    python3-3.6.8 \
    python3-pip-9.0.3 \
    iproute-4.11.0 \
    python-dns-1.12.0 \
    less-458 \
    vim-7.4 \
    openssh-clients-7.4p1 \
    sshpass-1.06 \
    rsync-3.1.2 \
    \
    && yum clean all && subscription-manager unsubscribe --all && rm -rf /var/cache/yum

# install tools
RUN python3 -m pip install --no-cache --upgrade pip
RUN LANG=en_US.UTF-8 pip3 install --no-cache \
    \
    openshift==0.11.2 \
    ansible==3.0.0 \
    docker==4.4.3 \
    shtab==1.3.4 \
    passlib==1.7.4 \
    bcrypt==3.2.0 \
    dnspython==2.2.1

RUN ansible-galaxy collection install \
    \
    kubernetes.core:==2.3.0 \
    community.docker:==2.2.1
