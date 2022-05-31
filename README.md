## Swagger Editor - Docker Extension

This repository contains the source and instructions for adding the Swagger Editor to Docker Desktop as an extension.

**Note** As the Docker Desktop extension framework is currently in beta, you need to manually install the related binary. At the time of writing this is currently at version 0.2.4.

You can download the binary from https://github.com/docker/extensions-sdk/releases/tag/v0.2.4 and then follow the instructions at https://docs.docker.com/desktop/extensions-sdk/#prerequisites to setup the plugin.

For example if you are on Linux then its a matter of running the following:
```
wget https://github.com/docker/extensions-sdk/releases/download/v0.2.4/desktop-extension-cli-linux-amd64.tar.gz
tar -xvzf desktop-extension-cli-linux-amd64.tar.gz
mkdir -p ~/.docker/cli-plugins
mv docker-extension ~/.docker/cli-plugins
```

### Build locally

If you want to build the extension locally then run the following:
```
# clone a copy of the swagger-editor repository
git clone https://github.com/swagger-api/swagger-editor.git

# build the extension
docker buildx build -t noelm/swagger-editor-extension:0.0.2 .

# validate the extension
docker extension validate noelm/swagger-editor-extension:0.0.2
# you should get the following message:
# The extension image "noelm/swagger-editor-extension:0.0.2" is valid
```

### Install the extension

You can of course skip the build process above and jump straight to installation by running the following:
**Note** The current image hosted on docker hub will only work on Linux (tested on Ubuntu 20.04)
```
docker extension install noelm/swagger-editor-extension:0.0.2
```

### Remove the extension
```
docker extension uninstall noelm/swagger-editor-extension:0.0.2
```
