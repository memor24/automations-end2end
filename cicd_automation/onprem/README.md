## CICD automation with Jenkins onpremise
VMware ESXi is used for the Jenkins server, using Terraform.
Jenkins and all dependencies are installed on the server, with Ansible.
All of the CICD pipeline including environment, plugins, etc is automated as code, with Groovy.


### Note on Jenkins installation
You can use docker image for Jenkins, or install it on premise. \
Java (runtime & compiler) is required to be installed for Jenkins to work:
```
java -version
sudo apt install default-jre

javac -version
sudo apt install default-jdk
```

