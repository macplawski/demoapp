pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build("demoapp:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy'){
            steps {
                    ls -la
            }
        }
    }
}