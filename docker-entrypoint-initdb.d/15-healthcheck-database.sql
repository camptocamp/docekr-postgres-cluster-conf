CREATE DATABASE healthcheck;
CREATE USER healthcheck;
\c healthcheck -- psql specific command
DROP SCHEMA public;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA pg_catalog FROM public;
GRANT EXECUTE ON FUNCTION pg_is_in_recovery() to healthcheck;
GRANT EXECUTE ON FUNCTION pg_terminate_backend(int) to healthcheck;
GRANT EXECUTE ON FUNCTION pg_backend_pid() to healthcheck;
