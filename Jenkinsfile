pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven-3.9.9', type: 'hudson.tasks.Maven$MavenInstallation'
    }

    stages {
        stage('Build with Maven') {
            steps {
                script {
                    echo "Building the Maven project..."
                    sh "${MAVEN_HOME}/bin/mvn clean package"
                }
            }
        }
    }