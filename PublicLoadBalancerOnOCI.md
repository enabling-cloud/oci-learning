# Introduction 

* Load Balancer enables Automated traffic distribution 
* Load Balancer Improves resource utilization, facilitates scaling, and helps ensure high availability
* There are two types public and private 


# Design

Lets provision the following Infrastructure.

For the sake of simplicity lets focus only on the highlighted items.

![](resources/lb-public-design.png)


# Prerequisites

### SSH

Make sure to generate the [SSH key Pari](GeneratingSshKey.md), ignore if already done

### Compute Instance

Make sure to [Create Compute Instance](CreatingComputeInstance.md), we would have to create two compute instances, ignore if already done.

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

![](resources/lb-public-vcn.png)

Since we have created above vcn with option **"Create Virtual Cloud Plus Related Resources"** it would create the following automatically.

* Subnets
* Rout Table
* Internet Gateway
* Security List and 
* DHCP Options

Will try to reuse some of it where ever applicable instead of creating new one.

![](resources/lb-public-vcn-details.png)

## Create New Security List for Loadbalancer

![](resources/lb-public-click-create-sl.png)

![](resources/lb-public-create-sl.png)

![](resources/lb-public-sl-created.png)

Refer [this](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm) for more details on SecurityList

## Crete New Route Table For Loadbalancer

![](resources/lb-public-click-create-rt.png)

![](resources/lb-public-create-rt.png)

![](resources/lb-public-rt-created.png)

Refer [this](https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/managingroutetables.htm) for more details on Routers

## Modify Existing Subnets

Will reuse existing 3 subnets from public_lb_vcn for this purpose

### AD-1 (LB_Subnet_1)

![](resources/lb-public-click-edit-ad1.png)

![](resources/lb-public-click-edit-ad1.png)


### AD-2 (LB_Subnet_2)

![](resources/lb-public-click-edit-ad2.png)

### AD-3 (Apps)

![](resources/lb-public-edit-ad3.png)

## All Subnets

Here are the updated subnets

![](resources/lb-public-subnets.png)


# Testing



# Clean Up



# References
