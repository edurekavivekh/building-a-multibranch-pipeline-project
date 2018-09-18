pipeline {
	agent none
    environment {
        CI = 'true'
    }
    
    stages {
        stage('Build') {
		steps {
			sh 'BUILD="$(($BUILD_ID-2))"'
			sh 'docker -H 127.0.0.1 rmi --force chatapp:env.$BUILD'
			sh 'docker -H 127.0.0.1 run -d -p 80:3000 --name chatapp chatapp:env.$BUILD_ID'
		      }
	}
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
