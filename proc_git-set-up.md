# Using Git

## Setting up Git

Knative on OpenShift uses git to manage repositories.  This guide explains how to set up your system to connect to the proper git repositories.

[`openshift-knative/docs`]:: A public GitHub repo that hosts the Knative on OpenShift documentation.


### Installing Git

If using Fedora, open your terminal and enter the proper installation command.

#### Fedora
----
$ yum install git (up to Fedora 21)
$ dnf install git (Fedora 22 and later)
----


#### Other operating systems

* [Download Git^](https://git-scm.com/downloads)



### Configuring Git

Once you have git installed, set up your git account.

.Procedure
. Open *Terminal*
. Set your name and email
+
[source,options="nowrap",subs="+quotes"]
----
$ git config --global user.name "<your-name>"
$ git config --global user.email "<your-email>"
----
+
TIP: The email you specify should be the same one found in your [email settings](https://help.github.com/articles/adding-an-email-address-to-your-github-account/). To keep your email address hidden, see [Keeping your email address private](https://help.github.com/articles/keeping-your-email-address-private).

. Set your git defaults
+
[source]
----
$ git config --global pull.rebase true
$ git config --global push.default simple
----


### Fork the upstream (GitHub) repository

Fork the `openshift-knative/docs` upstream repository to create a copy under your own GitHub ID. Clone your forked repository to bring your GitHub repository files to your local machine. Your forked repository is now the `origin` repository for your local files.

.Procedure
1. Open a browser and navigate to the upstream repository located at 
2. Click *Fork* located in the upper right under your profile icon.
3. Select your user account for the location of the forked repository. This creates your own copy of the repository under your own GitHub ID.


> **NOTE:** For more information about https://help.github.com/articles/fork-a-repo/[forking^] and https://help.github.com/articles/cloning-a-repository/[cloning^], consult the official https://help.github.com/[GitHub documentation^].



### Add your SSH keys to GitHub

If you choose to use the SSH address for your clones, you will need to add an SSH Key to GitHub first.

.Procedure
. Open *Terminal*.
. Check to see if you have a public SSH key:
+
[source]
----
$ ls ~/.ssh/
----
. If you don't have a key, generate one:
+
[source,options="nowrap",subs="+quotes"]
----
$ ssh-keygen -t rsa -C "<your-email>"
----
. Open your key in an editor:
+
[source]
----
$ cd ~/.ssh/
$ vi id_rsa.pub
----
. Copy the contents of the file to your clipboard.
. Visit link:https://github.com/settings/keys[https://github.com/settings/keys^]
. Click *New SSH Key*.
. Give your key a name and paste the contents of your key file.
. Click *Add SSH Key*.



### Updating repository URLs

If the upstream repository is moved, you can change the downstream URL by using the following command:

[source]
----
$ git remote set-url upstream https://github.com/<new upstream>
----

Use the following command any time you need to fetch the latest source code locally:

[source]
----
$ git fetch upstream
----


 

### Access another writer’s unmerged commits

This is the process you can use if you need commits another writer has submitted in a merge request that is not yet merged.

1. Check out a new topic branch from upstream/master as you normally do.
+
[source,options="nowrap",subs="+quotes"]
----
$ git fetch upstream
$ git checkout -b <new-topic-branch> upstream/master
----

2. If you have not yet added that writer’s remote repository, add it now.
+
[source,options="nowrap",subs="+quotes"]
----
$ git remote add -f <user> git@github.com:<user>/strimzi-kafka-operator.git
----

3. Rebase to bring in the changes that are in that user’s outstanding
 `origin/<merge-request-branch>` branch.
+
[source,options="nowrap",subs="+quotes"]
----
$ git rebase <user>/<merge-request-branch>
----
+
(you'll see the following response)
+
[source,options="nowrap",subs="+quotes"]
----
First, rewinding head to replay your work on top of it...
Fast-forwarded <new-topic-branch> to <user>/<merge-request-branch>
----


### References

* https://git-scm.com[Official Git Site^]
* http://help.github.com[GitHub Help^]

