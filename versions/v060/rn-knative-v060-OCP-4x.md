<!--please copy and paste this template into your vXXX folder for the current release and modify there. Do NOT edit this template)-->

![Release Notes](https://github.com/openshift-knative/docs/blob/master/images/release-notes-banner.png)

# Knative v0.6.0 on OpenShift  

**Release Date:**

This document describes the latest changes, enhancements, bug fixes and known issues for Knative on OpenShift. It incorporates changes to Knative’s Serving and Eventing components, and may be adopted for consistency and compatibility on OpenShift.

>**NOTE:** The functionality introduced by Knative on an OpenShift cluster is preview only. Red Hat support is not provided, and this release should not be used in a production environment. Features are still under development and are not fully supported under Red Hat Subscription Level Agreements.

>**NOTE:** The features outlined in this document reflect the selected contributions of the Red Hat team. For complete details of Knative releases, refer to the **Resources and Links** section of this document.
-------------

## General Information

### Release components
The following components have been tested on the OpenShift 4.1 cluster in this release;

|Component|Version
|---------|-------|
| Knative Serving | 0.6.0 |
| Knative Eventing | 0.6.0 |
----------------

## What's New
### Serving
- **Knative Serving Operator now available.** An Operator that installs the Knative Serving component on OpenShift 4.1 is now available through the embedded OperatorHub in the  OpenShift console. This replaces the previous installation script available in Knative on OpenShift v0.5.0. ([#139](https://github.com/openshift/knative-serving/pull/139), [#405](https://github.com/operator-framework/community-operators/pull/405))

- **Operator automatically installs the Maistra Operator and ControlPlane.** The operator will attempt to discover Istio. If not found, it will install the Maistra Operator and a minimal Maistra ControlPlane. ([#12](https://github.com/openshift-knative/knative-serving-operator/pull/12))

- **Operator automatically installs the Knative OpenShift Ingress Operator.** After installing Knative Serving, the operator now ensures that the Knative OpenShift Ingress Operator is deployed so that OpenShift Routes get created automatically for every Knative Route. ([#14](https://github.com/openshift-knative/knative-serving-operator/pull/14))

### Eventing

- **Knative Eventing Operator now available.** An Operator that installs the Knative Eventing component on OpenShift 4.1 is now available through the embedded OperatorHub in the  OpenShift console. This replaces the previous installation script available in Knative on OpenShift v0.5.0. ([#407](https://github.com/operator-framework/community-operators/pull/407))

-------------

## Fixed Issues

### Serving
- See the [Knative core Serving release notes](https://github.com/knative/serving/releases).

### Eventing
- See the [Knative core Eventing release notes](https://github.com/knative/eventing/releases).

-------------

## Known Issues
- **The Maistra ControlPlane remains after Knative Serving has been removed.** The Maistra control plane installed by the Knative Serving Operator when Istio is not found does not get removed when Knative Serving is uninstalled. ([#12](https://github.com/openshift-knative/knative-serving-operator/pull/12))

- **Camel and Kafka optional eventing sources have been removed.** The Camel and Kafka sources that were previously available by installing the Knative Eventing Operator have been removed. These will become standalone Knative Kafka and Knative Camel Operators in a future release of Knative on OpenShift. See *Resources and Links* below for more information. ([#34](https://github.com/openshift-knative/knative-eventing-operator/pull/34), [#1](https://github.com/openshift-knative/knative-kafka-operator/pull/1))

- **Activator and autoscaler pods fail to start when there is an existing Maistra installation before installing the Knative Serving Operator.** If Maistra version 0.10 or 0.11 is already installed before installing the Knative Serving Operator, the activativator and autoscaler pods can fail to start, and the user will encounter an error. This issue can temporarily be fixed by setting the Security Context Constraints for service accounts controller and default to `privileged`;
```
oc adm policy add-scc-to-user privileged -z controller -n knative-serving
oc adm policy add-scc-to-user privileged -z default -n knative-serving
```
- **Istio pods fail to start when there is an existing Maistra installation before installing the Knative Serving Operator.** If Maistra 0.11 is already installed, the Knative Serving Operator will try to install Maistra ControlPlane 0.10 in the `istio-system` namespace, which can make the `istio-ingressgateway` and `istio-pilot` pods to fail to start.

-------------

## Resources and Links

- https://github.com/knative/docs/releases
- https://github.com/knative/serving/releases
- https://github.com/knative/eventing/releases
- https://github.com/tektoncd/pipeline/releases
