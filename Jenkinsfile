pipeline {
    agent any
    stages{
        stage("git checkout"){
            steps{
                git 'https://github.com/naresh9919/war-file--tomcat.git'
            }
        }
        stage("unit testing"){
            steps{
                sh "mvn test"
            }
        }
        stage("integration testing"){
            steps{
                sh "mvn verify -DskipUnitTest"
            }
        }
        stage("maven building"){
            steps{
                sh "mvn clean install"
            }
        }stage("static code analasis"){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'Sonar_credentials')
                    sh "mvn clean install sonar:sonar"
                }
            }
        }
        stage("quality gate status"){
            steps{
                srcipt{
                    withSonarQubeEnv(credentialsId: 'Sonar_credentials')
                }
            }
        }
    }
}
