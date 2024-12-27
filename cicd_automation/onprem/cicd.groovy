// write the entire pipeline in groovy including
// (?user, environment, stages, plugins)
// versioning + tagging

def buildApp(){
    sh 'pip3 install -r requirements.txt'
}

def testApp(){
    sh 'pytest'
}

def deployApp(){
    sh 'cp -r ./dist/* /var/www/html'
}
