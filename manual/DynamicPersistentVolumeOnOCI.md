[Home](../README.md)

# File Storage Service Using Dynamic Persistent Volume on OCI



```Powershell
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: dynamicPersistentVolumeClaim
spec:
  storageClassName: "oci"
  selector:
    matchLabels:
      failure-domain.beta.kubernetes.io/zone: "PHX-AD-1"
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 50Gi
```

[Short Hand Version of Availability Domains](https://docs.cloud.oracle.com/iaas/Content/ContEng/Concepts/contengprerequisites.htm#Availab)

Other values of `accessModes` could be `ReadWriteOnce`


```Powershell
apiVersion: v1
kind: Service
metadata:
  name: oke-fss-dpvc-svc
spec:
  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: oke-fss-dpvc
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: oke-fss-dpvc
  name: oke-fss-dpvc
spec:
  selector:
    matchLabels:
      app: oke-fss-dpvc
  replicas: 3
  template:
    metadata:
      labels:
        app: oke-fss-dpvc
    spec:
      containers:
      - name: oke-fss-dpvc  
        image: ngix
        ports:
        - containerPort: 80
        volumeMounts:
        - name: nfs-mount
          mountPath: "/usr/share/nginx/html/"
      volumes:
      - name: nfs-mount
        persistentVolumeClaim:
          claimName: dynamicPersistentVolumeClaim
          readOnly: false
```


```Powershell

```


```Powershell

```


```Powershell

```


```Powershell

```


```Powershell

```


```Powershell

```


```Powershell

```


```Powershell

```

# References 
* [OCI Document](https://docs.cloud.oracle.com/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim.htm)
* [OCI Volume Provisioner](https://github.com/oracle/oci-volume-provisioner)
* [Persistent Storage With Containers](https://www.slideshare.net/oracledevs/persistent-storage-with-containers-by-kaslin-fields)