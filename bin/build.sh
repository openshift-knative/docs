# Build website
#
# Run from root level of repo, eg ./bin/build.sh local-site.yml

# get files from other repos using ruby version of asciidoctor

# Removed as not pulling from remotes anymore
# ./bin/ant-include.sh

# generate html with pull for latest https://github.com/aerogear/antora-ui

antora --clean --fetch site.yml

# fix html

./bin/fix-div.sh

