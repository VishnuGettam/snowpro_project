 
CREATE OR REPLACE FUNCTION "DISPALY_FLATTENDATA"()
RETURNS TABLE ("HASH_KEY" VARCHAR, "VALUE" VARIANT, "OUTPUTS" VARIANT)
LANGUAGE SQL
AS 
$$
 
        select 
            hash_key,
            fl.value,
            outputs
        from 
            tblbitcoin  ,
            lateral FLATTEN(input => outputs) fl 
        limit 10
      
$$;

select * from table(DISPALY_FLATTENDATA());
 

CREATE OR REPLACE FUNCTION "FN_FLATTENDATA"("IP" VARIANT)
RETURNS VARIANT
LANGUAGE PYTHON
RUNTIME_VERSION = '3.12'
HANDLER = 'flatten_data'
AS '
def flatten_data(ip):
    op = []
    for x in ip:
        op.append(x)
    return op;
 
';

select * from information_schema.functions;

select get_ddl('function','DISPALY_FLATTENDATA()');