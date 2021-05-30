# Python Guide

## Language Reference

https://learnxinyminutes.com/docs/python/

## Setup and use python

- [The right and wrong way to set up Python 3 on MacOS | Opensource.com](https://opensource.com/article/19/5/python-3-default-mac)
- [How to use pyenv to run multiple versions of Python on a Mac | Opensource.com](https://opensource.com/article/20/4/pyenv)

venv

## Productive developer environment

https://realpython.com/python-development-visual-studio-code/

## How to structure a Python Project

https://docs.python-guide.org/writing/structure/

## Code Style

https://docs.python-guide.org/writing/style/

pre-commit
black
flake8
type hints & flake8-annotations & mypy
isort
flake8-docstrings

## Key Librairies

- [Libraries Landscape in Python](https://community.ibm.com/community/user/datascience/blogs/paco-nathan/2019/03/12/a-landscape-diagram-for-python-data)

## Unit testing

Here is a basic example of a pytest test:

```py
import pytest
from koala.io.config import Config
from koala.io.datawarehouse import DataWarehouse

class TestDataWarehouse:
    
    @pytest.fixture
    def dwh_config(self):
        return Config()


    @pytest.mark.parametrize("names", [True, False], ids=["NamesOnly", "All"])
    def test_get_all_metrics(self, dwh_config, names):
        # Given
        dwh = DataWarehouse(envir=dwh_config)

        # When
        results = dwh.get_all_metrics(name_only=names)

        # Then
        assert results is not None
        assert isinstance(results, list)
```

Here the test is `test_get_all_metrics`.

It pulls in the `dwh_config` fixture which I'll cover later.

It also uses `pytest`'s parametrizing decorator (opens new window)to run the same test multiple times with different data configurations.

The key practice that makes testing really really easy is **the Given/When/Then framework** which makes the process of writing tests calmingly methodic and digestable.

**Given**
Everything I need to setup a test. This can consist of test data but also of setting up a database connection using fixtures which I promise I'll cover later. The distinction I like is that fixtures return `ERROR`s where as tests throw `FAIL`s.

**When**
The part of the code under test. I try to make this section one line of code so it is really clear what is being tested and how a user would write the same line of code. It forces me to think about the Developer Experience (DX) of the API design.

**Then**
This is the part where you confirm your expectations. Aim for proprty based aspects instead of fixed values. This might mean you have to sharpen your knowledge of metaprogramming methods like `isinstance`.

## References

- https://github.com/louisguitton/simple-cookiecutter-python/blob/master/%7B%7Bcookiecutter.project%7D%7D/.pre-commit-config.yaml
- [The Hitchhiker’s Guide to Python](https://docs.python-guide.org/)
- [Advanced python testing](https://joshpeak.net/posts/2019-06-18-Advanced-python-testing.html)
- [A practical guide to setup.py](https://godatadriven.com/blog/a-practical-guide-to-using-setup-py/)
- [How to make an awesome Python package in 2021 | Anton Zhiyanov](https://antonz.org/python-packaging/)
