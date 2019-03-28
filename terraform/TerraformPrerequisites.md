
## Terraform Installation

Download Terraform from [here](https://www.terraform.io/downloads.html)

The download contains a single executable file. Unzip it to a directory that is on your PATH.

```Powershell
PS C:\WINDOWS\system32> terraform -v
Terraform v0.11.11

PS C:\WINDOWS\system32>
```

## OCI CLI Installation

Refer [this](../manual/OciCliUpAndRunningOnWindows.md) for more details on OCI CLI installation, this would generate API SSL Key pair in $HOME/.oci


```Powershell
nadeem@NADEEM-LAP MINGW64 ~/.oci
$ ls -la
total 46
drwxr-xr-x 1 nadeem 1049089    0 Mar  7 17:01 ./
drwxr-xr-x 1 nadeem 1049089    0 Mar 12 11:16 ../
-rw-r--r-- 1 nadeem 1049089  323 Mar 16 11:10 config
-rw-r--r-- 1 nadeem 1049089 1675 Mar 16 11:10 oci_api_key.pem
-rw-r--r-- 1 nadeem 1049089  451 Mar 16 11:10 oci_api_key_public.pem
-rw-r--r-- 1 nadeem 1049089 2869 Mar  7 17:03 oci_cli_rc

nadeem@NADEEM-LAP MINGW64 ~/.oci

```

Alternatively refer [this](GeneratingAPISigningKey.md) if you just want to generate teh API SSL Key Pair.
