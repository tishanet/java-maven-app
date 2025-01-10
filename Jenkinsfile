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

        stage('Docker build') {
            steps {
                echo "Building the Docker image..."
                sh 'docker build -t tishadev/java-app:1.0 .'
                sh 'docker images'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push tishadev/java-app:1.0'
            }
        }
    }

    post {
        success {
            echo "Job is successful!"
        }
        failure {
            echo "Job is failed! Please check the logs for details."
        }
    }
}