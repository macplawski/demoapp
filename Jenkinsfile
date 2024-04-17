pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def now = new Date()
                    println now.format("yyMMdd.HHmm", TimeZone.getTimeZone('UTC'))
                    sh "sed -i 's/JOB_DATE/${now.format("yyyyMMddHHmm")} /g' src/main/java/Hello.java"
                    sh "cat src/main/java/Hello.java"
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