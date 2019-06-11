# Knative Eventing v0.6.0 on Openshift 4.1
--------

Knative Eventing can be installed by using the Knative Eventing operator available on the OpenShift OperatorHub.


> **IMPORTANT:** This release introduces Knative Knative Eventing `v0.6.0` on an OpenShift 4.1 cluster (OCP) and should not be used in a production environment.


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

1. Go to **Catalog > OperatorHub** in the OpenShift Web Console. A list of operators for OpenShift, provided by Red Hat as well as a community of partners and open-source projects is provided. Click on the **Knative Eventing Operator** tile. 

> **NOTE:** Use the **Filter by Keyword** box to facilitate the search of the Knative Eventing operator in the catalog.

![ESO Tile](/images/knative_eventing_tile_highlighted.png)

2. A `Show Community Operator` dialog box will appear. Click **Continue** to proceed.

3. The **Knative Eventing Operator** descriptor screen will appear. Click **Install**.

![ESO Install Screen](/images/knative_eventing_operator_screen.png)

4. On the **Create the Operator Subscription** screen, ensure  **All namespaces on the cluster (default)** is selected under the **Installation Mode** section.

![ESO Namespaces Default](/images/knative_eventing_namespaces_default.png)

> **NOTE:** The Operator Lifecycle Manager will install the operator in all namespaces. The installation will create the `knative-eventing` namespace.

5. Confirm the subscription for the installation operator, by viewing the **Subscription Overview**. The **UPGRADE STATUS** will update from `1 installing` to `1 installed`.

![ESO Upgrade Status](/images/knative_eventing_installed_sub.png)

> **NOTE:** The screen will update after a few minutes. Wait for the `knative-eventing` namespace to appear in the project drop-down menu. Refresh the page if needed.

6. Knative Eventing is now installed. Navigate to **Catalog > Installed Operators** to confirm the operator is installed. Click on `knative-eventing` to view the install status.

![ESO installed](/images/knative_eventing_installed_operator.png)


---------
## Uninstalling the Knative Eventing Operator

1. Go to **Catalog > OperatorHub** in the OpenShift Web Console.

2. Click on the **Knative Eventing Operator** tile.

![ESO Uninstall Tile](/images/knative_eventing_uninstall_operator.png)

> **NOTE:** The tile will indicate whether the operator is installed.

3. The **Show Community Operator**` dialog box will appear. Click **Continue** to proceed.

4. Once the **Knative Eventing Operator** descriptor screen appears, click **Uninstall**.

![ESO Uninstall](/images/knative_eventing_uninstall_operator.png)

5. Select **Also completely remove the Operator from the selected namespace**, in the **Remove Operator Subscription** dialog box.

6. Click **Remove**.
