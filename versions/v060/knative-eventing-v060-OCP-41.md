# Knative Eventing v0.6.0 on Openshift 4.1
--------

Knative Eventing can be installed by using the Knative Eventing Operator available on the OpenShift OperatorHub.

> **IMPORTANT:** This release introduces Knative Knative Eventing `v0.6.0` on an OpenShift 4.1 cluster (OCP) and should not be used in a production environment.

> **IMPORTANT:**  ClusterChannelProvisioners have been deprecated and will be removed in future releases. Please use [CRD-based channel implementations](https://github.com/knative/eventing/releases) instead.

| Existing CCP  | Replacement CRDs|
| ------------- |:-------------:|
| `in-memory`   | InMemoryChannel
| `kafka` 	    | KafkaChannel

## Prerequisites

* An OpenShift 4 cluster is required for installation. Visit [try.openshift.com](try.openshift.com) for information on setting up an OpenShift 4 cluster.

> **IMPORTANT:**  You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | [4.1](https://try.openshift.com/)          |

> **NOTE:**  Long-running clusters are not supported in this release.


--------
## Installing the Knative Eventing Operator

1. Go to **Catalog > OperatorHub** in the OpenShift web console. A list of operators for OpenShift, provided by Red Hat as well as a community of partners and open-source projects is provided. Click on the **Knative Eventing Operator** tile. 

> **NOTE:** Use the **Filter by Keyword** box to facilitate the search of the Knative Eventing operator in the catalog.

![ESO Tile](/images/knative-eventing-tile-highlighted.png)

2. A `Show Community Operator` dialog box will appear. Click **Continue** to proceed.

3. The **Knative Eventing Operator** descriptor screen will appear. Click **Install**.

![ESO Install Screen](/images/knative-eventing-operator-screen.png)

4. On the **Create the Operator Subscription** screen, ensure  **All namespaces on the cluster (default)** is selected under the **Installation Mode** section.

![ESO Namespaces Default](/images/knative-eventing-namespaces-default.png)

> **NOTE:** The Operator Lifecycle Manager (OLM) will install the operator in all namespaces. The installation will create the `knative-eventing` namespace.

5. Confirm the subscription for the installation operator, by viewing the **Subscription Overview**. The **UPGRADE STATUS** will update from `O Installing` to `1 Installed`.

![ESO Upgrade Status](/images/knative-eventing-installed-sub.png)

> **NOTE:** The screen will update after a few minutes. Wait for the `knative-eventing` namespace to appear in the project drop-down menu. Refresh the page if needed.

6. Knative Eventing is now installed. Navigate to **Catalog > Installed Operators** to confirm the operator is installed. Click on `knative-eventing` to view the install status.

![ESO installed](/images/knative-eventing-installed-operator.png)


---------
## Uninstalling the Knative Eventing Operator

1. Go to **Catalog > OperatorHub** in the OpenShift Web Console.

2. Click on the **Knative Eventing Operator** tile.

![ESO Uninstall Tile](/images/knative-eventing-uninstall-tile.png)

> **NOTE:** The tile will indicate whether the operator is installed.

3. The **Show Community Operator**` dialog box will appear. Click **Continue** to proceed.

4. Once the **Knative Eventing Operator** descriptor screen appears, click **Uninstall**.

![ESO Uninstall](/images/knative-eventing-uninstall-operator.png)

5. Select **Also completely remove the Operator from the selected namespace**, in the **Remove Operator Subscription** dialog box.

6. Click **Remove**.
