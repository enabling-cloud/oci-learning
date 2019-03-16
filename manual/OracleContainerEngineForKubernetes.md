# Kubernetes Up And Running On Oracle Cloud Infrastructure (OCI)

## Prerequisites

### SSH

Make sure to generate the [SSH key Pair](GeneratingSshKey.md), ignore if already done

### Policy 

![](../resources/k8s-click-policies.png)

Click **Create Policy**

![](../resources/k8s-create-policy.png)

```
allow service OKE to manage all-resources in tenancy

```
Alternatively
```
Allow group [group name] to manage all-resources in compartment [compartment name]

```

### OCI CLI

Following the instructions [here](OciCliUpAndRunningOnWindows.md) to install OCI CLI


### Kubernetes/Docker General Idea

Refer [this](https://github.com/enabling-cloud/kubernetes-learning) for more details on kubernetes.

Refer [this](https://github.com/enabling-cloud/docker-learning) for more details on Docker.


## Cluster Creation

![](../resources/k8s-navigate-to-oke.png)

![](../resources/k8s-click-create-cluster.png)

![](../resources/k8s-cluster-name.png)


![](../resources/k8s-vcn-confirm.png)

![](../resources/k8s-node-pool-confirm.png)

![](../resources/k8s-add-aon.png)

![](../resources/k8s-cluster-creation-details.png)

![](../resources/k8s-cluster-creating.png)

![](../resources/k8s-cluster-created.png)


## Setup Kubeconfig



## Playing with Clustered Kubectl



## Deployment


## Clean up



```Powershell


```

