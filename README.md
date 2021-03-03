# OpenShift Serverless Previews Documentation

OpenShift Serverless Previews provides tutorials and information about
additional, advanced use cases and integrations that are possible using
OpenShift Container Platform and OpenShift Serverless, but are for development
purposes only and are not officially supported by Red Hat.  This repository
contains the source files for the OpenShift Serverless Previews documentation
found at https://openshift-knative.github.io.

Current projects that fall into this category include

* OpenShift Serverless Functions [Developer Preview] https://openshift-knative.github.io/docs/docs/functions/about-functions.html


## Building the Site

If you would like to build this site locally, you will need to have a recent
version of Node.js installed, as well as the site formatting tool,
[antorra](https://docs.antora.org/antora/2.3/install/install-antora/).

To build the site:

```
antora antora-playbook.yml
```

You will find the output in `build/site`.

Build and deploy Serverless applications using an event-driven infrastructure
on Red Hat® OpenShift®.

--------------
## Links
* [Knative Eventing on OpenShift Container Platform developer preview](https://openshift-knative.github.io/docs/docs/index.html)
* [Knative tutorial](https://redhat-developer-demos.github.io/knative-tutorial)
* [Knative documentation](https://github.com/knative/docs)
