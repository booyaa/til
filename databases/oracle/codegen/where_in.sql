-- how to create a where in list from a column (assumes char type)

SELECT
        CASE ROWNUM
            WHEN 1   THEN '('
            ELSE ','
        END
    || replace(q'['_TBL_']','_TBL_',table_name)
FROM
    user_tables
UNION ALL
SELECT
    ')'
FROM
    dual;

-- expected output  
--    
-- WHERE_IN            
-- --------------------
-- ('FOO'
-- ,'BAR'
-- )
--
-- 6 rows selected.  
