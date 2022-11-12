pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages {
        stage("git"){
            steps{
                git credentialsId: 'git-credentials', url: 'https://github.com/naresh9919/war-file--tomcat.git'
            }
        }
        stage("build code"){
            steps {
                sh "mvn clean install"
            }
        }
        stage("static code analasis"){
            steps {
                withSonarQubeEnv("sonarqube 8.9.9"){
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
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_pwd', path: '', url: 'http://3.110.41.6:8080/')], contextPath: 'war', war: '**/*.war'
                    }
                }
            }
        }
    }
}
