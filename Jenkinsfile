pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Count Files') {
            steps {
                script {
                    // Вказуємо каталог, в якому потрібно підрахувати файли
                    def directoryPath = '/mnt/f/EMPI/EMPI6' // Переконайтесь, що шлях правильний для Linux
                    
                    // Підрахунок файлів (для Linux)
                    def fileCount = sh(script: "find '${directoryPath}' -type f | wc -l", returnStdout: true).trim()
                    
                    // Вивід кількості файлів на консоль
                    echo "Number of files in '${directoryPath}': ${fileCount}"
                }
            }
        }
    }
}
