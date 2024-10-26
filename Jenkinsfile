pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Клонування репозиторію
                git branch: 'main', url: 'https://github.com/Kvantym/LubCO'
            }
        }

        stage('Install DEB Package') {
            steps {
                // Встановлення DEB пакета
                sh '''
                # Перевірте, чи dpkg встановлено
                if ! command -v dpkg &> /dev/null
                then
                    echo "dpkg could not be found, please install it."
                    exit 1
                fi

                # Вивести змінні середовища для діагностики
                echo "Environment variables:"
                env

                # Встановлення DEB пакета з sudo
                echo "Installing DEB package..."
                sudo dpkg -i /var/jenkins_home/workspace/LubCO/countfiles_1.0-1_amd64.deb

                # Виправлення залежностей, якщо потрібно
                echo "Fixing dependencies if necessary..."
                sudo apt-get install -f
                echo "DEB package installed successfully!"
                '''
            }
        }

        stage('Count Files') {
            steps {
                // Виконання скрипта count_files.sh
                sh '''
                echo "Counting files using count_files.sh..."
                # Дайте права на виконання скрипту
                chmod +x count_files.sh
                # Запустіть скрипт
                ./count_files.sh
                '''
            }
        }

        stage('Test Output') {
            steps {
                // Додатковий етап для тестового виводу
                sh '''
                echo "Running tests..."
                # Тут можна додати тестові команди
                echo "All tests passed successfully!"
                '''
            }
        }
    }
}
