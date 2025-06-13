pipeline {
    agent any

    environment {
        IMAGE_NAME = 'hello-java-image'
        CONTAINER_NAME = 'hello-java-container'
    }

    stages {
        stage('Cloner le repo') {
            steps {
                echo 'Clonage du projet...'
                checkout scm
            }
        }

        stage('Build de l\'image Docker') {
            steps {
                echo 'Construction de l\'image Docker...'
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Déploiement (run)') {
            steps {
                echo 'Lancement du conteneur...'
                bat 'docker rm -f %CONTAINER_NAME% || true'
                bat 'docker run -d --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }

        stage('Logs (pour voir le Hello)') {
            steps {
                echo 'Affichage des logs du conteneur :'
                bat 'docker logs %CONTAINER_NAME%'
            }
        }
    }

    post {
        success {
            echo 'Déploiement réussi'
        }
        failure {
            echo 'Le pipeline a échoué'
        }
    }
}
