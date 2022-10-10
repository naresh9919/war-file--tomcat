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
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_credentials', path: '', url: 'http://13.232.253.83:8080/')], contextPath: null, war: '**/*.war'
                    }
                }
            }
        }
                stage("static code analysis"){
                    steps{
                        script{
                            withSonarQubeEnv(credentialsId: 'sonar_credentials')
                            sh "mvn clean package sonar:sonar"
                        }
                    }
                }
    }
}
