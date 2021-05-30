# Backend Guide

[The Twelve-Factor App Methodology](https://12factor.net)

## Keep secrets and configuration out of version control

You _really_ don't want to leak your AWS secret key or Postgres username and password on Github. Enough said — see the [Twelve Factor App](http://12factor.net/config) principles on this point. Here's one way to do this:

### Store your secrets and config variables in a special file

Create a `.env` file in the project root folder. Thanks to the `.gitignore`, this file should never get committed into the version control repository. Here's an example:

```nohighlight
# example .env file
DATABASE_URL=postgres://username:password@localhost:5432/dbname
AWS_ACCESS_KEY=myaccesskey
AWS_SECRET_ACCESS_KEY=mysecretkey
OTHER_VARIABLE=something
```

### Use a package to load these variables automatically.

If you look at the stub script in `src/data/make_dataset.py`, it uses a package called [python-dotenv](https://github.com/theskumar/python-dotenv) to load up all the entries in this file as environment variables so they are accessible with `os.environ.get`. Here's an example snippet adapted from the `python-dotenv` documentation:

```python
# src/data/dotenv_example.py
import os
from dotenv import load_dotenv, find_dotenv

# find .env automagically by walking up directories until it's found
dotenv_path = find_dotenv()

# load up the entries as environment variables
load_dotenv(dotenv_path)

database_url = os.environ.get("DATABASE_URL")
other_variable = os.environ.get("OTHER_VARIABLE")
```

## Web development

- [What is gunicorn (WSGI)?](https://vsupalov.com/what-is-gunicorn/)
- [What is ASGI?](https://asgi.readthedocs.io/en/latest/introduction.html)

## Data management

- [Data Management With Python, SQLite, and SQLAlchemy – Real Python](https://realpython.com/python-sqlite-sqlalchemy/)

## Monitoring

- [How to monitor your FastAPI service · guitton.co](https://guitton.co/posts/fastapi-monitoring/)
