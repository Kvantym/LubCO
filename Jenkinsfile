pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-jenkins-builder .'
            }
        }
        stage('Run Script in Docker') {
            steps {
                sh 'docker run --rm my-jenkins-builder bash -c "/path/to/your/script.sh"'
            }
        }
    }
}
