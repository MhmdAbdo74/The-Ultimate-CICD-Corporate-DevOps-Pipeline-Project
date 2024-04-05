pipeline {
    agent any
    
    tools {
        maven 'mvn'
        jdk 'jdk17'
        // Add SonarQube Scanner tool
        
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MhmdAbdo74/The-Ultimate-CICD-Corporate-DevOps-Pipeline-Project.git'
            }
        }
        
        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('File System Scan') {
            steps {
                sh "trivy fs --format table -o trivy-fs-report.html ."
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh "$SCANNER_HOME/bin/sonar-scanner  \
                        -Dsonar.projectName=BoardGame \
                        -Dsonar.projectKey=BoardGame \
                        -Dsonar.java.binaries=src/"
                }
            }
        }
   stage('Quality Gate') {
 steps {
 script {
 waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
 }
 }
 }
       stage ('Build')
        {
            steps {
                sh 'mvn clean package'
            }
           
        }
        
        stage('publish to nexus ')
        {
            steps {
                sh 'mvn   deploy'

            }
        }




    }

}