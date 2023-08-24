create or replace view `dbt_gopal__jaffle_shop_audit`.`dim_dbt__seeds`
  
  
  as
    with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`stg_dbt__seeds`

),

seeds as (

    select
        seed_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        database,
        schema,
        name,
        package_name,
        path,
        checksum,
        meta,
        alias
    from base

)

select * from seeds
