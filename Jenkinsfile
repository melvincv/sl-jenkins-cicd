pipeline {
    agent {
        docker {
            image 'maven:3.8-openjdk-17'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'docker:dind'
                }
            }
            
            steps {
                echo 'Building Docker image'
                script {
                    def customImage = docker.build("bookzyapp:${env.BUILD_ID}")
                    customImage.push()
                    customImage.push('latest')
                }
            }
        }
    }
}