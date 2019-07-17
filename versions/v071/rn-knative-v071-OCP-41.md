![Release Notes](https://github.com/openshift-knative/docs/blob/master/images/release-notes-banner.png)

# Knative v0.7.1 on OpenShift Serverless

**Release Date:** 17 July 2019

This document describes the latest changes, enhancements, bug fixes and known issues for Knative on OpenShift. It incorporates changes to Knative’s Serving and Eventing components, and may be adopted for consistency and compatibility on OpenShift.

>**NOTE:** The functionality introduced by Knative on an OpenShift cluster is preview only. Red Hat support is not provided, and this release should not be used in a production environment. Features are still under development and are not fully supported under Red Hat Subscription Level Agreements.

>**NOTE:** The features outlined in this document reflect the selected contributions of the Red Hat team. For complete details of Knative releases, refer to the **Resources and Links** section of this document.
-------------

## General Information

### Release components
The following components tested on the **OpenShift 4.1** cluster in this release:

|Component|Version
|---------|-------|
| Knative Serving | 0.7.1 |
| Knative Eventing | 0.7.1 |

----------------

## What's New
### Serving
- **Cluster-local services in default installation:** Serving Operator supports the usage of cluster-local services in the default installation [(#38)](https://github.com/openshift-knative/knative-serving-operator/pull/36)

- **Support concurrency-based scaling on the HPA:** Metric-scraping and decision-making have been separated out of the Knative internal autoscaler (KPA). The metrics are now also available to the HPA. [(#4386)](https://github.com/knative/serving/pull/4386)


### Eventing
- **ClusterChannelProvisioners (CCP) have been deprecated:** ClusterChannelProvisioners (CCP) have been deprecated. You must use CRD-based channel implementations instead [(#1486)](https://github.com/knative/eventing/pull/1486), [(#1488)](https://github.com/knative/eventing/pull/1488)

-------------

## Fixed Issues
### Serving
- See the [core Knative Serving release notes](https://github.com/knative/serving/releases).


### Eventing
- See the [core Knative Eventing release notes](https://github.com/knative/eventing/releases).

-------------

## Known Issues
- **The v1beta1 API is not provided:**  For this release, Knative on OpenShift only serves the v1alpha1 API.

- **Patch autoscaler deployment to register custom-metrics API:**  When running Knative Serving in a mesh environment (for example, you installed Maistra and you have sidecar-injection enabled) run the following command to patch the autoscaler’s deployment to successfully register the custom-metrics API:

  `oc -n knative-serving patch deployment autoscaler -p '{"spec":{"template":{"metadata":{"annotations":                                  {"traffic.sidecar.istio.io/includeInboundPorts": "8080,9090"}}}}}'`

- **The autoscaler starts logging an error after several hours of runtime:** After approximately 16 hours of runtime the following message is logged:

  `authentication.go:62] Unable to authenticate the request due to an error: x509: certificate signed by unknown authority`

  You can circumvent the issue by restarting the autoscaler pod and executing the foliowing command:

  `oc delete pod -n knative-serving -l 'app=autoscaler'`

  You can also [setup the prometheus-adapter](https://docs.openshift.com/container-platform/4.1/monitoring/exposing-custom-application-metrics-for-autoscaling.html) and label the autoscale service using:

  `service.alpha.openshift.io/serving-cert-secret-name: prometheus-adapter-tls  `

  This creates a secret named `prometheus-adapter-tls`, which can then be mounted to the autoscaler. 

-------------

## Resources and Links

- https://github.com/knative/docs/releases
- https://github.com/knative/serving/releases
- https://github.com/knative/eventing/releases
