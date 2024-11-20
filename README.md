# Deploy Jenkins to ECS on Fargate

## Description
This project uses Terraform to deploy Jenkins to Amazon ECS on Fargate. Jenkins is an open-source automation server that helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery.

## Prerequisites
Before you begin, ensure you have the following:
- An AWS account
- AWS CLI installed and configured
- Terraform installed
- An AWS Network stamped out. You can use the following repository to set up your network: [AWS Network Stamp Out](https://github.com/jWatsonDev/aws-network-stamp-out)

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. **Initialize Terraform:**
    ```bash
    terraform init
    ```

3. **Plan the Terraform deployment:**
    ```bash
    terraform plan
    ```

4. **Apply the Terraform deployment:**
    ```bash
    terraform apply
    ```

## Usage
Once the deployment is complete, you can access Jenkins using the URL provided by the Terraform output. 

1. **Get the Jenkins initial admin password:**
    ```bash
    terraform output jenkins_initial_admin_password
    ```

2. **Access Jenkins:**
    Open your web browser and navigate to the Jenkins URL provided by the Terraform output.

3. **Unlock Jenkins:**
    Use the initial admin password to unlock Jenkins and start configuring your Jenkins instance.

## Contributing
Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Open a pull request

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.