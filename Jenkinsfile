pipeline {
    agent {
        docker {
            image 'centos:latest'  // або 'ubuntu:latest' для DEB пакету
            args '-v /var/run/docker.sock:/var/run/docker.sock' // підключення Docker всередині Docker
        }
    }
    stages {
        stage('Build Packages') {
            steps {
                // Завантажуємо скрипт з репозиторію
                checkout scm

                // Будуємо RPM і DEB пакети
                script {
                    if (isUnix()) {
                        sh '''
                            # Створюємо RPM пакет
                            rpmbuild -bb ~/rpmbuild/SPECS/count_files.spec
                            
                            # Створюємо DEB пакет
                            dpkg-deb --build count-files-1.0
                        '''
                    }
                }
            }
        }
        stage('Install and Execute Script') {
            steps {
                script {
                    if (isUnix()) {
                        // Встановлюємо пакет і запускаємо скрипт
                        sh '''
                            # Встановлюємо RPM або DEB, в залежності від системи
                            if [ -f ~/rpmbuild/RPMS/x86_64/count-files-1.0-1.el7.x86_64.rpm ]; then
                                rpm -i ~/rpmbuild/RPMS/x86_64/count-files-1.0-1.el7.x86_64.rpm
                            else
                                dpkg -i count-files-1.0.deb
                            fi

                            # Виконуємо скрипт і виводимо результат
                            /usr/local/bin/count_files.sh
                        '''
                    }
                }
            }
        }
    }
}
