pipeline {
    agent any
    tools {
        maven 'maven 3.9.0'
    }
    stages {
        stage("build maven"){
            steps {
                sh 'mvn clean install'
            }
        }
        stage("test"){
            steps{
                sh 'mvn test'
            }
        }
        stage("deploy"){
            steps {
                sh 'mvn deploy'
            }
        }
        stage("static code analasis"){
            steps {
                withSonarQubeEnv("SonarQube 8.9.9"){
                    sh "mvn sonar:sonar"
                }
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deployments'){
            parallel {
                stage ("Deploy to Staging"){
                    steps {
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_pwd', path: '', url: 'http://52.66.212.108:8080/')], contextPath: null, war: '**/*.war'
                    }
                }
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                    sh 'docker build -t nareshbabu1991/simpletomcatwebapp .'
                }
            }
        }
        stage('push docker to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub_pwd', variable: 'dockerhub_pwd')]) {
                    sh 'docker login -u nareshbabu1991 -p ${dockerhub_pwd}'
}
                    sh 'docker push nareshbabu1991/simpletomcatwebapp'
                }
            }
        }
    }
}
