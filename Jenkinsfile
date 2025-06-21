@Library('ystv-jenkins')

def pluginPlans = []
def volumes = []
def normalPlans = []

pipeline {
    agent {
        node 'nomad'
    }

    environment {
        CLOUDFLARE_API_TOKEN = credentials('cloudflare-api-token-ystv-dns')
    }

    stages {
        stage('Init') {
            steps {
                script {
                    sh(script: "terraform init")
                }
            }
        }

        stage('Plan') {
            when {
                anyOf {
                    branch 'main'
                    changeRequest()
                }
            }

            steps {
                script {
                    sh(script: "terraform plan")
                }
            }
        }

        stage('Apply') {
            when {
                branch 'main'
            }

            steps {
                script {
                    sh(script: "terraform apply -auto-approve")
                }
            }
        }
    }
}