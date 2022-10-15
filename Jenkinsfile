pipeline {
    agent any
    tools {
        maven 'maven 3.8.6'
    }
    stages{
        stage('build maven'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t nareshbabu1991/simpletomcatwebapp .'
                }
            }
        }
    }
}
