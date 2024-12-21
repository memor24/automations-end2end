## CICD automation with Jenkins onpremise
VMware ESXi is used for the Jenkins server, using Terraform.
Jenkins and all dependencies are installed on the server, with Ansible.
All of the CICD pipeline including environment, plugins, etc is automated as code, with Groovy.

### Note on Jenkins installation
You can also use docker image for Jenkins.

Java (runtime & compiler) is required to be installed for Jenkins to work.
```
java -version
javac -version
```
Or install Jenkins and all dependencies on the server with Ansible: \
```
ansible-playbook install_jenkins.yml
```
After running Ansible playbook, update the jenkins.service unit file:
```
sudo vi /etc/systemd/system/jenkins.service
# and add this info:
[Service]
User=devops
Group=jenkins
ExecStart=/usr/bin/java -jar /usr/share/jenkins/jenkins.war --httpPort=8085 --httpListenAddress=0.0.0.0
Restart=on-failure
```
