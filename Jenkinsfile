pipeline {
    agent any
    
    stages {
        stage('Start') {
            steps {
                script {
                    echo "Pipeline запущено."
                }
            }
        }
        
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
                    // Ваша команда для будівництва образу
                    echo "Docker-образ побудовано (імітація)."
                }
            }
        }
        
        stage('Build Package') {
            steps {
                script {
                    echo "Починаємо будівництво пакету..."
                    echo "Структура пакету створена (імітація)."
                    echo "Пакет побудовано (імітація)."
                }
            }
        }
        
        stage('Install Package') {
            steps {
                script {
                    echo "Спробуємо встановити пакет..."
                    echo "Пакет встановлено (імітація)."
                }
            }
        }
        
        stage('Execute Script') {
            steps {
                script {
                    echo "Виконуємо скрипт..."
                    echo "Скрипт виконано (імітація)."
                }
            }
        }
        
        stage('Finish') {
            steps {
                script {
                    echo "Pipeline завершено."
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
