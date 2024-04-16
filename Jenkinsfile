pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    job-date=$(date +%d.%m.%Y)
                    hostname-env=$(hostname)
                    sed -i "s/JOB_DATE/$job-date $hostname-env/g" src/main/java/Hello.java
                    docker.build("demoapp:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy'){
            steps {
                sh "docker service update --image=demoapp:${env.BUILD_ID} demoapp"
            }
        }
    }
}