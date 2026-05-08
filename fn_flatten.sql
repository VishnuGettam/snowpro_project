select * from bitcoin_dev.bitcoin_dev_schema_core.tblbitcoin limit 5;

use database bitcoin_dev;
use schema bitcoin_dev_schema_core;


create or replace function fn_flattenData(ip variant)
returns variant
language python
runtime_version='3.12'
handler = 'flatten_data'  
as
$$
 
begin

  
  def flatten_data(ip):
    op = []
    for x in ip:
        op.append(x)
    return op;
end;
$$