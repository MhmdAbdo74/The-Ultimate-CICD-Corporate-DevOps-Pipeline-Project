pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'jdk17'
    
    }
    environment {
      //add sonar-scanner tool 
        SCANNER_HOME = tool 'sonar-scanner'

    }

    stages {

        stage ('git checkout'){
            steps {
                git branch: 'main', url: 'https://github.com/MhmdAbdo74/The-Ultimate-CICD-Corporate-DevOps-Pipeline-Project.git'
            }



        }
        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }
     
        
        stage('File System Scan') {
            steps {
               sh "trivy fs --format table -o trivy-fs-report.html ."
            }
        }
    
    stage('SonarQube Analsyis') {
 steps {
 withSonarQubeEnv('sona-server') {
 sh ''' $SCANNER_HOME/bin/sonar-scanner -
Dsonar.projectName=BoardGame -Dsonar.projectKey=BoardGame \
 -Dsonar.java.binaries=. '''
 }
 }
 }
}
}