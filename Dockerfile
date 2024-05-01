FROM apache/airflow:2.3.0

COPY dags /opt/airflow/dags
COPY plugins /opt/airflow/plugins
COPY airflow.cfg /opt/airflow/airflow.cfg

ENV AIRFLOW_HOME=/opt/airflow

RUN pip install poetry

COPY pyproject.toml poetry.lock* /opt/airflow/
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi
