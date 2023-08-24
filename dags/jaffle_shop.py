from pendulum import datetime

from airflow import DAG
from airflow.operators.empty import EmptyOperator
from cosmos import DbtDag, DbtTaskGroup, ProfileConfig, ProjectConfig

profile_config = ProfileConfig(
    profile_name="jaffle_shop",
    target_name="dev",
    profiles_yml_filepath="/opt/airflow/git/jaffle_shop.git/dags/dbt/jaffle_shop/profiles.yml",
)

with DAG(
        dag_id="extract_dag",
        start_date=datetime(2023, 8, 23),
        schedule="@daily",
):
    e1 = EmptyOperator(task_id="pre_dbt")

    dbt_tg = DbtTaskGroup(
        project_config=ProjectConfig(dbt_project_path="/opt/airflow/git/jaffle_shop.git/dags/dbt/jaffle_shop", manifest_path="/opt/airflow/git/jaffle_shop.git/dags/dbt/jaffle_shop/dags/dbt/jaffle_shop/target/manifest.json"),
        profile_config=profile_config,
    )

    e2 = EmptyOperator(task_id="post_dbt")

    e1 >> dbt_tg >> e2
