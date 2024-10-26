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
                # Використовуйте правильний шлях до RPM пакета
                sudo rpm -ivh /mnt/c/wsl.localhost/Ubuntu-22.04/home/kvantym/rpmbuild/RPMS/x86_64/countfiles-1.0-1.x86_64.rpm
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
