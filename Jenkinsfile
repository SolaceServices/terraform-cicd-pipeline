pipeline {
  agent any
    options { 
		disableConcurrentBuilds()
    	disableResume() 
    	disableRestartFromStage()
    }
    parameters{
    	choice(name: 'SERVICE', choices:['AJCR_sandbox_mesh', 'AJCR_Reporting'], description: 'Solace Broker Service')
    }
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!' 
            }
        }
	    stage('Validate params') {
		    steps {
                script {
                    sh 'printenv'	
                    echo "Service: ${SERVICE}"
                   }
            }
		}	        
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }        
    }
}