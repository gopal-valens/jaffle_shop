

    
  
    
  

  with dbt_models_data as (
      select
          database_name,
          schema_name,
          alias as table_name
      from `dbt_gopal__jaffle_shop_elementary`.`dbt_models`
  ),

  dbt_snapshots_data as (
      select
          database_name,
          schema_name,
          alias as table_name
      from `dbt_gopal__jaffle_shop_elementary`.`dbt_snapshots`
  ),

  dbt_sources_data as (
      select
          database_name,
          schema_name,
          name as table_name
      from `dbt_gopal__jaffle_shop_elementary`.`dbt_sources`
  ),

  dbt_seeds_data as (
      select
          database_name,
          schema_name,
          name as table_name
      from `dbt_gopal__jaffle_shop_elementary`.`dbt_seeds`
  ),

  tables_information as (
      select * from dbt_models_data
      union all
      select * from dbt_sources_data
      union all
      select * from dbt_snapshots_data
      union all
      select * from dbt_seeds_data
  ),

  columns_information as (
      
    
    
    
        (
    
        
    with empty_table as (
            select
            
                
        cast('dummy_string' as string) as full_table_name

,
                
        cast('dummy_string' as string) as database_name

,
                
        cast('dummy_string' as string) as schema_name

,
                
        cast('dummy_string' as string) as table_name

,
                
        cast('dummy_string' as string) as column_name

,
                
        cast('dummy_string' as string) as data_type


            )
        select * from empty_table
        where 1 = 0

    
)
        
    



  ),

  dbt_columns as (
      select col_info.*
      from tables_information tbl_info
      join columns_information col_info
          on (lower(tbl_info.database_name) = lower(col_info.database_name) and
              lower(tbl_info.schema_name) = lower(col_info.schema_name) and
              lower(tbl_info.table_name) = lower(col_info.table_name)
          )
  )

  select *
  from dbt_columns

