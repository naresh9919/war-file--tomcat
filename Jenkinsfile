pipeline{
    agent any
    tools {
        maven "3.8.6"
    }
    stages {
        stage("Build stage"){
            steps {
                sh "mvn clean install"
            }
        }
        stage ("sonarqube code analysis"){
            steps {
             withSonarQubeEnv("sonarqube 8.9.9"){
                 sh "mvn sonar:sonar"
                }
            }
        }
        stage("Quality Gate Status"){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube-credentials'
                }
            }
        }
    }
}
