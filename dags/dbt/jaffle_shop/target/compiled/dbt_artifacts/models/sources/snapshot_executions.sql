/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    cast(null as string) as command_invocation_id,
    cast(null as string) as node_id,
    cast(null as timestamp) as run_started_at,
    cast(null as boolean) as was_full_refresh,
    cast(null as string) as thread_id,
    cast(null as string) as status,
    cast(null as timestamp) as compile_started_at,
    cast(null as timestamp) as query_completed_at,
    cast(null as float) as total_node_runtime,
    cast(null as integer) as rows_affected,
    cast(null as string) as materialization,
    cast(null as string) as schema,
    cast(null as string) as name,
    cast(null as string) as alias,
    cast(null as string) as message
from dummy_cte
where 1 = 0