with base as (

    select *
    from `dbt_gopal__jaffle_shop_audit`.`snapshots`

),

enhanced as (

    select
        md5(cast(concat(coalesce(cast(command_invocation_id as string), ''), '-', coalesce(cast(node_id as string), '')) as string)) as snapshot_execution_id,
        command_invocation_id,
        node_id,
        run_started_at,
        database,
        schema,
        name,
        depends_on_nodes,
        package_name,
        path,
        checksum,
        strategy,
        meta,
        alias
    from base

)

select * from enhanced