## Swagger Editor - Docker Extension

This repository contains the source and instructions for adding the Swagger Editor to Docker Desktop as an extension.


### Note
From version **4.10.0** of Docker Desktop you no longer need to manaully install the Docker extension CLI as it is now bundled by default.

----
#### For Docker Desktop versions less than 4.10.10
> If for some reason you are still running a version of Docker Desktop that is less than **4.10.0** (and greater than 4.8.x) then you will need to manually install the Docker extension CLI binary.
>
> You can download the binary from https://github.com/docker/extensions-sdk/releases/tag/v0.2.4 and then follow the instructions at https://docs.docker.com/desktop/extensions-sdk/#prerequisites to setup the plugin.
>
> For example if you are on Linux then its a matter of running the following:
> ```
> wget https://github.com/docker/extensions-sdk/releases/download/v0.2.4/desktop-extension-cli-linux-amd64.tar.gz
> tar -xvzf desktop-extension-cli-linux-amd64.tar.gz
> mkdir -p ~/.docker/cli-plugins
> mv docker-extension ~/.docker/cli-plugins
> ```
----

### Build locally

If you want to build the extension locally then run the following:
```
# build the extension
docker buildx build -t noelm/swagger-editor-extension:4.3.0 .

# validate the extension
docker extension validate noelm/swagger-editor-extension:4.3.0
# you should get the following message:
# The extension image "noelm/swagger-editor-extension:4.3.0" is valid
```

### Install the extension

You can of course skip the build process above and jump straight to installation by running the following:
**Note** The current image hosted on docker hub with the `4.3.0` tag has been tested on Ubuntu 20.04 and MacOS. 
```
docker extension install noelm/swagger-editor-extension:4.3.0
```

![Swagger Editor Docker Ext](Swagger-Editor-Docker-Ext.png?raw=true "Swagger Editor Docker Extension")


### Remove the extension
```
docker extension uninstall noelm/swagger-editor-extension:4.3.0
```
