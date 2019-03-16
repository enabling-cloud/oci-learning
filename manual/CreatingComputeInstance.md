# Creating Compute Instance

Lets provision the following infrastructure

![](../resources/components-tobe-created.png)

## Prerequisites

### SSH

Make sure to generate the [SSH key Pair](GeneratingSshKey.md), ignore if already done

### VNC

Make sure to [create VCN](CreatingVCN.md), ignore if already done.

## Creation 

### Step 1 : Navigate To Compute Instance

![](../resources/navigate-compute-instance.png)

![](../resources/compute-instances.png)

### Step 2 : Provide Name

![](../resources/compute-instance-name.png)

### Step 3 : Select Availability Doamin

![](../resources/compute-instance-domain.png)

### Step 4 : Select Image Source

![](../resources/compute-instance-image-source.png)

Available images

![](../resources/compute-instance-images.png)

### Step 5 : Select Instance Type

![](../resources/compute-instance-instance-type.png)


### Step 6 : Select Instance Shape

![](../resources/compute-instance-instance-shape.png)

Available Shapes

![](../resources/compute-instance-instance-shapes.png)

### Step 7 : Add SSH Key

Copy the ssh public key

```Powershell
nadeem@NADEEM-LAP MINGW64 ~
$ clip < ~/.ssh/id_rsa.pub
 
nadeem@NADEEM-LAP MINGW64 ~
$
```
Paste it

![](../resources/compute-instance-ssh-key.png)

### Step 8: Configure Networking

![](../resources/compute-instance-networking.png)

### Step 9 : Configure Advance Options

provide cloud init script

![](../resources/compute-instance-advanced-options.png)

### Step 10 : Wait For Instance to be provisioned

![](../resources/compute-instance-being-provisioned.png)

Instance provisioned

![](../resources/compute-instance-provisioned.png)

Make a note of public ip address

## Connecting To Provisioned Instance 


### Step 1 :  Connect Using SSH Tool

##### Note : _opc_ is the default user

![](../resources/compute-instance-connect-options.png)

### Step 2 : Instance Connected

```Powershell
Authenticating with public key "imported-openssh-key"
     ┌────────────────────────────────────────────────────────────────────┐
     │                        • MobaXterm 10.5 •                          │
     │            (SSH client, X-server and networking tools)             │
     │                                                                    │
     │ ➤ SSH session to opc@130.61.95.93                                  │
     │   • SSH compression : ✔                                            │
     │   • SSH-browser     : ✔                                            │
     │   • X11-forwarding  : ✘  (disabled or not supported by server)     │
     │   • DISPLAY         : 172.19.134.33:0.0                            │
     │                                                                    │
     │ ➤ For more info, ctrl+click on help or visit our website           │
     └────────────────────────────────────────────────────────────────────┘

[opc@demo-compute-instance ~]$ pwd
/home/opc
[opc@demo-compute-instance ~]$ ls -ltr
total 0
[opc@demo-compute-instance ~]$

```



## Termination 


### Step 1 : Navigate To Compute Instance

![](../resources/navigate-compute-instance.png) 

![](../resources/compute-instances2.png)

### Step 2 : Initiate Termination

![](../resources/compute-instance-terminate.png)

Confirm

![](../resources/compute-instance-confirm-terminate.png)

### Step 3 : Wait for Instance being terminated

![](../resources/compute-instance-being-terminated.png)

Terminated

![](../resources/compute-instance-terminated.png)



## References

* [Launching your first linux instance](https://docs.cloud.oracle.com/iaas/Content/GSG/Reference/overviewworkflow.htm)
* [Bastion Host](http://wiki-tbe.us.oracle.com/download/attachments/64660285/Bastion.vsdx?version=2&modificationDate=1551638194000&api=v2)
* [Graphics for Topologies and Diagrams](https://docs.cloud.oracle.com/iaas/Content/General/Reference/graphicsfordiagrams.htm)
