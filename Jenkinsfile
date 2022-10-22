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
     stage('Build image') {         
        steps {
          app = docker.build("pontoriero3/addressbook-jenkins")    
       }
     }
     stage('Push image') {
        steps {
          docker.withRegistry('https://registry.hub.docker.com', 'git') {            
          app.push("${env.BUILD_NUMBER}")            
          app.push("latest")        
          }    
        }
     }
  }
}
