# Knative on an OpenShift 4.0 cluster
------

> **IMPORTANT:** The functionality introduced by Knative on an OpenShift cluster is preview only. Red Hat support is not provided, and this release should not be used in a production environment.

> **NOTE:** This release includes upstream Knative Eventing `v0.4.1` and Knative Serving `v0.4.1`.

## Prerequisites

> **IMPORTANT:** You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

> **NOTE:** This Knative on OpenShift preview is only available by using the OpenShift 4.0 developer preview. You will require a Red Hat Developers login to try this. Visit [try.openshift.com](https://try.openshift.com/) for getting started information.

> **IMPORTANT:** Installation requires the OpenShift version `0.16.1` installer or later. Using the [latest version installer](https://github.com/openshift/installer/releases) is recommended.  

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | [4.0 Developer Preview](https://try.openshift.com/)          |

> **NOTE:**  Long-running clusters are not supported in this release.

## Installing Knative on an OpenShift cluster using the script provided

1. Login to the cluster using your admin credentials.

   `oc login <admin-credentials>`
   
2. Clone the `knative-operators` repository.

```
   git clone https://github.com/openshift-cloud-functions/knative-operators
   cd knative-operators/
   git fetch --tags  
   git checkout openshift-v0.4.0      
```

3. Navigate to the newly cloned repository and run the `install.sh` script.

   `./etc/scripts/install.sh`  

>**NOTE:** The `install.sh` script can time-out waiting for the Istio operator to complete, and you may receive an `ERROR: Timed out` message. If the `install.sh` script fails to install Istio, run the script again after it times out.

4. Once the script starts, you will see the following warning and prompt.

```
   WARNING: This script will attempt to install Istio, Knative, and OLM in your Kubernetes/OpenShift cluster.
    
   If targeting OpenShift, a recent version of 'oc' should be available in your PATH. Otherwise, 'kubectl' will be used.

   Pass -q to disable this prompt
 
   Enter to continue or Ctrl-C to exit:

```

5. Press Enter to continue.


## Post-installation tasks

### Allowing external access to Knative services for OCP 4.0
   
#### Creating an OpenShift Route pointing to the istio-ingressgateway for each of your Knative Service. 

1. Create a route by using the `oc expose` command.

```
oc expose svc istio-ingressgateway --hostname=<servicename>.<projectname>.<openshiftdomain> --name=<servicename> -n istio-system
```

For example, if the following inputs are used:
* knative service name: *helloworld*
* project: *my project*
* cluster wildcard domain: *apps.demo1.d103.sandbox718.opentlc.com*
    
the `oc command` would be:

```
oc expose svc istio-ingressgateway --hostname=helloworld.myproject.apps.demo1.d103.sandbox718.opentlc.com --name=helloworld -n istio-system
```

