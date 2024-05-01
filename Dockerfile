FROM python:3.11.9

WORKDIR /linkedin-scrapper

RUN pip install poetry

COPY pyproject.toml poetry.lock* /linkedin-scrapper/

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY . /linkedin-scrapper

RUN poetry run python -m ipykernel install --user --name=linkedin-scrapper-env --display-name "linkedin-scrapper-env"
