--------sp1-----------------------------------
create or replace procedure sp_deletebitcoinrecords(blknum varchar)
returns object
language sql
as
$$
declare
    num_records_deleted int default 0;
begin

        delete from tblbitcoin where block_number = 'blknum';
        num_records_deleted := SQLROWCOUNT;

        return object_construct(
            'status','success',
            'rows_deleted',num_records_deleted
        );

        EXCEPTION 
            when STATEMENT_ERROR then
                return object_construct(
                    'error','Statement_error',
                    'code',SQLCODE,
                    'state',SQLSTATE,
                    'error_msg',SQLERRM
                );
            when EXPRESSION_ERROR then
                return object_construct(
                    'error','Expression_error',
                    'code',SQLCODE,
                    'state',SQLSTATE,
                    'error_msg',SQLERRM

                );
            when OTHER then
                return object_construct(
                    'error','error',
                    'code',SQLCODE,
                    'state',SQLSTATE,
                    'error_msg',SQLERRM

                );

end;


$$;


call sp_deletebitcoinrecords('asdas');


------------sp2-------------
create or replace procedure sp_getbitcoinblocks()
returns table() 
language sql 
as
$$
declare 
final_table resultset;
begin

        final_table := (select 
                        block_number,
                        count(block_number)
                        from tblbitcoin 
                        group by block_number
                        order by count(block_number)
                        );


        return table(final_table);


    end;
$$;



call sp_getbitcoinblocks();


select 
block_number,
count(block_number)
from tblbitcoin 
group by block_number
order by count(block_number) limit 1;