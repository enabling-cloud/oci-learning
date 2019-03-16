[Home](../README.md)


# Generating API Signing Key (API SSL Key)

An SSL key pair to enable Terraform to connect to the OCI API under your identity is required.

Open **Git Bash** in windows

![](../resources/git-bash-admin.png)

Run the following commands


Create .oci Directory

```Powershell
nadeem@nadeem-LAP MINGW64 ~
$ mkdir ~/.oci
```

Generate Private key

```Powershell
nadeem@nadeem-LAP MINGW64 ~
$ openssl genrsa -out ~/.oci/oci_api_key.pem 2048
Generating RSA private key, 2048 bit long modulus
..................................+++
..............+++
e is 65537 (0x10001)

```


provide appropriate access

```Powershell
nadeem@nadeem-LAP MINGW64 ~
$ chmod go-rwx ~/.oci/oci_api_key.pem
```


Generate public key

```Powershell
nadeem@nadeem-LAP MINGW64 ~
pempenssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
writing RSA key
```


Generated files

```Powershell
nadeem@nadeem-LAP MINGW64 ~
$ cd .oci

nadeem@nadeem-LAP MINGW64 ~/.oci
$ ls -la
total 37
drwxr-xr-x 1 nadeem 1049089    0 Mar  1 20:55 ./
drwxr-xr-x 1 nadeem 1049089    0 Mar  1 20:54 ../
-rw-r--r-- 1 nadeem 1049089 1675 Mar  1 20:54 oci_api_key.pem
-rw-r--r-- 1 nadeem 1049089  451 Mar  1 20:55 oci_api_key_public.pem

nadeem@nadeem-LAP MINGW64 ~/.oci
$
```

Generate the finger prints

```Powershell
nadeem@nadeem-LAP MINGW64 ~/.oci
$ openssl rsa -pubout -outform DER -in ~/.oci/oci_api_key.pem | openssl md5 -c
writing RSA key
(stdin)= 5d:01:f7:11:95:96:6b:84:a1:60:ae:e9:09:59:b3:a1

```

Add the public key to OCI

The public key needs to be added to your user account in the OCI console.

Copy the public key

```Powershell
nadeem@nadeem-LAP MINGW64 ~/.oci
$ clip <  ~/.oci/oci_api_key_public.pem

```

Paste the key, copied above.

![](../resources/oci-add-public-key-dialog.png)

Public key added

![](../resources/ocid-public-key-added.png)

