pipeline {
    agent any
    stages {
        stage('test') {
            steps {
                echo "Testing the application"
            }
        }

        stage('build') {
            steps {
                echo "Building the application"
            }
        }

        stage('deploy') {
            steps {
                echo "Deploying the application"
                script {
                    def dockerCmd = "docker-compose -f docker-compose.yml up -d"
                    sshagent(['ec2-server-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.221.98.104 ls -la"
                        sh "scp docker-compose.yml ec2-user@54.221.98.104:/home/ec2-user/"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.221.98.104 ${dockerCmd}"

                    }
                }
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