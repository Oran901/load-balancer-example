# Load Balancing on Amazon EKS

This project demonstrates two primary methods for exposing external traffic to an EKS cluster:  
1. Using an Application Load Balancer (ALB)  
2. Using a Network Load Balancer (NLB) with an Ingress Controller inside the cluster

## Load Balancing Approaches

### Application Load Balancer (ALB)
- Operates at Layer 7 (HTTP/HTTPS)
- Provides metrics via AWS CloudWatch
- Routing logic is handled outside of the cluster
- Supports TLS termination using AWS Certificate Manager (ACM)

### Network Load Balancer (NLB) with Ingress Controller
- NLB operates at Layer 4, while the Ingress Controller (e.g., NGINX) handles Layer 7 logic
- Metrics are collected within the cluster using tools like Prometheus
- Routing logic is managed inside the cluster via Kubernetes Ingress resources
- TLS termination can occur at the NLB or the Ingress Controller
- NLB is generally more cost-effective than ALB for the same usage pattern

## Prerequisites
- AWS CLI configured
- A domain registered on Route 53

## How to Run
- Clone the repository
- Modify the AWS provider block in `/bootstrap/providers.tf` to match your Terraform authentication method (remove it if you’re not assuming a role)
- Update `domain_name` and other variables in `/bootstrap/locals.tf`
- Run `terraform apply` from the `/bootstrap` directory
- Configure Route 53 to route your domain to the appropriate load balancer

## Result
Two sample applications will be available:
- `http://www.your-domain` 
- `http://plain.your-domain`