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
                  docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                  app.push()
                  }
              }
         }
     }
     stage('Pull & Run App') {
         steps {
            
            agent {
                 docker {
                   image                 'pontoriero3/addressbook-1'
                   reuseNode              true
                   registryUrl           'https://registry.hub.docker.com'
                   registryCredentialsId 'docker-hub-credentials'
                 }
               }
            image.run()
         }
     }  
  }
}
