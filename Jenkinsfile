pipeline {
    agent { dockerfile true }
    environment {
        CI = 'true'
    }
    stages {
        stage('Run') {
            steps {
                sh './jenkins/scripts/run.sh'
            }
	}
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
