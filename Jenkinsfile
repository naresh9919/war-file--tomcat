pipeline {
    agent any
    
    tools {
        maven 'maven3.8.6'
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
                        deploy adapters: [tomcat7(credentialsId: 'tomcat_credentials', path: '', url: 'http://65.2.176.35:8080/')], contextPath: null, war: '**/*.war'
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
        stage("docker image BUild"){
            steps{
                script{
                    sh "docker image build -t $JOB_NAME:v1,$BULD_ID ."
                    sh "docker image tage $JOB_NAME:v1,$BUILD_ID nareshbabu1991/$JOBNAME:v1$BUILD_ID"
                    sh "docker image tage $JOB_NAME:v1,$BUILD_ID nareshbabu1991/$JOBNAME:latest"
                }
            }
        }
    }
}
