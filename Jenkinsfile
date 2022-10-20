pipeline {
  agent { label 'agent1' }

  environment {
   ANSIBLE_PRIVATE_KEY=credentials('jenkins') 
   WORKSPACE="${WORKSPACE}"
  }

  stages {
    stage('deploy') {
      steps {
        sh 'DOCKER_BUILDKIT=1 docker build --output type=local,dest=dist .'
        sh 'ansible-galaxy collection install -r deployment/requirements.yml'
        sh 'ls .'
        sh 'ansible-playbook -i deployment/inventory.hosts --private-key=$ANSIBLE_PRIVATE_KEY deployment/playbook.yml'
      }
    }
  }
}