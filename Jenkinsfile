pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Клонування репозиторію
                git branch: 'main', url: 'https://github.com/Kvantym/LubCO'
            }
        }

        stage('Install RPM Package') {
            steps {
                // Встановлення RPM пакета
                sh '''
                # Перевірте, чи RPM встановлено
                if ! command -v rpm &> /dev/null
                then
                    echo "rpm could not be found, please install it."
                    exit 1
                fi
                
                # Використовуйте правильний шлях до RPM пакета
                rpm -ivh /var/jenkins_home/workspace/LubCO/countfiles-1.0-1.x86_64.rpm
                '''
            }
        }

        stage('Count Files') {
            steps {
                // Ваш скрипт для підрахунку файлів
                sh '''
                # Команди для підрахунку файлів
                echo "Counting files..."
                ls -l | wc -l
                '''
            }
        }
    }
}
