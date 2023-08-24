
  
    
        create or replace table `dbt_gopal__jaffle_shop_elementary`.`metadata`
      
      
    using delta
      
      
      
      
      
      
      as
      

SELECT
    '0.9.3' as dbt_pkg_version
  