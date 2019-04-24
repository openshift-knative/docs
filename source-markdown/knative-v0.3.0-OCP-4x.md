# Knative on an OpenShift 4.0 cluster
------

> **IMPORTANT:** The functionality introduced by Knative on an OpenShift cluster is preview only. Red Hat support is not provided, and this release should not be used in a production environment.

## Prerequisites

> **IMPORTANT:** You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

> **NOTE:** This Knative on OpenShift preview is only available via the OpenShift 4.0 developer preview. You will require a Red Hat Developers login to try this. Visit [try.openshift.com](https://try.openshift.com/) for getting started information.

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | [4.0 Developer Preview](https://try.openshift.com/)    |

## Installing Knative on an OpenShift cluster using the script provided

1. Login to the cluster using your admin credentials.

   `oc login <admin-credentials>`
   
2. Clone the `knative-operators` repository.

    `git clone https://github.com/openshift-cloud-functions/knative-operators`
   
    `cd knative-operators/` 
   
    `git fetch --tags`   
   
    `git checkout openshift-v0.3.0`   


3. Navigate to the newly cloned repository and run the `install.sh` script.

   `./etc/scripts/install.sh`  

>**NOTE** The installation script takes around 20-30 minutes to complete, depending on your system.

4. Once the script starts, you will see the following warning and prompt.

```
   WARNING: This script will attempt to install Istio, Knative, and OLM in your Kubernetes/OpenShift cluster.
    
   If targeting OpenShift, a recent version of 'oc' should be available in your PATH. Otherwise, 'kubectl' will be used.

   If using OpenShift 3.11 and your cluster isn't minishift, ensure \$KUBE_SSH_KEY and \$KUBE_SSH_USER are set

   Pass -q to disable this prompt
 
   Enter to continue or Ctrl-C to exit:
```

5. Press Enter to continue.
