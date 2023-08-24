
  
    
        create or replace table `dbt_gopal__jaffle_shop_audit`.`seeds`
      
      
    using delta
      
      
      
      
      
      
      as
      /* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    cast(null as string) as command_invocation_id,
    cast(null as string) as node_id,
    cast(null as timestamp) as run_started_at,
    cast(null as string) as database,
    cast(null as string) as schema,
    cast(null as string) as name,
    cast(null as string) as package_name,
    cast(null as string) as path,
    cast(null as string) as checksum,
    cast(null as string) as meta,
    cast(null as string) as alias
from dummy_cte
where 1 = 0
  