# Dockerized syncano cli

Docker image with syncano-cli using same os/nodejs as syncano nodejs_v8 runtime.

## Requirements
* Docker
* jq - optional for compile-env.sh script
* yamljs - optional for compile-env.sh script, can be added as a dev dep to socket.

## Installation

```
$ ./build.sh
```

## Usage

### Using cli
```
$ cd /syncano/project/dir
$ /this/repo/dir/s.sh deploy
```

### Using compile-env.sh

Copy /this/repo/dir/compile-env.sh to /socket/dir/bin/compile-env-docker
Create compile and compile-env scripts responsible for assembling socket. (Check syncano-cli docs for more info)
Edit socket's package.json

```
{
    "scripts": {
        "build": "npm run build:src && npm run build:env",
        "build:src": "sh ./bin/compile",
        "build:env": "sh ./bin/compile-env-docker"
    }
}
```

Run syncano-cli as usual according to syncano-cli docs.

### Using compile.sh

In case you have some native code in your socket you can use compile.sh script
Copy /this/repo/dir/compile.sh to /socket/dir/bin/compile-docker
Create compile and compile-env scripts responsible for assembling socket. (Check syncano-cli docs for more info)
Edit socket's package.json

```
{
    "scripts": {
        "build": "npm run build:src && npm run build:env",
        "build:src": "sh ./bin/compile-docker",
        "build:env": "sh ./bin/compile-env-docker"
    }
}
```

Run syncano-cli as usual according to syncano-cli docs.