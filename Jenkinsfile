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
        stage('Setup') {
            steps {
                script{
                    working_dir = pwd() + "/services/${SERVICE}"
                    echo "Working dir: ${working_dir}"
                }
                echo 'Hello world!' 
            }
        }
	    stage('Validate params') {
		    steps {
                script {
                    sh 'printenv'	
                    echo "Service: ${working_dir}"
                   }
            }
		}	        
        stage('Terraform init') {
            steps {
                dir(working_dir) {
                    script {
                        sh 'terraform init'
                    }
                }

            }
        }        
    }
}