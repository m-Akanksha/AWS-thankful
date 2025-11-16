pipeline {
    agent any

    environment {
        AWS_REGION = "ap-south-1"
        ECR_REPO = "123456789012.dkr.ecr.ap-south-1.amazonaws.com/myapp"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/m-Akanksha/AWS-thankful.git'
            }
        }

        stage('Build JAR') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t Thankful-aws .'
            }
        }

        stage('Login to ECR') {
            steps {
                bat 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker tag Thankful-aws:latest $ECR_REPO:$IMAGE_TAG'
                bat 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }
    }
}