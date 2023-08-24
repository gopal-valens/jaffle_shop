-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`dbt_invocations` as DBT_INTERNAL_DEST
      using `dbt_invocations__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.invocation_id = DBT_INTERNAL_DEST.invocation_id
          

      when matched then update set
         * 

      when not matched then insert *
