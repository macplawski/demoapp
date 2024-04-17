pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def now = new Date()
                    println now.format("yy.MM.dd.HH.mm", TimeZone.getTimeZone('UTC'))
                    sh "sed -i 's/JOB_DATE/${now.format("yyyy.MM.dd-HH.mm")} /g' src/main/webapp/index.jsp"
                    docker.build("demoapp:${env.BUILD_ID}", "--no-cache .")
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