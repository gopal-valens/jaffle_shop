with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`stg_dbt__model_executions`

),

model_executions as (

    select
        model_execution_id,
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
        schema, -- noqa
        name,
        alias,
        message
    from base

)

select * from model_executions