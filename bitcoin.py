from snowflake.snowpark import Session

connection_params = {
    "account": "IBWBDHN-WI07977",
    "user": "vishnugettam",
    "password": "Admin@123456789",
    "role": "accountadmin",
    "warehouse": "compute_wh",
    "database": "bitcoin_dev",
    "schema": "bitcoin_dev_schema_core",
}

snowflake_connection = Session.builder.configs(connection_params).create()

df = snowflake_connection.table("tblbitcoin")
df.show()
