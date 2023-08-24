/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    cast(null as string) as command_invocation_id,
    cast(null as string) as dbt_version,
    cast(null as string) as project_name,
    cast(null as timestamp) as run_started_at,
    cast(null as string) as dbt_command,
    cast(null as boolean) as full_refresh_flag,
    cast(null as string) as target_profile_name,
    cast(null as string) as target_name,
    cast(null as string) as target_schema,
    cast(null as integer) as target_threads,
    cast(null as string) as dbt_cloud_project_id,
    cast(null as string) as dbt_cloud_job_id,
    cast(null as string) as dbt_cloud_run_id,
    cast(null as string) as dbt_cloud_run_reason_category,
    cast(null as string) as dbt_cloud_run_reason,
    cast(null as string) as env_vars,
    cast(null as string) as dbt_vars,
    cast(null as string) as invocation_args,
    cast(null as string) as dbt_custom_envs
from dummy_cte
where 1 = 0