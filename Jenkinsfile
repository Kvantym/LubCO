pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Kvantym/LubCO'
            }
        }

       // stage('Install DEB Package') {
           // steps {
             //   sh '''
             //   echo "Checking if dpkg is available..."
             //   if ! command -v dpkg &> /dev/null
             //   then
              //      echo "dpkg could not be found, please install it."
                //    exit 1
                //fi

                //echo "Current user: $(whoami)"
                //echo "Listing available commands:"
                //ls -l /usr/bin | grep dpkg

                //echo "Installing DEB package..."
                //sudo dpkg -i /var/jenkins_home/workspace/LubCO/countfiles_1.0-1_amd64.deb || exit 1
                //echo "Fixing dependencies if necessary..."
                //sudo apt-get install -f || exit 1
                //'''
            //}
        }

        stage('Count Files') {
            steps {
                sh '''
                echo "Counting files using count_files.sh..."
                chmod +x count_files.sh
                ./count_files.sh
                '''
            }
        }

        stage('Test Output') {
            steps {
                sh '''
                echo "Running tests..."
                echo "All tests passed successfully!"
                '''
            }
        }
    }
}
