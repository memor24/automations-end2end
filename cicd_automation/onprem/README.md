



### Note on Jenkins installation
You can use docker image for Jenkins, or install it on a local development environment:
Java (runtime & compiler) is required to be installed for Jenkins to work:
```
java -version
sudo apt install default-jre

javac -version
sudo apt install default-jdk
```
Then, Jenkins can be installed with an Ansible role, or via instructions on the Jenkins doc for the specific host:
```
ansible-galaxy role install geerlingguy.jenkins
```

