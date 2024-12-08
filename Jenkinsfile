pipeline {
    agent any
    environment {
    JAVA_HOME = "C:\\Program Files\\Java\\jdk-21"
    PATH = "${JAVA_HOME}\\bin;${env.PATH}"
    MAVEN_OPTS = "-Dmaven.repo.local=E:/jenkins/maven-repo"
         }
    tools{
        maven 'maven_3_8_6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/puampokale/utsama-automation']])
                bat 'mvn --version'
                bat 'java -version'
                bat 'mvn clean install'
            }
        }
        stage('build docker image'){
             steps{
                script{
                    bat 'docker build -t utsamatech/utsama-devops-integration .'
                }
            }
        }
        stage('push to docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpwd')]) {
                        bat 'docker login -u utsamatech -p $dockerhubpwd'
                        }

                        bat 'docker push utsamatech/utsama-devops-integration'
                }
            }
        }
    }
}