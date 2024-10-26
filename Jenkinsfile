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
                script {
                    docker.build('sysprog-image:latest')
                }
            }
        }
        
        stage('Build Package') {
            steps {
                script {
                    docker.image('sysprog-image:latest').inside('--entrypoint=""') {
                        sh '''
                            echo "Створюємо директорію build..."
                            mkdir -p build
                            cd build
                            
                            echo "Створюємо структуру пакету..."
                            mkdir -p sysprog_1.0-1/DEBIAN
                            echo "Package: sysprog" > sysprog_1.0-1/DEBIAN/control
                            echo "Version: 1.0-1" >> sysprog_1.0-1/DEBIAN/control
                            echo "Section: base" >> sysprog_1.0-1/DEBIAN/control
                            echo "Priority: optional" >> sysprog_1.0-1/DEBIAN/control
                            echo "Architecture: all" >> sysprog_1.0-1/DEBIAN/control
                            echo "Maintainer: Your Name <your.email@example.com>" >> sysprog_1.0-1/DEBIAN/control
                            echo "Description: Sample SysProg Package" >> sysprog_1.0-1/DEBIAN/control
                            
                            echo "Копіюємо скрипт count_files.sh..."
                            mkdir -p sysprog_1.0-1/usr/local/bin
                            cp /usr/local/bin/count_files.sh sysprog_1.0-1/usr/local/bin/
                            echo "Копіювання завершено."
                            
                            echo "Будуємо deb пакет..."
                            dpkg-deb --build sysprog_1.0-1
                            echo "Пакет побудовано."
                        '''
                        
                        // Завжди будуємо RPM
                        sh '''
                            echo "Будуємо RPM пакет з deb..."
                            cd build
                            alien -r --scripts sysprog_1.0-1.deb
                            echo "RPM файл:"
                            ls -la
                            find . -name "*.rpm"
                        '''
                    }
                }
            }
        }
        
        stage('Install Package') {
            steps {
                script {
                    docker.image('sysprog-image:latest').inside('--entrypoint=""') {
                        sh '''
                            cd build
                            echo "Список файлів у каталозі build:"
                            ls -la
                            
                            RPM_FILE=$(find . -name "*.rpm")
                            if [ -n "$RPM_FILE" ]; then
                                echo "Встановлюємо RPM файл: $RPM_FILE"
                                rpm -ivh $RPM_FILE
                            else
                                echo "RPM файл не знайдено"
                                exit 1
                            fi
                        '''
                    }
                }
            }
        }
        
        stage('Execute Script') {
            steps {
                script {
                    docker.image('sysprog-image:latest').inside('--entrypoint=""') {
                        sh '''
                            echo "Перевіряємо вміст /usr/local/bin..."
                            ls -la /usr/local/bin
                            echo "Вміст скрипта count_files.sh:"
                            cat /usr/local/bin/count_files.sh
                            echo "Виконуємо скрипт count_files.sh:"
                            /usr/local/bin/count_files.sh
                        '''
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
