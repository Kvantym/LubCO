pipeline {
    agent {
        docker {
            image 'count-files-pipeline' // Назва вашого образу
            args '-v C:/Users/makss/OneDrive/Documents/my-files:/data' // Мапа для доступу до файлів на хості
        }
    }
    stages {
        stage('Run count_files.sh') {
            steps {
                sh '/usr/local/bin/count_files.sh /data'
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
