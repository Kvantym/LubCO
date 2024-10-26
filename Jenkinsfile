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

                # Список встановлених пакетів для перевірки
                echo "Currently installed packages:"
                dpkg --get-selections

                # Встановлення DEB пакета
                echo "Installing DEB package..."
                sudo dpkg -i /var/jenkins_home/workspace/LubCO/countfiles_1.0-1_amd64.deb

                # Виправлення залежностей, якщо потрібно
                echo "Fixing dependencies if necessary..."
                sudo apt-get install -f
                '''
            }
        }

        stage('Count Files') {
            steps {
                // Ваш скрипт для підрахунку файлів
                sh '''
                echo "Counting files..."
                # Підрахунок файлів у каталозі
                file_count=$(ls -1 | wc -l)
                echo "Total files: $file_count"
                '''
            }
        }
    }
}
