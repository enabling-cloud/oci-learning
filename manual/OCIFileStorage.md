[Home](../README.md)

# Attaching File Storage To Multiple Oracle Cloud Infrastructure (OCI) Compute Instances

Lets provision the following infrastructure

![](../resources/fs-infrastructure.png)

## Prerequisites

### SSH

Make sure to generate the [SSH key Pair](GeneratingSshKey.md), ignore if already done

### VNC

Make sure to [create VCN](CreatingVCN.md), ignore if already done.

### Compute Instance

Create 2 [compute instances](CreatingComputeInstance.md) in AD1


![](../resources/fs-ci.png)


## Create File System

![](../resources/fs-navigate.png)

![](../resources/fs-click-create.png)


Click **Edit Details** on **File System Information**

![](../resources/fs-create-name.png)

Click **Edit Details** on **Export Information**

![](../resources/fs-create-export-info.png)

Here is the full information, **Click Create.**

![](../resources/fs-create-details.png)


File System and Mount Target created in **AD2**

![](../resources/fs-created.png)


![](../resources/fs-mount-commands.png)


Will execute the following commands later on both instances after updating security list

![](../resources/fs-mount-commands-info.png)


## Update VCN Security List

Refer [this](https://docs.cloud.oracle.com/iaas/Content/File/Tasks/securitylistsfilestorage.htm) for more detail, lets update the security list for AD2

![](../resources/fs-subnet-ad2.png)

Click **Edit All Rules**

Add the following 4 Ingress Rules

![](../resources/fs-3-ingress-rules.png)

![](../resources/fs-4th-ingress-rules.png)

Add the following 3 egress rules

![](../resources/fs-egress-rules.png)



##Mount File Systems on Both instances

Lets now execute the mount commands

Refer [this](CreatingComputeInstance.md#connecting-to-provisioned-instance)  for more details on how to connect to compute instances


### Instance #1

```Powershell
[opc@instance1 ~]$ sudo yum install nfs-utils
Loaded plugins: langpacks, ulninfo
Package 1:nfs-utils-1.3.0-0.61.0.1.el7.x86_64 already installed and latest version
Nothing to do
```

```Powershell
[opc@instance1 ~]$ sudo mkdir -p /mnt/test-file-system
```

```Powershell
[opc@instance1 ~]$ sudo mount 10.0.1.3:/test-file-system /mnt/test-file-system
```

```Powershell
[opc@instance1 ~]$ cd  /mnt/test-file-system
[opc@instance1 test-file-system]$
```

```Powershell
[opc@instance1 test-file-system]$ sudo su -
[root@instance1 ~]# ls
[root@instance1 ~]# cd /mnt/test-file-system
```

### Instance #2

Repeat the above steps for Instance #2 as well.

```Powershell
[opc@instance2 ~]$ sudo yum install nfs-utils
Loaded plugins: langpacks, ulninfo
Package 1:nfs-utils-1.3.0-0.61.0.1.el7.x86_64 already installed and latest version
Nothing to do
```

```Powershell
[opc@instance2 ~]$ sudo mkdir -p /mnt/test-file-system
```

```Powershell
[opc@instance2 ~]$ sudo mount 10.0.1.3:/test-file-system /mnt/test-file-system
```

```Powershell
[opc@instance2 ~]$ cd  /mnt/test-file-system
[opc@instance2 test-file-system]$
```

```Powershell
[opc@instance2 test-file-system]$ sudo su -
[root@instance2 ~]# ls
[root@instance2 ~]# cd /mnt/test-file-system
```


Lets create a file in **instace#1**

```Powershell
[root@instance1 test-file-system]# echo "Hello" > sample.txt
[root@instance1 test-file-system]# cat sample.txt
Hello
[root@instance1 test-file-system]#
```

Available in **instance #2** as well.

```Powershell
[opc@instance2 ~]$ cd /mnt/test-file-system
[opc@instance2 test-file-system]$ ls
sample.txt
[opc@instance2 test-file-system]$ cat sample.txt
Hello
[opc@instance2 test-file-system]$
```


# Clean Up 

### Compute Instance

Refer [this](CreatingComputeInstance.md#termination) for more details on how to terminate Compute instances.

#### File Storage

![](../resources/fs-click-file-system.png)


![](../resources/fs-click-delete-export.png)

Confirm export delete


Delete filesystem

![](../resources/fs-click-delete.png)

Confirm filesystem delete

Delete mount target

![](../resources/fs-click-delete-mt.png)

### VCN

Refer [this](CreatingVCN.md#terminating-vcn) for more details on how to terminate VCN.


# References
* [File Storage Overview](https://docs.cloud.oracle.com/iaas/Content/File/Concepts/filestorageoverview.htm)
