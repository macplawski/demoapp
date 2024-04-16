pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                script {
                    docker.build("demoapp:${env.BUILD_ID}")
                }
            }
        }
    }
}