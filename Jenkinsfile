pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    environment{
        def appVersion = '' //variable declaration
        nexusUrl = '34.229.169.20:8081'
    }
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "Application version: ${params.appVersion}"
                }
            }
        }
        stage('Init'){
            steps{
                sh """
                    ls -lrt
                    cd terraform
                    terraform init -lock=false
                """
            }
        }
        stage('Plan'){
            steps{
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}" -lock=false
                """
            }
        }

        // stage('Deploy'){
        //     steps{
        //         sh """
        //             cd terraform
        //             terraform plan
        //         """
        //     }
        // }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}

