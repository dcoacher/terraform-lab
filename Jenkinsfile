pipeline {
  agent any
  stages {
    stage('Stage 1') {
      parallel {
        stage('Stage 1') {
          steps {
            sleep 5
          }
        }

        stage('Step 1') {
          steps {
            echo 'Step 1 Completed'
          }
        }

      }
    }

    stage('Stage 2') {
      parallel {
        stage('Stage 2') {
          steps {
            sleep 10
          }
        }

        stage('Step 1') {
          steps {
            echo 'Stage 2 Completed'
          }
        }

      }
    }

  }
}