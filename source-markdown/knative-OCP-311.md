# Knative on an OpenShift 3.11 cluster
Developer Preview
------

> **IMPORTANT:** The functionality introduced by Knative on an OpenShift cluster is developer preview only. Red Hat support is not provided, and this release should not be used in a production environment.

## Prerequisites

> **IMPORTANT:** You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | 3.11		|

## Installing Knative on an OpenShift cluster using the script provided

1. Login to the cluster using your admin credentials.

   `oc login <admin-credentials>`
   
2. Clone the `knative-operators` repository.

```
   git clone https://github.com/openshift-cloud-functions/knative-operators  
   cd knative-operators/   
   git fetch --tags   
   git checkout openshift-v0.2.0   
```
3. Set the following SSH properties using your OpenShift cluster credentials:

   `export KUBE_SSH_USER=<username>`   
   `export KUBE_SSH_KEY=<path-to-private-ssh-key>`   

4. Navigate to the newly cloned repository and run the `install.sh` script.

   `./etc/scripts/install.sh`  

>**NOTE** The installation script takes around 20-30 minutes to complete, depending on your system.

5. Once the script starts, you will see the following warning and prompt:

```
  WARNING: This script will blindly attempt to install OLM, Istio, and Knative on your OpenShift cluster, so if any are already there, hijinks may ensue.

  If your cluster isn't minishift, ensure $KUBE_SSH_KEY and $KUBE_SSH_USER are set  

  Pass -q to disable this warning   

  Enter to continue or Ctrl-C to exit:

```

6. Press Enter to continue.
   

## Post-installation tasks

### Allowing external access to Knative services using a configured hostname.

Your Knative services will not be accessible from outside of the OpenShift cluster by default, however you can enable access by configuring a hostname. This method uses wildcard routes to automatically assign a hostname to Knative services.

1. Find the default routing subdomain of your OpenShift cluster. For more information, see [Additional resources](#additional-resources).

2. Open the config map for your cluster to edit the Knative serving configuration.

   `oc edit configmap config-domain -n knative-serving`   

3. Replace the default "example.com" with your default routing subdomain.

4. Configure your router to allow wildcard domains.

   `oc set env dc/router ROUTER_ALLOW_WILDCARD_ROUTES=true -n default`   

5. Create a route that forwards wildcard traffic to the `knative-ingressgateway`.
   > **NOTE:** This route requires one host per namespace that is running Knative services. The format for the host of the route is `wildcard.<namespace>.<default-routing-subdomain>`.

   To do this, you must create a wildcard yaml file (in our example this is named `wildcard-routes.yml`) with the following    content:
```
    apiVersion: route.openshift.io/v1
    kind: Route
    metadata:
      name: knative-ingressgateway-wildcard
      namespace: <namespace-running-knative-services>
    spec:
      host: wildcard.<namespace>.<default-routing-subdomain>
      port:
        targetPort: http2
      to:
        kind: Service
        name: knative-ingressgateway
        weight: 100
        wildcardPolicy: Subdomain  
```
6. Apply the yaml file.
   
    `oc apply -f wildcard-routes.yml`   

7. Clone the demo repository.

   `git clone https://github.com/openshift-cloud-functions/demos.git`

8. Deploy the demo application.

   `oc apply -f ~/demos/knative-kubecon/serving/010-service.yaml`   

9. View the domain that was assigned to the application. You can now access the demo application using this domain.

   `oc get service.serving.knative.dev/dumpy`   

## Additional resources

* For more information about default routing subdomains, see [OpenShift documentation](https://docs.openshift.com/enterprise/3.0/install_config/install/deploy_router.html#customizing-the-default-routing-subdomain).
