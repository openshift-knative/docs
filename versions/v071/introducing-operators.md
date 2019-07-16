# Installing Knative Operators from OperatorHub

The Knative Operators offer a method of packaging, deploying, and managing an OpenShift application. An OpenShift application is an application that is both deployed on OpenShift and managed using the OpenShift APIs and tooling.

As a cluster administrator, you can install Knative Operators from the OperatorHub using the OpenShift Container Platform web console. You can then subscribe the Operator to one or more namespaces to make it available on your cluster.

During installation, the user must determine the following initial settings for the Operator:

* Installation Mode
* Update Channel
* Approval strategy


![Knative default](/images/knative-serving-namespaces-default.png)



## Installation Mode
* Choose **All namespaces on the cluster (default)** to have the Operator installed on all namespaces. You can also choose **A specific namespace on the cluster**, if available, to install the operator in a selected namespace.


## Update Channel
* If an Operator is available through multiple channels, you can choose the channel to where it is subscribed. For example, to deploy from the `example` channel, select it from the list drop-down list.


## Approval Strategy
* You can choose **Automatic** or **Manual** updates. If you choose **Automatic** updates for an installed Operator, when a new version of that Operator is available, the OLM automatically upgrades the running instance of your Operator. 
* If you select **Manual** updates, when a newer version of an Operator is available, the OLM creates an update request. As a cluster administrator, you must then manually approve that update request to have the Operator updated to the new version.

