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
