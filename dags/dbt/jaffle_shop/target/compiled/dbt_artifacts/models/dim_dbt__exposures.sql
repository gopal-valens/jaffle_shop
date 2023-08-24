with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`stg_dbt__exposures`

),

exposures as (

    select
        exposure_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        name,
        type,
        owner,
        maturity,
        path,
        description,
        url,
        package_name,
        depends_on_nodes
    from base

)

select * from exposures