# Packer Templates
These handy templates can be used to create Packer files, which is about creating custom images and then deploying them after,
unlike the traditional way of deploying images and configuring them later.

To prepare and download the plugins:
```
packer fmt .
packer init .
packer validate .
```
Then build the custom image:
```
packer build .
```

For using cloud images as initial template, use cloud credentials, e.g. for AWS CLI:
```
$ export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
$ export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
```
