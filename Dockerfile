FROM puckel/docker-airflow:1.10.9

USER root
RUN apt-get update && apt-get install -y postfix
USER airflow

RUN pip install --user psycopg2-binary
ENV AIRFLOW_HOME=/usr/local/airflow

RUN mkdir /usr/local/airflow/packages
COPY ./packages.pth /usr/local/lib/python3.7/site-packages

COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
