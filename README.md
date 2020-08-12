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

The multiuser JupyterHub server used for the tutorial was a TLJH ([The Littlest JupyterHub](https://tljh.jupyter.org/en/latest/)) server. The environment used was built from this repository and managed thereafter using the [`plasmabio/tljh-repo2docker`](https://github.com/plasmabio/tljh-repo2docker) extension.

The JupyterHub server was running on a [Digital Ocean](https://www.digitalocean.com/) basic server (8 GB Memory / 160 GB Disk / 5TB data transfer) in the `LON1` London region under `Ubuntu 18.04.3 (LTS) x64`. Billing was at the level of `$40 /mo` (`$0.060 /hour`). The server was created and populated the day before the workshop with an intention of making it available for the workshop day and the day after.

Authentication on the TLJH server was switched to the first use authenticator by logging in to the physical server using ssh and issuing the commands:

```
# Full path if required: /opt/tljh/hub/bin/tljh-config 
sudo tljh-config set auth.type firstuseauthenticator.FirstUseAuthenticator
sudo tljh-config set auth.FirstUseAuthenticator.create_users True
sudo tljh-config reload
```

### Using An https

I had previously added a domain to my Digital Ocean account as per guidance [here](https://www.digitalocean.com/docs/networking/dns/how-to/add-domains/). *This simply means adding the domain name (eg ouseful.org) to your account and then from your domain control panel, adding the Digital Ocean nameservers (ns1.digitalocean.com, ns2.digitalocean.com, ns3.digitalocean.com).*

It’s then trivial to create and map a subdomain to a Digital Ocean droplet:

![](https://ouseful.files.wordpress.com/2020/07/control_panel_-_digitalocean.png?w=768&h=444)

I then enabled https using a free LetsEncrypt certificate following [this TLJH guidance](https://tljh.jupyter.org/en/latest/howto/admin/https.html#howto-admin-https).


### TLJH Customisation

I customised the TLJH environment in a couple of ways too, adding a logo and changing the colour theme from Jupyter orange to an OU blue.

To brand the TLJH landing page with a logo, in the server I created a directory path:

```
mkdir -p /usr/local/share/jupyter/hub/static/images
```
and `scp`'d a logo into it:

```
scp ./OU-logo-83x65.png root@IP.ADDRESS:/usr/local/share/jupyter/hub/static/images/OU-logo-83x65.png
```

Then back in the server:

```
locate jupyterhub_config.py

#then with path discovered:
nano /opt/tljh/hub/lib/python3.6/site-packages/tljh/jupyterhub_config.py
```

and added to the `jupyterhub_config.py` file:

```
c.JupyterHub.logo_file = '/usr/local/share/jupyter/hub/static/images/OU-logo-83x65.png'
```

Tweaks to login page:

```
locate login.html
# And with the discovered path:
nano /opt/tljh/hub/share/jupyterhub/templates/login.html
```

then I changed the login message.

The colour theming is defined in `/opt/tljh/hub/share/jupyterhub/static/less/variables.less` as [`jupyter-orange`](https://github.com/jupyterhub/jupyterhub/search?q=jupyter-orange&unscoped_q=jupyter-orange) but in the deployment this literal value (`#F37524`) is baked in to `/opt/tljh/hub/share/jupyterhub/static/css/style.min.css`. So I recoloured it to a `#316FB4` blue with a literal edit:

```
locate style.min.css
# And with the discovered path:
sed -i 's/F37524/316FB4/g' /opt/tljh/hub/share/jupyterhub/static/css/style.min.css
```

To restart the server with the new settings:

```
/opt/tljh/hub/bin/tljh-config reload
```
