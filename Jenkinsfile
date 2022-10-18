pipeline {
    agent any
    
    tools {
        maven 'maven 3.8.6'
    }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Archiving the artifacts'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deployments'){
            parallel{
                stage ("Deploy to Staging"){
                    steps {
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_pwd', path: '', url: 'http://13.127.119.94:8080/')], contextPath: null, war: '**/*.war'
                    }
                }
            }
        }
        stage("static code analasis"){
            steps{
                withSonarQubeEnv("sonarqube 8.9.9"){
                    sh "mvn sonar:sonar"
                }
            }
        }
        stage("Build docker image"){
            steps{
                script{
                    sh "docker build -t nareshbabu1991/simpletomcatwebapp ."
                }
            }
        }
        stage("push docker to hub"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub_pwd', variable: 'dockerhub')]) {
                     sh "docker login -u nareshbabu1991 -p ${dockerhub_pwd}"
}
                     sh "docker push nareshbabu1991/simpletomcatwebapp"
                }
            }
        }
    }
}
