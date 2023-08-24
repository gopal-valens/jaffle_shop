-- back compat for old kwarg name
  
  
  
      
          
          
      
  

  

  merge into `dbt_gopal__jaffle_shop_elementary`.`data_monitoring_metrics` as DBT_INTERNAL_DEST
      using `data_monitoring_metrics__dbt_tmp` as DBT_INTERNAL_SOURCE
      on 
              DBT_INTERNAL_SOURCE.id = DBT_INTERNAL_DEST.id
          

      when matched then update set
         * 

      when not matched then insert *
