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
          sh "docker build ~/CICD-PipelineProject/docker-im -t myaddressbook:latest"  
       }
     }
     stage('Push image') {
        steps {
          sh "docker push pontoriero3/myaddressbook"
          }    
        }
     }
  }
}
