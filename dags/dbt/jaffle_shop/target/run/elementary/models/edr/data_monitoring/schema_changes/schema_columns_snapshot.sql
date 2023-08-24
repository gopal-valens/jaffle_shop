-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`schema_columns_snapshot` as DBT_INTERNAL_DEST
      using `schema_columns_snapshot__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.column_state_id = DBT_INTERNAL_DEST.column_state_id
          

      when matched then update set
         * 

      when not matched then insert *
