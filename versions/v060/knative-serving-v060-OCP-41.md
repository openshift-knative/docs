# Knative Serving v0.6.0 on Openshift 4.1
--------

The Knative Serving operator can be installed by using the operator available in the OpenShift OperatorHub.


> **IMPORTANT:** This release introduces Knative on an OpenShift (OCP) 4.1 cluster. This release should not be used in a production environment.

> **NOTE:** This release documents the installation of Knative Serving `v0.6.0`.

## Prerequisites

* An OpenShift 4 cluster is required for installation. Visit [try.openshift.com](try.openshift.com) for information on setting up an OpenShift 4 cluster.

> **IMPORTANT:**  You will need cluster administrator privileges to install and use Knative on an OpenShift cluster.

### Supported platform versions

> **IMPORTANT:** Installation requires the OpenShift version `4.1.0-rc.0` installer located [here](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.1.0-rc.0/). Later versions of the installer are not compatible with the Istio version included with this release.

| Platform        | Supported versions           |
| ------------- |:-------------:|
| OpenShift      | [4.1](https://try.openshift.com/)          |

> **NOTE:**  Long-running clusters are not supported in this release.

------
## Installing the Knative Serving Operator 

1. Go to **Catalog > OperatorHub** in the Web Console. A list of operators for OpenShift, provided by Red Hat as well as a community of partners and open-source projects is provided. Click on the **Knative Serving Operator** tile. 

> **NOTE:** Use the **Filter by Keyword** box to facilitate the search of the Knative Serving operator in the catalog. 

![KSO Tile](/images/knative_serving_tile_highlighted.png)

2. A `Show Community Operator` dialog box will appear. Click **Continue** to proceed.

3. The **Knative Serving Operator** descriptor screen will appear. Click **Install**.

![KSO Install Screen](/images/knative_serving_operator_screen.png)

4. On the **Create the Operator Subscription** screen, ensure  **All namespaces on the cluster (default)** is selected under the **Installation Mode** section.

![KSO Namespaces Default](/images/knative_serving_namespaces_default.png)

> **NOTE:** The OLM will install the operator in all namespaces. This is will create `knative-serving`, `istio-operator`,and `istio-system` namespaces.

5. Confirm the subscription for the installation operator, by viewing the **Subscription Overview**. The **UPGRADE STATUS** will update from `1 installing` to `1 Installed`.

![KSO Upgrade Status](/images/knative_serving_installed_sub.png)

> **NOTE:** The screen will update after a few minutes. Wait for the `knative-serving` namespace to appear in the project drop-down menu. Refresh the page if needed.

9. Knative Serving is now installed. Navigate to **Catalog > Installed Operators** to confirm the operator is installed. Click on `knative-serving` to view the install status.

![KSO installed](/images/knative_serving_installed_operator.png)


------
## Uninstalling the Knative Serving Operator 

1. Go to **Catalog > OperatorHub** in the Web Console. 

2. Click on the **Knative Serving Operator** tile. 

![KSO Uninstall Tile](/images/knative_serving_uninstall_operator.png)

> **NOTE:** The operator tile will indicate it is installed.
 
3. The **Show Community Operator**` dialog box will appear. Click **Continue** to proceed.

4. Once, the **Knative Serving Operator** descriptor screen appears, click **Uninstall**.

![KSO Uninstall](/images/knative_serving_uninstall_operator.png)

5. Select **Also completely remove the Operator from the selected namespace**, in the **Remove Operator Subscription** dialog box.

6. Click **Remove**.


