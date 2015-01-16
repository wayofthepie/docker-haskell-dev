# A dockerized haskell development environment
This repo allows building a dockerized development environment for haskell, containing the following:

* vim
** With ghcmod-vim and its vim plugin dependencies installed (see https://github.com/eagletmt/ghcmod-vim)
* ghc 7.8.4
* ghc-mod 5.2.1.2
* cabal 1.22 
* git 2.1.0

This setup works great in conjunction with cabal sanboxes.

# Pre-build setup
There are some convenience functions run as part of the docker image build which setup user.name and user.email in git's config and also allow checking out repositories in the image - this has actually proved quite useful in certain situations.

The file [env.conf](https://github.com/wayofthepie/docker-haskell-dev/blob/master/env.conf) contains the variables which the docker build will read to seutp your git user.name, user.email and also a list of repositories which the build will checkout. Uncomment and override if you wish to set these in the image, if not, leave them commented out and the build will ignore these steps.

# Building the image
[build.sh](https://github.com/wayofthepie/docker-haskell-dev/blob/master/build.sh) will build the image, it takes the image's name as an argument.

```bash
./build.sh haskel-devel
```

# Starting the image
[start.sh](https://github.com/wayofthepie/docker-haskell-dev/blob/master/start.sh) takes the name to call the container, the image name to build the image from and a port on the local machine to map to port 8000 on the container.

```bash
./start.sh hdev haskell-devel 8000
```

# Vim config
Vim configuration is contained in [vimrc](https://github.com/wayofthepie/docker-haskell-dev/blob/master/vimrc). By default the following shortcuts are mapped:

* __mc__ : mapped to :GhcModCheckAsync
* __ml__ : mapped to :GhcModLintAsync
* __mt__ : mapped to :GhcModType
* __mi__ : mapped to :GhcModInfo 

For example, if you highlight a function with the cursor in vim __mt__ will give you the functions type.


