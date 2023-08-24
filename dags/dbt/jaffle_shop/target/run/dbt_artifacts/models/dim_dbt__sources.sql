create or replace view `dbt_gopal__jaffle_shop_audit`.`dim_dbt__sources`
  
  
  as
    with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`stg_dbt__sources`

),

sources as (

    select
        source_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        database,
        schema,
        source_name,
        loader,
        name,
        identifier,
        loaded_at_field,
        freshness
    from base

)

select * from sources
