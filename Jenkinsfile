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
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_credentials', path: '', url: 'http://13.232.81.39:8080/')], contextPath: null, war: '**/*.war'
                    }
                }
            }
        }
        stage("static code analasis"){
            steps{
                withSonarQubeEnv("SonarQube 8.9.9"){
                    sh "mvn sonar:sonar"
                }
            }
        }
    }
}
