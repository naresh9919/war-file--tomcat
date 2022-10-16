pipeline {
    agent any
    tools {
        maven "maven 3.8.6"
    }
    stages{
        stage("maven build"){
            steps{
                sh "mvn clean install"
            }
        }
        stage("static code analasis"){
            steps{
                withSonarQubeEnv(credentialsId: 'sonarqube-pwd') {
                    sh "mvn sonar:sonar"
}
            }
        }
    }
}
