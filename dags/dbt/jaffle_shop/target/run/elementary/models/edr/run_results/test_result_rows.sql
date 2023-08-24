-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`test_result_rows` as DBT_INTERNAL_DEST
      using `test_result_rows__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.elementary_test_results_id = DBT_INTERNAL_DEST.elementary_test_results_id
          

      when matched then update set
         * 

      when not matched then insert *
