# CV
My simple node application with hello world
and the file name is server.js and when we have run it then we fire this command node server.js

var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello World!");
}
var www = http.createServer(handleRequest);
www.listen(8080);



Then
Use the built-in Web preview feature of Cloud Shell to open a new browser tab and proxy a request to the instance you just started on port 8080.


# here is the docker file
FROM node:6.9.2
EXPOSE 8080
COPY server.js .
CMD node server.js


# for building the image
docker build -t gcr.io/PROJECT_ID/hello-node:v1 .

# to run the image
docker run -d -p 8080:8080 gcr.io/PROJECT_ID/hello-node:v1

# check the app
curl http://localhost:8080

#Now that the image is working as intended, push it to the Google Container Registry, a private repository for your Docker images, accessible from your Google Cloud projects.

gcloud auth configure-docker

docker push gcr.io/PROJECT_ID/hello-node:v1
# Create your cluster

gcloud config set project PROJECT_ID

gcloud container clusters create hello-world \
                --num-nodes 2 \
                --machine-type n1-standard-1 \
                --zone "ZONE"


# Create your pod
kubectl create deployment hello-node \
    --image=gcr.io/PROJECT_ID/hello-node:v1

#As you can see, you've created a deployment object. Deployments are the recommended way to create and scale pods. Here, a new deployment manages a single pod replica running the hello-node:v1 image.


#To view the deployment, run:
kubectl get deployments

To view the pod created by the deployment, run:
kubectl get pods

#some useful commands are:

kubectl cluster-info
kubectl config view
#**And for troubleshooting **:
kubectl get events
kubectl logs <pod-name>

# Allow external traffic

kubectl expose deployment hello-node --type="LoadBalancer" --port=8080

The flag used in this command specifies that it is using the load-balancer provided by the underlying infrastructure (in this case the Compute Engine load balancer). Note that you expose the deployment, and not the pod, directly. This will cause the resulting service to load balance traffic across all pods managed by the deployment (in this case only 1 pod, but you will add more replicas later).

The Kubernetes master creates the load balancer and related Compute Engine forwarding rules, target pools, and firewall rules to make the service fully accessible from outside of Google Cloud.

To find the publicly-accessible IP address of the service, request kubectl to list all the cluster services:
kubectl get services


#You should now be able to reach the service by pointing your browser to this address: http://<EXTERNAL_IP>:8080

#**Scale up your service**
kubectl scale deployment hello-node --replicas=4
#Request a description of the updated deployment:
kubectl get deployment
kubectl get pods
**#Task 7. Roll out an upgrade to your service
**
vi server.js

Then update the response message:
response.end("Hello Kubernetes World!");

:wq

docker build -t gcr.io/PROJECT_ID/hello-node:v2 .
docker push gcr.io/PROJECT_ID/hello-node:v2
kubectl edit deployment hello-node

Look for Spec > containers > image and change the version number to v2:


:wq

kubectl get deployments





                
