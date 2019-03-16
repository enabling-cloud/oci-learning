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
success

```

```
Allow group [group name] to manage all-resources in compartment [compartment name]

```

### OCI CLI

Following the instructions [here](OciCliUpAndRunningOnWindows.md) to install OCI CLI


### Kubernetes/Docker General Idea

Refer [this](https://github.com/enabling-cloud/kubernetes-learning) for more details on kubernetes.

Refer [this](https://github.com/enabling-cloud/docker-learning) for more details on Docker.


## Cluster Creation



## Setup Kubeconfig



## Playing with Clustered Kubectl



## Deployment


## Clean up



```Powershell


```

