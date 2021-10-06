#### THIS REPOSITORY HAS BEEN ARCHIVED.

Please see https://docs.openshift.com/ for the latest documentation for OpenShift Serverless.

#######################################################################################

# OpenShift Serverless Previews Documentation

OpenShift Serverless Previews provides documentation, tutorials and additonal
information about new products and features from OpenShift Serverless which are
not officially supported by Red Hat but may be available through Developer or
Technology Preview programs. These capabilities are provided for development
purposes only.  This repository contains the source files for the OpenShift
Serverless Previews documentation found at
https://openshift-knative.github.io/docs/.

Current projects in this category include:

* OpenShift Serverless Functions [Developer Preview] https://openshift-knative.github.io/docs/docs/functions/about-functions.html


## Building the Site

If you want to build this site locally, you must use the site generation tool,
[Antora](https://docs.antora.org/antora/2.3/install/install-antora/).

To build the site:

```
antora antora-playbook.yml
```

You will find the output in `build/site`.

After reviewing the generated output, you may publish it by
copying the output to `./docs`.

```sh
cp -R site/docs/* docs/
```


--------------
## Links
* [Knative tutorial](https://redhat-developer-demos.github.io/knative-tutorial)
* [Knative documentation](https://github.com/knative/docs)
