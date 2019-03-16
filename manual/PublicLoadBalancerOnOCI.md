# Introduction 

* Load Balancer enables Automated traffic distribution 
* Load Balancer Improves resource utilization, facilitates scaling, and helps ensure high availability
* There are two types public and private 


# Design

Lets provision the following Infrastructure.

For the sake of simplicity lets focus only on the highlighted items.

![](../resources/lb-public-design.png)


# Prerequisites

### SSH

Make sure to generate the [SSH key Pair](GeneratingSshKey.md), ignore if already done


# Implementation

## We need the following
* VCN
* Internet Gateway
* Two subnets for two Load Balancers
* One security list for LB Subnets
* One Route table for LB Subnets
* Load Balancers
* Two compute instances
* one subnet, security list, route table for backendset (Compute instances)


## Creating VCN

Lets [create VCN](CreatingVCN.md), and name it **public_lb_vcn**.

![](../resources/lb-public-vcn.png)

Since we have created above vcn with option **"Create Virtual Cloud Plus Related Resources"** it would create the following automatically.

* Subnets
* Rout Table
* Internet Gateway
* Security List and 
* DHCP Options

Will try to reuse some of it where ever applicable instead of creating new one.

![](../resources/lb-public-vcn-details.png)

## Create New Security List for Loadbalancer

![](../resources/lb-public-click-create-sl.png)

![](../resources/lb-public-create-sl.png)

![](../resources/lb-public-sl-created.png)

Refer [this](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm) for more details on SecurityList

## Crete New Route Table For Loadbalancer

![](../resources/lb-public-click-create-rt.png)

![](../resources/lb-public-create-rt.png)

![](../resources/lb-public-rt-created.png)

Refer [this](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm) for more details on Routers

## Modify Existing Subnets

Will reuse existing 3 subnets from public_lb_vcn for this purpose

### AD-1 (LB_Subnet_1)

![](../resources/lb-public-click-edit-ad1.png)

![](../resources/lb-public-edit-ad1.png)


### AD-2 (LB_Subnet_2)

![](../resources/lb-public-click-edit-ad2.png)

### AD-3 (Apps)

![](../resources/lb-public-edit-ad3.png)

### All Subnets

Here are the updated subnets

![](../resources/lb-public-subnets.png)


## Create Two App Compute Instances

Create two compute instances and do the following :

* Install Apache
* Firewalls opened to allow HTTP 
* Create index.html


Follow the steps in [Create Compute Instance](CreatingComputeInstance.md), to create two compute instances.

![](../resources/lb-public-two-apps.png)

Refer [this](https://docs.cloud.oracle.com/iaas/Content/Compute/Concepts/computeoverview.htm) for more details on Compute Service

## App1

![](../resources/lb-public-app1.png)

Lets connect

![](../resources/lb-public-app1-ssh.png)

### Install Apache on App1

Install HTTP Server

```Powershell
sudo yum install httpd -y
```
Start Apache server

```Powershell
sudo apachectl start
```

Configure it to start after system reboot

```Powershell
 sudo systemctl enable httpd
```

Quick Check on configurations

```Powershell
[opc@app1 ~]$ sudo apachectl configtest
Syntax OK
[opc@app1 ~]$

```
Create firewall rules to allow access to the ports on which the HTTP server listens.

```Powershell
[opc@app1 ~]$  sudo firewall-cmd --permanent --zone=public --add-service=http
success
[opc@app1 ~]$ sudo firewall-cmd --reload
success
[opc@app1 ~]$

```

Create Index file for App1

```Powershell
sudo bash -c 'echo This is App1 running on OCI >> /var/www/html/index.html'
```

```Powershell
[opc@app1 ~]$ curl localhost
This is App1 running on OCI
[opc@app1 ~]$
```

## App2


![](../resources/lb-public-app2.png)

![](../resources/lb-public-app2-ssh.png)

### Install Apache on App2

```Powershell
[opc@app2 ~]$ sudo yum install httpd -y

```

```Powershell
[opc@app2 ~]$ sudo apachectl start
```


```Powershell
[opc@app2 ~]$ sudo systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.

```

```Powershell
[opc@app2 ~]$ sudo apachectl configtest
Syntax OK

```

```Powershell
[opc@app2 ~]$ sudo firewall-cmd --permanent --zone=public --add-service=http
success
[opc@app2 ~]$  sudo firewall-cmd --reload
success

```

```Powershell
[opc@app2 ~]$ sudo bash -c 'echo This is App2 running on OCI >> /var/www/html/index.html'

```

```Powershell
[opc@app2 ~]$ curl localhost
This is App2 running on OCI
[opc@app2 ~]$

```

## Create Load Balancer

![](../resources/lb-navigation.png) 

![](../resources/lb-click-create.png) 

![](../resources/lb-public-name.png) 

![](../resources/lb-public-network.png) 

![](../resources/lb-public-listener.png)

![](../resources/lb-public-backendset.png)

![](../resources/lb-public-details.png)


When a load balancer is created, you’re assigned a public IP address to which you route all incoming traffic.

The IP address is highly available, meaning it is available from both subnets that you specified.

Note that it is only active in one subnet at a time.

## Update SecurityList

Update LB_Security_List to allow internet traffic to listener.

![](../resources/lb-public-sl-click-edit.png)


You would be updating both ingress and egress.

![](../resources/lb-public-lbsl-rules.png)


![](../resources/lb-public-lbsl-egress.png)

Update **Default Security List** to allow traffic from Load balancers to Apps

![](../resources/lb-public-dsl-click-edit.png)

Subnet 1

![](../resources/lb-public-ingress-subnet.png)

Subnet 2

![](../resources/lb-public-ingress-subnet2.png)




# Testing

If you get **502** wait for some more time.

![](../resources/lb-public-502.png)

After some times it works

![](../resources/lb-public-up-running.png)



# Clean Up

### Locadbalancer

Terminate the loadbalancer


### Compute Instance

Terminate the two compute instances. Refer [this](CreatingComputeInstance.md#termination) for more details on how to terminate Compute instance.

### VCN

Termincate the VCN. Refer [this](CreatingVCN.md#terminating-vcn) for more details on how to terminate VCN.



# References

* [Getting Started With Loadbalancer](https://docs.cloud.oracle.com/iaas/Content/GSG/Tasks/loadbalancing.htm)
* [OCI Loadbalancer Document](https://docs.cloud.oracle.com/iaas/Content/Balance/Concepts/balanceoverview.htm)
* [OCI VCN Overview and Deployment Guide.pdf](https://cloud.oracle.com/iaas/whitepapers/vcn-deployment-guide.pdf)

