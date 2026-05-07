from snowflake.snowpark import Session


connection_params = {
    "account": "<account_name>",
    "user": "<username>",
    "password": "<password>",   
    "role": "<role_name>",
    "warehouse": "<warehouse_name>",
    "database": "<database_name>",
    "schema": "<schema_name>"

}

snowflake_connection = Session.builder.configs(connection_params).create()