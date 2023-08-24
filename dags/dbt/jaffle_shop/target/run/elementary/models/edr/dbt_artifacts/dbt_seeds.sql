-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`dbt_seeds` as DBT_INTERNAL_DEST
      using `dbt_seeds__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.unique_id = DBT_INTERNAL_DEST.unique_id
          

      when matched then update set
         * 

      when not matched then insert *
