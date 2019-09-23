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
                    dockerImage = docker.build(registry + ":latest")
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
            steps {
                // sh 'docker container stop nodejs-docker-app'
                // sh 'docker container rm -f nodejs-docker-app'
                sh 'docker container run -p 4000:4000 --name nodejs-docker-app $registry:latest'
            }
        }
        // stage('Test') {
        //     steps {
        //         sh 'node --version'
        //     }
        // }
    }
}