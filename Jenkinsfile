pipeline{
    agent {label 'terraform-node'}
    parameters{
        choice(name:'action', choices:['apply','destroy'],description:'Select Terraform action')
    }
    environment{
        AWS_ACCESS_KEY_ID= credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY= credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage('Checkout Code'){
            steps{
                checkout scm
            }
        }
        stage('Terraform Format Check'){
            steps{
                sh 'terraform fmt'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Init'){
            steps{
                sh '''
                echo "Terraform action is ---> ${action}"
                terraform ${action} --auto-approve
                '''
            }
        }

    }

    post{
        always{

        }
        success{
            emailext (
                subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]': 
                Check console output at "${env.JOB_NAME} [${env.BUILD_NUMBER}]"
                """,
                to: 'foladevops@gmail.com',
                from: 'infofoladevops@gmail.com',
            )
        }
        failure{
            emailext (
                subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]': 
                Check console output at "${env.JOB_NAME} [${env.BUILD_NUMBER}]"
                """,
                to: 'foladevops@gmail.com',
                from: 'infofoladevops@gmail.com',
            )
        }
    }
}
