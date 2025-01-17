set dotenv-load := true

@_default:
    just --list --unsorted

# bootstrap project
@bootstrap *ARGS:
    just env
    just build {{ ARGS }}
    just manage migrate
    just stop

# build project
@build *ARGS:
    docker compose build {{ ARGS }}

# start project
@start *ARGS:
    just app-start
    just stop

# stop project
@stop *ARGS:
    docker compose down {{ ARGS }}

# start infra services
@infra-start *ARGS:
    docker compose up db {{ ARGS }}

# stop infra services
@infra-stop *ARGS:
    docker compose down db {{ ARGS }}

# start django app
@app-start *ARGS:
    docker compose up app {{ ARGS }} --watch

# start django app
@app-stop *ARGS:
    docker compose down app {{ ARGS }}

# uv run command in container
@run *ARGS:
    docker compose run --rm app {{ ARGS }}

# run django management command
@manage *ARGS:
    just run python manage.py {{ ARGS }}

# copy .env.example to .env if not exists
@env:
    test -f .env || cp .env.example .env    

# run pre-commit processes
@pre *ARGS:
    uv run --with pre-commit-uv pre-commit run {{ ARGS }} --all-files

# run ruff linting & formatting
@ruff *ARGS:
    uv run ruff check src {{ ARGS }}
    uv run ruff format src

# run tests
@test *ARGS:
    just run pytest {{ ARGS }} --ds=config.settings.test

# run tests with coverage
@test-cov *ARGS:
    just run coverage run -m pytest --ds=config.settings.test && coverage report -m {{ ARGS }}

# clean up cache files etc.
@clean *ARGS:
    rm -rf .ruff_cache/
    rm -rf .pytest_cache/
    rm -rf ./src/.pytest_cache/
    rm -rf .coverage
    rm -rf .mypy_cache/
    find . | grep -E "(__pycache__|\.pyc$)" | xargs rm -rf
