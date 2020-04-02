# SimpleWebserver

# Prerequisites
1. Install Pulumi.  https://www.pulumi.com/docs/get-started/install/
2. Configure AWS credentials. https://www.pulumi.com/docs/intro/cloud-providers/aws/setup/ 
3. Make sure Docker is installed and running.  https://docs.docker.com/install/
3. Clone and put it as is whererver you want and go inside the folder.  
4. Run the following command to deploy it in AWS:  
   `$ npm install --save @pulumi/cloud  @pulumi/cloud-aws`  
5. We are running on AWS, so please configure the provider, the region and use Fargate:  
   `$ pulumi config set cloud:provider aws`    
   `$ pulumi config set aws:region us-east-1`   
   `$ pulumi config set cloud-aws:useFargate true`   

## Installation  

1. Preview and deploy changes via `pulumi up`. This will take a few minutes. 
   Pulumi automatically builds and provisions a container registry (ECR), builds the Docker container,
   and pushed the image into the repository. 
   This all happens automatically and does not require manual configuration on your part.  
2. View the endpoint URL and copy-paste it to the browser, dont forget to add `:8080` at the end.
