![Release Notes](https://github.com/openshift-knative/docs/blob/master/images/release-notes-banner.png)

# Knative v0.5.0 on OpenShift  

**Release Date:** 30 April 2019

This document describes the latest changes, enhancements, known issues, and fixes for Knative on OpenShift. It incorporates fixes that apply to Knative’s Serving, Eventing, and Build components and may be adopted for consistency and compatibility on OpenShift.

>**NOTE:** The functionality introduced by Knative on an OpenShift cluster is in preview only. Red Hat support is not provided, and this release should not be used in a production environment. Features are still under development and are not fully supported under Red Hat Subscription Level Agreements.

>**NOTE:** The features outlined in this document, reflect the selected contributions of the Red Hat team. For complete release information relating to Knative, refer to the **Resources and Links** section of this document. 
-------------

## General Information
The following components tested on the OpenShift 4.x cluster in this release:

|Component|Version
|---------|-------|
|Serving|0.5.1|
|Eventing|0.5.0|
|Build|0.5.0|
|Maistra|0.6.0|
----------------

## What's New
### Serving
- **Bucketize autoscaling metrics by timeframe:** Instead of calculating the average concurrency per pod over time (bucketizing by pod name), it is now bucketized by time. Statistics are averaged by each specific timeframe vs. averaged over the whole window. [(#3289)](https://github.com/knative/serving/pull/3289)
- **Setting default operator values:** The operator is now able to set sensible default values for the default domain suffix and outbound IP ranges on OpenShift.


### Eventing
- **Implementation of Broker, Trigger, and Namespace Controllers:** Initial implementations of the Broker and Trigger controllers, as well as the Eventing Namespace watcher are presented. Broker and Trigger are implemented as event delivery mechanisms. For more information on Event Brokers and Triggers, see [here](https://github.com/knative/docs/tree/master/docs/eventing#event-brokers-and-triggers). Information on Broker and Trigger CRDs is available [here](https://github.com/knative/eventing/tree/master/docs/broker). [(#788)](https://github.com/knative/eventing/pull/788)
- **Added ReplicationFactor configuration:** Kafka Channels can configure their replication factor with the ReplicationFactor argument. [(#869)](https://github.com/knative/eventing/pull/869)
- **Addition of Eventing sources:** Apache Camel-K and Apache Kafka sources added and dumper removed. [(#13)](https://github.com/openshift/knative-eventing-sources/pull/13)

### Build
- **Commit id in Git source:** Allows specifying a commit hash to pinpoint the exact state of the repository that should be used for the build.
- **Build pod labels:** Users can specify pod labels to be set on builder pods.

-------------

## Fixed Issues

### Eventing
- Previously, existing Kafka consumers were stopped and resubscribed when fanout configs updated. Now, Kafka consumers are reused until the corresponding subscriptions are deleted. [(#880)](https://github.com/knative/eventing/pull/880)
- An Event can flow through a Broker by using Trigger replies 255 times before getting dropped. [(#951)](https://github.com/knative/eventing/pull/951)  [(#1016)](https://github.com/knative/eventing/pull/1016)

### Build
- Memory limit set for controllers to restrict memory usage.
-------------

## Known Issues
- **Istio installation stalls:** Sometimes `install.sh` timeouts on OpenShift 4/AWS waiting for the Istio-operator. The install script fails with a timeout error. Rerunning the script usually bypasses this error. The script does not work on OpenShift 3.11.

- **Maistra sidecar injection broken for long-running clusters:** Following installation of Istio, Maistra’s MutatingWebhookConfiguration gets garbage-collected after several hours. Maistra's MutatingWebhookConfiguration disappears after being up for a period of time. It uses an invalid OwnerReference to set a cluster-scoped resource for ownership by a namespace-scoped resource. This causes eventing sources to fail when connecting to channels. 

- **Crash loop of Camel K eventing controller:** The Camel K eventing controller crashes if Apache Camel K cluster resources are not installed in the cluster. Camel K cluster resources should be installed first, for the CamelSource controller to work properly. If Camel K cluster resources are not installed in the cluster, the `camel-controller` pod in the `knative-sources` namespace will crash after startup, signalling that Camel K resources were not found in the cluster. The `camel-controller` pod will not crash if Camel K is properly installed. 
-------------

## Resources and Links

- https://github.com/knative/docs/releases
- https://github.com/knative/serving/releases
- https://github.com/knative/eventing/releases
- https://github.com/knative/build/releases
- https://github.com/tektoncd/pipeline/releases
