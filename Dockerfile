FROM apache/airflow:2.8.1-python3.11

USER root
RUN apt update
RUN apt install build-essential

ENV AIRFLOW_HOME=/opt/airflow
ENV PYTHONPATH $PYTHONPATH:$AIRFLOW_HOME/config/

COPY dags ${AIRFLOW_HOME}/dags
COPY plugins ${AIRFLOW_HOME}/plugins
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
COPY airflow.requirements.txt ${AIRFLOW_HOME}/airflow.requirements.txt
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

USER airflow
RUN pip install --no-cache-dir --user \
    -r ${AIRFLOW_HOME}/requirements.txt
ENV PYTHONPATH ${AIRFLOW_HOME}/dags/libs:$PYTHONPATH
