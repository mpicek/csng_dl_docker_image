# csng_dl_docker_image
Docker image setup based on NGC PyTorch image for prediction of neural responses using Deep Learning.

Dockerfile is based on NGC PyTorch image with tag 21.03 which is known to work for us.
The Dockerfile creates a Conda environment, installs the dependencies and checks
that everything is well installed.

How to build the image:
```bash
docker build -t picekma/csng_docker_dl:0.1 .
```

How to run the image:
```bash
docker run --gpus all -it --rm -v local_dir:$(pwd) picekma/csng_docker_dl:0.1
```

In the docker bash, we need to run:
```bash
source activate csng-dl
```
in order to activate the environment. Now we can run whatever we want.


To push the image to Docker Hub, you have to log in:
```bash
docker login
```

and then run
```bash
docker push picekma/csng_docker_dl:tagname
```
where tagname is for example '0.1'.

