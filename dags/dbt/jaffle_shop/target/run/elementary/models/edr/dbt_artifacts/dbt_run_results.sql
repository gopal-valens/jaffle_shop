-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`dbt_run_results` as DBT_INTERNAL_DEST
      using `dbt_run_results__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.model_execution_id = DBT_INTERNAL_DEST.model_execution_id
          

      when matched then update set
         * 

      when not matched then insert *
