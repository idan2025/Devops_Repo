pipeline {
  agent any
  environment{
    IMAGE_NAME = "idan2025/hello-flask"
  }
  stages {
    stage('Code Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/idan2025/Devops_Repo.git'
        
      }
    }
    stage('Docker BUild & Tag') {
        steps {
        sh '''
        docker build -t "${IMAGE_NAME}:${BUILD_NUMBER}" .
        docker build -t "${IMAGE_NAME}:latest" .
        '''
        }
    }
    stage('Docker Push') {
        steps {
            withCredentials([usernamePassword(credentialsId:'dockerhub-credentials',usernameVariable:'DOCKER_USER',passwordVariable:'DOCKER_PASS')]){
                sh '''
                echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                docker push ${IMAGE_NAME}:latest
                docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                '''

            }
        }
    }
    stage('Docker Run') {
        steps {
            sh '''
            docker pull ${IMAGE_NAME}:latest
            docker run -d --name hello-flask -p 5000:5000 ${IMAGE_NAME}:latest
            '''
        }
    }
  }
}
