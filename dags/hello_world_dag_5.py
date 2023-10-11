from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def helloWorld():
    print('Hello World 5!')

with DAG(dag_id="hello_world_dag_5",
         start_date=datetime(2023,10,11),
         schedule_interval="@daily",
         catchup=False) as dag:
    
    task1 = PythonOperator(
        task_id="hello_world_5",
        python_callable=helloWorld)

task1