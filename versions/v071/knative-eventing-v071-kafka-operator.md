# Knative Apache Kafka Operator v0.7.1

This guide walks cluster administrators through installing the Knative Apache Kafka Operator in an OpenShift Container Platform cluster. As a cluster administrator, you can install the operator from the OperatorHub using the OpenShift Container Platform web console. 


## Prerequisites

* [Knative Eventing](versions/v071/knative-eventing-v071-OCP-41.md) is installed
* A running instance of [Apache Kafka](https://github.com/strimzi) 


------
## Installing the Knative Apache Kafka Operator

1. Select the `knative-eventing` project by clicking on **Projects > Create Project** in the web console. 

![KAKO Project](/images/kafka-eventing-project.png)

2. Go to **Catalog > OperatorHub**. A list of operators for OpenShift, provided by Red Hat as well as a community of partners and open-source projects is available. Use the **Filter by Keyword** box to facilitate the search of the Knative Apache Kafka Operator in the catalog.  

3. Click on the **Knative Apache Kafka** tile.

![KAKO Tile](/images/kafka-tile-highlighted.png)

4. A `Show Community Operator` dialog box will appear. Click **Continue** to proceed.

5. The **Knative Apache Kafka Operator** descriptor screen will appear. Click **Install**.

![KAKO Install](/images/kafka-install-operator.png)

6. On the **Create the Operator Subscription** screen
    - Go to the **Installation Mode** section and choose the default selection. 
    - Click  **Subscribe**.

![KAKO Subscribe](/images/kafka-default.png)

> **NOTE:** The Knative Apache Kafka Operator does not auto-install all components. Clicking **Subscribe** only installs the Knative Apache Kafka Operator. Manual installation is required to configure the editor, so that all components are installed.

7. Confirm the subscription for the installation operator, by viewing the **Subscription Overview**. Observe as the **UPGRADE STATUS** goes for `0 Installing` to `1 Installed`.

![KAKO Subscription](/images/kafka-subscription-overview.png)

8. Click the `1 Installed` link.

9. Click  **Create New** to install the `Knative Apache Kafka` API.

![KAKO Create New](/images/kafka-create-new.png)

10. In the Custom Resource (CR) dialog
    - Configure the Kafka channel as the default
    - Provide the URL to your Kafka instance. 
    - Click **Create** to set the value.

![KAKO CR Editor](/images/kafka-CR-editor.png)

> **NOTE:**  The editor is pre-populated with definitions. Configure the file by manually entering YAML or JSON definitions, or by dragging and dropping a file into the editor. 

> **NOTE:** During installation, you can set the Kafka Channel as the default channel by using Custom Resources.

11. After some time, three Kafka pods in the Knative Apache Kafka namespace will be listed - two for the channel, one for the source.

12. See the updated **Config Maps**, which reflect the Kafka channel configured as the default.

> **NOTE:** When the channel is configured as the default, each new channel that is created will be a Kafka Channel, which is then backed by a Kafka Topic.

![KAKO Config Maps](/images/kafka-configmap.png)


------
## Uninstalling the Knative Apache Kafka Operator 

1. Go to **Catalog > OperatorHub** 

2. Click on the **Knative Apache Kafka Operator** tile.

>**NOTE:** The operator tile will indicate it is installed.

![KAKO Uninstall Tile](/images/kafka-installed-remove.png)
 
3. Click **Uninstall** on the **Knative Apache Kafka Operator** descriptor screen.

4. In the **Remove Operator Subscription** dialog box
    - Select **Also completely remove the Operator from the selected namespace**
    - Click **Remove**. The Apache Kafka Operator subscription is now removed.

