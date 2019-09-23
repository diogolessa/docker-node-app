pipeline {
    environment {
        registry = "dlessa/nodejs-docker-app"
        registryCredential = "dockerhub"
        dockerImage = ""
    }
    agent any
    stages {
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Running app') {
            agent {
                docker { image registry }
            }
            steps {
                sh 'docker container stop nodejs-docker-app'
                sh 'docker container rm -f nodejs-docker-app'
                sh 'docker run -p 4000:4000 --name nodejs-docker-app $registry:$BUILD_NUMBER'
            }
        }
        // stage('Test') {
        //     steps {
        //         sh 'node --version'
        //     }
        // }
    }
}