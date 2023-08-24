create or replace view `dbt_gopal__jaffle_shop_audit`.`stg_dbt__tests`
  
  
  as
    with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`tests`

),

enhanced as (

    select
        md5(cast(concat(coalesce(cast(command_invocation_id as string), ''), '-', coalesce(cast(node_id as string), '')) as string)) as test_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        name,
        depends_on_nodes,
        package_name,
        test_path,
        tags
    from base

)

select * from enhanced
