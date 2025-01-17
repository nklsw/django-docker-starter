# django-docker-starter

An opinionated boilerplate project using Django with a dockerized development environment and a production-ready docker image for deployment.

- Django 5.1
- Python 3.13
- Postgres 17
- Docker Compose for local development
- Dockerfile for building a production-ready image
- Justfile recipes
- uv for package and project management
- ruff, pytest, django-environ, and many more nice tools


## Get Started
This project leverages [uv](https://docs.astral.sh/uv/getting-started/installation/), [just](https://github.com/casey/just) and [Docker Compose](https://docs.docker.com/compose/install/) for managing the development environment. Make sure you have installed he necessary dependencies for running them on your local machine.

Initialize the dev environment with the `just bootstrap` recipe. This will build the dev image and prepare everything before you can start the app and the dependant infrastructure services with the `just start` recipe. Stop all services with hitting `CTRL+C` or using the `just stop` recipe in another terminal. 

```sh
just bootstrap
just start
```

## Usage
The most used project commands are available as just recipe:
```shell
just [recipe]
```

```make
Available recipes:
    bootstrap *ARGS   # bootstrap project
    build *ARGS       # build project
    start *ARGS       # start project
    stop *ARGS        # stop project
    infra-start *ARGS # start infra services
    infra-stop *ARGS  # stop infra services
    app-start *ARGS   # start django app
    app-stop *ARGS    # start django app
    run *ARGS         # uv run command in container
    manage *ARGS      # run django management command
    env               # copy .env.example to .env if not exists
    pre *ARGS         # run pre-commit processes
    ruff *ARGS        # run ruff linting & formatting
    test *ARGS        # run tests
    test-cov *ARGS    # run tests with coverage
    clean *ARGS       # clean up cache files etc.
```


## Acknowledgement
This boilerplate is inspired by [Nick Janetakis' docker-django-example](https://github.com/nickjj/docker-django-example) and [Jeff Triplett's django-startproject](https://github.com/jefftriplett/django-startproject/). I used a lot of patterns, practices and also code snippets from their projects. I highly recommend taking a look at their repos as it may be more usefull. This boilerplate is an opinionated copy/mix of their work to make it fit my personal needs.