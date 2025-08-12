pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/JeevanKumar100/dockerproject.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-jenkins-docker-app")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker stop myapp || true
                    docker rm myapp || true
                    docker run -d -p 5000:5000 --name myapp my-jenkins-docker-app
                '''
            }
        }
    }
}

