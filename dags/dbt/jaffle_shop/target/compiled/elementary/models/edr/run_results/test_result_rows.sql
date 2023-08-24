

-- depends_on: `dbt_gopal__jaffle_shop_elementary`.`elementary_test_results`
with empty_table as (
            select
            
                
        cast('this_is_just_a_long_dummy_string' as string) as elementary_test_results_id

,
                
        cast('this_is_just_a_long_dummy_string' as string) as result_row

,
                cast('2091-02-17' as timestamp) as detected_at

,
                cast('2091-02-17' as timestamp) as created_at


            )
        select * from empty_table
        where 1 = 0