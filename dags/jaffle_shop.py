from pendulum import datetime

from airflow import DAG
from airflow.operators.empty import EmptyOperator
from cosmos import DbtTaskGroup, ProfileConfig, ProjectConfig
from cosmos.profiles import DatabricksTokenProfileMapping

profile_config = ProfileConfig(
    profile_name="jaffle_shop",
    target_name="dev",
    profiles_yml_filepath="dbt/profiles.yml",
)

databricks_profile = DatabricksTokenProfileMapping(
    conn_id='my_databricks_connection',
    profile_args={"host": "adb-2002800394447601.1.azuredatabricks.net",
                  "schema": "dbt_gopal__jaffle_shop",
                  "token": "dapib9177beac988227e0440856809ebb2e5",
                  "http_path": "/sql/1.0/warehouses/ef0a6fc07d996fb5"},
)

with DAG(
        dag_id="extract_dag",
        start_date=datetime(2023, 8, 23),
        schedule="@daily",
):
    e1 = EmptyOperator(task_id="pre_dbt")

    dbt_tg = DbtTaskGroup(
        project_config=ProjectConfig("jaffle_shop"),
        profile_config=profile_config,
    )

    e2 = EmptyOperator(task_id="post_dbt")

    e1 >> dbt_tg >> e2
