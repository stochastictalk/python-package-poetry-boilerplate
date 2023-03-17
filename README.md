# 🫖 🎶 Poetry Boilerplate

A minimal Poetry Python package with tools for documentation, linting, formatting and testing. All you need to do is rename it et voilà! you have the starting point of your next Python package.

- 📜 Docs: `sphinx`
- 🧰 Linting: `ruff`
- ⚫ Autoformatting: `black`
- 🧪 Testing: `pytest`

## Quickstart

First clone this repository, set it as your working directory, and make sure you have [Poetry installed](https://python-poetry.org/docs/).

Activate the package virtual environment by running `poetry shell`. 

Install development dependencies by running `poetry install -E dev`.

### Check you can import the package

Check you can import the package by launching the Python interpreter via `python` and running
```
from boilerplate import say_hello
say_hello() # Prints 'hello, world, hello, universe! 💫'
``` 

Exit the Python interpreter by running `exit()`.

### 🧰  Enable linting and autoformatting

Install the pre-commit hooks by running `pre-commit install`. The pre-commit hooks will run each time you try to make a commit. You can edit their configuration in `pyproject.toml`.

### 🧪 Testing  

Run the tests by calling `pytest`. Add and modify tests under `tests/`.

### 📜 Docs

The boilerplate package provides autodocs for numpy docstrings. To compile the documentation, run
```
cd docs
make html
```
Host the resulting doc HTMLs using Python's webserver:
```
python -m http.server 3527 -d ../build/sphinx/html
``` 
Open a web browser on the host and go to `localhost:3527`. You should see the docs.

To start developing in the context of your own git repo, delete the `.git` directory and initialize a new one with `git init`. 

![Screenshot of rendered documentation](assets/docs-screenshot.png)

### ✏️ Renaming the package from `boilerplate` to `your_package_name`

Rename the package by running `rename.sh your_package_name` from the repo root.

To start developing in the context of your own git repo, delete the `.git` directory and initialize a new one with `git init`. 

### 🎶 Using Poetry

🚨 This section is a quick guide to Poetry. Skip it if you are already comforatble with how to use Poetry to create a Python package 🚨

Poetry is a command-line tool for Python packaging.  

Poetry uses a 'lock file', which means that when you install a poetry package for the first time a text file named `poetry.lock` is generated. This file lists pinned dependency versions. This is helpful because it allows other users of your code to reproduce exactly the environment you used.

To add a dependency, include it under the `tool.poetry.dependencies` stanza in `pyproject.toml` and run `poetry update` to add the dependency to the lock file and refresh the package install.

The package is installed in the virtual environment in editable mode by default. If you want to install in non-editable mode, run `poetry install --no-root` from within the virtual environment.

To create a wheel, run `poetry build`. The wheel and sdist archive are written to `dist/`. Only pure Python wheels are supported by Poetry.

Enjoy! 🫖
