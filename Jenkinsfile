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
                dir("bookzy") {
                    sh 'mvn -B -DskipTests clean package'
                }
            }
        }
        stage('Test') { 
            steps {
                dir("bookzy") {
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit './bookzy/target/surefire-reports/*.xml' 
                }
            }
        }
        stage('Deploy') { 
            steps {
                sh './scripts/deploy.sh'
            }
        }
    }
}