pipeline {
    agent any
    tools {
        maven 'maven 3.8.6'
    }
    stages {
        stage("build maven"){
            steps {
                sh 'mvn clean install'
            }
        }
        stage("static code analasis"){
            steps {
                withSonarQubeEnv("SonarQube 8.9.9"){
                    sh "mvn sonar:sonar"
                }
            }
        }
        stage("Quality Gate Status"){
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube_pwd'
                }
            }
        }
    }
}
