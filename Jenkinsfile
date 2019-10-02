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
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'chmod +x run.sh'
                sh './run.sh'
            }
        }
        // stage('Test') {
        //     steps {
        //         sh 'node --version'
        //     }
        // }
    }
}