pipeline {
    agent { dockerfile true }
    environment {
        CI = 'true'
    }
    stages {
	stage('Run') {
	    steps {
		sh 'docker run -d -p 80:3000 --name chatapp'
	    }
	}
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
