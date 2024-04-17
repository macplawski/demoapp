#!groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    def now = new Date()
                    sh "sed -i 's/JOB_DATE/${now.format("yyyy.MM.dd-HH.mm")} /g' src/main/webapp/index.jsp"
                    sh "sed -i 's/JOB_DATE/${now.format("yyyy.MM.dd-HH.mm")} /g' src/main/java/Hello.java"
                    docker.build("demoapp:${env.BUILD_ID}", "--no-cache .")
                }
            }
        }
        stage('Deploy'){
            steps {
                script {
                    EXISTS = sh(script: 'docker service ls | grep demoapp | wc -l', returnStdout: true).trim()
                    sh 'echo $EXISTS'
                    if ("$EXISTS" == '1') {
                        sh "docker service update --image=demoapp:${env.BUILD_ID} demoapp"
                    } else {
                        sh "docker service create --name demoapp -p 8080:8080 --replicas 3 demoapp:${env.BUILD_ID} "
                    }
                }
            }
        }
    }
}