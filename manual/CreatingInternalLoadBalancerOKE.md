[Home](../README.md)

# Creating Private (Internal) Load Balancer in OKE

Just add the following annotation

```Powershell
service.beta.kubernetes.io/oci-load-balancer-internal: “true”
```

Here is an example

```Powershell
kind: Service
apiVersion: v1
metadata:
 name: sample-app-internal-svc
 annotations:
   service.beta.kubernetes.io/oci-load-balancer-internal: “true”
spec:
 selector:
   app: sample-app
 ports:
 - protocol: TCP
   targetPort: 8080
   port: 80
 type: LoadBalancer
```

# References

* [OCI Annotations](https://github.com/oracle/oci-cloud-controller-manager/blob/master/docs/load-balancer-annotations.md)
* [Internal Loadbalancer](https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer)