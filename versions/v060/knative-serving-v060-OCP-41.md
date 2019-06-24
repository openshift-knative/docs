# Knative Serving v0.6.0 on OpenShift 4.1
--------

Knative Serving can be installed by using the Knative Serving Operator available on the OpenShift OperatorHub.


> **IMPORTANT:** This release introduces Knative Serving `v0.6.0`on an OpenShift 4.1 cluster (OCP). This release should not be used in a production environment.


## Prerequisites

* An OpenShift 4 cluster is required for installation. Visit [try.openshift.com](try.openshift.com) for information on setting up an OpenShift 4 cluster.

> **IMPORTANT:**  You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | [4.1](https://try.openshift.com/)          |

> **NOTE:**  Long-running clusters are not supported in this release.

------
## Installing the Knative Serving Operator

1. Go to **Catalog > OperatorHub** in the OpenShift Web Console. A list of operators for OpenShift, provided by Red Hat as well as a community of partners and open-source projects is provided. Click on the **Knative Serving Operator** tile.

> **NOTE:** Use the **Filter by Keyword** box to facilitate the search of the Knative Serving operator in the catalog.

![KSO Tile](/images/knative_serving_tile_highlighted.png)

2. A **Show Community Operator** dialog box will open. Click **Continue** to proceed.

3. The **Knative Serving Operator** descriptor screen will appear. Click **Install**.

![KSO Install Screen](/images/knative_serving_operator_screen.png)

4. On the **Create the Operator Subscription** screen, create a new subscription by clicking on the **Subscribe** button. This will install the Knative Serving Operator in the project `openshift-operators` and Knative Serving in the `knative-serving` project.

![KSO Namespaces Default](/images/knative_serving_namespaces_default.png)

> **NOTE:** The Operator Lifecycle Manager (OLM) installs the operator, which will automatically install Knative. This installation will create the `knative-serving`, `istio-operator`, and `istio-system` namespaces.

5. Verify the subscription status for the installation operator, by viewing the **Subscription Overview**. The **UPGRADE STATUS** will update from **0 Installing** to **1 Installed**. 

> **NOTE:** The screen will update after a few minutes. Wait for the `knative-serving` namespace to appear in the project drop-down menu. Refresh the page if needed.

![KSO Upgrade Status](/images/knative_serving_installed_sub.png)

6. Knative Serving is now installed. Navigate to **Catalog > Installed Operators** to confirm the operator is installed. Click on **knative-serving** to view the install status.

![KSO installed](/images/knative_serving_installed_operator.png)

------
## Uninstalling the Knative Serving Operator

1. Go to **Catalog > OperatorHub** in the OpenShift Web Console.

2. Click on the **Knative Serving Operator** tile.

![KSO Uninstall Tile](/images/knative_serving_uninstall_tile.png)

3. The **Show Community Operator**` dialog box will appear. Click **Continue** to proceed.

4. Once the **Knative Serving Operator** descriptor screen appears, click **Uninstall**.

![KSO Uninstall](/images/knative_serving_uninstall_operator.png)

5. Select **Also completely remove the Operator from the selected namespace**, in the **Remove Operator Subscription** dialog box.

6. Click **Remove**.
