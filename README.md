# About 

Microservice application developed with NestJs and deployed on kubernetes 

## Overview 

This application koultime help you order food to get delivered. 

The reosons behind choosing the microservice architecture is:
- The flexibility to add new services 
- The ability to scale the service of orders independtly whenever we have a lot of demand 


<img src="https://github.com/rihemebh/delivery-microservice-devops/blob/main/data%20(1).gif" width=350 height=450 />




- Orders Microservice: 
    - Create orders
    - Get list of orders
- Product Microservice 
    - Get list of products
    - Create new product
   
 This microservices communicate with an api gateway 

 
## Architecture 

<img src="https://github.com/rihemebh/delivery-microservice-devops/blob/main/projet-MS%20architecture.drawio.png" width=500 height=250 />



## Deployment
 - The client could only communicate with the api gateway: we should expose a public IP
 - For the microservices we should allow only the traffic from the api gateway
 - The different apps are isolated in their namespaces (which we give the possibility of having multi env) 
 - The connection to the database is made through the connection string (provided by mongodb atlas) and stored in a secret
 - I used confid maps to store the name of the services that will be used by the api gateway to send requets to microservices
     
     <img src="https://github.com/rihemebh/delivery-microservice-devops/blob/main/projet-Kubernetes%20architecture.drawio.png" width=500 height=650 />
     
     
## Helm 

I created helm charts with values file for every microservice. 
I used the charts of prometheus and grafana in order to set the metrics.

## Automation 
The provisioning of the cluster is made by Terraform 

The deployment is autamed using the helm charts already created 



## Monitoring 

The different metrics are set using prometheus: cpu usage, memory usage, number of requests..

we can vizualize the diferent metrics using Grafana 

//image 
