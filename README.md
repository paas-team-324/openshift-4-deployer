# OpenShift 4 Deployer

Deployer image for OpenShift 4 Automation.

``` bash
# enter redhat credentials
vi SM_USER
vi SM_PASSWORD

# store as env vars
SM_USER=$(cat SM_USER)
SM_PASSWORD=$(cat SM_PASSWORD)

# log in to redhat registry
docker login registry.redhat.io -u $SM_USER -p $SM_PASSWORD

# build deployer
docker build --no-cache -t deployer:base --build-arg SM_USER=$SM_USER --build-arg SM_PASSWORD=$SM_PASSWORD .

# clean up
docker logout registry.redhat.io
unset SM_USER
unset SM_PASSWORD
rm -f SM_USER SM_PASSWORD
```

You can now transfer the `deployer:base` image.
