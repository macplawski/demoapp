pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def hostname = InetAddress.getLocalHost().getHostName()

                    def currentDate = new Date()
                    def formattedDate = currentDate.format("dd.MM.yyyy")
                    sh "sed -i "s/JOB_DATE/${formattedDate} ${hostname}/g" src/main/java/Hello.java"

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