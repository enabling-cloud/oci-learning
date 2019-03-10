# Oracle Database UP And Running On Oracle Cloud Infrastructure (OCI)

Lets provision the following infrastructure

![](resources/db-infrastructure.png)

## Prerequisites

### SSH

[Generating a Secure Shell (SSH) Public/Private Key Pair](GeneratingSshKey.md)

### VNC

[Creating VCN](CreatingVCN.md)


## Create Database VM


### Step 1 : Navigate to Database Option

![](resources/navigate-database-option.png)

Click **Launch DB Systems**

![](resources/launch-db-systems-menu.png)


### Step 2 : Provide Database System Infromation

![](resources/db-name-se.png)


![](resources/db-available-editions.png)

### Step 3 : Provide License Information

![](resources/db-as-lt.png)


### Step 4 : Add SSH Key

Copy public key

```Powershell
nadeem@nadeem-LAP MINGW64 ~/.ssh
$ clip < id_rsa.pub

nadeem@nadeem-LAP MINGW64 ~/.ssh
$

```
Paste the SSH key

![](resources/db-ssh-paste.png)

### Step 5 : Provide Network Infromation

![](resources/db-network-info.png)


### Step 6 : Provide Database Information

![](resources/db-info.png)

Click **Launch DB System**

![](resources/db-launch.png)

### Step 7 : Wait For Instance Being Provisioned

![](resources/db-being-provisoned.png)

It takes couple of minutes



## Connect From the DB Provisioned Machine


```Powershell

```


```Powershell

```

## Connect from Other Machine

* [Connecting To DB](https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/connectingDB.htm)
* [Youtbue : Connect SQL Developer](https://youtu.be/T0vN8m6yfao)
* [OCI Database](https://youtu.be/uwUvmAGk6gM)


## Clean Up 

### Database VM


### VNC



## References
* 