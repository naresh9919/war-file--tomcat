pipeline {
    agent any
    stages{
        stage('Docker Build and Tag'){
            steps{
                sh 'docker build –t simpleproject:latest .'
                sh 'docker tag simpleproject nareshbabu1991/simpleproject:latest .'
                sh 'docker tag simpleproject nareshbabu1991/simpleproject:$BUILD_NUMBER'
            }
        }
        stage('Publish image to Docker Hub'){
            steps{
                withDockerRegistry([ credentialsId: "docker_cred", url: "https://hub.docker.com/repository/docker/nareshbabu1991/simpleproject" ])
                sh  'docker push nareshbabu1991/simpleproject:latest'
                sh  'docker push nareshbabu1991/simpleproject:$BUILD_NUMBER'
            }
        }
    }
}
