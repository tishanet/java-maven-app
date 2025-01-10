pipeline {
    agent any

    tools {
        maven 'maven-3.9.9' // Use the Maven tool configured in Jenkins
    }

    stages {
        stage('Build with Maven') {
            steps {
                echo "Building the Maven project..."
                sh 'mvn clean package'
            }
        }
    }

    post {
        success {
            echo "Build Successful!"
            script {
                sh 'ls -la ./target'
            }
        }
        failure {
            echo "Build failed! Please check the logs for details."
        }
    }
}