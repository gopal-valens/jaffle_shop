create or replace view `dbt_gopal__jaffle_shop_audit`.`fct_dbt__seed_executions`
  
  
  as
    with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`stg_dbt__seed_executions`

),

seed_executions as (

    select
        seed_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        was_full_refresh,
        thread_id,
        status,
        compile_started_at,
        query_completed_at,
        total_node_runtime,
        rows_affected,
        materialization,
        schema,
        name,
        alias,
        message
    from base

)

select * from seed_executions
