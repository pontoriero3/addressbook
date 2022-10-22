pipeline {
   
   agent any
   
   stages {
     stage ("Clone the GitHub Repository") {
       steps {
         git "https://github.com/pontoriero3/addressbook.git"
       }
     }
     stage ("Compile the Java project") {
       steps { 
         sh "mvn compile"
       }
     }
     stage('Build') { 
         steps { 
             script{
              app = docker.build("pontoriero3/addressbook-1")
             }
         }
     }
     stage('Test'){
         steps {
              echo 'No tests at the moment...'
         }
     }
     stage('Deploy') {
         steps {
              script {
                  // withDockerRegistry([credentialsId: "docker-hub-credentials", url: 'https://registry.hub.docker.com']) {
                  docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                  app.push()
                  }
              }
         }
     }
     stage('Pull & Run App') {
         steps {
              script {   
                     docker run --name pontoriero3/addressbook-1 --restart=on-failure --detach ^
                 --network jenkins --env DOCKER_HOST=tcp://docker:2376 ^
                 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 ^
                 --volume jenkins-data:/var/jenkins_home ^
                 --volume jenkins-docker-certs:/certs/client:ro ^
                 --publish 8080:8080 --publish 50000:50000 myjenkins-pontoriero3/addressbook-1
              }
         }
     }  
  }
}
