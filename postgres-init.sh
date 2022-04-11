set -e

psql -v ON_ERROR_STOP=1 --username "db_user" <<-EOSQL
    CREATE DATABASE "db";
EOSQL

psql -v ON_ERROR_STOP=1 --username "db_user" db <<-EOSQL
    CREATE TABLE "account" (
        "acct_id" SERIAL PRIMARY KEY,
        "name" VARCHAR(255)
    );
EOSQL

psql -v ON_ERROR_STOP=1 --username "db_user" db <<-EOSQL
    INSERT INTO "account" ("name") VALUES
    ('test1');
EOSQL
