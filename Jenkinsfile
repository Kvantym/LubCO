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
                echo 'Building Docker image...'
                sh 'docker build -t my-jenkins-builder .'
            }
        }
        stage('Run Script in Docker') {
            steps {
                echo 'Running script in Docker container...'
                sh 'docker run --rm my-jenkins-builder bash /usr/local/bin/count_files.sh || (echo "Script failed" && exit 1)'
            }
        }
    }
}
