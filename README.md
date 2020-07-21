# R + Python Binder Example

Demos for OU R-Club tutorial

*This repo builds on the [`r_with_python`](https://github.com/binder-examples/r_with_python) repo and provides examples of using both R and Python in both Jupyter notebooks and RStudio.*

You can run the examples via [MyBinder](https://mybinder.readthedocs.io/en/latest/):

 - Launch into Jupyter Notebooks: [![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/ouseful-demos/ou-rclub/master)
 - Launch into RStudio: [![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/ouseful-demos/ou-rclub/master?urlpath=rstudio)

You can also access RStudio from the *New* menu on the notebook server homepage.

Example files are in the [`tutorial`](./tutorial) directory.


If you have Docker installed on your own computer [[install Docker](https://docs.docker.com/engine/install/)], along with a Python environment with the `pip` package manager installed, you can build and run your own container locally using [`repo2docker`](https://repo2docker.readthedocs.io/en/latest/) by opening a terminal / command prompt and entering:

```
pip install jupyter-repo2docker
jupyter-repo2docker https://github.com/ouseful-demos/ou-rclub
```

*I also reminded myself of a range of topic based notebook examples I'd developed previously on the soon to be shut down `notebooks.azure.com` service. I've moved the notebooks to [`ouseful-demos/getting-started-with-notebooks`](https://github.com/ouseful-demos/getting-started-with-notebooks) and will try to pull a binder config that allows them to run as an when I get a chance.*

## Multi-User JupyterHub Server Used for the Tutorial

The multiuser JupyterHub server used for the tutorial was a TLJH ([The Littlest JupyterHub](https://tljh.jupyter.org/en/latest/)) server. The ennvironment use was built from this repository and managed thereafter using the [`plasmabio/tljh-repo2docker`](https://github.com/plasmabio/tljh-repo2docker) extension.

The JupyterHub server was running on a [Digital Ocean](https://www.digitalocean.com/) basic server (8 GB Memory / 160 GB Disk / 5TB data transfer) in the `LON1` London region under Ubuntu 18.04.3 (LTS) x64`. Billing was at the level of `$40 /mo` (`$0.060 /hour`). The server was created and populated the day before the workshop with an intention of making it available for the workshop day and the day after.

Authentication on the TLJH server was switched to the first use authenticator by logging in to the physical server using ssh and issuing the commands:

```
# Full path if required: /opt/tljh/hub/bin/tljh-config 
sudo tljh-config set auth.type firstuseauthenticator.FirstUseAuthenticator
sudo tljh-config set auth.FirstUseAuthenticator.create_users True
sudo tljh-config reload
```
