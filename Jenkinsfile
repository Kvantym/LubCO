pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Клонування коду з репозиторію
                checkout scm
            }
        }

        stage('Count Files') {
            steps {
                script {
                    // Вказуємо каталог, в якому потрібно підрахувати файли
                    def directoryPath = 'F:\\EMPI\\EMPI6' // Вказано правильний шлях

                    // Підрахунок файлів (для Windows)
                    def fileCount = bat(script: "dir /b /a-d \"${directoryPath}\" | find /c /v \"\"", returnStdout: true).trim()

                    // Вивід кількості файлів на консоль
                    echo "Number of files in '${directoryPath}': ${fileCount}"
                }
            }
        }
    }
}
