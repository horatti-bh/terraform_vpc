pipeline {
agent any
    tools {
        terraform 'terraform1.1.3'
    }
    parameters {
        choice(choices: ['', 'dev', 'prod'], description: 'select env', name: 'ENV')
    }
    stages {
        stage ('INIT') {
            steps {
                sh '''
                make init-${ENV}
                '''

            }
        }
    }
}

