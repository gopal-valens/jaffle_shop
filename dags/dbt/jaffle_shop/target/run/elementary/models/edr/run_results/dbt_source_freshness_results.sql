-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`dbt_source_freshness_results` as DBT_INTERNAL_DEST
      using `dbt_source_freshness_results__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.source_freshness_execution_id = DBT_INTERNAL_DEST.source_freshness_execution_id
          

      when matched then update set
         * 

      when not matched then insert *
