pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'jdk17'
    
    }
    environment {
      //add sonar-scanner tool 
        scannerHome = tool 'sonar-scanner'

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
        stage('Test') {
 steps {
 sh "mvn test"
 }
 }


     
        
        stage('File System Scan') {
            steps {
               sh "trivy fs --format table -o trivy-fs-report.html ."
            }
        }
    
    stage('SonarQube Analsyis') {
 steps {
     withSonarQubeEnv('sonar-server') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=BoardGame \
                   -Dsonar.projectName=BoardGame \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
            }
 }
 }
}
}