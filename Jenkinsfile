pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Починаємо Checkout..."
                    checkout scm
                    echo "Checkout завершено."
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Починаємо будівництво Docker-образу..."
                    // Просто виводимо повідомлення, без будівництва
                    echo "Docker-образ побудовано (імітація)."
                }
            }
        }
        
        stage('Build Package') {
            steps {
                script {
                    echo "Починаємо будівництво пакету..."
                    // Імітація створення пакету
                    echo "Структура пакету створена (імітація)."
                    echo "Пакет побудовано (імітація)."
                }
            }
        }
        
        stage('Install Package') {
            steps {
                script {
                    echo "Спробуємо встановити пакет..."
                    // Імітація встановлення пакету
                    echo "Пакет встановлено (імітація)."
                }
            }
        }
        
        stage('Execute Script') {
            steps {
                script {
                    echo "Виконуємо скрипт..."
                    // Імітація виконання скрипта
                    echo "Скрипт виконано (імітація)."
                }
            }
        }
    }
    
    post {
        always {
            echo "Очищення робочого простору..."
            cleanWs()
            echo "Робочий простір очищено."
        }
    }
}
