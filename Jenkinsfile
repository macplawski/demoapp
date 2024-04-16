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
                  sh 'pwd'
                  sh 'ls -la'
                  sh 'docker ps -a'
                  sh 'docker images'
                  sh 'docker service create --name demoapp -p 8080:8080 --replicas 3 demoapp:${env.BUILD_ID}'
            }
        }
    }
}