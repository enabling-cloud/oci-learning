[Home](../README.md)

# Creating TLS Secrect

Execute the following in linux


```Powershell
-bash-4.2$ openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout tls.key -out tls.crt -extensions san -config <(echo "[req]"; echo distinguished_name=req; echo "[san]"; echo subjectAltName=DNS:tbe.com,DNS:tbe.net,IP:129.146.88.240) -subj "/CN=nginxsvc/O=nginxsvc"
Generating a 4096 bit RSA private key
..................++
..................................++
writing new private key to 'tls.key'
-----
-bash-4.2$ ls
tls.crt  tls.key
-bash-4.2$
```

In Windows you would change the sub to `"//CN=nginxsvc\O=nginxsvc"`

View the certificate

```Powershell
D:\practices\kubernetes\tbe\key>keytool -printcert -v -file  tls.crt
Owner: O=nginxsvc, CN=nginxsvc
Issuer: O=nginxsvc, CN=nginxsvc
Serial number: d522260999431afb
Valid from: Wed Jul 10 20:21:53 IST 2019 until: Sat Jul 07 20:21:53 IST 2029
Certificate fingerprints:
         MD5:  FC:4B:3E:EE:EF:92:26:E4:AB:1B:7D:A7:C4:38:47:0A
         SHA1: 33:78:C0:97:8D:E2:4E:11:08:B8:64:80:33:B7:2E:CB:84:E7:4F:83
         SHA256: BA:FC:E5:D9:10:83:E9:4D:1F:16:ED:3C:02:1C:84:E2:2C:1B:66:92:D0:BF:57:15:6F:26:48:5E:66:CF:53:90
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 4096-bit RSA key
Version: 3
 
Extensions:
 
#1: ObjectId: 2.5.29.17 Criticality=false
SubjectAlternativeName [
  DNSName: tbe.com
  DNSName: tbe.net
  IPAddress: 129.146.88.240
]
 
 
D:\practices\kubernetes\tbe\key>
```
