pipeline {
    agent { label 'linux' }

    tools {
        maven 'Maven 3.9.11'
    }

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
                sh "${tool 'Maven 3.9.11'}/bin/mvn clean package -DskipTests"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t thankful-aws .'
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region $AWS_REGION \
                | docker login --username AWS --password-stdin $ECR_REPO
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker tag thankful-aws:latest $ECR_REPO:$IMAGE_TAG"
                sh "docker push $ECR_REPO:$IMAGE_TAG"
            }
        }
    }
}
