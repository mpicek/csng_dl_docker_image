# csng_dl_docker_image
Docker image setup based on NGC PyTorch image for prediction of neural responses using Deep Learning.

The Docker Hub repository is located [here](https://hub.docker.com/repository/docker/picekma/csng_docker_dl/general).

Dockerfile is based on NGC PyTorch image with tag 21.03 which is known to work for us.
The Dockerfile creates a Conda environment, installs dependencies and checks
that everything is well installed.

How to build the image:
```bash
docker build -t picekma/csng_docker_dl:0.1 .
```

How to run the image:
```bash
docker run --gpus all -it --rm -v local_dir:$(pwd) picekma/csng_docker_dl:0.1
```

In the container's bash, run `source activate csng-dl` to activate the Conda environment.

To push the image to Docker Hub, you have to log in:
```bash
docker login
```

and then run
```bash
docker push picekma/csng_docker_dl:tagname
```
where tagname is for example '0.1'.

### Creating and running a Singularity image on MetaCentrum

Get a virtual machine with enough CPUs, RAM and a large SCRATCHDIR.

```
export TMPDIR=$SCRATCHDIR
export SINGULARITY_TMPDIR=$SCRATCHDIR
export SINGULARITY_CACHEDIR=$SCRATCHDIR
singularity build path/to/new/image.img docker://picekma/csng_docker_dl:0.1
```

And then run with:
```
singularity shell --nv -B $SCRATCHDIR path/to/new/image.img
```

In the container's bash, run `source activate csng-dl` to activate the Conda environment.

Your container is now ready and you can execute code from [this repository](https://github.com/mpicek/reCNN_visual_prosthesis).
