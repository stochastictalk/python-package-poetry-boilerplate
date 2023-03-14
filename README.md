# 🫖 🎶 Poetry Boilerplate

A minimal Poetry Python package with tools for documentation, linting, formatting and testing.

- 📜 Docs: `sphinx`
- 🧰 Linting: `ruff`
- ⚫ Autoformatting: `black`
- 🧪 Testing: `pytest`


## Quickstart

First make sure you have [Poetry installed](https://python-poetry.org/docs/).

Activate the package virtual environment by running `poetry shell`. 

Install development dependencies by running `poetry install -E dev`.

Test you can import the package by launching the Python interpreter via `python` and running
```
from boilerplate import say_hello
say_hello() # Prints 'hello, universe! 💫'
``` 

Exit the Python interpreter by running `exit()`.

Install the pre-commit hooks by running `pre-commit install`. The pre-commit hooks will run each time you try to make a commit. You can edit their configuration in `pyproject.toml`.



When you're finished with the virtual environment, you can exit the shell in which it is activated via `exit`.



### Using Poetry

🚨 This section is a quick guide to Poetry. Skip it if you are already comforatble with how to use Poetry to create a Python package 🚨

Poetry is a command-line tool for Python packaging.  

Poetry uses a 'lock file', which means that when you install a poetry package for the first time a text file named `poetry.lock` is generated. This file lists pinned dependency versions. This is helpful because it allows other users of your code to reproduce exactly the environment you used.

To add a dependency, include it under the `tool.poetry.dependencies` stanza in `pyproject.toml` and run `poetry update` to add the dependency to the lock file and refresh the package install.

The package is installed in the virtual environment in editable mode by default. If you want to install in non-editable mode, run `poetry install --no-root` from within the virtual environment.

###

Great! 


First, prove to yourself the package installs correctly, its tests run, and its documentation compiles.

If you're using Docker, launch a Python container and connect to its shell
```
docker run -it -p 3527:3527 -v ${PWD}:/package python:3.9 /bin/bash
```

Install the development version of the package in editable mode to the environment with
```
pip install -e '.[develop]'
```
The package's configuration is in `pyproject.toml` (summary [here](https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html)). The directory structure follows the src layout ([details](https://setuptools.pypa.io/en/latest/userguide/package_discovery.html)). Its version is managed using `setuptools_scm`, meaning version numbers are automatically extracted from git tags: you can read about the versioning logic [here](https://pypi.org/project/setuptools-scm/).

Install the precommit hooks:
```
pre-commit install
```
You can edit the config of these in `.pre-commit-config.yaml`.

Check the tests run:
```
pytest
```
Compile the documentation:
```
cd docs
make html
```
Host the resulting doc HTMLs using Python's webserver:
```
python -m http.server 3527 -d ../build/sphinx/html
``` 
Open a web browser on the host and go to `localhost:3527`. You should see the docs.

![Screenshot of rendered documentation](assets/docs-screenshot.png)


Finally, to create a wheel and sdist for your package:
```
python -m build --wheel
```
They will be output to a directory `dist/`.
