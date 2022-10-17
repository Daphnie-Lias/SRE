# Infrastructure

## AWS Zones
Identify your zones here

["us-east-2a", "us-east-2b", "us-east-2c"] and ["us-west-1a", "us-west-1b"]


## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| EC2 | VM's that hosts the application |  t3.micro  | 3 instances in us-east-2 | Replicated in us-west-1 region |
| SSH Keys | Administering the EC2 instances |  NA  | 2  | Created in 2 locations/regions |
| EKS | Managed service to deploy and scale containerized applications | t3.medium,Disksize 20 GiB | 1 nodegroup with 2 nodes in each region | Replicated in us-west-1 region |
| ALB | Attach to Ubuntu instances, distribute web traffic and listen on port 80 | NA | 1 in each region | Replicated in us-west-1 region |
| RDS Cluster + Instance | Database replication in 2 zones | db.t2.small | 2 nodes each in Primary and Secondary cluster | Replicated in us-west-1 region |
| S3 Buckets | Holds Terraform backend,Backups for recovery | NA | 2 | Created in 2 regions |
| Prometheus, Grafana | Monitoring Assets | NA | 2 | Available in 2 zones |

### Descriptions
EC2 instances are Ubuntu web server VM's running custom image using application code .
ALB - Application load balancer that balances traffic and routes to many backend services.
GitHub repo - Storing Terraaform code.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

1. Database Replication: Ensures your database is exactly the same in both locations.
2. Minimize Configuration Drift: Use automation to reduce the drift.
3. Annual / Quarterly DR Practice : Flow actual production traffic to DR site to emsure infrastructure actually works.
4. Updated DR plan: This ensures DR site is always in-sync with primary site.
5. DNS naming: DNS allows you to "hide" a specific IP of a data center or server to make failover more seamless

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
1. Ensure both sites are configured the same.
2. Point DNS to secondary site using AWS Route 53
3. Manually failover the database instance, and force secondary instance to become primary.
4. Check DB activity in new primary instance.