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
              app = docker.build("pontoriero3/addressbook")
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
             script{
                 docker.withRegistry('https://registry.hub.docker.com', 'git') {
                 app.push("${env.BUILD_NUMBER}")
                 app.push("latest")
                 }
             }
         }
     }
  }
}
