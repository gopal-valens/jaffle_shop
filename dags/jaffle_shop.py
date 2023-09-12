from pendulum import datetime

from airflow import DAG
from airflow.operators.empty import EmptyOperator
from cosmos import DbtDag, LoadMode, RenderConfig, DbtTaskGroup, ProfileConfig, ProjectConfig
from cosmos.profiles import DatabricksTokenProfileMapping
from cosmos.constants import TestBehavior

PROJECT_ROOT_PATH="/opt/airflow/git/jaffle_shop.git/dags/dbt/jaffle_shop"

profile_config = ProfileConfig(
    profile_name="jaffle_shop",
    target_name="dev",
    #profiles_yml_filepath=f"{PROJECT_ROOT_PATH}/profiles.yml",
    profile_mapping=DatabricksTokenProfileMapping(
        conn_id = 'databricks_default'
    )
)

with DAG(
        dag_id="extract_dag",
        start_date=datetime(2023, 9, 12),
        schedule="@daily",
):
    e1 = EmptyOperator(task_id="pre_dbt")

    dbt_tg = DbtTaskGroup(
        project_config=ProjectConfig(dbt_project_path=PROJECT_ROOT_PATH,
                                     manifest_path=f"{PROJECT_ROOT_PATH}/target/manifest.json",),
        profile_config=profile_config,
        render_config=RenderConfig(
            load_method=LoadMode.DBT_MANIFEST,
            test_behavior=TestBehavior.NONE
        ),
    )

    e2 = EmptyOperator(task_id="post_dbt")

    e1 >> dbt_tg >> e2
