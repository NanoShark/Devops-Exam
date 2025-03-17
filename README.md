# DevOps Exam Michael Malka


## Project Structure

```
docker-compose.yml
README.md
app/
    app.py
    requirements.txt
azure-pipelines/
    azure-pipelines.yml
docker/
    Dockerfile
jenkins/
    docker-compose.yml
    Jenkinsfile
kubernetes/
    k8s-deployment.yaml
    k8s-secret.yaml
    k8s-service.yaml
terraform/
    main.tf
    outputs.tf
```

## Directories and Files

### Root Directory
- `.env`: Environment variables file.
- `.gitignore`: Git ignore file.
- `docker-compose.yml`: Docker Compose configuration file.
- `README.md`: This README file.

### app/
- `app.py`: Main application code.
- `requirements.txt`: Python dependencies.

### azure-pipelines/
- `azure-pipelines.yml`: Azure Pipelines configuration file.

### docker/
- `Dockerfile`: Dockerfile for building the application image.

### jenkins/
- `docker-compose.yml`: Docker Compose file for Jenkins setup.
- `Jenkinsfile`: Jenkins pipeline configuration file.


### kubernetes/
- `k8s-deployment.yaml`: Kubernetes deployment configuration.
- `k8s-secret.yaml`: Kubernetes secrets configuration.
- `k8s-service.yaml`: Kubernetes service configuration.

### terraform/
- `main.tf`: Main Terraform configuration file.
- `outputs.tf`: Terraform outputs configuration.


## Usage

### Docker
To build and run the Docker container:
```sh
docker-compose up --build
```

### Jenkins
To set up Jenkins, navigate to the `jenkins/` directory and run:
```sh
docker-compose up --build
```

### Kubernetes
To deploy the application to Kubernetes, apply the configurations in the `kubernetes/` directory:
```sh
kubectl apply -f kubernetes/
```

### Terraform
To initialize and apply the Terraform configuration, navigate to the `terraform/` directory and run:
```sh
terraform init
terraform apply
```
### Helm 
Didnt had time so so sorry 
