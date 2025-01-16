pipeline {
    agent any
    stages {
        stage('test') {
            steps {
                echo "Testing the application"
                echo "Executing pipeline for branch $BRANCH_NAME"
            }
        }

        stage('build') {
            when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                echo "Building the application"
            }
        }

        stage('deploy') {
            when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                echo "Deploying the application"
                script {
                    def dockerCmd = "docker-compose -f docker-compose.yml up -d"
                    sshagent(['ec2-server-key']) {
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