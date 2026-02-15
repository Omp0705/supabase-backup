--
-- PostgreSQL database dump
--

\restrict KIVBFUWNfF6PIzILfWYkGHv5aepxzcQnEiXF8p8QbNU1EEoORnPBYDk6klgDTpg

-- Dumped from database version 15.14
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: generate_fac_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_fac_id() RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    new_id int;
begin
    new_id := nextval('fac_id_seq');
    return 'FAC' || lpad(new_id::text, 4, '0'); -- FAC0001, FAC0002, etc.
end;
$$;


ALTER FUNCTION public.generate_fac_id() OWNER TO postgres;

--
-- Name: swap_timetable_entries_by_id(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    sem1 INT;
    sem2 INT;
    day1 INT;
    day2 INT;
    slot1 INT;
    slot2 INT;
    temp_slot INT := 9999;  -- Must exist in time_slots
BEGIN
    -- Step 1: Lock and fetch the first entry
    SELECT semester_id, day_id, time_slot_id INTO sem1, day1, slot1
    FROM timetable WHERE id = entry_id1 FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Entry % not found.', entry_id1;
    END IF;

    -- Step 2: Lock and fetch the second entry
    SELECT semester_id, day_id, time_slot_id INTO sem2, day2, slot2
    FROM timetable WHERE id = entry_id2 FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Entry % not found.', entry_id2;
    END IF;

    -- Step 3: Temporarily move ALL entries in (sem1, day1, slot1) to TEMP slot
    UPDATE timetable
    SET time_slot_id = temp_slot
    WHERE semester_id = sem1 AND day_id = day1 AND time_slot_id = slot1;

    -- Step 4: Move ALL entries in (sem2, day2, slot2) to slot1
    UPDATE timetable
    SET time_slot_id = slot1
    WHERE semester_id = sem2 AND day_id = day2 AND time_slot_id = slot2;

    -- Step 5: Move TEMP slot entries to slot2
    UPDATE timetable
    SET time_slot_id = slot2
    WHERE semester_id = sem1 AND day_id = day1 AND time_slot_id = temp_slot;

EXCEPTION
    WHEN OTHERS THEN
        RAISE WARNING 'Swap failed: %', SQLERRM;
        RAISE;
END;
$$;


ALTER FUNCTION public.swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_
        -- Filter by action early - only get subscriptions interested in this action
        -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
        and (subs.action_filter = '*' or subs.action_filter = action::text);

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batches (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.batches OWNER TO postgres;

--
-- Name: batches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.batches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.batches_id_seq OWNER TO postgres;

--
-- Name: batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.batches_id_seq OWNED BY public.batches.id;


--
-- Name: days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.days (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.days OWNER TO postgres;

--
-- Name: days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.days_id_seq OWNER TO postgres;

--
-- Name: days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.days_id_seq OWNED BY public.days.id;


--
-- Name: fac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fac_id_seq OWNER TO postgres;

--
-- Name: fcm_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fcm_tokens (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    fcm_token text NOT NULL,
    user_role text NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT fcm_tokens_user_role_check CHECK ((user_role = ANY (ARRAY['student'::text, 'professor'::text])))
);


ALTER TABLE public.fcm_tokens OWNER TO postgres;

--
-- Name: lecture_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lecture_types (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.lecture_types OWNER TO postgres;

--
-- Name: lecture_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lecture_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lecture_types_id_seq OWNER TO postgres;

--
-- Name: lecture_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lecture_types_id_seq OWNED BY public.lecture_types.id;


--
-- Name: lectures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures (
    id integer NOT NULL,
    day_id integer,
    time_slot_id integer,
    semester_id integer,
    subject_id integer,
    professor_id integer,
    batch_id integer,
    lecture_type_id integer
);


ALTER TABLE public.lectures OWNER TO postgres;

--
-- Name: lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectures_id_seq OWNER TO postgres;

--
-- Name: lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectures_id_seq OWNED BY public.lectures.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    professor_name text NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    topic text
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: professor_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor_subjects (
    id integer NOT NULL,
    professor_id integer,
    subject_id integer
);


ALTER TABLE public.professor_subjects OWNER TO postgres;

--
-- Name: professor_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professor_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professor_subjects_id_seq OWNER TO postgres;

--
-- Name: professor_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professor_subjects_id_seq OWNED BY public.professor_subjects.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    id uuid DEFAULT auth.uid() NOT NULL,
    name text NOT NULL,
    department text NOT NULL,
    contact_no text NOT NULL,
    exp text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    profile_pic text,
    fac_id text
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semesters (
    id integer NOT NULL,
    number integer NOT NULL,
    name text,
    CONSTRAINT semesters_number_check CHECK (((number >= 1) AND (number <= 8)))
);


ALTER TABLE public.semesters OWNER TO postgres;

--
-- Name: semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semesters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semesters_id_seq OWNER TO postgres;

--
-- Name: semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semesters_id_seq OWNED BY public.semesters.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id uuid DEFAULT auth.uid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    rollno text NOT NULL,
    abc_id text NOT NULL,
    sem text NOT NULL,
    department text NOT NULL,
    profile_pic text,
    contact_no text
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name text NOT NULL,
    code text,
    sem integer,
    is_elective boolean DEFAULT false
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subjects_id_seq OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10)
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slots (
    id integer NOT NULL,
    start_time text,
    end_time text,
    slot text
);


ALTER TABLE public.time_slots OWNER TO postgres;

--
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.time_slots_id_seq OWNER TO postgres;

--
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    id integer NOT NULL,
    semester_id integer,
    day_id integer,
    time_slot_id integer,
    subject_id integer,
    professor_id integer,
    lecture_type_id integer,
    batch_id integer
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- Name: timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.timetable_id_seq OWNER TO postgres;

--
-- Name: timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timetable_id_seq OWNED BY public.timetable.id;


--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tokens (
    id uuid NOT NULL,
    email text NOT NULL,
    token text NOT NULL,
    role text NOT NULL,
    sem text,
    abc_id text,
    fac_id text,
    CONSTRAINT user_tokens_role_check CHECK ((role = ANY (ARRAY['student'::text, 'professor'::text])))
);


ALTER TABLE public.user_tokens OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: batches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches ALTER COLUMN id SET DEFAULT nextval('public.batches_id_seq'::regclass);


--
-- Name: days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days ALTER COLUMN id SET DEFAULT nextval('public.days_id_seq'::regclass);


--
-- Name: lecture_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecture_types ALTER COLUMN id SET DEFAULT nextval('public.lecture_types_id_seq'::regclass);


--
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- Name: professor_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor_subjects ALTER COLUMN id SET DEFAULT nextval('public.professor_subjects_id_seq'::regclass);


--
-- Name: semesters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters ALTER COLUMN id SET DEFAULT nextval('public.semesters_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- Name: timetable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable ALTER COLUMN id SET DEFAULT nextval('public.timetable_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	7347e4ec-1422-41a6-a9c0-3a032c67f211	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:14:04.580624+00	
00000000-0000-0000-0000-000000000000	24d1d051-56a4-4777-8419-6faefbd4ff6a	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:15:33.754657+00	
00000000-0000-0000-0000-000000000000	48df13c8-db32-4d5d-a5bb-f57206334465	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:18:21.21333+00	
00000000-0000-0000-0000-000000000000	28bf045b-a672-4b7e-97f4-153a5d9aa9f4	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:20:14.17941+00	
00000000-0000-0000-0000-000000000000	763b799b-f056-4fc9-ac6f-1b88c02dab2b	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:36:53.617273+00	
00000000-0000-0000-0000-000000000000	d164a02e-2a13-4a94-adfd-b5c76a847668	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:41:40.560821+00	
00000000-0000-0000-0000-000000000000	5299cf53-87ae-4e1a-a466-283a75aeb862	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:42:43.520143+00	
00000000-0000-0000-0000-000000000000	cb832ead-72df-402d-b5ff-a9bbe75090c3	{"action":"user_confirmation_requested","actor_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-28 11:44:31.537751+00	
00000000-0000-0000-0000-000000000000	185df14e-dd1c-4cca-b821-142296a982fb	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"5e174acd-e28f-4724-adfc-6bf40c53c934","user_phone":""}}	2025-03-29 13:35:31.243451+00	
00000000-0000-0000-0000-000000000000	754bffc2-62cb-434c-b845-591b6888907b	{"action":"user_signedup","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-29 13:37:45.797402+00	
00000000-0000-0000-0000-000000000000	9e765a23-01b1-4beb-9092-56f7b359440e	{"action":"login","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 13:37:45.801526+00	
00000000-0000-0000-0000-000000000000	c8834041-2f44-4902-b08f-d9242f04634d	{"action":"login","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 13:38:42.449297+00	
00000000-0000-0000-0000-000000000000	ca97e729-505e-4c4b-a023-0ffcb1a3ab22	{"action":"login","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 13:43:36.997092+00	
00000000-0000-0000-0000-000000000000	e92b821e-80a2-40ef-9109-8edb24fa98ee	{"action":"token_refreshed","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-29 14:36:00.9126+00	
00000000-0000-0000-0000-000000000000	c780d14f-0b41-467d-9062-5ce111394d0f	{"action":"token_revoked","actor_id":"2b583410-911a-4123-acb7-9113277cb9e9","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-29 14:36:00.914375+00	
00000000-0000-0000-0000-000000000000	df30497a-ce76-468e-92d0-a593989a49e5	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"2b583410-911a-4123-acb7-9113277cb9e9","user_phone":""}}	2025-03-29 14:57:18.044419+00	
00000000-0000-0000-0000-000000000000	aaa13493-0dd5-4398-bbe6-d6d5327beff2	{"action":"user_signedup","actor_id":"9e6e952c-d208-4407-b07a-9da0b5efde4a","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-29 14:57:49.382742+00	
00000000-0000-0000-0000-000000000000	a0b5405f-16b5-4069-9677-1bf6be12818d	{"action":"login","actor_id":"9e6e952c-d208-4407-b07a-9da0b5efde4a","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 14:57:49.38719+00	
00000000-0000-0000-0000-000000000000	e4d245e9-fa11-4710-8ee4-5718db6e4c02	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"9e6e952c-d208-4407-b07a-9da0b5efde4a","user_phone":""}}	2025-03-29 15:05:06.625785+00	
00000000-0000-0000-0000-000000000000	d519d541-f103-44b5-8926-bf81b4627bc7	{"action":"user_signedup","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-29 15:06:23.061036+00	
00000000-0000-0000-0000-000000000000	be553cb7-49af-4adb-b9a9-b73cf5f24422	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 15:06:23.065965+00	
00000000-0000-0000-0000-000000000000	73f37d34-de34-4bf6-b5b1-cbdd96d9bad8	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-29 16:20:54.945235+00	
00000000-0000-0000-0000-000000000000	03c2893f-ceaf-4323-b606-7ceb4816760e	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-29 17:17:04.952626+00	
00000000-0000-0000-0000-000000000000	03dcf135-3863-4758-872f-01f06b23e2e4	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-29 17:17:04.9564+00	
00000000-0000-0000-0000-000000000000	12bcb9ed-06ad-4319-9fac-b8e3bbce1d03	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 07:05:49.703914+00	
00000000-0000-0000-0000-000000000000	9b1bd1e3-fa0d-4dbe-b3dc-331aad9a6844	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 07:05:49.730214+00	
00000000-0000-0000-0000-000000000000	3af82648-5f14-4655-8b4e-1452bae21f8e	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 07:05:49.804048+00	
00000000-0000-0000-0000-000000000000	aacbbf99-345d-4e49-987d-11d0b9a1d635	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-30 07:06:56.263894+00	
00000000-0000-0000-0000-000000000000	84d611de-7bc3-43f1-87f8-21aea53f214d	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 10:03:58.720419+00	
00000000-0000-0000-0000-000000000000	a28ea5cc-b785-4e7d-9121-c158028b70e5	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 10:03:58.732916+00	
00000000-0000-0000-0000-000000000000	c0ef4520-b023-4a6d-8c81-c50972f0914d	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 16:12:46.50114+00	
00000000-0000-0000-0000-000000000000	07af7154-78a9-4ba9-b019-c198a57a18db	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 16:12:46.502218+00	
00000000-0000-0000-0000-000000000000	0239e673-9898-4d04-9fb7-32ed88568d50	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-30 16:12:46.684195+00	
00000000-0000-0000-0000-000000000000	ec7633f6-f66c-4d32-ab1c-fca4dfde6427	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 06:35:22.850287+00	
00000000-0000-0000-0000-000000000000	43c5c1c8-b969-4ef9-84aa-aaca318c5c27	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 06:35:22.866701+00	
00000000-0000-0000-0000-000000000000	5f57a0ab-1452-4c74-976c-8997439126f6	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 06:35:22.902016+00	
00000000-0000-0000-0000-000000000000	f83f998b-7ab5-4699-865a-084fc86b2047	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-31 06:53:42.594946+00	
00000000-0000-0000-0000-000000000000	915f2c4b-cc0a-4928-bbf3-f08a8fae9d32	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 14:49:03.381095+00	
00000000-0000-0000-0000-000000000000	f2b4074f-9aa1-49fd-89a7-5445475428a2	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 14:49:03.383802+00	
00000000-0000-0000-0000-000000000000	d2da0003-5c05-4cd3-aa0d-c3effe673fd8	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 14:49:03.411723+00	
00000000-0000-0000-0000-000000000000	75dc9db3-ac34-426f-bf1c-6f71eb2dc770	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 14:49:03.430054+00	
00000000-0000-0000-0000-000000000000	bc389c96-04ee-4ab1-9aad-864b85ec7e17	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-31 14:49:03.439315+00	
00000000-0000-0000-0000-000000000000	5abf77d2-3bb3-49b8-9e77-81087f175ae6	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-31 14:50:52.725181+00	
00000000-0000-0000-0000-000000000000	eddae061-ce00-4dcb-9b68-8cc991d08235	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-01 17:24:45.272008+00	
00000000-0000-0000-0000-000000000000	f699323d-ad54-4887-a478-da2bbbb14f3a	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-01 17:24:45.290071+00	
00000000-0000-0000-0000-000000000000	7acf0758-b641-4506-9c30-9c0d55454864	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-01 17:24:45.328336+00	
00000000-0000-0000-0000-000000000000	6a9e0ea4-3cda-4e04-8b9d-cbac7c033a0d	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-01 17:25:07.681989+00	
00000000-0000-0000-0000-000000000000	a8ca11d8-e089-4f77-a124-efc9cbf87d99	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-01 18:16:53.645188+00	
00000000-0000-0000-0000-000000000000	5cf92b74-c174-499c-8a68-aa7813a35944	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-01 18:16:53.646845+00	
00000000-0000-0000-0000-000000000000	1ebf01c3-5450-4225-99d1-cac750b496d7	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-01 18:29:20.956917+00	
00000000-0000-0000-0000-000000000000	23a3ba1e-1705-4d4b-9162-7cb73caa7f69	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 04:55:16.313509+00	
00000000-0000-0000-0000-000000000000	b88d8c0b-efb0-4df0-b8ec-7df2c1bea8fe	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 04:55:16.314646+00	
00000000-0000-0000-0000-000000000000	e168cc3f-0624-44ab-837c-d3a79e120ade	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 04:55:16.336111+00	
00000000-0000-0000-0000-000000000000	ef6a64a1-38e3-46a4-acc4-366e4eed6c0f	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 05:53:43.769181+00	
00000000-0000-0000-0000-000000000000	553278fa-32ca-43a1-8228-405eff0eac33	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 05:53:43.772289+00	
00000000-0000-0000-0000-000000000000	62f52f96-7893-4417-981e-7a6794a64147	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 05:55:26.550507+00	
00000000-0000-0000-0000-000000000000	c6db3815-d12f-45f3-a151-41ad29bee221	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 05:55:26.552377+00	
00000000-0000-0000-0000-000000000000	80051d33-4416-44e7-85b7-6a534de06d51	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 06:43:28.466079+00	
00000000-0000-0000-0000-000000000000	a44d8bd7-5d09-48ab-99ca-7856dd1d1a80	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 06:43:28.469308+00	
00000000-0000-0000-0000-000000000000	6178c579-1994-46d0-a9f6-f7aebeabc7fc	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 07:31:53.131937+00	
00000000-0000-0000-0000-000000000000	2e7bdcc6-1010-4c9d-b7b4-bb19ee7ecdc4	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 07:31:53.133708+00	
00000000-0000-0000-0000-000000000000	3e80c70b-ca20-4d09-ba7f-d5fe7bf98155	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 07:32:08.178175+00	
00000000-0000-0000-0000-000000000000	a8459d97-b2ab-412e-9ab2-582547d2b8ff	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 08:20:10.305038+00	
00000000-0000-0000-0000-000000000000	8aa0d555-4639-4bde-81a4-311f9287dd2b	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 08:20:10.314436+00	
00000000-0000-0000-0000-000000000000	9480ff13-b91a-45e7-ac45-80f1be473a7a	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 09:08:12.255492+00	
00000000-0000-0000-0000-000000000000	e6529958-baba-411c-8d23-e58bdde5935f	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 09:08:12.257362+00	
00000000-0000-0000-0000-000000000000	2bd0588d-45af-4b0c-bb81-6748d00d4a5e	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 10:00:35.635402+00	
00000000-0000-0000-0000-000000000000	a3a9ab8c-3148-459a-b74e-5183f61b1a61	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 10:00:35.638606+00	
00000000-0000-0000-0000-000000000000	771a7ef4-8df9-493d-a265-202851576a3a	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 10:48:41.487428+00	
00000000-0000-0000-0000-000000000000	1d07ee18-eae4-4094-b302-c5058d90979b	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 10:48:41.489995+00	
00000000-0000-0000-0000-000000000000	ea06e5de-83a9-4d4c-ad78-f10ecbec597f	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 11:36:46.052926+00	
00000000-0000-0000-0000-000000000000	b72e3a46-5eb9-47db-bfd1-e4cb5ae96e25	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 11:36:46.053893+00	
00000000-0000-0000-0000-000000000000	4b1ecddc-858f-4d77-adbf-88604f0de325	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 12:24:49.038397+00	
00000000-0000-0000-0000-000000000000	466a3f27-2abe-4a6d-b558-289a17c15e65	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 12:24:49.039321+00	
00000000-0000-0000-0000-000000000000	f0065104-7d22-4fbd-91ea-572510eaa9d0	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 13:16:05.783235+00	
00000000-0000-0000-0000-000000000000	da84cda5-c89b-4949-9499-bd9cfa917bf3	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 13:16:05.784317+00	
00000000-0000-0000-0000-000000000000	97a126fb-0c73-477b-94b6-cae771086f31	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 13:16:05.881806+00	
00000000-0000-0000-0000-000000000000	c424ae6a-0ada-4258-baeb-3924b437355d	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 14:28:07.026404+00	
00000000-0000-0000-0000-000000000000	d69583a1-2479-4ebb-9fdc-b17d6a782455	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 14:28:07.028324+00	
00000000-0000-0000-0000-000000000000	904eea35-d84c-472c-bdcd-2237b01878da	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-02 14:28:07.695714+00	
00000000-0000-0000-0000-000000000000	256d2ef0-b0a0-4dc2-ab13-6515bb116b84	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-03 11:38:16.83961+00	
00000000-0000-0000-0000-000000000000	688e6f87-e0d7-4dfc-be3e-6ea255576319	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-03 11:38:16.854856+00	
00000000-0000-0000-0000-000000000000	d819046c-7f68-4aeb-8e3a-aa1bac54ad26	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-03 11:38:16.915287+00	
00000000-0000-0000-0000-000000000000	facbec5d-5115-4b65-b16a-c308be428b7d	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:08:34.700528+00	
00000000-0000-0000-0000-000000000000	d88dae24-2d90-4c3b-a8a2-8205d4d1efdb	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:08:34.725421+00	
00000000-0000-0000-0000-000000000000	7e671bf0-626f-4fb2-9202-e351fb0dc3e6	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:08:34.781876+00	
00000000-0000-0000-0000-000000000000	cde8b7e8-a7c7-4c71-884c-bb8b3b56f8eb	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:45:47.549864+00	
00000000-0000-0000-0000-000000000000	6ba2db98-6e14-409f-bb2f-482a169ad638	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:45:47.552626+00	
00000000-0000-0000-0000-000000000000	7c3599d2-0d36-4310-993f-474c7ba5b6da	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 12:45:47.816293+00	
00000000-0000-0000-0000-000000000000	8cc17c08-3e47-4640-bde0-92763e16edcf	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 16:40:44.747366+00	
00000000-0000-0000-0000-000000000000	057c53f8-2695-4e52-a079-a4496a8287f5	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 16:40:44.748998+00	
00000000-0000-0000-0000-000000000000	93e1b549-b01b-4321-9394-a69111855992	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 16:40:44.849414+00	
00000000-0000-0000-0000-000000000000	b3fe0c61-2665-4d3c-99a3-98e7d13afc79	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 19:06:42.499333+00	
00000000-0000-0000-0000-000000000000	a28e8f91-5162-4682-a3a5-401f5479f7f6	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 19:06:42.501302+00	
00000000-0000-0000-0000-000000000000	5a6734ad-1413-4f74-aaed-5bfeff752471	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-04 19:06:42.532298+00	
00000000-0000-0000-0000-000000000000	360898b1-46ef-4448-aa7b-e9b8fbdd83d9	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 03:22:42.010309+00	
00000000-0000-0000-0000-000000000000	6e3f0dc0-1f86-4e75-ac38-d0f26890444f	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 03:22:42.035298+00	
00000000-0000-0000-0000-000000000000	10bc578c-8cbd-46e5-8bdb-ccb3a1459a50	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 03:22:42.086779+00	
00000000-0000-0000-0000-000000000000	64418d2c-2c7b-45a5-b84b-afb2f4559805	{"action":"login","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 03:22:55.717279+00	
00000000-0000-0000-0000-000000000000	e1888d7b-996e-4cd8-9ff6-b85dd5c8ad3c	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 14:29:25.863166+00	
00000000-0000-0000-0000-000000000000	cebe5424-805c-4f07-96be-113617e2e91b	{"action":"token_revoked","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 14:29:25.87604+00	
00000000-0000-0000-0000-000000000000	aa5dfec3-1929-4b91-baa5-c2ea6b1fe67a	{"action":"token_refreshed","actor_id":"9206ec67-5881-403b-b2e3-002927a626b5","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 14:29:26.360604+00	
00000000-0000-0000-0000-000000000000	c3bb4efd-8beb-4dcf-9081-d61477efb6e4	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"9206ec67-5881-403b-b2e3-002927a626b5","user_phone":""}}	2025-04-05 16:24:19.461962+00	
00000000-0000-0000-0000-000000000000	c7f201bf-540a-4183-a2fb-df3f5cfa3274	{"action":"user_signedup","actor_id":"b2f5b547-ff75-4052-bea2-b84b87d53946","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-05 16:25:06.182535+00	
00000000-0000-0000-0000-000000000000	9bf64f73-95b9-42b3-a521-44dc97bddc77	{"action":"login","actor_id":"b2f5b547-ff75-4052-bea2-b84b87d53946","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:25:06.187188+00	
00000000-0000-0000-0000-000000000000	ff24f7bc-43f1-4933-be35-deaf5383b769	{"action":"user_signedup","actor_id":"5e83e324-5ef1-4bc8-b5a8-6a3f7f41f23a","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-05 16:26:45.889709+00	
00000000-0000-0000-0000-000000000000	e9cfca33-49d0-461d-9297-6b3cef837262	{"action":"login","actor_id":"5e83e324-5ef1-4bc8-b5a8-6a3f7f41f23a","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:26:45.896229+00	
00000000-0000-0000-0000-000000000000	bcd2e14e-67a1-42af-8da5-69705ad1f8b4	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"b2f5b547-ff75-4052-bea2-b84b87d53946","user_phone":""}}	2025-04-05 16:39:40.344392+00	
00000000-0000-0000-0000-000000000000	1a8211e3-52c7-4d71-9f49-64a69aa15e06	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom434@gmail.com","user_id":"5e83e324-5ef1-4bc8-b5a8-6a3f7f41f23a","user_phone":""}}	2025-04-05 16:39:40.423483+00	
00000000-0000-0000-0000-000000000000	3ebc0130-855e-477e-88db-56d9d3417a61	{"action":"user_signedup","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-05 16:40:23.389381+00	
00000000-0000-0000-0000-000000000000	c6364dfb-9e94-435a-aefe-1a78e72574eb	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:40:23.394186+00	
00000000-0000-0000-0000-000000000000	bcea66a6-a9f9-44ad-a1b8-3c1a36cba9de	{"action":"user_signedup","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-05 16:40:37.299077+00	
00000000-0000-0000-0000-000000000000	6ab6e8bd-782c-44d3-9df7-e57322511056	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:40:37.303586+00	
00000000-0000-0000-0000-000000000000	b4c46322-2009-47a0-8b9a-5628beafb815	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:42:11.89855+00	
00000000-0000-0000-0000-000000000000	6490fdf0-b52c-4544-9e89-f0bd5384c7a1	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:47:25.745096+00	
00000000-0000-0000-0000-000000000000	998a70dc-2f2c-4df0-8a3e-d8959a56e7ed	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:52:07.268642+00	
00000000-0000-0000-0000-000000000000	3cec1a50-f9c5-4cd6-8656-88cf371c571e	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:54:13.166822+00	
00000000-0000-0000-0000-000000000000	e238ca53-f76c-4e47-b474-2255d5bfea09	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:55:35.292499+00	
00000000-0000-0000-0000-000000000000	d6d47161-542a-4dab-9c1f-13ca108277f0	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:56:09.10555+00	
00000000-0000-0000-0000-000000000000	90a34d55-7246-4500-b098-aa0d9e7789a5	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:58:00.88852+00	
00000000-0000-0000-0000-000000000000	faab34bc-b1a7-462d-b7c8-d89650ace8c6	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:58:06.611182+00	
00000000-0000-0000-0000-000000000000	bd3978b7-dc9c-4ae7-97c1-4ff4876bbb09	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:58:15.542251+00	
00000000-0000-0000-0000-000000000000	d1214047-6d05-462b-bc01-9be23b6dbdb9	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:58:17.979353+00	
00000000-0000-0000-0000-000000000000	a6f1d2dc-6292-48b4-91c8-d22273d8f3fd	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 16:58:20.354834+00	
00000000-0000-0000-0000-000000000000	1f27a849-e156-43c3-94ee-517bc2f10a34	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:06:10.648568+00	
00000000-0000-0000-0000-000000000000	b5efa4cc-3138-4afe-a059-f39de8c9a8ff	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:06:23.707708+00	
00000000-0000-0000-0000-000000000000	c10a3f95-d768-49d5-8015-422173581ee5	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:06:34.75358+00	
00000000-0000-0000-0000-000000000000	323b9dd7-696f-4499-905d-abd0f94ef550	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:06:41.627521+00	
00000000-0000-0000-0000-000000000000	527377ac-265a-49d1-baf0-319af944f041	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:15:10.274326+00	
00000000-0000-0000-0000-000000000000	2fa485e9-033a-495e-a35a-5f92ae330925	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:15:32.91828+00	
00000000-0000-0000-0000-000000000000	74ed14b0-0b13-4636-8a30-a6f16216bb66	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:31:05.723044+00	
00000000-0000-0000-0000-000000000000	ad0b70ae-6f94-46f1-949b-60b9cc5d1be1	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 17:31:10.599022+00	
00000000-0000-0000-0000-000000000000	37427e09-401d-4562-b839-3c7976bf6fe6	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 17:40:30.52173+00	
00000000-0000-0000-0000-000000000000	9a27c0f4-d210-4219-a77e-7f5240227e36	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 17:40:30.52389+00	
00000000-0000-0000-0000-000000000000	cbfce3b5-bad7-48e3-be35-f5261adef68a	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 17:40:30.724765+00	
00000000-0000-0000-0000-000000000000	519815ab-f743-46de-9a53-7c0981e7b767	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 17:40:30.725511+00	
00000000-0000-0000-0000-000000000000	b8eaa981-5664-4f53-be02-192dd13bb875	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:04:39.641134+00	
00000000-0000-0000-0000-000000000000	211a4081-a0ab-4e81-bde2-a07c0be44105	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:04:45.274203+00	
00000000-0000-0000-0000-000000000000	52d1a8d6-a033-4c20-90a6-7f240f31b775	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:30:13.234016+00	
00000000-0000-0000-0000-000000000000	f3c92565-060e-4d1b-827e-cf2c6360507d	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:30:30.190023+00	
00000000-0000-0000-0000-000000000000	03783a14-1dfa-4a1c-97a5-e9112c2884bc	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:30:53.269252+00	
00000000-0000-0000-0000-000000000000	8d017a87-beb1-4811-a96b-b6fa31a98a49	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:32:31.446578+00	
00000000-0000-0000-0000-000000000000	a635cb16-7cc3-4619-848e-62832e5e0dde	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 18:32:48.963102+00	
00000000-0000-0000-0000-000000000000	687148da-9ef6-4404-a025-85fce201d861	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 18:40:24.207627+00	
00000000-0000-0000-0000-000000000000	ebdf9839-ba97-4b21-8c36-46d59111ab18	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 18:40:24.209757+00	
00000000-0000-0000-0000-000000000000	e9980550-bac0-4baa-8d36-c5538042bded	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 18:40:24.527764+00	
00000000-0000-0000-0000-000000000000	3bd0f55c-d2a3-4082-9baa-51be40cd53b9	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 18:40:24.528445+00	
00000000-0000-0000-0000-000000000000	2093e25c-0204-416d-8abc-daadc8409a07	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 19:02:14.8018+00	
00000000-0000-0000-0000-000000000000	f46e544a-aed6-456a-8f64-c42e1f3cb93f	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-05 19:04:19.593486+00	
00000000-0000-0000-0000-000000000000	829c399f-b7d5-40ed-aca5-d7d4f1269fc1	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 19:40:18.109179+00	
00000000-0000-0000-0000-000000000000	581c49d6-c65e-4459-89b4-bce5af8611b1	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 19:40:18.112523+00	
00000000-0000-0000-0000-000000000000	7ed99520-e7d8-4d0c-8e68-2f45708ad17e	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 19:40:18.602402+00	
00000000-0000-0000-0000-000000000000	9008212c-c980-4c2e-8a0a-e81f26d8d853	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-05 19:40:18.603309+00	
00000000-0000-0000-0000-000000000000	515a0725-11a6-495c-a59d-fb0b91e7ee5a	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 01:56:53.085041+00	
00000000-0000-0000-0000-000000000000	1f66cb1b-56e9-48b2-bdf8-faf384abdcb2	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 01:56:53.091738+00	
00000000-0000-0000-0000-000000000000	00b00556-9c28-4d42-ab00-13164be05c24	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 01:56:53.122286+00	
00000000-0000-0000-0000-000000000000	2e950d3c-6053-4875-b32d-8aa0f4f6c6ed	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 01:57:08.451654+00	
00000000-0000-0000-0000-000000000000	6b2e31bc-b138-4194-8c5f-67335d611527	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 02:22:15.09421+00	
00000000-0000-0000-0000-000000000000	86fa67e9-5247-4a2f-ae53-ae906c13beec	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 03:10:46.077461+00	
00000000-0000-0000-0000-000000000000	e66e4f0d-bad6-4f38-b15f-a86b028745bc	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 03:10:46.084061+00	
00000000-0000-0000-0000-000000000000	b7a0a83d-d5cd-46e0-b19e-94561cbcc384	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 03:10:46.114529+00	
00000000-0000-0000-0000-000000000000	3023096e-9a20-4d25-9a6a-3aa954f0aada	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 03:44:00.429689+00	
00000000-0000-0000-0000-000000000000	98abf125-440d-42e7-9f19-11d1aaf1551e	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 03:45:04.443583+00	
00000000-0000-0000-0000-000000000000	8a66ea28-1345-4b55-b1ae-f1aa40270ae4	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 03:50:19.805629+00	
00000000-0000-0000-0000-000000000000	cb69ef84-045c-4d2c-bb8a-c2642ae892ae	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 04:08:28.900627+00	
00000000-0000-0000-0000-000000000000	b4d7c051-3146-480a-8655-e55b784cf3e0	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 04:08:33.008897+00	
00000000-0000-0000-0000-000000000000	2ad48e76-cc58-4339-a246-4909fc694b99	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 04:10:03.812289+00	
00000000-0000-0000-0000-000000000000	908dd419-e524-4c2d-8625-c297ccbea81f	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 04:10:13.476834+00	
00000000-0000-0000-0000-000000000000	4a234083-9717-4390-a752-5aa679b4e346	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 04:13:04.081197+00	
00000000-0000-0000-0000-000000000000	acf11542-701f-4376-8fe5-6bd532c2f30a	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 04:13:06.645559+00	
00000000-0000-0000-0000-000000000000	5b45b05d-f406-4861-9b76-84b314bcf04b	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 04:13:33.111845+00	
00000000-0000-0000-0000-000000000000	61deb218-c170-4baa-9f0c-aa04ee065cc6	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 05:01:37.765226+00	
00000000-0000-0000-0000-000000000000	3bfa756b-27a3-47e6-81a7-d496beb968bc	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 05:01:37.767124+00	
00000000-0000-0000-0000-000000000000	a71f0f5f-f6c4-4e04-84de-35e0f8bfb637	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 05:53:37.043476+00	
00000000-0000-0000-0000-000000000000	b3d50516-d56b-4efc-b642-88b6ebcba797	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 05:53:37.04583+00	
00000000-0000-0000-0000-000000000000	7a2d65ed-d6de-4df0-a898-4446f7febbe7	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 06:08:46.636229+00	
00000000-0000-0000-0000-000000000000	979fc172-a185-4cdf-acfa-3165f41db71e	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 06:15:06.721532+00	
00000000-0000-0000-0000-000000000000	0b4815f6-ea68-494e-a500-4b76550ea970	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 06:16:45.42572+00	
00000000-0000-0000-0000-000000000000	6c5f8a7c-6959-41a6-9534-5db3b953206d	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 06:17:45.008945+00	
00000000-0000-0000-0000-000000000000	7d969cba-1bd8-4996-8b55-deceeb72b205	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 08:13:57.780106+00	
00000000-0000-0000-0000-000000000000	a81101c4-a03e-4eb4-9e6c-1036e5268e42	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 08:14:08.547377+00	
00000000-0000-0000-0000-000000000000	e358a629-c8e0-4c35-996d-75e5bb299447	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 08:14:35.172486+00	
00000000-0000-0000-0000-000000000000	12adbbde-dcf4-4f5b-ac89-12e5686b9ddc	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 08:15:29.310037+00	
00000000-0000-0000-0000-000000000000	5d9e6d76-d16c-45d5-9264-f9ad94e3d581	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 10:18:09.180801+00	
00000000-0000-0000-0000-000000000000	9710c5cd-64fa-4f50-9fd3-ecd4bf1222df	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 10:21:17.349325+00	
00000000-0000-0000-0000-000000000000	b24f4dcf-4040-4572-b3b8-5c4dc7907a4e	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 12:16:11.0238+00	
00000000-0000-0000-0000-000000000000	2884836a-9a04-47c6-a901-b299ff08995b	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 12:16:18.698867+00	
00000000-0000-0000-0000-000000000000	cfd584bf-8ae7-4f16-92c2-733dd2dc9982	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 12:19:05.811647+00	
00000000-0000-0000-0000-000000000000	cd67faf3-ad0e-4aa7-9881-ef72c341367c	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 12:19:09.243228+00	
00000000-0000-0000-0000-000000000000	3014323b-4338-4d37-b77f-76ea34a2414e	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 12:37:45.802807+00	
00000000-0000-0000-0000-000000000000	5b73a010-5408-4ea3-a2bd-0acf110270bc	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:25:48.948707+00	
00000000-0000-0000-0000-000000000000	4bbe8aa9-2e6e-4a95-88fe-929d0397d6ba	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:25:48.952846+00	
00000000-0000-0000-0000-000000000000	3dafcf94-caa0-47d5-ba1f-2cf9028761f7	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:19.386001+00	
00000000-0000-0000-0000-000000000000	4dd7a343-ba9c-4867-a6ad-455f8eb3f462	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:19.388339+00	
00000000-0000-0000-0000-000000000000	e21463a6-fe50-45c2-b726-9ace99e04be4	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:19.489039+00	
00000000-0000-0000-0000-000000000000	fcb8a467-2ab1-4409-b32e-434cc96879cf	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:51.01534+00	
00000000-0000-0000-0000-000000000000	432efe1a-d31a-43e5-a01e-4f85d9dd6094	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:51.016022+00	
00000000-0000-0000-0000-000000000000	21a5fedb-2f40-44b1-a49b-4d72c4e7ec5b	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 13:39:51.478944+00	
00000000-0000-0000-0000-000000000000	dc738101-05bd-4a97-9a4e-57731eb5bceb	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-06 13:43:14.513024+00	
00000000-0000-0000-0000-000000000000	8f917289-afcd-4503-9501-d1825a6fcd37	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-06 13:44:43.583724+00	
00000000-0000-0000-0000-000000000000	ec0d4d81-39e8-45dd-b2f0-5cfd4223e256	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 16:23:53.943604+00	
00000000-0000-0000-0000-000000000000	cebad603-2b4b-4a04-a471-334471e91bfa	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 16:23:53.945874+00	
00000000-0000-0000-0000-000000000000	e2be0981-61fb-48f9-a531-888f2ca23d43	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 16:23:54.386578+00	
00000000-0000-0000-0000-000000000000	e645dc2e-da6f-47c5-ac1f-1f7e7bbacd0f	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 19:05:12.373474+00	
00000000-0000-0000-0000-000000000000	545177d8-a3a6-4afc-933d-c64a0c73b7f9	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 19:05:12.375609+00	
00000000-0000-0000-0000-000000000000	2bcf28c3-40e9-4c7a-b6d1-aeab706b2c12	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-06 19:05:12.599187+00	
00000000-0000-0000-0000-000000000000	2f4b1b41-9810-4b7c-b49f-c206caae1474	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 03:29:27.282063+00	
00000000-0000-0000-0000-000000000000	ce8e0780-9a83-40e4-a8d4-734c21b70bd9	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 03:29:27.299411+00	
00000000-0000-0000-0000-000000000000	38b234be-7985-4990-808f-a3675ceb1479	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 03:29:27.334965+00	
00000000-0000-0000-0000-000000000000	cfb70f5f-c1fc-43dc-92d9-4c76d4415a97	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 03:30:07.881782+00	
00000000-0000-0000-0000-000000000000	b29d46d5-934b-4c8d-ab7d-c81f43b4cec0	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 03:40:28.993984+00	
00000000-0000-0000-0000-000000000000	9a4adb92-6004-4a3a-9ff5-24038e4a7aa2	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 03:40:45.978921+00	
00000000-0000-0000-0000-000000000000	25549ce0-e682-4fd2-a989-496935a6867f	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 07:21:40.652095+00	
00000000-0000-0000-0000-000000000000	cef797f3-d233-4e03-ac83-c11f4564be11	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 07:22:07.990624+00	
00000000-0000-0000-0000-000000000000	c9e67bd9-4530-4188-aaf6-ce9f4142fc88	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 07:22:27.886768+00	
00000000-0000-0000-0000-000000000000	7a33a24f-e545-4b45-be36-c29d4ed6102c	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 08:16:26.814638+00	
00000000-0000-0000-0000-000000000000	623f20f8-10c4-418e-9f8b-50eca2402f9b	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 08:16:26.821652+00	
00000000-0000-0000-0000-000000000000	573e4f29-24a6-4961-968e-2c78f3d1401e	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 08:16:41.673979+00	
00000000-0000-0000-0000-000000000000	196aa2c3-3fe2-418f-87e6-53e54a16a8ef	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 08:52:35.068554+00	
00000000-0000-0000-0000-000000000000	180f5ed4-00fe-4bea-b982-29a8b7999e67	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 08:52:40.191634+00	
00000000-0000-0000-0000-000000000000	b53f33da-a786-42e5-886a-831ffa99c1ac	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 08:53:54.541035+00	
00000000-0000-0000-0000-000000000000	59fb2838-8230-427f-ad52-f0040d6e34bb	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 08:53:59.345683+00	
00000000-0000-0000-0000-000000000000	6b1047d0-add5-4c06-a452-64c25a314738	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 08:55:36.714161+00	
00000000-0000-0000-0000-000000000000	944984e9-353b-4363-83d1-855d37c0f52c	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 08:55:40.222373+00	
00000000-0000-0000-0000-000000000000	271c111a-331b-41e9-bcb7-02345a187ec7	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 08:59:40.959577+00	
00000000-0000-0000-0000-000000000000	fe41809f-bf18-45db-b2c7-b72074797808	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 08:59:45.632887+00	
00000000-0000-0000-0000-000000000000	7866f967-effa-49e4-a400-ad991e7448c8	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 09:03:31.816491+00	
00000000-0000-0000-0000-000000000000	8e98de89-35aa-45e2-bdcd-266a457071a3	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 09:04:25.908063+00	
00000000-0000-0000-0000-000000000000	21cb6d1b-d755-417d-9fc3-f3eecf3173ed	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 09:10:27.56766+00	
00000000-0000-0000-0000-000000000000	f2014cd3-f95c-4942-9aa0-1e4c91660c4f	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 09:10:30.894321+00	
00000000-0000-0000-0000-000000000000	5c1c84d2-50ea-4f8b-a0d5-347cf4588f22	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 09:16:04.599839+00	
00000000-0000-0000-0000-000000000000	630dad4c-b36e-45df-b3f9-ab9ecce18766	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 09:16:23.453542+00	
00000000-0000-0000-0000-000000000000	2f3b023e-6c29-4066-af8f-f02f23a5854b	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 09:38:39.646977+00	
00000000-0000-0000-0000-000000000000	1a97f6f6-867a-4354-a378-086db026a490	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 10:48:14.017052+00	
00000000-0000-0000-0000-000000000000	87ffa3b1-cc91-4a06-9a6e-2aaadda86bad	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 10:48:14.018882+00	
00000000-0000-0000-0000-000000000000	aff89daa-0479-40c2-b824-430b4a9b3773	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 10:48:14.077613+00	
00000000-0000-0000-0000-000000000000	89a897d9-50da-4e4e-a157-9e14de351d9a	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 12:43:48.67651+00	
00000000-0000-0000-0000-000000000000	68ec4a25-7203-4968-bf88-ba6a6924e4d5	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 12:43:48.679275+00	
00000000-0000-0000-0000-000000000000	4bb95536-8135-4dd3-8e36-14a3d0aff544	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 12:43:48.771783+00	
00000000-0000-0000-0000-000000000000	89211d90-98cb-4588-93a5-d7f28f335083	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:44:48.04736+00	
00000000-0000-0000-0000-000000000000	1fd11b33-6961-442e-af27-4e074406a861	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 12:45:21.097002+00	
00000000-0000-0000-0000-000000000000	19dcc2be-26bb-44ec-a52a-1025ab0fe983	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:45:51.222489+00	
00000000-0000-0000-0000-000000000000	b81ede79-c70b-4833-9e50-69ec2215446a	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 12:54:18.590472+00	
00000000-0000-0000-0000-000000000000	fb2a1860-a12a-4166-ae5d-dfffe0f77310	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:54:53.696625+00	
00000000-0000-0000-0000-000000000000	cc3f1603-630c-4f00-bc31-96c0318526f5	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 12:55:27.824301+00	
00000000-0000-0000-0000-000000000000	3f5f3228-6b8d-48a8-8372-180f0f36b233	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:56:52.202898+00	
00000000-0000-0000-0000-000000000000	90e3d2f2-888c-4c02-a293-f01949e66bd7	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 12:57:11.989877+00	
00000000-0000-0000-0000-000000000000	2b6b79cb-90fd-4edc-89b5-808aa42069c3	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:58:21.43496+00	
00000000-0000-0000-0000-000000000000	53114c01-98d4-474b-afea-fd4c2daecea5	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 12:59:22.936101+00	
00000000-0000-0000-0000-000000000000	66a8d488-8af2-4f8e-a5c7-005c34983aeb	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 12:59:58.085035+00	
00000000-0000-0000-0000-000000000000	05db90b1-23a6-4a94-a5fe-5d1e43dbb237	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 13:09:57.256733+00	
00000000-0000-0000-0000-000000000000	8cbf3990-4283-4641-b64d-313faa2b492c	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 13:14:27.878717+00	
00000000-0000-0000-0000-000000000000	429ce976-e578-478a-9bb3-74bf22cdac03	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 13:15:23.415174+00	
00000000-0000-0000-0000-000000000000	9e8a245b-4e88-4d87-bb69-86773e22c379	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 13:15:48.774089+00	
00000000-0000-0000-0000-000000000000	599f6976-78fe-41d9-aa28-8433f5f5c76c	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 13:57:17.677638+00	
00000000-0000-0000-0000-000000000000	d155d638-2f5a-4c0c-8c3b-94227e4da81b	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 13:57:46.81681+00	
00000000-0000-0000-0000-000000000000	be063da4-3ae0-4735-9782-6c969c07e80d	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 13:58:00.154285+00	
00000000-0000-0000-0000-000000000000	a12956c4-2cec-4226-a7a6-bdf50ea1ab93	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 14:28:35.033712+00	
00000000-0000-0000-0000-000000000000	653233cb-f1fe-4b4e-91be-3fd16b67315f	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 14:28:49.566318+00	
00000000-0000-0000-0000-000000000000	afbddcd5-7689-47e7-a7d7-57d5d877db23	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 15:18:11.392158+00	
00000000-0000-0000-0000-000000000000	76dd72f0-d8d3-482c-943e-4b1a2fa8044e	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 15:18:11.395063+00	
00000000-0000-0000-0000-000000000000	9edbda1e-58e4-44bf-b3ee-20ddc25a23f9	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-07 15:19:23.616784+00	
00000000-0000-0000-0000-000000000000	111c87ea-bc59-4742-ba23-53daa680c548	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-07 15:19:44.051141+00	
00000000-0000-0000-0000-000000000000	abcd61de-44e6-4aaf-976d-a9bf5ca7a294	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 15:25:31.381515+00	
00000000-0000-0000-0000-000000000000	88e76a34-9d5d-4796-9b2c-485de025d508	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 15:25:31.383915+00	
00000000-0000-0000-0000-000000000000	ad14a4c1-a738-4048-a3b7-f8da061e7903	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 15:25:31.532906+00	
00000000-0000-0000-0000-000000000000	6875191b-0262-4fc6-a2a6-01f2dbd68cfd	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 16:29:11.302502+00	
00000000-0000-0000-0000-000000000000	c1627e7e-ce6a-4be4-bb4f-f68a8ce8480e	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 16:29:11.306559+00	
00000000-0000-0000-0000-000000000000	126d19c8-0120-48c7-b17f-5477cdd30152	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-07 16:29:11.33801+00	
00000000-0000-0000-0000-000000000000	1f2e3a08-793c-42be-ac55-7e5cff75c40e	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 00:18:26.818175+00	
00000000-0000-0000-0000-000000000000	139a5d4d-d666-4a8b-b8b9-7cecdeb80a79	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 00:18:26.827908+00	
00000000-0000-0000-0000-000000000000	b0dc6fb6-2e5a-47cc-a348-36c7d2b95323	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 00:18:26.873214+00	
00000000-0000-0000-0000-000000000000	b778e397-76f9-4f0c-bf69-f325b8647703	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 01:57:35.657637+00	
00000000-0000-0000-0000-000000000000	013905d2-d7d2-40b5-84fe-c00a1c5e6dc7	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 01:57:35.660594+00	
00000000-0000-0000-0000-000000000000	006b33cd-e4d4-4c03-baa0-d457201def78	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 01:57:35.682846+00	
00000000-0000-0000-0000-000000000000	3822b115-6635-4ad5-9d38-85de08f95f9f	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-08 02:27:36.510587+00	
00000000-0000-0000-0000-000000000000	49902d09-f64b-461c-9f4c-df374a24fad3	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-08 08:59:00.845457+00	
00000000-0000-0000-0000-000000000000	18227ce8-fc84-4fa9-8683-a85550294d61	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-08 09:08:45.987068+00	
00000000-0000-0000-0000-000000000000	5709c54c-2f2e-4aa1-80a4-56b9b029617e	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-08 09:09:22.611583+00	
00000000-0000-0000-0000-000000000000	138b6a14-3722-496e-9737-1882c86f8406	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-08 09:49:34.590805+00	
00000000-0000-0000-0000-000000000000	e3813b58-42cc-467c-a3b7-5f5c6820d45d	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-08 09:50:12.687714+00	
00000000-0000-0000-0000-000000000000	e8b6489f-3ee9-4d99-bf18-16cf1400c2ea	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 11:04:00.690926+00	
00000000-0000-0000-0000-000000000000	af8cb89c-2bb5-4e4a-adf9-73cf39720364	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 11:04:00.69339+00	
00000000-0000-0000-0000-000000000000	0cf1a6d2-ced4-4339-a5b0-e895da4729dc	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 11:04:01.244432+00	
00000000-0000-0000-0000-000000000000	ade12acb-8336-45ff-b275-b02caf42e23c	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 13:35:07.93433+00	
00000000-0000-0000-0000-000000000000	24e2295b-751c-4c65-a027-9d84bb3bf679	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 13:35:07.960025+00	
00000000-0000-0000-0000-000000000000	7f74f96d-f371-4e84-9a98-0cef07336c86	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 13:35:08.021456+00	
00000000-0000-0000-0000-000000000000	30f3e395-8319-4761-8a2b-e27047854c7f	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-08 14:19:41.964393+00	
00000000-0000-0000-0000-000000000000	1ee60a42-1893-4793-84e0-636273187436	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-08 14:28:35.478569+00	
00000000-0000-0000-0000-000000000000	cf5a68d8-ed84-455e-857d-d083caa209aa	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 16:06:59.762372+00	
00000000-0000-0000-0000-000000000000	a555ea5e-3b13-4b33-a7a8-a28cb8439e37	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 16:06:59.766023+00	
00000000-0000-0000-0000-000000000000	76645470-253d-42fb-8816-b70b5818a97c	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-08 16:06:59.86723+00	
00000000-0000-0000-0000-000000000000	90b7782d-5370-4122-9e7a-c55fb4c5dfaf	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 01:07:30.532773+00	
00000000-0000-0000-0000-000000000000	1271e473-156f-441f-aa0c-7597fe078551	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 01:07:30.54483+00	
00000000-0000-0000-0000-000000000000	2b680709-8175-4864-9b50-3e6bcc4aca6e	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 01:07:30.586828+00	
00000000-0000-0000-0000-000000000000	be0e5c48-a025-4992-b695-cb4cd800f8ec	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-09 01:07:35.583591+00	
00000000-0000-0000-0000-000000000000	211c220e-ca02-4841-b4f5-bec64e969049	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 03:48:49.32323+00	
00000000-0000-0000-0000-000000000000	d1fe5015-5e45-423e-bc36-4974086fbb63	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-09 03:50:37.220753+00	
00000000-0000-0000-0000-000000000000	24462c20-e3f8-4068-ad36-d98a55a2e0a5	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 05:20:09.963138+00	
00000000-0000-0000-0000-000000000000	6a46161d-e9c9-4aab-bffd-ff7a3d6adf43	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-09 05:20:39.10448+00	
00000000-0000-0000-0000-000000000000	848440e6-2770-4a36-9e05-5ff50f95bf45	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 12:05:05.884437+00	
00000000-0000-0000-0000-000000000000	ab647e28-9f62-456f-830f-837e5dede4c6	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 16:25:36.928389+00	
00000000-0000-0000-0000-000000000000	3f039c42-f262-46da-93d5-32f3784ed03f	{"action":"user_signedup","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-09 16:53:43.428777+00	
00000000-0000-0000-0000-000000000000	58778c01-3ab4-422d-9da2-deae02dc9c07	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 16:53:43.438907+00	
00000000-0000-0000-0000-000000000000	bbb87af4-9105-40d6-8c29-4ab272a6d712	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 19:21:29.058166+00	
00000000-0000-0000-0000-000000000000	d55a9998-dcce-4ae3-91e5-09a5f8bf9212	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 19:21:29.062778+00	
00000000-0000-0000-0000-000000000000	770f78df-a53f-489a-91e1-3f2b2ff985de	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 19:21:29.159245+00	
00000000-0000-0000-0000-000000000000	46b7c49d-a4a4-4d3e-a4f8-568cd084941a	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 20:24:11.133753+00	
00000000-0000-0000-0000-000000000000	bb5a3b8e-6a69-49a5-a1b3-7e34c1bddf98	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 20:24:11.13705+00	
00000000-0000-0000-0000-000000000000	fa12fa22-40ff-4a44-a049-41e6cec3422f	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-09 20:24:11.586339+00	
00000000-0000-0000-0000-000000000000	038dd096-1cd8-434c-80f5-69e1ccb3bbdf	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-09 20:41:19.264509+00	
00000000-0000-0000-0000-000000000000	f1013223-c998-4417-b8fb-e1b8e5b41afe	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-09 20:41:33.044491+00	
00000000-0000-0000-0000-000000000000	45db71ff-600d-4cea-9f35-50977a7234f8	{"action":"logout","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account"}	2025-04-09 20:41:40.884757+00	
00000000-0000-0000-0000-000000000000	a8c2a5e3-5167-4181-8e80-c84b3073eb27	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 02:16:04.846314+00	
00000000-0000-0000-0000-000000000000	463638fb-fd9e-479c-b5aa-0d92cdb6b2d3	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 02:16:04.873111+00	
00000000-0000-0000-0000-000000000000	6983b6cd-7cfa-4c48-9cfa-8e091e8c4474	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 02:16:04.917301+00	
00000000-0000-0000-0000-000000000000	4cf91818-3a01-4ece-a487-bc1965603c7a	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 02:18:14.602313+00	
00000000-0000-0000-0000-000000000000	7a0b5514-f17b-41f0-9e42-0d0ac57fc638	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 04:01:18.260267+00	
00000000-0000-0000-0000-000000000000	36d51b41-28fc-49fe-926c-65b4682b2426	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 04:05:00.899066+00	
00000000-0000-0000-0000-000000000000	0d86e2d4-97eb-4ba6-9fa5-5870b26a496f	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 04:05:21.729457+00	
00000000-0000-0000-0000-000000000000	0d3e3109-0229-472e-a477-4581005f0d88	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 06:17:01.527063+00	
00000000-0000-0000-0000-000000000000	6e6428b6-b3f8-409b-9600-fdbbf2faf517	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 06:17:01.53901+00	
00000000-0000-0000-0000-000000000000	e51fddb6-c412-415b-8baf-98f7755fe998	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 06:17:02.133135+00	
00000000-0000-0000-0000-000000000000	58d03904-f9d7-4a2c-a578-f0349cb3bcdd	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 07:30:39.270689+00	
00000000-0000-0000-0000-000000000000	d830e07a-604b-4c4a-8102-c100038c625f	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 07:30:39.281267+00	
00000000-0000-0000-0000-000000000000	364f4999-430c-4ba6-a56e-648f285ad11e	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 08:06:57.138094+00	
00000000-0000-0000-0000-000000000000	96d7f604-8ecf-4f09-912d-212c6bbd102f	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 08:09:10.055145+00	
00000000-0000-0000-0000-000000000000	f2d2ede0-ade6-4e01-b68d-5ffe627d29df	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 08:09:23.038134+00	
00000000-0000-0000-0000-000000000000	2992de9a-2021-4a51-b5d2-f4301ee27495	{"action":"logout","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 08:19:08.752316+00	
00000000-0000-0000-0000-000000000000	34e97d0c-a681-41de-b6c9-386260826ca7	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 09:00:31.127268+00	
00000000-0000-0000-0000-000000000000	fdac194d-fc47-4fca-9353-8c1972487f19	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 09:58:14.848477+00	
00000000-0000-0000-0000-000000000000	3d1847e9-56ad-455c-9ba5-756a6abd27b8	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 09:58:14.85101+00	
00000000-0000-0000-0000-000000000000	ee07c786-1951-40f3-9449-9dc91e5eecdb	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 09:58:21.285575+00	
00000000-0000-0000-0000-000000000000	0c9cea09-0930-4a99-b4b7-280bf5f0eef1	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 09:58:36.167393+00	
00000000-0000-0000-0000-000000000000	c415d12b-a438-4d69-a2ce-847288ec62c4	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 11:49:22.618024+00	
00000000-0000-0000-0000-000000000000	0e1cc333-cc64-4636-b0b5-c32ae49e9d27	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 11:49:22.62174+00	
00000000-0000-0000-0000-000000000000	cf035926-ffad-4ea1-aeb2-706b72942f59	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 11:49:34.633695+00	
00000000-0000-0000-0000-000000000000	a94042b5-da06-4962-8a49-6f1360d5d6ec	{"action":"token_refreshed","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 12:34:39.520396+00	
00000000-0000-0000-0000-000000000000	5a1b3a73-be81-4292-abbc-43653ebd45d0	{"action":"token_revoked","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 12:34:39.522054+00	
00000000-0000-0000-0000-000000000000	b3d6fba2-3554-44c3-8885-18c63d2cf3a4	{"action":"token_refreshed","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 12:34:40.488195+00	
00000000-0000-0000-0000-000000000000	c124ea32-58a7-4b1a-8bdf-f7775171279e	{"action":"logout","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 12:34:42.374553+00	
00000000-0000-0000-0000-000000000000	be717d6e-a124-4dfa-a6fb-3dd5d3d12adb	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 12:36:17.423759+00	
00000000-0000-0000-0000-000000000000	4db710c0-e84f-4872-bf26-bb4c4ad42d6c	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 13:52:53.334207+00	
00000000-0000-0000-0000-000000000000	73c3d1f1-373a-487b-a029-066e8395c2c0	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 13:52:53.337249+00	
00000000-0000-0000-0000-000000000000	f09c7a6b-2a5d-4d9c-98e6-b5ab653f92f4	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 13:52:53.61335+00	
00000000-0000-0000-0000-000000000000	44b00b5e-2aba-40d4-a7e8-71254c7c7a85	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 15:03:08.158839+00	
00000000-0000-0000-0000-000000000000	0c90a7b8-4586-4400-9ff4-f512f8a4e00f	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 15:03:08.159855+00	
00000000-0000-0000-0000-000000000000	37991842-1391-491d-88fa-1870b3bbe8fb	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 15:03:27.528429+00	
00000000-0000-0000-0000-000000000000	b0ffa0c3-6de3-439d-9405-bda9819f9993	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 15:51:28.960344+00	
00000000-0000-0000-0000-000000000000	4ea7daf4-e9c5-4984-8971-c1d96ec51b9c	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 15:51:28.962615+00	
00000000-0000-0000-0000-000000000000	083d82c0-a915-495e-a4ab-a9047308fea5	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 16:47:54.005395+00	
00000000-0000-0000-0000-000000000000	3d2ec360-919a-47d7-8fdc-ea78f9a9efb1	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-10 16:47:54.007085+00	
00000000-0000-0000-0000-000000000000	0950a975-5091-4aef-bfec-16506707cda2	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-10 16:48:59.225838+00	
00000000-0000-0000-0000-000000000000	e6cb12ee-e6bd-4d46-bd11-e8653592f3dc	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 16:49:16.045986+00	
00000000-0000-0000-0000-000000000000	7217f583-a170-4e63-919c-702e94c1c40c	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 16:49:19.531522+00	
00000000-0000-0000-0000-000000000000	b75e3cca-d6af-436d-9620-8a302e5d81bc	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-10 16:49:37.679341+00	
00000000-0000-0000-0000-000000000000	1a87d096-3e1a-4bc3-903f-10d171c2d185	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 03:51:43.801117+00	
00000000-0000-0000-0000-000000000000	a9fc9516-a78d-4ebf-a30e-b134bf5d0931	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-11 03:51:49.629911+00	
00000000-0000-0000-0000-000000000000	e2d7f0c7-bf08-45f5-b449-25e85bda1cc7	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 03:52:03.08794+00	
00000000-0000-0000-0000-000000000000	f1fad213-ad50-4b81-9017-96c413ae1463	{"action":"token_refreshed","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 04:04:54.226062+00	
00000000-0000-0000-0000-000000000000	f7e194e9-1379-46f9-a972-fdaf45e414c4	{"action":"token_revoked","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 04:04:54.22869+00	
00000000-0000-0000-0000-000000000000	d78a9457-f395-4698-ada8-2ed184f14130	{"action":"token_refreshed","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 04:04:54.294542+00	
00000000-0000-0000-0000-000000000000	ce4f04e9-08b4-4b86-9453-c1c8f0736921	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 04:06:43.310274+00	
00000000-0000-0000-0000-000000000000	3be2f784-a342-4629-9792-7cf4c9323086	{"action":"logout","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account"}	2025-04-11 04:07:53.830634+00	
00000000-0000-0000-0000-000000000000	cb6fb6a6-7573-42f2-bb3e-90061e33d796	{"action":"login","actor_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","actor_username":"harshal@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 04:08:58.579898+00	
00000000-0000-0000-0000-000000000000	e8c10a1b-c029-403a-af22-a1f33ee777d1	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 04:12:05.438551+00	
00000000-0000-0000-0000-000000000000	b659209d-088d-4ed3-be13-3a6704625e1e	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 04:12:57.56911+00	
00000000-0000-0000-0000-000000000000	6d93a0b1-647d-4baa-91b0-17f7772f97cd	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 04:13:57.047516+00	
00000000-0000-0000-0000-000000000000	ac4f5fca-2dbf-4ef5-afd7-82e9f0b5b15e	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 08:48:52.706421+00	
00000000-0000-0000-0000-000000000000	efe5b75e-5406-4539-b6c5-abad94ba31f0	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 08:48:52.713035+00	
00000000-0000-0000-0000-000000000000	752a55d9-5390-4a0e-a4aa-865cbfabe642	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 08:48:53.057352+00	
00000000-0000-0000-0000-000000000000	b8cb973c-522a-42a5-9682-2aabc5dd4a8a	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-11 08:49:07.519743+00	
00000000-0000-0000-0000-000000000000	e48ccc04-9d93-4f49-a602-4cd7b90cba9e	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 10:55:23.764764+00	
00000000-0000-0000-0000-000000000000	71db78ea-656c-4625-b181-43c7025b4a35	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 10:55:23.768113+00	
00000000-0000-0000-0000-000000000000	4017f71a-175d-4715-be35-2796c0529edc	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 10:55:24.103007+00	
00000000-0000-0000-0000-000000000000	bb7a0a33-b0ad-42a1-9296-9f9b8fcdc3c2	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 13:52:46.02176+00	
00000000-0000-0000-0000-000000000000	eebf0570-8880-4432-bc85-3aec6ab22372	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 13:52:46.024382+00	
00000000-0000-0000-0000-000000000000	ee396c2c-e6d0-4cd1-9732-95d30075200b	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 13:52:46.123953+00	
00000000-0000-0000-0000-000000000000	26efceec-712d-451a-a54b-ad5141c06f67	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 16:37:58.549525+00	
00000000-0000-0000-0000-000000000000	c308644f-cfaa-4f8a-8e46-16ecdd2a069c	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 16:37:58.551522+00	
00000000-0000-0000-0000-000000000000	a0bd0ab1-727e-4a0a-8891-0b8e5e8d907a	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 16:37:58.927524+00	
00000000-0000-0000-0000-000000000000	3dcea505-4317-4f97-affd-1cd5183158db	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 17:26:01.679818+00	
00000000-0000-0000-0000-000000000000	327d6cbc-9e74-41d3-9758-7cce85af5e6d	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 17:26:01.68972+00	
00000000-0000-0000-0000-000000000000	6f0f4833-571f-4588-9578-ac80ecbeab2b	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 18:27:04.947715+00	
00000000-0000-0000-0000-000000000000	0e1f5e7f-d82e-4d2c-9605-b9b68ebc33de	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 18:27:04.949556+00	
00000000-0000-0000-0000-000000000000	21ceb85c-5b27-489c-9703-98e6da27e062	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 18:27:05.031059+00	
00000000-0000-0000-0000-000000000000	e15679b0-55db-426d-a297-d28328d2d565	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 19:15:09.280047+00	
00000000-0000-0000-0000-000000000000	0a92c6a7-24b8-48d1-a711-67a224ecc228	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 19:15:09.282721+00	
00000000-0000-0000-0000-000000000000	88fd8c42-4462-4dc7-a433-64aac0b28388	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 20:03:13.48873+00	
00000000-0000-0000-0000-000000000000	65acf00d-bd9d-447e-848b-ca76b9d3f5f2	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 20:03:13.490326+00	
00000000-0000-0000-0000-000000000000	d84ec5a5-a65f-4476-acd4-f360af28164d	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 20:51:15.237174+00	
00000000-0000-0000-0000-000000000000	e28b7981-075b-40c5-8f57-e8bb0a6c4731	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-11 20:51:15.239377+00	
00000000-0000-0000-0000-000000000000	7ec0b821-6d47-4faa-88c1-6131838ab148	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 02:25:01.841733+00	
00000000-0000-0000-0000-000000000000	72bf68d8-118c-461e-9837-4a00df8adab6	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 02:25:01.843281+00	
00000000-0000-0000-0000-000000000000	f52cde48-7404-4210-9574-91de9f1d18ff	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 02:25:01.996813+00	
00000000-0000-0000-0000-000000000000	890f0f28-0078-4570-ae5f-0967b0c4ead2	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 02:29:05.71901+00	
00000000-0000-0000-0000-000000000000	cf50258f-dee9-4dce-823c-3df3f05e322d	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 02:29:32.402256+00	
00000000-0000-0000-0000-000000000000	59a5a193-0202-4c35-bee6-2a75d0f13ab7	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 03:26:35.66387+00	
00000000-0000-0000-0000-000000000000	e3c9d652-1364-4973-9678-54d6b2e6a06c	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 03:26:35.666526+00	
00000000-0000-0000-0000-000000000000	93c8d203-baf8-4821-8e75-2d6985e6c55f	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 04:14:36.034696+00	
00000000-0000-0000-0000-000000000000	1549238f-eae4-4129-9ed9-54861e099d39	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 04:14:36.038603+00	
00000000-0000-0000-0000-000000000000	9b95c2a2-c8fe-4324-8995-0f6418580336	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 04:32:08.651581+00	
00000000-0000-0000-0000-000000000000	1ef359d9-2d60-4aa9-8ae8-568e2bd0f7d2	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 04:32:24.337487+00	
00000000-0000-0000-0000-000000000000	c8782b72-0a9c-4124-b9bd-8d5b1430ae22	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 04:47:43.581391+00	
00000000-0000-0000-0000-000000000000	925ec074-b6f7-4184-b5e0-3364a4080bc6	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 04:48:06.741899+00	
00000000-0000-0000-0000-000000000000	62cc850b-1938-400e-a754-36c17b9c5296	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 04:50:04.10564+00	
00000000-0000-0000-0000-000000000000	7bf657ff-4fc0-4d7f-ab5f-e9e280fc82e4	{"action":"login","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 04:50:31.553322+00	
00000000-0000-0000-0000-000000000000	3283ff88-2e02-46e0-9687-ba288247a1de	{"action":"token_refreshed","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 05:38:57.505577+00	
00000000-0000-0000-0000-000000000000	f4ad4341-3564-4cc3-a0b0-e408dd951b32	{"action":"token_revoked","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 05:38:57.507224+00	
00000000-0000-0000-0000-000000000000	548543e5-e309-4281-ad7e-314e72269890	{"action":"user_modified","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-04-12 05:42:39.24804+00	
00000000-0000-0000-0000-000000000000	835ff292-826c-4a79-aae8-889cd60a4106	{"action":"logout","actor_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 06:07:42.322236+00	
00000000-0000-0000-0000-000000000000	47d8dde7-d7ef-4041-aa73-b1dc0416f987	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 06:08:00.252997+00	
00000000-0000-0000-0000-000000000000	66e1db41-626a-4217-851c-0dd82fad83c9	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 06:28:49.397248+00	
00000000-0000-0000-0000-000000000000	9362a294-110e-43eb-8d91-08fbccf6936d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom434@gmail.com","user_id":"1fbd10cc-0889-422c-97bb-efe9a1ac3427","user_phone":""}}	2025-04-12 06:32:07.887379+00	
00000000-0000-0000-0000-000000000000	44029824-0b31-412e-8de9-e7628ca3c8da	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom434@gmail.com","user_id":"363ec257-aab1-4114-9040-3eee76fa28b6","user_phone":""}}	2025-04-12 06:32:30.026001+00	
00000000-0000-0000-0000-000000000000	c0d38a88-3b24-4294-931e-e8a605c9ca51	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom434@gmail.com","user_id":"363ec257-aab1-4114-9040-3eee76fa28b6","user_phone":""}}	2025-04-12 06:33:01.139389+00	
00000000-0000-0000-0000-000000000000	ab3f0edd-86c6-4d65-89c4-735b3b9ac409	{"action":"user_signedup","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-12 06:34:33.175109+00	
00000000-0000-0000-0000-000000000000	f78c9127-d5b0-4bd3-bfb2-d099d6ca9347	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 06:34:33.180418+00	
00000000-0000-0000-0000-000000000000	cf376bc5-9f23-4b60-b0b4-3d5f24eae049	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 06:34:46.273842+00	
00000000-0000-0000-0000-000000000000	fa161ade-5ef7-4ceb-afc3-5e2735c94f7a	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 07:16:53.914993+00	
00000000-0000-0000-0000-000000000000	6a308fdb-5a17-42c6-9859-ea5c593362b0	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 07:17:17.002417+00	
00000000-0000-0000-0000-000000000000	a876c588-7b55-4b8d-a3ce-13d4371ec664	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 08:24:00.542404+00	
00000000-0000-0000-0000-000000000000	699b87b9-8f49-450f-944d-218b1e68aaaf	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 08:24:00.554062+00	
00000000-0000-0000-0000-000000000000	4e8697e7-bc91-40b3-bdbd-ea6a33c84743	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 08:24:02.219319+00	
00000000-0000-0000-0000-000000000000	af9af280-575e-4ee9-b05a-e7a4fd29d807	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 09:27:38.644634+00	
00000000-0000-0000-0000-000000000000	c2f26896-81e3-4504-9d95-b63e3d4ebff3	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 09:27:38.649574+00	
00000000-0000-0000-0000-000000000000	ddcc34fd-3036-46e1-aae2-43874b4c66b7	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 09:27:38.694209+00	
00000000-0000-0000-0000-000000000000	68839e45-926b-429c-9652-0293c71af861	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-12 09:27:44.718211+00	
00000000-0000-0000-0000-000000000000	b18a8a19-ebd1-4137-97b9-4f51c52f39ed	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-12 09:27:56.670754+00	
00000000-0000-0000-0000-000000000000	08907dc8-e669-46fb-9c5a-622d0e4c708d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 10:21:22.12027+00	
00000000-0000-0000-0000-000000000000	8ace43c7-ea0b-4143-94ce-42b44e91e997	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 10:21:22.123032+00	
00000000-0000-0000-0000-000000000000	5201be8e-771f-426c-84ba-b7ca16144823	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 11:15:03.550784+00	
00000000-0000-0000-0000-000000000000	35eae284-63dc-4b5c-8727-588eda99c8d0	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 11:15:03.552642+00	
00000000-0000-0000-0000-000000000000	528b8ecf-a0f1-4b8f-b563-e0e5fbe30914	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 12:14:44.94413+00	
00000000-0000-0000-0000-000000000000	514e8812-96ae-42c4-a013-017c6b0eb9c6	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 12:14:44.945741+00	
00000000-0000-0000-0000-000000000000	2b0994f7-623b-4feb-9d65-f8edc869a1e4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 13:19:35.801838+00	
00000000-0000-0000-0000-000000000000	18536eab-31bd-477e-8ffa-5cdce39dbdf2	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 13:19:35.803243+00	
00000000-0000-0000-0000-000000000000	77225116-da2b-48d1-92d7-f41bc9d505f1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 13:19:36.198781+00	
00000000-0000-0000-0000-000000000000	649e1432-546f-49d4-809a-408bf725ba12	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 14:07:37.572415+00	
00000000-0000-0000-0000-000000000000	c984d685-0c90-4582-83bd-2faba44a5275	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 14:07:37.574155+00	
00000000-0000-0000-0000-000000000000	8be3c720-872c-4f9c-88bf-d370bff0b3a9	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 15:53:38.68083+00	
00000000-0000-0000-0000-000000000000	9ac135a0-0f90-4491-89c0-5c960e5a3523	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 15:53:38.685318+00	
00000000-0000-0000-0000-000000000000	62f640b1-ac6e-400a-8f2b-7f92e4fb1fc1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 15:53:38.873662+00	
00000000-0000-0000-0000-000000000000	ea4cd3a6-9264-4b98-aa11-9d073b8815ce	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 18:32:46.328556+00	
00000000-0000-0000-0000-000000000000	391bd15e-de79-408e-81da-ff77a73aa944	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 18:32:46.331597+00	
00000000-0000-0000-0000-000000000000	38f220c8-cc83-474d-a5a8-6e07feef9242	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 18:32:46.582262+00	
00000000-0000-0000-0000-000000000000	c09f14d3-8937-487f-97ed-456f2180f7c4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 19:35:10.838247+00	
00000000-0000-0000-0000-000000000000	7b297150-beda-4a76-a4f4-14f0de9ce105	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 19:35:10.841085+00	
00000000-0000-0000-0000-000000000000	4f267b84-024e-4c21-95e6-d6b3fffc2d1a	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-12 19:35:12.707887+00	
00000000-0000-0000-0000-000000000000	36935183-4a51-4934-8c75-a896a98fc472	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 05:02:23.931577+00	
00000000-0000-0000-0000-000000000000	2680d6bd-7bba-456f-94b2-188f3c5b6cd8	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 05:02:23.944858+00	
00000000-0000-0000-0000-000000000000	280a22de-1029-4012-b807-56ca945ed457	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 05:02:23.980199+00	
00000000-0000-0000-0000-000000000000	cc5c9cd1-535f-46d6-9db8-b3876934960c	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 06:19:03.417454+00	
00000000-0000-0000-0000-000000000000	f9d08c8b-aa29-49ad-b92a-381458a65365	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 06:19:03.425802+00	
00000000-0000-0000-0000-000000000000	48dcf687-22d6-43c6-aea4-1813713eb5f7	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 06:19:05.106936+00	
00000000-0000-0000-0000-000000000000	464d0ebf-8613-4b23-9bd0-235a19394778	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 07:15:33.566256+00	
00000000-0000-0000-0000-000000000000	3cc2a254-ea7e-45dc-9d7c-1ca7dbacc736	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 07:15:33.569028+00	
00000000-0000-0000-0000-000000000000	0deff4e1-393f-4c99-9afa-fd7defe6cda5	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 10:01:18.959797+00	
00000000-0000-0000-0000-000000000000	28df457b-4eca-4156-a6cc-95a41837ee16	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 10:01:18.971397+00	
00000000-0000-0000-0000-000000000000	60795b8a-97bf-4f1a-bb4a-4e521bf89ad8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 10:01:19.002146+00	
00000000-0000-0000-0000-000000000000	424e3a3b-765e-4a43-8c3f-248486110c65	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 12:55:16.625622+00	
00000000-0000-0000-0000-000000000000	1dc702d0-362a-4c11-8755-04d8546aafee	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 12:55:16.643101+00	
00000000-0000-0000-0000-000000000000	6802337d-efe4-40e6-9baf-2fec5a7f9810	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 12:55:16.747037+00	
00000000-0000-0000-0000-000000000000	4e1251f2-e30f-4810-8678-999beef482cc	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 14:13:31.052015+00	
00000000-0000-0000-0000-000000000000	2fb9ba7f-0eb8-4baf-a5fa-8d5c0a1ac065	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 14:13:31.056805+00	
00000000-0000-0000-0000-000000000000	e4e83063-afa6-4bdd-abd1-cf00626579e1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 18:03:31.457582+00	
00000000-0000-0000-0000-000000000000	8b5f31cc-4c5d-4670-9689-6eea1c5934b5	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 18:03:31.460613+00	
00000000-0000-0000-0000-000000000000	feb2b9d2-575f-4ef9-97a6-38ae43863268	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 18:03:31.827007+00	
00000000-0000-0000-0000-000000000000	3b6ce0b8-3cde-4aa1-9264-f0814f8e8588	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 18:51:33.304686+00	
00000000-0000-0000-0000-000000000000	c54c0aa5-14c5-4537-b716-413e528e6d42	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 18:51:33.308265+00	
00000000-0000-0000-0000-000000000000	2769ff12-b1b6-4f25-85ec-961d4bf3b592	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 19:39:33.919312+00	
00000000-0000-0000-0000-000000000000	c13c0ccf-6756-487d-a471-4709d75df41a	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 19:39:33.921683+00	
00000000-0000-0000-0000-000000000000	105fd146-b168-428c-9d21-dfec4f36d044	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 20:27:36.528465+00	
00000000-0000-0000-0000-000000000000	7df8b014-ee2e-4082-9044-f077a273d8a3	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 20:27:36.533593+00	
00000000-0000-0000-0000-000000000000	b61b5a63-c5fb-4104-b016-05cad5c2f307	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 21:18:38.09785+00	
00000000-0000-0000-0000-000000000000	09dfba88-d505-47c2-ac71-039eb29e48ef	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 21:18:38.098863+00	
00000000-0000-0000-0000-000000000000	996aed39-4b33-4a0e-b0b5-b457cbd8970a	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 22:19:23.685718+00	
00000000-0000-0000-0000-000000000000	61d5fe69-f9b9-49b1-bf21-c10568fef347	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-13 22:19:23.68755+00	
00000000-0000-0000-0000-000000000000	fb779b3b-e83c-4fd9-9f52-4c184894c242	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 03:11:30.158616+00	
00000000-0000-0000-0000-000000000000	41f89b44-62c3-489b-9f61-8048932c5024	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 03:11:30.169232+00	
00000000-0000-0000-0000-000000000000	98d29ac3-463e-459e-9f54-fe3719907d10	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 03:11:32.061321+00	
00000000-0000-0000-0000-000000000000	a1c71a48-aa90-473c-b112-c502256bc3ea	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 04:11:10.636029+00	
00000000-0000-0000-0000-000000000000	fe470102-2856-4740-a563-b91cbee7c31e	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 04:11:10.641823+00	
00000000-0000-0000-0000-000000000000	e78a636b-9f49-4af2-ba38-c63aa389f316	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 04:37:07.047002+00	
00000000-0000-0000-0000-000000000000	c26df256-db0d-4481-8537-78825436c788	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 04:37:27.691181+00	
00000000-0000-0000-0000-000000000000	2241c393-23dc-46cd-8d46-868946859f8c	{"action":"token_refreshed","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 05:57:37.882158+00	
00000000-0000-0000-0000-000000000000	32447d60-25e9-42d3-8043-a1e7b9da9365	{"action":"token_revoked","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 05:57:37.885372+00	
00000000-0000-0000-0000-000000000000	2675c589-e802-455f-b3d8-a17980f0b580	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 05:57:46.098142+00	
00000000-0000-0000-0000-000000000000	38994ddf-7aa5-444d-98da-43dd29115f6c	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 05:57:56.551394+00	
00000000-0000-0000-0000-000000000000	0b8dd6c5-cf36-41c8-bc3a-582d9dfe8b4c	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 06:56:58.441761+00	
00000000-0000-0000-0000-000000000000	589d2e9e-5e87-486b-b1c1-24dba88ff20b	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 06:56:58.450957+00	
00000000-0000-0000-0000-000000000000	38d90539-c2aa-4056-9faf-023c673ee9a5	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 07:44:59.77958+00	
00000000-0000-0000-0000-000000000000	5bcbd911-3c8d-4ae5-aae4-7f5bc309d994	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 07:44:59.784788+00	
00000000-0000-0000-0000-000000000000	e41dd113-d731-40ed-8fcd-e62d872db7aa	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 08:33:00.843837+00	
00000000-0000-0000-0000-000000000000	322e6d9a-0f29-47c0-8f44-2fd3e77b8a87	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 08:33:00.860737+00	
00000000-0000-0000-0000-000000000000	3f3c22a3-791c-49ff-b669-b46829120c61	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 09:28:42.548341+00	
00000000-0000-0000-0000-000000000000	c0bc3656-e807-4ea3-ae58-cfb396ddb059	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 09:28:42.563516+00	
00000000-0000-0000-0000-000000000000	a774db74-860d-4b8c-81db-b854276e5fee	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 10:00:46.822442+00	
00000000-0000-0000-0000-000000000000	f9a15f20-006c-4626-aa82-fcc9ef4c82f6	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 10:00:49.131742+00	
00000000-0000-0000-0000-000000000000	e0ed037f-09cd-4666-984e-799b25e079ec	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 10:48:52.506566+00	
00000000-0000-0000-0000-000000000000	32bfd67f-feda-4ecf-879d-18007dd8d12a	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 10:48:52.510196+00	
00000000-0000-0000-0000-000000000000	1087ffe4-e4ce-40b2-be26-1ff3f76c48fe	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 11:07:52.451207+00	
00000000-0000-0000-0000-000000000000	f6a8a34b-0d9b-410a-9a14-7b52844a1da4	{"action":"user_signedup","actor_id":"3ef868e6-e426-4a81-a5c4-f0c03c701fc2","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-14 11:09:13.59466+00	
00000000-0000-0000-0000-000000000000	cb3f65cb-319c-4b57-85f2-0d6e4a139de5	{"action":"login","actor_id":"3ef868e6-e426-4a81-a5c4-f0c03c701fc2","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:09:13.603204+00	
00000000-0000-0000-0000-000000000000	4b01fc64-8f23-4b54-a13c-39dc693462b8	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cp0705@gmail.com","user_id":"3ef868e6-e426-4a81-a5c4-f0c03c701fc2","user_phone":""}}	2025-04-14 11:10:30.259109+00	
00000000-0000-0000-0000-000000000000	b438ff28-6d80-4952-8818-8ab11d6252d4	{"action":"user_signedup","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-14 11:11:16.157707+00	
00000000-0000-0000-0000-000000000000	44f590b6-c5fa-43c4-9aa3-2e5ca7d8f2f8	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:11:16.163728+00	
00000000-0000-0000-0000-000000000000	d0874a24-2dee-4689-abd5-0fe97726c8eb	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:23:21.713783+00	
00000000-0000-0000-0000-000000000000	17e2cdb4-d50c-4156-9c22-bf8c2ed6dfc3	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 11:33:14.1938+00	
00000000-0000-0000-0000-000000000000	ccfd41c2-1c4d-4afe-98fc-7f7bed631b93	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:33:57.857483+00	
00000000-0000-0000-0000-000000000000	bc2fae2d-aeae-4485-916d-b010070181de	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:49:10.168562+00	
00000000-0000-0000-0000-000000000000	682a9a76-ad5f-471e-86d1-3bd819d9f5bf	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 11:56:44.837161+00	
00000000-0000-0000-0000-000000000000	bdabe938-3e1b-4a66-9110-314e6b41d953	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 11:57:06.482529+00	
00000000-0000-0000-0000-000000000000	4d31c73f-3b26-49d7-aa94-2e84d6cbd261	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 12:36:19.224279+00	
00000000-0000-0000-0000-000000000000	b34a7e13-5bed-49cf-8f49-51ac7714d21a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:01:08.224315+00	
00000000-0000-0000-0000-000000000000	92ee8f83-45fc-4646-8648-ce7bad7dc480	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:01:19.77958+00	
00000000-0000-0000-0000-000000000000	78957ff9-9246-42e6-8dde-ae879774359c	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:02:36.050898+00	
00000000-0000-0000-0000-000000000000	93eee1e5-2542-4d59-9260-9735f4582657	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:02:53.082425+00	
00000000-0000-0000-0000-000000000000	c1d5a1cf-efaf-4132-95f3-ee9366735ffc	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 13:05:46.966356+00	
00000000-0000-0000-0000-000000000000	44ec2a2a-bef3-448e-bfed-b614456436c9	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:06:06.02077+00	
00000000-0000-0000-0000-000000000000	a29dbc45-e639-47e0-828c-41520a75a2db	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 13:18:05.755164+00	
00000000-0000-0000-0000-000000000000	2fc36d3f-4c4d-42cc-ab3f-3695feb57303	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:18:28.368341+00	
00000000-0000-0000-0000-000000000000	c58d73a9-4176-46c5-ab7b-1c7bd8b9b7be	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 13:22:22.269029+00	
00000000-0000-0000-0000-000000000000	428ebbbb-806b-46e9-af43-9263a052eead	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:22:39.540924+00	
00000000-0000-0000-0000-000000000000	c27c6e84-dac5-4c78-9297-c6d647d14dae	{"action":"logout","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 13:24:13.111554+00	
00000000-0000-0000-0000-000000000000	dcb97291-a72b-4466-b907-48b62cae7dac	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 13:24:44.304875+00	
00000000-0000-0000-0000-000000000000	43fe463a-e50b-484c-b957-d1e51a674366	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 14:28:04.490421+00	
00000000-0000-0000-0000-000000000000	ac7ed209-0d3f-4311-8ef1-3a8033a85f5c	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 14:28:04.494344+00	
00000000-0000-0000-0000-000000000000	2ad4333b-c4a6-4d1c-b3f8-82f23a4ce005	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 14:28:05.081976+00	
00000000-0000-0000-0000-000000000000	0035d14e-3834-4dd7-961b-321b124be453	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 14:38:27.121442+00	
00000000-0000-0000-0000-000000000000	6ea0f50a-649b-4d68-9858-7e685f0638da	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 14:38:39.620972+00	
00000000-0000-0000-0000-000000000000	22c0663d-d730-4600-8bde-15bc2253c9a9	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 15:26:40.751243+00	
00000000-0000-0000-0000-000000000000	f9edf8c8-38dc-4158-b0bf-a33a979a119a	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 15:26:40.754867+00	
00000000-0000-0000-0000-000000000000	bf054eea-d8bd-43ec-a237-049fe328815f	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 16:15:30.939791+00	
00000000-0000-0000-0000-000000000000	8eb1b989-fc69-4f7f-9ee1-6aa62d6aafbf	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 16:15:30.943713+00	
00000000-0000-0000-0000-000000000000	25a1ad50-fb59-4413-8cc6-801b6ddf96f7	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 17:32:45.951744+00	
00000000-0000-0000-0000-000000000000	c8b9ebed-5015-4c54-90bb-17a80f577377	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 17:32:45.954976+00	
00000000-0000-0000-0000-000000000000	36d41907-9266-4e89-a14e-dda97bfd3f75	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 17:32:46.419868+00	
00000000-0000-0000-0000-000000000000	ab480023-c36a-401c-b744-9284be9b83b0	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 18:21:28.639375+00	
00000000-0000-0000-0000-000000000000	71cd2c25-8e80-48bf-81f3-9ffa52408cab	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 18:21:28.645912+00	
00000000-0000-0000-0000-000000000000	1366b7e4-92c5-45b1-b673-d3ac5775cef6	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 19:20:58.726424+00	
00000000-0000-0000-0000-000000000000	62617814-111a-4642-b75d-a5a4228b48e1	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 19:20:58.72921+00	
00000000-0000-0000-0000-000000000000	da4c04c1-bc55-4535-bcdc-32c5796bbd32	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 20:18:38.549711+00	
00000000-0000-0000-0000-000000000000	a34c1cbe-efcb-4417-bce7-74f87fb922f3	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 20:18:38.552111+00	
00000000-0000-0000-0000-000000000000	46c25b16-2597-437f-8a09-3bb085c5b363	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 21:56:23.141254+00	
00000000-0000-0000-0000-000000000000	dfbf8906-e663-4b6b-ad93-2ff39b152af3	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 21:56:23.145458+00	
00000000-0000-0000-0000-000000000000	b31d026e-722a-49bf-ab4a-42abe67a7fe8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-14 21:56:23.167804+00	
00000000-0000-0000-0000-000000000000	78970031-b50b-40d1-9958-f571874f6a99	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-14 22:00:48.359993+00	
00000000-0000-0000-0000-000000000000	ee29a5b9-dded-4ec5-abc5-f18967e9fe64	{"action":"user_signedup","actor_id":"f4168d81-a87f-4761-ac33-7c910663cef1","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-14 22:16:40.788982+00	
00000000-0000-0000-0000-000000000000	10211749-90a1-466a-8605-4a4b2cd9908b	{"action":"login","actor_id":"f4168d81-a87f-4761-ac33-7c910663cef1","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 22:16:40.798771+00	
00000000-0000-0000-0000-000000000000	a7f812cb-66c8-4228-a926-6695ef1d7649	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"belllaciao1234@gmail.com","user_id":"f4168d81-a87f-4761-ac33-7c910663cef1","user_phone":""}}	2025-04-14 22:18:26.464843+00	
00000000-0000-0000-0000-000000000000	befcb42b-2e6e-4206-bd78-0f1de9723b14	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 22:28:37.186904+00	
00000000-0000-0000-0000-000000000000	ac0dbce9-f5ab-4a2e-9dbf-719835dc6443	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 22:28:50.431817+00	
00000000-0000-0000-0000-000000000000	c4adc183-530b-4c1e-a6b9-8c87df43c666	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-14 22:29:13.081662+00	
00000000-0000-0000-0000-000000000000	515096df-f166-4ad2-be73-e9c8c09bb061	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 02:38:24.385615+00	
00000000-0000-0000-0000-000000000000	9f48ef44-ce2c-444d-b839-8956a2912f7b	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 02:38:24.400641+00	
00000000-0000-0000-0000-000000000000	4353e307-c0bc-4e4c-b18c-b70f7bbce281	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 02:38:24.459084+00	
00000000-0000-0000-0000-000000000000	eb5c3d71-f55d-48a0-b8ce-5ac93bdbdb7e	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 02:38:33.001943+00	
00000000-0000-0000-0000-000000000000	bebcdffd-fc04-40e2-8723-4d62e4bf056c	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 02:38:44.675459+00	
00000000-0000-0000-0000-000000000000	27930dc9-2db6-4ce1-8584-80726db530cd	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 02:41:15.57224+00	
00000000-0000-0000-0000-000000000000	97c686e4-db71-490e-b9c0-7ea1825fd558	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 02:48:07.332213+00	
00000000-0000-0000-0000-000000000000	8c2c67a9-914c-4edc-b23f-2712f18b21e5	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 02:48:19.39111+00	
00000000-0000-0000-0000-000000000000	74e4fde0-e10d-4874-91d8-bb8846d08e75	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 02:58:12.826367+00	
00000000-0000-0000-0000-000000000000	bc5d5608-4014-41ff-8755-ec2a66584d89	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 02:58:37.095212+00	
00000000-0000-0000-0000-000000000000	11a8519d-f145-491b-8de3-62f1a39bad62	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 03:00:38.240279+00	
00000000-0000-0000-0000-000000000000	79d3dea2-8a23-4452-acc2-87536646cb63	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 03:01:16.757477+00	
00000000-0000-0000-0000-000000000000	82e7d324-1203-4947-ac52-3e3063904547	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 03:49:57.820693+00	
00000000-0000-0000-0000-000000000000	4bdac62e-1f6f-4249-b1d7-9fb449048d15	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 03:49:57.822849+00	
00000000-0000-0000-0000-000000000000	992f96bf-4c2b-4ff5-9d2e-e72d719308fa	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 04:41:11.936272+00	
00000000-0000-0000-0000-000000000000	a745bb07-b0c3-49c8-9101-3fae6476a72b	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 04:41:11.940072+00	
00000000-0000-0000-0000-000000000000	2e9b9bb3-5e4b-483e-9208-ead170a16359	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 04:41:20.826764+00	
00000000-0000-0000-0000-000000000000	61e13894-5f94-4f2b-b6c9-4f3b4bfc36c8	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 04:41:33.722994+00	
00000000-0000-0000-0000-000000000000	51b5fdf7-fc64-4215-a4e5-c3944869cc75	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 10:32:23.489528+00	
00000000-0000-0000-0000-000000000000	1493a417-5b4c-4dfd-aed2-d098b6593f22	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 10:32:23.504163+00	
00000000-0000-0000-0000-000000000000	2ecd2426-4eab-486a-997f-a18ed5a450cb	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 10:32:23.753471+00	
00000000-0000-0000-0000-000000000000	69e608a4-1132-4d52-84b1-f406d1e599b8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 11:27:12.187521+00	
00000000-0000-0000-0000-000000000000	e860571f-e3d7-4389-a46f-d6513935efce	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 11:27:12.19632+00	
00000000-0000-0000-0000-000000000000	8469447a-dfc6-4e06-abb9-37475dddcbd5	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 12:23:26.34577+00	
00000000-0000-0000-0000-000000000000	cb45ffe7-6c34-4e94-abc2-b7c487218d6f	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 12:23:26.350728+00	
00000000-0000-0000-0000-000000000000	3e27af39-dc61-4879-9523-ddd7e969d146	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 13:11:34.210471+00	
00000000-0000-0000-0000-000000000000	6772d562-bfe9-4876-a8e4-3d3fb693cef3	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 13:11:34.213128+00	
00000000-0000-0000-0000-000000000000	7548f91e-f4ef-4cbf-8f38-343f791af0fe	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:03.845404+00	
00000000-0000-0000-0000-000000000000	d28c37fa-74ac-40eb-8804-5c580b9cd5ea	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:03.849143+00	
00000000-0000-0000-0000-000000000000	d2ec8e8f-b218-45e0-8877-b8de4f2d91f5	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:04.027955+00	
00000000-0000-0000-0000-000000000000	f694aeaf-6637-4f42-b676-0b3e61040cae	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:13.555042+00	
00000000-0000-0000-0000-000000000000	8d8e5ddb-9b70-4391-bc1d-c9cc07a7fabb	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:14.109704+00	
00000000-0000-0000-0000-000000000000	e541aeb2-46f5-4a7e-aa2c-c65e3860c66a	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 15:42:14.413762+00	
00000000-0000-0000-0000-000000000000	60499a62-07ae-44e6-8cad-92a18f1382a1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 17:15:10.784715+00	
00000000-0000-0000-0000-000000000000	27850a3c-1f41-4dd1-a1cb-16668f62f7fb	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 17:15:10.786959+00	
00000000-0000-0000-0000-000000000000	a125475d-c26a-481a-bf7c-53ba66aef1c8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 18:03:41.786564+00	
00000000-0000-0000-0000-000000000000	3df5feeb-2d89-4a95-8ae9-56ecbfc6262f	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 18:03:41.790339+00	
00000000-0000-0000-0000-000000000000	444b2a30-7c19-47ca-881e-80cd2347c8b9	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 18:04:00.8718+00	
00000000-0000-0000-0000-000000000000	0d2e557e-f1ab-4680-9486-20b134e516df	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 18:05:22.601027+00	
00000000-0000-0000-0000-000000000000	62594579-f33c-44be-a043-11a5bcb0e6fa	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 18:06:36.2351+00	
00000000-0000-0000-0000-000000000000	81a29a21-2e26-497d-a2bf-c507e678f905	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 18:07:03.175755+00	
00000000-0000-0000-0000-000000000000	7363e5d5-a84e-462f-b624-42d374cb53f8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 18:52:01.367496+00	
00000000-0000-0000-0000-000000000000	e2201926-a550-4e71-92e0-60a3d67d5736	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 18:52:01.372454+00	
00000000-0000-0000-0000-000000000000	0c09804b-8fab-4aa4-ae26-dbf9de964c6c	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 19:41:09.696344+00	
00000000-0000-0000-0000-000000000000	9004b390-1bd3-4bf3-8236-55574e93f450	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 19:41:09.699915+00	
00000000-0000-0000-0000-000000000000	8eb424d1-a324-47ca-b557-b1a5310afef6	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 20:34:06.359747+00	
00000000-0000-0000-0000-000000000000	749076b8-af99-4ed5-b5b3-d6c750afac99	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 20:34:06.362799+00	
00000000-0000-0000-0000-000000000000	3b86a8cc-e9e1-4933-8614-7879a1d53967	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 21:18:26.680515+00	
00000000-0000-0000-0000-000000000000	1e3906b1-807b-4f8e-9fc9-1fea3374fb7c	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 21:18:26.68222+00	
00000000-0000-0000-0000-000000000000	662d894e-1fdc-4868-b9b7-183bc4946f67	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 21:18:26.735236+00	
00000000-0000-0000-0000-000000000000	d2dd0b52-f1bf-45f2-892d-563d6e26ec77	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 21:18:35.560243+00	
00000000-0000-0000-0000-000000000000	3ff46df3-1f3b-4291-bc72-e90354e79e01	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 21:22:52.484631+00	
00000000-0000-0000-0000-000000000000	46c70e0d-f183-475c-9ddc-c5a122ae5ac5	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 21:22:52.487824+00	
00000000-0000-0000-0000-000000000000	ac12be04-07fe-4ea0-a4b1-73df1fbb6069	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-15 21:31:37.756555+00	
00000000-0000-0000-0000-000000000000	ff9ee729-d8a5-4b5d-a9f7-b12fb2369198	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-15 22:11:13.519656+00	
00000000-0000-0000-0000-000000000000	b5b8e91a-a80b-4974-876c-a903f969567e	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 23:19:14.990472+00	
00000000-0000-0000-0000-000000000000	b2669573-75f8-447d-a01e-7e0acbc58aac	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-15 23:19:14.99731+00	
00000000-0000-0000-0000-000000000000	dcb04258-8199-4a4a-8636-71f554857454	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 00:26:27.229137+00	
00000000-0000-0000-0000-000000000000	fb0aae82-f8cd-4b0d-a20b-18aa3f00cb38	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 00:26:27.238778+00	
00000000-0000-0000-0000-000000000000	34cfc5b8-19ab-4fa1-aa69-9980d80530b3	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 00:26:27.282045+00	
00000000-0000-0000-0000-000000000000	38b3c4d1-d281-4171-a42d-76592039a5cb	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 02:40:04.948566+00	
00000000-0000-0000-0000-000000000000	21a97af7-a25b-4e3c-a0ec-532d0d2dfeb1	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 02:40:04.954718+00	
00000000-0000-0000-0000-000000000000	c0317278-ca91-433e-8503-d2310a53b1c4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 02:40:05.228367+00	
00000000-0000-0000-0000-000000000000	e8911f78-f21d-41d4-b8d2-16aaaf633755	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 03:32:56.088902+00	
00000000-0000-0000-0000-000000000000	c661f15b-052b-4405-a6aa-1a7ea6f8ade8	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 03:32:56.092+00	
00000000-0000-0000-0000-000000000000	6ac4e992-2b3c-4fbd-a84c-defd148b900d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 04:32:39.796094+00	
00000000-0000-0000-0000-000000000000	7367ff41-cb07-481e-b6c4-6bdff19c3156	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 04:32:39.799799+00	
00000000-0000-0000-0000-000000000000	227cfeca-95ff-4353-bf1a-6edc79732f02	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 08:39:12.87561+00	
00000000-0000-0000-0000-000000000000	8956cf9d-e587-4345-a2ff-ba0d59077adb	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 08:39:12.888698+00	
00000000-0000-0000-0000-000000000000	bc39985b-84b3-4413-9a0f-effc75f2699f	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 08:39:13.32536+00	
00000000-0000-0000-0000-000000000000	86123e96-c8ba-4445-a687-fbab2aae6ecb	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 14:33:33.591413+00	
00000000-0000-0000-0000-000000000000	576a4e93-d19a-4643-b965-4fe9dc6abadf	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 14:33:33.604875+00	
00000000-0000-0000-0000-000000000000	4ddce582-6bc0-4a2d-888c-09967b615352	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 14:33:33.654141+00	
00000000-0000-0000-0000-000000000000	835e5d48-3144-4478-a2ba-da5300635e8e	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-16 14:33:37.539719+00	
00000000-0000-0000-0000-000000000000	86c2b4a1-edcf-447e-8514-3af1a78fd8ff	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 14:36:01.694547+00	
00000000-0000-0000-0000-000000000000	63ce4666-b135-435f-916d-dd5fcfab9c5b	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-16 14:44:58.8385+00	
00000000-0000-0000-0000-000000000000	40300c6d-7403-440e-8513-3f899a804cbe	{"action":"user_signedup","actor_id":"d1647eff-70dc-42b6-aa72-130c533592dc","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-16 14:50:01.790552+00	
00000000-0000-0000-0000-000000000000	944290ec-ae98-4c16-bac9-0c6366ed9df4	{"action":"login","actor_id":"d1647eff-70dc-42b6-aa72-130c533592dc","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 14:50:01.801246+00	
00000000-0000-0000-0000-000000000000	4e2abd3e-3817-4f2d-8a54-2a2bace9d717	{"action":"user_repeated_signup","actor_id":"d1647eff-70dc-42b6-aa72-130c533592dc","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-04-16 14:51:46.62741+00	
00000000-0000-0000-0000-000000000000	776466bd-ce38-433d-bdb4-7c0b9c9316ca	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"omp349242@gmail.com","user_id":"d1647eff-70dc-42b6-aa72-130c533592dc","user_phone":""}}	2025-04-16 14:54:00.946489+00	
00000000-0000-0000-0000-000000000000	e5206964-a308-4c62-af19-e7d4fcebf2fc	{"action":"user_signedup","actor_id":"76c6a74b-fed7-41c2-b7e9-ae327ae25671","actor_username":"vipulpatil2580@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-16 15:00:42.797264+00	
00000000-0000-0000-0000-000000000000	5455960e-0507-4318-a3cd-c43b554cca62	{"action":"login","actor_id":"76c6a74b-fed7-41c2-b7e9-ae327ae25671","actor_username":"vipulpatil2580@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 15:00:42.805352+00	
00000000-0000-0000-0000-000000000000	316c9e4b-a37d-478c-8054-be29c77cab77	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 15:01:19.953381+00	
00000000-0000-0000-0000-000000000000	0b1d3081-f930-4d60-bba7-493815d4ca95	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-16 15:02:55.507363+00	
00000000-0000-0000-0000-000000000000	deb61791-70a3-4f73-8ea6-75635ed43c21	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 15:03:18.304515+00	
00000000-0000-0000-0000-000000000000	4edbdcb4-a498-496c-9e49-fc9b9de14abe	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-16 15:20:41.602272+00	
00000000-0000-0000-0000-000000000000	99dcbe6c-d165-4893-b8ee-531f732302b5	{"action":"user_signedup","actor_id":"2763082c-881e-498d-b3cd-771432f0c053","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-04-16 15:40:35.770974+00	
00000000-0000-0000-0000-000000000000	b395cdc6-6478-4cd5-a298-7f3e7ecaecf3	{"action":"login","actor_id":"2763082c-881e-498d-b3cd-771432f0c053","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 15:40:35.779332+00	
00000000-0000-0000-0000-000000000000	99507182-b542-412a-9fd6-bf13ca777efe	{"action":"login","actor_id":"2763082c-881e-498d-b3cd-771432f0c053","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 16:03:16.617578+00	
00000000-0000-0000-0000-000000000000	df365351-a1a6-412d-ae6c-c179378e27d3	{"action":"logout","actor_id":"2763082c-881e-498d-b3cd-771432f0c053","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-16 16:03:35.638301+00	
00000000-0000-0000-0000-000000000000	409b5443-e7f9-4355-adaf-f7b851b1df00	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 16:35:56.995917+00	
00000000-0000-0000-0000-000000000000	bb266565-4f91-4b14-930a-ad9472a13b9f	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-16 17:06:51.650885+00	
00000000-0000-0000-0000-000000000000	f66899ce-fb6a-49f5-bae5-1b5800389166	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 21:06:11.837911+00	
00000000-0000-0000-0000-000000000000	316d3c68-7947-4d3c-952a-afeddff92c52	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 21:06:11.845012+00	
00000000-0000-0000-0000-000000000000	929f4b9f-76ef-48b6-90ff-cbd1c4ed097f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-16 21:06:12.081087+00	
00000000-0000-0000-0000-000000000000	871ce2f3-2d21-4b4d-be1d-3b7731c8a2e0	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-17 17:41:24.228746+00	
00000000-0000-0000-0000-000000000000	c4a1d210-cda4-4c2f-bdc5-ecc949a37a67	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-17 17:41:24.253124+00	
00000000-0000-0000-0000-000000000000	0eec50f1-3b33-4a24-a00e-75ba1bdc06d3	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-17 17:41:24.327746+00	
00000000-0000-0000-0000-000000000000	c3bf7884-76e1-4370-ae32-6f8b2aa71c40	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-18 10:21:26.248649+00	
00000000-0000-0000-0000-000000000000	187f9603-6f26-4c09-83b2-dd006db6b1d9	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-18 10:21:26.274782+00	
00000000-0000-0000-0000-000000000000	d06f81eb-50fb-4fda-9ad1-a2e70304bc20	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-18 10:21:26.5093+00	
00000000-0000-0000-0000-000000000000	ff093b03-f69f-41ad-9c7d-61e3355fd475	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-18 10:23:39.54344+00	
00000000-0000-0000-0000-000000000000	765e181e-ac18-41c0-a1cf-8b7d0e7c1a22	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-18 13:02:55.505117+00	
00000000-0000-0000-0000-000000000000	e78b1dfd-0d2e-48cb-bc83-987dac048c3d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 04:43:48.132853+00	
00000000-0000-0000-0000-000000000000	d8ff69c2-591a-46ef-9d08-577e9776b3fc	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 04:43:48.153744+00	
00000000-0000-0000-0000-000000000000	8f78035d-ee6f-4e45-992b-7a03eb81b828	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 04:43:48.300358+00	
00000000-0000-0000-0000-000000000000	78e29303-b8cf-40cf-8069-f657b1017df1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 05:49:09.601888+00	
00000000-0000-0000-0000-000000000000	8b7225b4-0815-4842-baa3-a06e3c88343d	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 05:49:09.605071+00	
00000000-0000-0000-0000-000000000000	3f24a95e-09fd-4031-869a-58247be8794d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-19 05:49:09.721564+00	
00000000-0000-0000-0000-000000000000	f9ec80f9-2e97-46c7-aa24-90a2105594c0	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-20 04:24:24.232735+00	
00000000-0000-0000-0000-000000000000	5bf7f6dc-ebb5-45f3-98d0-7aa416ae6e90	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-20 04:24:24.251928+00	
00000000-0000-0000-0000-000000000000	ba3b2281-ae28-42e5-a155-c2867d46dcb6	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-20 04:24:24.304589+00	
00000000-0000-0000-0000-000000000000	156af1a9-331c-4abf-8ef7-083c651c79e0	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-21 15:30:10.619106+00	
00000000-0000-0000-0000-000000000000	b9cb8843-056a-4d05-8ed8-4c90741f27a0	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-21 15:30:10.653179+00	
00000000-0000-0000-0000-000000000000	89b5cd24-885e-4f9f-81a7-d7195bcb1e21	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-21 15:30:10.730101+00	
00000000-0000-0000-0000-000000000000	1febc023-048e-4b8c-8ef3-4f2cb94368c1	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-21 15:31:52.312306+00	
00000000-0000-0000-0000-000000000000	2be9f386-e282-4073-a229-1d727f68e2c8	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-21 15:32:33.136487+00	
00000000-0000-0000-0000-000000000000	c289e358-188e-4362-8e0e-257f7f4fbb22	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-22 07:37:18.511694+00	
00000000-0000-0000-0000-000000000000	35c27aa0-79cd-4ee8-9ab4-427199e00eb0	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-22 07:37:18.533965+00	
00000000-0000-0000-0000-000000000000	442820c2-b1da-49d1-b719-3cce4f36adad	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-22 07:37:18.600913+00	
00000000-0000-0000-0000-000000000000	b6b0eb31-0f66-4339-b9cd-5143b8ca903e	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-23 17:26:53.774593+00	
00000000-0000-0000-0000-000000000000	2cdcc7da-ec19-4ba9-bbfb-f09bed48b6a4	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-23 17:26:53.799428+00	
00000000-0000-0000-0000-000000000000	11912b28-e62e-4eb8-b122-503cc1ecebdc	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-23 17:26:54.073315+00	
00000000-0000-0000-0000-000000000000	d8f850bd-d189-4cbb-b622-71bbe1c1e19a	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-23 17:27:21.426165+00	
00000000-0000-0000-0000-000000000000	6154e284-9244-4855-8969-94dbca6bf0ea	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-23 17:27:48.85934+00	
00000000-0000-0000-0000-000000000000	c0d361ba-37d5-4c6d-8e5f-2609b7e012d8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-23 17:33:53.220139+00	
00000000-0000-0000-0000-000000000000	45721034-24a4-43fe-a3ba-5108e1a46ce9	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-23 17:33:53.222489+00	
00000000-0000-0000-0000-000000000000	7e4323ea-0f6b-4ac8-8619-0148c7d4dec7	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-23 17:54:47.955971+00	
00000000-0000-0000-0000-000000000000	44ca007a-98f3-4de2-9d48-9cbf99156d21	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-23 17:54:58.755128+00	
00000000-0000-0000-0000-000000000000	f6ffe126-fb79-4e10-b578-78b5e2c72ac3	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-23 17:55:41.383562+00	
00000000-0000-0000-0000-000000000000	c423ea42-9eb3-454b-8f09-5190158f4649	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-28 16:49:08.2919+00	
00000000-0000-0000-0000-000000000000	921f0426-dc6e-44c3-bea2-0b431e001948	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-28 16:49:31.260458+00	
00000000-0000-0000-0000-000000000000	bfaf0a6b-ed6d-422d-8107-b315fce9a106	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 17:37:32.794579+00	
00000000-0000-0000-0000-000000000000	1cddcfe8-df22-4630-a6bc-ec79add35daa	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 17:37:32.801563+00	
00000000-0000-0000-0000-000000000000	9098fd37-3158-46a0-a1e4-78774526c0ab	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 18:25:33.64481+00	
00000000-0000-0000-0000-000000000000	17fd92be-6ddb-4fae-8785-d896939f44d4	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 18:25:33.650784+00	
00000000-0000-0000-0000-000000000000	61b06095-8eef-4369-9f90-7e627a804c68	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 19:13:34.064441+00	
00000000-0000-0000-0000-000000000000	a54c6950-931b-4176-be1d-9eec8062ffd2	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-28 19:13:34.067941+00	
00000000-0000-0000-0000-000000000000	e43f6381-420f-4282-acc4-6f154cd05813	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 06:52:37.140862+00	
00000000-0000-0000-0000-000000000000	3491b8a6-de72-47a7-8c7b-3f0cbc8590e5	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 06:52:37.16272+00	
00000000-0000-0000-0000-000000000000	8642323f-0a48-4594-ae67-95bb1318cac4	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 06:52:37.222271+00	
00000000-0000-0000-0000-000000000000	a2911b78-ef06-4eee-97bc-98c5c25d7f3f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 07:58:55.140911+00	
00000000-0000-0000-0000-000000000000	89e0b0a6-d301-46f7-8b61-1142a0e0361b	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 07:58:55.162579+00	
00000000-0000-0000-0000-000000000000	278fab4f-7fac-423a-a38f-21f290582f3e	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 11:06:41.851047+00	
00000000-0000-0000-0000-000000000000	d9579d58-e889-4e22-a902-00ed3b2ad778	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 11:06:41.858824+00	
00000000-0000-0000-0000-000000000000	179c9936-9897-487f-88ff-2185dc8ecbe8	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 11:06:42.288901+00	
00000000-0000-0000-0000-000000000000	d9c69907-8bbe-4d00-987a-35d4cc2d807f	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-04-29 11:18:02.41157+00	
00000000-0000-0000-0000-000000000000	90f1d19f-c9ea-4d4c-966b-9742e94df588	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-04-29 11:18:20.182827+00	
00000000-0000-0000-0000-000000000000	ad65e903-6f32-41f5-b4c3-dcef37076da6	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 14:12:33.449148+00	
00000000-0000-0000-0000-000000000000	692c3153-3c61-4b46-a7fb-b1818bfe3128	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 14:12:33.451146+00	
00000000-0000-0000-0000-000000000000	2980027d-8174-4a2c-9b6b-1b1dffd70b21	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 14:12:33.717769+00	
00000000-0000-0000-0000-000000000000	248f48f3-dfbc-45ea-8dcb-a5bff7569938	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 15:20:23.834794+00	
00000000-0000-0000-0000-000000000000	cf4392d8-3c21-4600-a0d8-b752542a1bdd	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 15:20:23.838047+00	
00000000-0000-0000-0000-000000000000	acd923da-fdbf-45ff-878d-33d9b3ec29bc	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 15:20:26.101784+00	
00000000-0000-0000-0000-000000000000	7d2548df-0222-4da3-85fc-46254f6686d2	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 16:08:26.936099+00	
00000000-0000-0000-0000-000000000000	68a82f6c-c9e2-4b7a-89cc-37f0b0edaa58	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 16:08:26.939055+00	
00000000-0000-0000-0000-000000000000	a41be8a0-92fd-4a77-a08a-2c4fd10a61f3	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 18:28:48.50004+00	
00000000-0000-0000-0000-000000000000	96d7a741-c4f0-485a-8d03-6732a65f5477	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 18:28:48.511796+00	
00000000-0000-0000-0000-000000000000	89c367a1-929b-4eac-94ca-e143263e1fc1	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 18:28:48.893897+00	
00000000-0000-0000-0000-000000000000	ee750a87-d218-4fcb-814f-4ae750614596	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 19:16:49.866118+00	
00000000-0000-0000-0000-000000000000	5fe80245-3166-4464-9b1d-27ffd8ae2b80	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 19:16:49.87388+00	
00000000-0000-0000-0000-000000000000	7358586a-a7ab-410c-9103-b28126413128	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 20:18:59.607356+00	
00000000-0000-0000-0000-000000000000	a903d6a8-018e-4dee-9bc0-e6ea3d455592	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-04-29 20:18:59.611267+00	
00000000-0000-0000-0000-000000000000	4f54422f-345c-4a8d-a56a-1e36eec2a838	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 06:24:28.487903+00	
00000000-0000-0000-0000-000000000000	2cc16595-fdce-4fc7-b383-bda30f56a62f	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 06:24:28.511516+00	
00000000-0000-0000-0000-000000000000	196616b2-c705-45d5-892b-46ca42ad4492	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 06:30:35.674031+00	
00000000-0000-0000-0000-000000000000	e80447b5-9f4f-4cec-8cff-965308119dc1	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 06:30:35.68153+00	
00000000-0000-0000-0000-000000000000	3c42623d-182d-437d-995f-717a9499ea1d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 07:32:15.805912+00	
00000000-0000-0000-0000-000000000000	aecb0614-0d35-4135-aecc-f6862ee75a80	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 07:32:15.815511+00	
00000000-0000-0000-0000-000000000000	9c9388f9-bd33-4c24-b9ee-7d958774f540	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 07:32:15.934316+00	
00000000-0000-0000-0000-000000000000	661191a9-bcd5-46a0-9cad-2235f86671b8	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 07:32:49.343559+00	
00000000-0000-0000-0000-000000000000	84f2d9c2-1ea0-43b3-942f-38eb59fe6c8c	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 07:32:49.344872+00	
00000000-0000-0000-0000-000000000000	06728865-57b0-4c03-a4f3-6bf8fb299c4d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 08:21:13.557501+00	
00000000-0000-0000-0000-000000000000	168de407-79d6-4c72-b1ca-a6f5546117a3	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 08:21:13.564617+00	
00000000-0000-0000-0000-000000000000	031830cc-4f77-47ba-89fb-7815c791f3b4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 08:26:09.087985+00	
00000000-0000-0000-0000-000000000000	867c1dd5-0800-4fa9-9529-312420994795	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 08:26:09.090636+00	
00000000-0000-0000-0000-000000000000	b3c368d9-cf25-4a62-a3ec-d1be0ce7bd93	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 09:08:57.691501+00	
00000000-0000-0000-0000-000000000000	33706630-ee43-4067-a7a2-c88906fa91de	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 09:09:09.589615+00	
00000000-0000-0000-0000-000000000000	d4e68e4e-f5cd-4f0b-8100-3a1f9a783e03	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 09:14:00.473909+00	
00000000-0000-0000-0000-000000000000	754b3462-fcaa-47d1-95ac-6691f6c0ae2b	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 09:26:08.454362+00	
00000000-0000-0000-0000-000000000000	dd7f9fc0-9d84-4a9f-9e05-83913cfd2f5a	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 09:26:08.459091+00	
00000000-0000-0000-0000-000000000000	9dd30a71-4b15-4d89-bb81-aa5f21fc3b88	{"action":"user_modified","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-01 09:44:42.001612+00	
00000000-0000-0000-0000-000000000000	040972ab-f73e-4825-977e-a36549668f50	{"action":"user_modified","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-01 09:44:43.513561+00	
00000000-0000-0000-0000-000000000000	b4f5e5ec-3fb1-4c58-b7a0-00369d8bb4ec	{"action":"user_modified","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-01 09:53:27.818031+00	
00000000-0000-0000-0000-000000000000	d48845f4-9305-48b0-b3eb-9d8db49084d7	{"action":"user_modified","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-01 09:53:41.233246+00	
00000000-0000-0000-0000-000000000000	e1f4dba0-511c-4bf5-acac-c8a9a19ed39e	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 09:59:32.208067+00	
00000000-0000-0000-0000-000000000000	59508004-0ed7-49d7-b79c-671fa13f7ebe	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 09:59:32.210655+00	
00000000-0000-0000-0000-000000000000	ef84bc04-7f20-42aa-859b-05e01733aded	{"action":"user_modified","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-01 10:01:49.924454+00	
00000000-0000-0000-0000-000000000000	1caf337c-955a-44c4-8da0-d62aaa533caf	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 10:26:07.944938+00	
00000000-0000-0000-0000-000000000000	2640d057-5bba-4c04-8e16-7c1b7e66ad02	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 10:26:07.947926+00	
00000000-0000-0000-0000-000000000000	9b36577f-23b9-4c13-804b-a3fd352884e5	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 14:48:27.827632+00	
00000000-0000-0000-0000-000000000000	ddd851da-cd6d-4d7d-af3c-2e45f61b368a	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 14:48:27.849226+00	
00000000-0000-0000-0000-000000000000	91781cf1-865c-417a-ab1f-9adbbe2aea86	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 14:48:29.525138+00	
00000000-0000-0000-0000-000000000000	770a799b-6d2a-4bb9-b681-3a9924513347	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 14:50:00.361759+00	
00000000-0000-0000-0000-000000000000	ecf98f0b-409d-4613-a0f0-ea3fbba29814	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 14:50:14.590352+00	
00000000-0000-0000-0000-000000000000	1983746a-03ee-4795-bc5b-396566b98a66	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 15:07:58.713259+00	
00000000-0000-0000-0000-000000000000	37fe2a93-d2a4-4436-8a36-8137db7aa1d9	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 15:07:58.715682+00	
00000000-0000-0000-0000-000000000000	23515bbf-668b-49cd-b538-dbfd2fb48a11	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 16:10:51.541759+00	
00000000-0000-0000-0000-000000000000	c21a8553-6f17-4886-83a7-882e8c718a32	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 16:10:51.543295+00	
00000000-0000-0000-0000-000000000000	715470dc-063b-4a61-a304-44f9a4fc0f04	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 16:10:52.071394+00	
00000000-0000-0000-0000-000000000000	77db50e9-2c7a-4320-b3a2-206a5e4d19c4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 17:24:38.306762+00	
00000000-0000-0000-0000-000000000000	65bb1c05-6dc2-4012-b309-8621bad9c093	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 17:24:38.308464+00	
00000000-0000-0000-0000-000000000000	e5dc8f2b-4669-4877-92d8-54e78c0f5759	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 17:24:38.328849+00	
00000000-0000-0000-0000-000000000000	d689064e-d5c6-4c92-8cb0-cab7c49e0ec4	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 19:16:47.792836+00	
00000000-0000-0000-0000-000000000000	02348162-c28b-43e8-a79a-bfd4699f9c68	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 19:16:47.805334+00	
00000000-0000-0000-0000-000000000000	43962f98-e0f7-4b19-b42c-d024d162784c	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-01 19:16:48.04031+00	
00000000-0000-0000-0000-000000000000	5b6be7d8-a0f6-4508-936c-13e888bf917b	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:01:42.446166+00	
00000000-0000-0000-0000-000000000000	196f6685-92ec-454d-9f96-fdd48f6ac283	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:04:27.267647+00	
00000000-0000-0000-0000-000000000000	2b9ef8d3-ec1e-499b-9886-1d5bc1d42141	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:07:33.3217+00	
00000000-0000-0000-0000-000000000000	5d4e8acc-f7d0-4db0-9c3c-3174ac056927	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:07:45.806648+00	
00000000-0000-0000-0000-000000000000	6ba9064a-b13f-409a-960a-8e17996e445b	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:08:05.669196+00	
00000000-0000-0000-0000-000000000000	fc31f7b8-fdbb-4890-8476-c0afddf94d3e	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:08:18.093481+00	
00000000-0000-0000-0000-000000000000	18b97634-5d38-4e45-adca-3c6748b9656c	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:29:51.176633+00	
00000000-0000-0000-0000-000000000000	7e3307dd-34f9-4ffd-ae0e-27cca37cfdc1	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:30:10.144582+00	
00000000-0000-0000-0000-000000000000	95bec3f7-f983-4fd7-8859-284c28d3afae	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:36:34.53251+00	
00000000-0000-0000-0000-000000000000	04293bcb-95ce-4643-b9e7-e358cb731650	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:36:52.020836+00	
00000000-0000-0000-0000-000000000000	92db68cb-ff40-4c99-afc5-210769cbba1c	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 20:59:35.739714+00	
00000000-0000-0000-0000-000000000000	cd5c1392-aaa1-4a10-91b3-15e21d284878	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 20:59:46.415268+00	
00000000-0000-0000-0000-000000000000	d49d792b-36d3-4efa-b3fd-3f70dfda8d61	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-01 21:01:54.71109+00	
00000000-0000-0000-0000-000000000000	70ed753e-68eb-4c95-b2a9-90a55dc8caff	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-01 21:02:17.958636+00	
00000000-0000-0000-0000-000000000000	f2f08df3-4837-4b6c-b07d-b75162b90192	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 09:44:57.457808+00	
00000000-0000-0000-0000-000000000000	edf46ad6-af53-47e7-a344-2ce4d0b7a40e	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 09:44:57.485579+00	
00000000-0000-0000-0000-000000000000	7dfafe5c-914a-4ddb-a1c0-2e7347e91f6f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 09:44:57.559008+00	
00000000-0000-0000-0000-000000000000	5dac755d-08d2-4018-a9d3-0deced1356c4	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 14:30:04.606407+00	
00000000-0000-0000-0000-000000000000	396cb809-510a-458e-b0d8-aed5ca8720a0	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 14:30:04.626015+00	
00000000-0000-0000-0000-000000000000	47b48e56-ad51-4db0-8c6b-2b0126a68e3a	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-02 14:30:04.67384+00	
00000000-0000-0000-0000-000000000000	8cd02d79-5765-4073-96f8-7fbb0a8ff6b6	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-02 14:30:25.597105+00	
00000000-0000-0000-0000-000000000000	b2ce1de8-4b37-4f53-ad66-61cffba2503b	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-02 14:30:47.586625+00	
00000000-0000-0000-0000-000000000000	d98d8329-ed30-4cd5-927c-2b0732de5b8e	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-04 07:20:35.77162+00	
00000000-0000-0000-0000-000000000000	96038e71-273d-4054-b927-edc84955f712	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-04 07:20:35.795904+00	
00000000-0000-0000-0000-000000000000	f90eb2cc-77c4-4e3c-8c3c-2d09824b5e47	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 05:59:11.226418+00	
00000000-0000-0000-0000-000000000000	c8a3156c-8cf6-46ed-92d9-adc19c1d7b5e	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 05:59:11.243678+00	
00000000-0000-0000-0000-000000000000	effd0078-52fe-4546-bdf4-e6e059151d27	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:01:47.003403+00	
00000000-0000-0000-0000-000000000000	400221bc-7d31-494f-9c10-a5905eb3df4a	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:01:47.004582+00	
00000000-0000-0000-0000-000000000000	45ee9b68-51fa-4f41-aca5-d444e929c5e2	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:56:05.582981+00	
00000000-0000-0000-0000-000000000000	38c82c29-9c71-4a79-ab4d-b557d110a210	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:56:05.599987+00	
00000000-0000-0000-0000-000000000000	979a2b8d-e367-42fa-890a-077bb9510432	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:59:20.04548+00	
00000000-0000-0000-0000-000000000000	2198b524-49ac-41f0-b4fb-116eb76d4c09	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 06:59:20.049433+00	
00000000-0000-0000-0000-000000000000	db6f633f-c3d3-4368-918b-38acb44b902c	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 09:49:13.907013+00	
00000000-0000-0000-0000-000000000000	1a27a50c-8fc6-4cc7-bcae-23faa0645fef	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 09:49:13.909824+00	
00000000-0000-0000-0000-000000000000	fa5dce78-358d-4490-ab47-294c2ef2d70a	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 09:49:14.035101+00	
00000000-0000-0000-0000-000000000000	e3c5ff7f-4829-4a7f-8d6c-897e54915880	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 09:56:24.396372+00	
00000000-0000-0000-0000-000000000000	4da698d3-4459-480c-afbb-b994b7f3d00c	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-06 09:56:24.398074+00	
00000000-0000-0000-0000-000000000000	263794d3-f6f6-4afa-8193-96cffb02f67a	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-06 09:56:32.141222+00	
00000000-0000-0000-0000-000000000000	255cffa0-120b-465b-b9de-1329469096a0	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-06 09:56:48.454738+00	
00000000-0000-0000-0000-000000000000	79fd0cd2-265a-47e4-86b0-f91a01f476bf	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 09:46:06.736556+00	
00000000-0000-0000-0000-000000000000	47f953d1-6e30-4ea7-a782-84919ae7cb75	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 09:46:06.773955+00	
00000000-0000-0000-0000-000000000000	c33e0fa2-a32e-45ea-be75-86c19d0fd128	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 14:41:47.410077+00	
00000000-0000-0000-0000-000000000000	92b825f7-6f64-4ed2-ae14-ffc12a65a025	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 14:41:47.434055+00	
00000000-0000-0000-0000-000000000000	acf0b077-b23a-40b3-baee-2c47c62d691e	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 14:41:47.488448+00	
00000000-0000-0000-0000-000000000000	7605a27d-23b0-48a6-86df-3f52a7cefc30	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-07 14:45:39.598502+00	
00000000-0000-0000-0000-000000000000	c5dbf02a-8f43-4234-9a22-e91b361d6029	{"action":"login","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-07 14:46:47.04653+00	
00000000-0000-0000-0000-000000000000	6251f245-a715-4969-ad5a-97ab0e52e4df	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 15:34:48.198563+00	
00000000-0000-0000-0000-000000000000	c8cff476-d257-4e10-88e0-28fa569a6dae	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 15:34:48.201011+00	
00000000-0000-0000-0000-000000000000	147af7a3-afdf-4d65-9bcb-982a20572112	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 17:23:30.248616+00	
00000000-0000-0000-0000-000000000000	b57e7da3-570b-47c8-847e-804147d96cf8	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 17:23:30.254048+00	
00000000-0000-0000-0000-000000000000	788fa02c-402e-4c9f-a1eb-9005d18bdb8d	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-07 17:23:30.346551+00	
00000000-0000-0000-0000-000000000000	5c992dea-a2ab-489b-9161-53ca77e1bb6a	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:03:51.460119+00	
00000000-0000-0000-0000-000000000000	6d496127-dd27-45fe-a713-0bb3d4477158	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:03:51.495368+00	
00000000-0000-0000-0000-000000000000	563a1c9b-0084-4fcc-aa21-ce980072a415	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:03:51.697309+00	
00000000-0000-0000-0000-000000000000	6b9491da-4c0c-46c8-a66e-3da76b3758ed	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:42:41.306083+00	
00000000-0000-0000-0000-000000000000	f3374969-6f26-4cc1-9363-14b956ac3663	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:42:41.313851+00	
00000000-0000-0000-0000-000000000000	9d686150-60c0-4b59-a28f-2b116afd67ed	{"action":"token_refreshed","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:51:52.948037+00	
00000000-0000-0000-0000-000000000000	5002254a-57bc-4ddf-8be3-3fb7d28fa538	{"action":"token_revoked","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 11:51:52.952796+00	
00000000-0000-0000-0000-000000000000	99bf5bcd-5e2f-4477-b28a-c3b2f2d3f0c5	{"action":"logout","actor_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","actor_username":"patilom434@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 12:08:04.82405+00	
00000000-0000-0000-0000-000000000000	0ef642e5-a27e-4db5-867b-fae41cedb27a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 12:08:28.550726+00	
00000000-0000-0000-0000-000000000000	501629ee-8ead-41b0-aaea-52629c6e0e9a	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"omp349242@gmail.com","user_id":"2763082c-881e-498d-b3cd-771432f0c053","user_phone":""}}	2025-05-08 12:15:49.097761+00	
00000000-0000-0000-0000-000000000000	40c84ccc-6506-47d2-9507-b7a8918a5d3d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"vipulpatil2580@gmail.com","user_id":"76c6a74b-fed7-41c2-b7e9-ae327ae25671","user_phone":""}}	2025-05-08 12:15:49.118068+00	
00000000-0000-0000-0000-000000000000	0d51ab6a-c54c-4a4a-bddc-81f8ec96c487	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"harshal@example.com","user_id":"d3615ee2-a133-411f-88d4-b3ee82d480f3","user_phone":""}}	2025-05-08 12:15:49.124206+00	
00000000-0000-0000-0000-000000000000	11f90119-a82c-441f-aa8a-542450c05830	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom434@gmail.com","user_id":"c3f83c68-709c-4d7e-874b-c8e920d78aa5","user_phone":""}}	2025-05-08 12:15:49.151197+00	
00000000-0000-0000-0000-000000000000	9face6ae-e116-409b-9f6e-8fcf5a61356f	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 12:16:30.301129+00	
00000000-0000-0000-0000-000000000000	fdd08bc8-c0bb-40f9-973c-18ffe62e13ab	{"action":"login","actor_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 12:17:55.209741+00	
00000000-0000-0000-0000-000000000000	54fcc964-5ef3-416d-8cf1-9d5ae9cc0b95	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"patilom4634@gmail.com","user_id":"a3823ee8-3ade-4208-84f7-3855f72c4efd","user_phone":""}}	2025-05-08 12:18:31.34714+00	
00000000-0000-0000-0000-000000000000	6142be94-9f15-48e3-b696-94a1a35d0205	{"action":"user_signedup","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 12:19:27.145272+00	
00000000-0000-0000-0000-000000000000	a88aee32-d485-4b2a-a988-26d94f9df752	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 12:19:27.149724+00	
00000000-0000-0000-0000-000000000000	cdffc64f-7705-4918-abbf-0988042a3768	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 12:19:33.609615+00	
00000000-0000-0000-0000-000000000000	cb7598c0-d812-4827-bb43-bd5f65f746a1	{"action":"user_modified","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"user"}	2025-05-08 12:19:59.458172+00	
00000000-0000-0000-0000-000000000000	49575424-a036-4338-9c21-806d0fda17cd	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 12:29:22.728197+00	
00000000-0000-0000-0000-000000000000	be336822-1870-4670-85bd-dd259c9753c2	{"action":"user_signedup","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 12:31:16.994548+00	
00000000-0000-0000-0000-000000000000	4c1ef1f8-dd00-45f1-9ae3-05cfde13fe6d	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 12:31:17.001591+00	
00000000-0000-0000-0000-000000000000	c433a0aa-f736-44a9-a492-51eb7ccd0656	{"action":"user_signedup","actor_id":"a86a619e-0322-4cb6-839b-c31f560956c8","actor_username":"belllaciao124@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 13:26:34.111773+00	
00000000-0000-0000-0000-000000000000	cce2bfa9-4ade-45a8-abba-624affe7f4df	{"action":"login","actor_id":"a86a619e-0322-4cb6-839b-c31f560956c8","actor_username":"belllaciao124@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:26:34.118905+00	
00000000-0000-0000-0000-000000000000	22b9384b-6201-4dcb-96de-6b503c5cae53	{"action":"user_signedup","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 13:30:35.243246+00	
00000000-0000-0000-0000-000000000000	96adea06-7812-4a5d-822c-5d4a00342b39	{"action":"login","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:30:35.24935+00	
00000000-0000-0000-0000-000000000000	a22f3536-457a-428a-a66a-93f6a63ed860	{"action":"login","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:31:20.925037+00	
00000000-0000-0000-0000-000000000000	80a022fc-8fa2-444b-8f6e-6ecda77f2373	{"action":"logout","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 13:33:07.573456+00	
00000000-0000-0000-0000-000000000000	0a07a36d-7568-40d0-aca1-08e29e9d53a1	{"action":"login","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:33:27.639288+00	
00000000-0000-0000-0000-000000000000	5e3a25d1-847a-4c11-a776-63cc8223094b	{"action":"logout","actor_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 13:37:56.9086+00	
00000000-0000-0000-0000-000000000000	d9aff325-165a-4533-adb3-897766133927	{"action":"user_signedup","actor_id":"f19af29f-a4a3-4da8-b054-494c49007e81","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 13:39:16.166595+00	
00000000-0000-0000-0000-000000000000	2b772d2e-d82a-4f5e-9bdc-26287cd73541	{"action":"login","actor_id":"f19af29f-a4a3-4da8-b054-494c49007e81","actor_username":"cp0705@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:39:16.170725+00	
00000000-0000-0000-0000-000000000000	3b0bb066-fc96-4e2d-909c-b79a615f9fc7	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"omp349242@gmail.com","user_id":"a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35","user_phone":""}}	2025-05-08 13:42:39.134699+00	
00000000-0000-0000-0000-000000000000	f454c3be-60a4-4cfc-9445-a2e69b78ecfe	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cp0705@gmail.com","user_id":"f19af29f-a4a3-4da8-b054-494c49007e81","user_phone":""}}	2025-05-08 13:42:39.312576+00	
00000000-0000-0000-0000-000000000000	8c6854bb-2a76-4c79-9a58-c68f6a11cb43	{"action":"user_signedup","actor_id":"eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 13:45:38.680406+00	
00000000-0000-0000-0000-000000000000	defa6087-e873-401a-bb12-307da34d44c2	{"action":"login","actor_id":"eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:45:38.687472+00	
00000000-0000-0000-0000-000000000000	3e14b82c-68aa-4c05-893c-d02f2102eddb	{"action":"login","actor_id":"eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:46:06.272995+00	
00000000-0000-0000-0000-000000000000	274682f7-06ab-43ec-b896-4faff88c1d84	{"action":"login","actor_id":"eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:46:09.958379+00	
00000000-0000-0000-0000-000000000000	cac0e9c7-c998-4023-a7d4-5e69089f8fa7	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"omp349242@gmail.com","user_id":"eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6","user_phone":""}}	2025-05-08 13:48:27.090472+00	
00000000-0000-0000-0000-000000000000	848cab60-43d2-41c9-b339-3e64225cd461	{"action":"user_signedup","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-08 13:51:56.536915+00	
00000000-0000-0000-0000-000000000000	f7d0408f-3947-4761-bae5-b35d8e293fdc	{"action":"login","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:51:56.541145+00	
00000000-0000-0000-0000-000000000000	fa5be84e-0787-43e7-a521-d157175e9f09	{"action":"login","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 13:52:13.045707+00	
00000000-0000-0000-0000-000000000000	86bc6aa0-73a3-464d-8ff1-a543af1b32b8	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 15:10:22.572915+00	
00000000-0000-0000-0000-000000000000	e6594cda-4aaa-4470-801e-78c064630f11	{"action":"token_revoked","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 15:10:22.585918+00	
00000000-0000-0000-0000-000000000000	6a94ecf0-140c-42e0-b8b1-625ca3d65f39	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 15:10:23.039749+00	
00000000-0000-0000-0000-000000000000	05f41a0e-f707-4828-8a90-79be0364d8e6	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 17:32:46.499037+00	
00000000-0000-0000-0000-000000000000	14f3986d-b1ba-4df9-b10f-929fc4c866da	{"action":"token_revoked","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 17:32:46.506792+00	
00000000-0000-0000-0000-000000000000	eaf103db-4d03-46d0-addb-3a96f56d58d9	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 17:32:46.552708+00	
00000000-0000-0000-0000-000000000000	76fae900-2113-46ac-a67b-3ced8642b9d5	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 18:39:35.554496+00	
00000000-0000-0000-0000-000000000000	a9fefa31-29c7-44de-8577-aad02e75d04a	{"action":"token_revoked","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 18:39:35.561512+00	
00000000-0000-0000-0000-000000000000	32882dbb-e70d-4dd0-b448-0cea1dd108e7	{"action":"token_refreshed","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-08 18:39:35.872009+00	
00000000-0000-0000-0000-000000000000	5ce2449d-d6a5-4838-969d-a383020ab3a9	{"action":"logout","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 19:22:39.456888+00	
00000000-0000-0000-0000-000000000000	7f6b0095-4086-496e-b50b-9fde3fff9150	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 19:36:10.315622+00	
00000000-0000-0000-0000-000000000000	2726dd03-d592-49eb-8d51-30be42e2eaa2	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 19:36:42.687692+00	
00000000-0000-0000-0000-000000000000	de0e15bf-6308-433a-b274-7f8b5e986203	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 19:36:50.360716+00	
00000000-0000-0000-0000-000000000000	bd417664-51e2-4fb9-afed-570aae708ca5	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 20:17:54.081647+00	
00000000-0000-0000-0000-000000000000	23ac5dbc-9967-452d-8099-974515c27a3a	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-08 20:19:25.16725+00	
00000000-0000-0000-0000-000000000000	87728ea6-1390-4ee7-8d19-f3b3def2d632	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-08 20:19:39.831449+00	
00000000-0000-0000-0000-000000000000	f1b20f9b-b7ad-46df-ae79-9b079014f631	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 13:50:25.95091+00	
00000000-0000-0000-0000-000000000000	0f1021b4-e413-49d3-bcbe-e9b4d7aa8068	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 13:52:17.290853+00	
00000000-0000-0000-0000-000000000000	03798337-261a-4752-a525-08279392d91e	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 13:52:33.231232+00	
00000000-0000-0000-0000-000000000000	4b131cd9-d34d-4453-920d-0d7eebeaef3a	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 13:56:27.876135+00	
00000000-0000-0000-0000-000000000000	2966f2b7-2156-464b-b728-03cb28b243e7	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 14:46:10.655718+00	
00000000-0000-0000-0000-000000000000	d8eccba1-51b4-464d-912c-2b4835883441	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 15:34:33.446575+00	
00000000-0000-0000-0000-000000000000	6cba4aa3-a4ea-4003-8a0c-a1b42b3626ba	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 15:34:33.453231+00	
00000000-0000-0000-0000-000000000000	d8d2c875-bd4e-49c2-8372-63ffba0b81ea	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 15:34:44.215753+00	
00000000-0000-0000-0000-000000000000	1bb34424-1357-4110-91c6-c9cc5bd533b2	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 16:31:04.781707+00	
00000000-0000-0000-0000-000000000000	9d3549c9-b531-4616-bbda-103f60ec2525	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 16:31:04.783659+00	
00000000-0000-0000-0000-000000000000	19769441-2b6b-49b5-9b94-830b7c0eee1c	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 17:59:39.052011+00	
00000000-0000-0000-0000-000000000000	3daf057a-bae3-40d0-bde5-7f4e876efb95	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 18:02:29.870921+00	
00000000-0000-0000-0000-000000000000	699c3f9c-4653-464d-9abc-bf74ac3acf1c	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 18:02:29.873765+00	
00000000-0000-0000-0000-000000000000	039b5fa5-3d43-4020-bf84-f89fde4d668f	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 18:30:47.95304+00	
00000000-0000-0000-0000-000000000000	b00687c4-21c2-4e1c-aac5-3a36b1028369	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 18:31:10.23736+00	
00000000-0000-0000-0000-000000000000	7cbb6690-78d7-4487-9d11-79a41ba40c96	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 18:32:09.035639+00	
00000000-0000-0000-0000-000000000000	613b3826-c05a-478a-b120-b3b87fb1f4a1	{"action":"user_signedup","actor_id":"a561911b-bc55-4136-8be4-e76ea631df9e","actor_username":"belllaciao14@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-05-09 18:33:55.960411+00	
00000000-0000-0000-0000-000000000000	789fbcea-44af-440f-8167-87d51f321761	{"action":"login","actor_id":"a561911b-bc55-4136-8be4-e76ea631df9e","actor_username":"belllaciao14@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 18:33:55.967667+00	
00000000-0000-0000-0000-000000000000	4238870d-a148-4c98-80fc-631bdcd195d0	{"action":"login","actor_id":"a561911b-bc55-4136-8be4-e76ea631df9e","actor_username":"belllaciao14@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 18:34:16.984546+00	
00000000-0000-0000-0000-000000000000	76606572-dd31-433e-8161-f3f1f6ecd26b	{"action":"logout","actor_id":"a561911b-bc55-4136-8be4-e76ea631df9e","actor_username":"belllaciao14@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 18:36:09.55388+00	
00000000-0000-0000-0000-000000000000	c3d084e7-7a1f-43f7-9446-5d96fa86b38d	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 18:47:40.698997+00	
00000000-0000-0000-0000-000000000000	69a911b4-2229-408c-a6fd-f0d37a03b613	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-09 18:47:40.701222+00	
00000000-0000-0000-0000-000000000000	5d6440cd-ada0-4da1-9c28-20a8160dda41	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 18:51:24.650221+00	
00000000-0000-0000-0000-000000000000	8113d687-ba34-49e4-bbaa-b1c943d87ca7	{"action":"logout","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-05-09 18:51:31.948853+00	
00000000-0000-0000-0000-000000000000	ac682a17-3c86-417b-a7d7-7edf6b68a3bf	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-09 18:51:50.939348+00	
00000000-0000-0000-0000-000000000000	c32903f6-626a-45af-a2e0-c15d3420ad07	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 04:46:10.743135+00	
00000000-0000-0000-0000-000000000000	29dd61e3-3aeb-449d-b169-821b1a63397c	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 04:46:10.754461+00	
00000000-0000-0000-0000-000000000000	1561dc4a-e55a-413b-8bcc-430200c5842e	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 04:46:10.794914+00	
00000000-0000-0000-0000-000000000000	ac518831-c5ce-4489-be5d-2fdbc47c1eba	{"action":"login","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-10 04:46:50.053551+00	
00000000-0000-0000-0000-000000000000	34317453-b746-4d65-80c9-a6834e492b1a	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-10 05:27:15.83009+00	
00000000-0000-0000-0000-000000000000	ab324605-ee57-4b44-8191-b78e2cd2ac51	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-10 05:27:15.831584+00	
00000000-0000-0000-0000-000000000000	5701f2f4-4279-4937-81ad-669752f93409	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 05:41:45.985433+00	
00000000-0000-0000-0000-000000000000	575b2300-639a-4e7f-ac51-977050766edd	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 05:41:45.988303+00	
00000000-0000-0000-0000-000000000000	efd7cdd5-9f2c-4caa-bba3-3f178c66514b	{"action":"token_refreshed","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 05:47:07.733767+00	
00000000-0000-0000-0000-000000000000	82a48906-0b93-44a9-b025-3b416b1a5afa	{"action":"token_revoked","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 05:47:07.73567+00	
00000000-0000-0000-0000-000000000000	8a9f8754-8454-46b9-b8b2-2f4be7ec5a9f	{"action":"token_refreshed","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 05:47:08.147863+00	
00000000-0000-0000-0000-000000000000	89a19518-5da5-4490-bd83-713f0b5daa17	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 06:55:53.186828+00	
00000000-0000-0000-0000-000000000000	859503c4-f92c-4ad3-a56c-ad25e31556ed	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 06:55:53.202339+00	
00000000-0000-0000-0000-000000000000	289b4533-0577-4faa-9d57-50b99c874015	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 06:55:53.23462+00	
00000000-0000-0000-0000-000000000000	419c845a-02b3-482a-8743-f8690945e847	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 06:56:44.317787+00	
00000000-0000-0000-0000-000000000000	fd3b8576-f074-43c7-854a-46581835f687	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 06:56:44.319079+00	
00000000-0000-0000-0000-000000000000	446b69c3-4d0b-411e-9979-3b50cca2247c	{"action":"token_refreshed","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 07:44:27.48905+00	
00000000-0000-0000-0000-000000000000	347723ce-1192-4536-a970-2618565dffd5	{"action":"token_revoked","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 07:44:27.492136+00	
00000000-0000-0000-0000-000000000000	97d87ab8-79c2-405c-a83a-d21c8854795d	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 09:17:29.511177+00	
00000000-0000-0000-0000-000000000000	14edc8b5-cf12-4f11-a0a0-8b2de842d800	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 09:17:29.513673+00	
00000000-0000-0000-0000-000000000000	c076032c-a77c-4389-924a-2eb45620aac4	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-10 09:17:29.611049+00	
00000000-0000-0000-0000-000000000000	c2c89e91-3ffb-4f11-9a01-aff7cfcd3590	{"action":"token_refreshed","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-11 16:12:28.403855+00	
00000000-0000-0000-0000-000000000000	aff75614-50f8-48a9-b066-d82d27d37857	{"action":"token_revoked","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-11 16:12:28.438367+00	
00000000-0000-0000-0000-000000000000	fb49b68a-f8ff-4998-b973-0c35c4bb3a2c	{"action":"token_refreshed","actor_id":"15099c4c-0d46-4764-81f5-87286f11ef40","actor_username":"belllaciao1234@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-11 16:12:28.514298+00	
00000000-0000-0000-0000-000000000000	45fbded1-47cf-4113-aa2d-d4d6916e696e	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-13 20:17:45.818141+00	
00000000-0000-0000-0000-000000000000	7d1e9dde-ec48-4041-a1da-6af91c678583	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-13 20:17:45.838545+00	
00000000-0000-0000-0000-000000000000	23e46f80-bf23-4cba-ad20-d11e654867e2	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-13 20:17:45.918171+00	
00000000-0000-0000-0000-000000000000	ee8e5357-6fed-491d-8a4c-bfd3c789f474	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-16 14:28:17.997327+00	
00000000-0000-0000-0000-000000000000	cb45d8ff-0ba0-4371-b17d-a81058a7fd17	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-16 14:28:18.026611+00	
00000000-0000-0000-0000-000000000000	f5abac31-5e1a-4e1d-adb7-bf8f3f294d76	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-16 14:28:18.089487+00	
00000000-0000-0000-0000-000000000000	3301c7e4-1d64-42bb-854c-66b39d4aa38a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:22:57.035674+00	
00000000-0000-0000-0000-000000000000	025b3853-e914-4ead-a9e3-56d331198c42	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:23:06.498092+00	
00000000-0000-0000-0000-000000000000	a6545bac-ddca-4756-943d-454ad2360a4a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:23:23.719083+00	
00000000-0000-0000-0000-000000000000	cfe950cf-2044-40d5-9b01-5de8995f2e04	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:24:21.398808+00	
00000000-0000-0000-0000-000000000000	f00d73c4-21b2-4284-9ade-bababead23b4	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:24:44.056386+00	
00000000-0000-0000-0000-000000000000	8093deaf-4fc6-4fce-8236-81329dc8fd0f	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-13 07:24:47.769429+00	
00000000-0000-0000-0000-000000000000	bb0a39b0-f007-4395-a4f4-6ff7d44de869	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-15 13:58:46.90498+00	
00000000-0000-0000-0000-000000000000	aa319094-5fe0-450e-af6f-377dd3ce676a	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-15 13:58:46.923407+00	
00000000-0000-0000-0000-000000000000	39f42fea-15f0-46aa-851d-dea5e6e30624	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-15 13:58:47.613747+00	
00000000-0000-0000-0000-000000000000	58f3fdcf-20a3-4064-bc00-59d549fc1516	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-06-15 13:58:56.73313+00	
00000000-0000-0000-0000-000000000000	8c968fb7-3fb9-458b-8db4-dc18d525b61a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-15 13:59:10.574589+00	
00000000-0000-0000-0000-000000000000	fa1537d3-ea7b-45f8-9223-9a36e85c2811	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-15 14:53:42.621272+00	
00000000-0000-0000-0000-000000000000	851dbd6b-0434-4d3a-9b6b-91e51f456f62	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-15 14:53:42.624576+00	
00000000-0000-0000-0000-000000000000	ba97ed3a-041c-43d8-9780-9459b7e5282d	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-06-15 14:54:29.949861+00	
00000000-0000-0000-0000-000000000000	93423f94-f025-45af-a273-78bdd88bc797	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-15 14:54:51.803759+00	
00000000-0000-0000-0000-000000000000	f08a5e4e-af9a-4e06-bf63-b69e186934bb	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 06:18:15.851852+00	
00000000-0000-0000-0000-000000000000	eee995e9-996d-4529-891e-9e02bd4114a9	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 06:18:15.859407+00	
00000000-0000-0000-0000-000000000000	72c8e89a-5993-4dea-9592-c1e909e235ae	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 06:18:16.121451+00	
00000000-0000-0000-0000-000000000000	d212ceb5-31e4-4c9b-8e00-aba565c54d68	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 08:01:33.148663+00	
00000000-0000-0000-0000-000000000000	0db2f14b-97d6-4d31-8ecd-fb9e53bb9902	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 08:01:33.152392+00	
00000000-0000-0000-0000-000000000000	a448dae7-ce8f-4282-a5a1-e5a2e4089a69	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-06-16 08:01:33.295633+00	
00000000-0000-0000-0000-000000000000	b0a1c126-cf2f-437b-bf76-284dc0c72b68	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-06-16 08:01:36.37993+00	
00000000-0000-0000-0000-000000000000	3ba98d96-8959-43d5-a349-dd7f134dda99	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-16 08:02:26.421754+00	
00000000-0000-0000-0000-000000000000	fd712b6a-5e02-4f8c-98d4-8bf66efb17cb	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-16 08:02:29.665363+00	
00000000-0000-0000-0000-000000000000	2e5bd04f-a09f-4a3e-9c0f-ba90c0f0031b	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-06-16 08:02:32.813017+00	
00000000-0000-0000-0000-000000000000	f9495fb1-c368-4323-b214-89f33a6c6e03	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 18:40:32.153713+00	
00000000-0000-0000-0000-000000000000	371d81ea-cc39-4291-87d9-f87911fd9042	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 18:40:32.160762+00	
00000000-0000-0000-0000-000000000000	e2d89b13-3c0b-45ee-88d1-1439a4a35270	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 18:40:32.393151+00	
00000000-0000-0000-0000-000000000000	c45571ba-d701-44e2-a367-7da3ffea4275	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:40:53.27409+00	
00000000-0000-0000-0000-000000000000	1e50d4f8-b39b-4d29-afc0-a302ee26d72d	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:41:40.319897+00	
00000000-0000-0000-0000-000000000000	7e6aafdd-a473-4cd0-83ee-6bc717ad34ab	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 18:46:48.374544+00	
00000000-0000-0000-0000-000000000000	229c88e0-c2ea-4eda-99a2-347b17a77323	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:47:04.98728+00	
00000000-0000-0000-0000-000000000000	bb31b0b8-a89d-422e-910b-e5d67eeae2be	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 18:48:22.143808+00	
00000000-0000-0000-0000-000000000000	723674ab-aec2-485f-80e7-406c6f55a4a5	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:49:12.061674+00	
00000000-0000-0000-0000-000000000000	493005ec-6c29-4db7-b462-32f539a9aeec	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 07:15:53.191503+00	
00000000-0000-0000-0000-000000000000	c4fa16ce-6c33-43f0-b267-e867c2f50445	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 07:15:53.214122+00	
00000000-0000-0000-0000-000000000000	7dce9278-a49c-4e77-9abe-3f352aa0e6bd	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 07:15:53.30068+00	
00000000-0000-0000-0000-000000000000	dd906818-1386-4bae-9ad1-28fb81bf9120	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 07:15:54.497632+00	
00000000-0000-0000-0000-000000000000	ae323094-ea9d-4083-a37b-2cf0ee633676	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 07:16:12.406155+00	
00000000-0000-0000-0000-000000000000	feee4c51-0d18-4548-9da0-cdf0636d03c8	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 09:52:37.275965+00	
00000000-0000-0000-0000-000000000000	effbb30c-0f4f-4048-82b4-768856f21371	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 10:02:25.958183+00	
00000000-0000-0000-0000-000000000000	df0d2353-197d-4855-b25a-7fa5d42437fd	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:08:12.383865+00	
00000000-0000-0000-0000-000000000000	0115ebd8-5858-48db-a1a4-4285b368f06c	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:08:12.400361+00	
00000000-0000-0000-0000-000000000000	4a2ee6e2-ffd7-4716-9d75-7e2631db207f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 14:08:12.475788+00	
00000000-0000-0000-0000-000000000000	347171a8-0b02-4f42-b3ea-eac8446ef435	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 14:08:13.959918+00	
00000000-0000-0000-0000-000000000000	2affadc8-cc4b-46c8-92a5-c8a7cf6c5886	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 14:08:34.103279+00	
00000000-0000-0000-0000-000000000000	13bc3eb4-e65b-4497-a2e6-d36b8930fdc4	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-26 04:56:01.914726+00	
00000000-0000-0000-0000-000000000000	2d097378-c8d1-478c-a470-1ecb0a12005a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-26 04:56:10.166203+00	
00000000-0000-0000-0000-000000000000	87d6e7f3-9ba8-440d-99bc-1087771e74d7	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-26 04:56:27.511511+00	
00000000-0000-0000-0000-000000000000	e1c5d616-485d-4dab-a227-7aa27c507d6b	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-26 05:00:18.854631+00	
00000000-0000-0000-0000-000000000000	bba55d21-abda-484d-82bd-c5551a00bb2c	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 10:57:36.510678+00	
00000000-0000-0000-0000-000000000000	0d3e5afb-17ca-4110-ae14-4d07039f4d57	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 10:57:36.539074+00	
00000000-0000-0000-0000-000000000000	17984c75-1535-486c-ab70-c17f40c5b835	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-26 10:57:36.590153+00	
00000000-0000-0000-0000-000000000000	b54bc640-892c-44f9-a383-df59a1634354	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-28 18:14:47.187934+00	
00000000-0000-0000-0000-000000000000	5629634e-4636-4111-9024-94bd0323a414	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 14:08:24.960778+00	
00000000-0000-0000-0000-000000000000	aa9f358f-6e9c-4bf9-a2b4-c7449442c111	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 14:08:24.9915+00	
00000000-0000-0000-0000-000000000000	4ef2e6eb-371b-41fc-9168-1817d41bd25b	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-04 14:08:25.063571+00	
00000000-0000-0000-0000-000000000000	3ada7ecb-1ab9-45aa-a0cb-36515d0ed807	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 11:56:54.9043+00	
00000000-0000-0000-0000-000000000000	073dfeea-a824-4eb6-87f0-f267c1062b88	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 11:56:54.930018+00	
00000000-0000-0000-0000-000000000000	a06c462e-e0ae-4113-977c-af8c34ea6415	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 11:56:54.9966+00	
00000000-0000-0000-0000-000000000000	b15d0b6f-9d93-48d6-b7ec-382db33ba5aa	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:01.909707+00	
00000000-0000-0000-0000-000000000000	af347c2e-0d1e-48ff-80f1-c5564414b6a5	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:01.933979+00	
00000000-0000-0000-0000-000000000000	76c12932-d478-4f13-a79c-4b62c587d3af	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:02.024643+00	
00000000-0000-0000-0000-000000000000	7db785b5-e299-45c1-85d6-a03bff245d07	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:05.589717+00	
00000000-0000-0000-0000-000000000000	30538f96-b226-4f90-9921-e5f550ecbc07	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:05.613803+00	
00000000-0000-0000-0000-000000000000	4f760f10-45fa-4795-82aa-c246a28b58ad	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:09.80324+00	
00000000-0000-0000-0000-000000000000	e3ad4941-1229-4bd3-941c-33d52df21b82	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-15 07:26:10.523875+00	
00000000-0000-0000-0000-000000000000	43b7e270-8117-4565-87c5-70f3eca5c033	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:09:25.596658+00	
00000000-0000-0000-0000-000000000000	fdacd51e-a107-49f6-a56b-dda523a094af	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:09:43.0977+00	
00000000-0000-0000-0000-000000000000	8695c2c0-b0b0-4de6-a1ee-a54cf31c997d	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-16 16:29:58.573114+00	
00000000-0000-0000-0000-000000000000	5f8f5e96-069c-412d-b626-167a34759076	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:31:05.80536+00	
00000000-0000-0000-0000-000000000000	cb257068-159b-43a0-a4f1-b4837a78a0e6	{"action":"login","actor_id":"9a246526-a93a-4b55-a730-847bad987e94","actor_username":"omp349242@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:31:20.491926+00	
00000000-0000-0000-0000-000000000000	e3fb786f-4455-4681-9853-16648aea1ec8	{"action":"login","actor_id":"a561911b-bc55-4136-8be4-e76ea631df9e","actor_username":"belllaciao14@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:31:46.218351+00	
00000000-0000-0000-0000-000000000000	e2d8e179-9e44-426c-97d4-e2da4237809c	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:32:00.460183+00	
00000000-0000-0000-0000-000000000000	14a76393-1ed2-42f6-bd75-fcc7fdc7838f	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:32:55.861457+00	
00000000-0000-0000-0000-000000000000	ff0d93f1-c4b6-4fc7-b346-c0a71f1efaaf	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-16 16:34:09.640233+00	
00000000-0000-0000-0000-000000000000	bc13f87d-e64c-4566-8abb-37f6cec15512	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-16 17:03:03.975985+00	
00000000-0000-0000-0000-000000000000	0d1f1247-8f76-4928-8df3-1601976e3eb5	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-17 05:48:33.687451+00	
00000000-0000-0000-0000-000000000000	da6298f3-bb34-4313-8a27-9f109153ff97	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-17 10:30:39.500466+00	
00000000-0000-0000-0000-000000000000	ba83151a-2607-4492-9b7e-592b71ca1a93	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-17 10:30:39.520798+00	
00000000-0000-0000-0000-000000000000	48c6716a-ca47-4c4d-badf-219516675b94	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-17 10:30:39.579705+00	
00000000-0000-0000-0000-000000000000	7225c562-05c5-43e1-99ff-b6bc6a088856	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-18 15:25:30.255196+00	
00000000-0000-0000-0000-000000000000	91acd145-5032-4841-9073-9cdf9dd17d2f	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-18 15:25:30.278315+00	
00000000-0000-0000-0000-000000000000	6e4591d3-43aa-40e9-92fb-4fb3a9b67325	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-18 15:25:30.336276+00	
00000000-0000-0000-0000-000000000000	314cda2b-4b13-4141-ae8a-f05d1fad3087	{"action":"logout","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-11-18 15:27:23.863004+00	
00000000-0000-0000-0000-000000000000	fdac6d4d-a88d-41b5-8ff1-35b525bfd420	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-18 15:27:32.89724+00	
00000000-0000-0000-0000-000000000000	17211098-d9f2-4ed3-aa53-35958723dc30	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 05:12:01.64013+00	
00000000-0000-0000-0000-000000000000	c61fe896-97f8-4e1f-a9a6-2fd0759b90d6	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 05:12:01.664654+00	
00000000-0000-0000-0000-000000000000	711e0440-7d09-4b94-856f-f171900310bf	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 05:12:02.441402+00	
00000000-0000-0000-0000-000000000000	9c9eaf36-6e78-4172-8e32-d3872272156f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 18:48:41.592352+00	
00000000-0000-0000-0000-000000000000	99b754cf-1882-4a9d-84a8-ea1929ac2539	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 18:48:41.606744+00	
00000000-0000-0000-0000-000000000000	afc5bdd9-537c-4c8a-b8ce-b4be040da0cc	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 18:48:41.906447+00	
00000000-0000-0000-0000-000000000000	7842dd5f-2f77-4e5a-ae37-e5aefb7bc7be	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 19:45:13.085861+00	
00000000-0000-0000-0000-000000000000	b58e2611-c07d-4f9d-bd5e-3ad79b7e5dec	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-21 19:45:13.098238+00	
00000000-0000-0000-0000-000000000000	08dc1255-d376-4a3e-8775-a225cc351b9f	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-23 20:25:47.611151+00	
00000000-0000-0000-0000-000000000000	26a22deb-4846-4bcd-bd9d-d68006c75e77	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-23 20:25:47.632864+00	
00000000-0000-0000-0000-000000000000	f16e271c-8dd5-4cb3-a166-65a8c5e18ace	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-24 05:46:14.954892+00	
00000000-0000-0000-0000-000000000000	a732e41c-3771-4e31-a9e1-f8948da7691a	{"action":"login","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-24 05:56:16.207915+00	
00000000-0000-0000-0000-000000000000	9340ca18-b029-4a7a-b020-e9ce86191917	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-24 08:27:39.431709+00	
00000000-0000-0000-0000-000000000000	7b436a2d-d8df-4b67-a5e3-a557a7d3abdc	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-24 08:27:39.458956+00	
00000000-0000-0000-0000-000000000000	63f9f49c-68fa-452f-860b-a5c7ee338179	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-11-24 08:27:39.598875+00	
00000000-0000-0000-0000-000000000000	e43be76c-6347-479c-9c23-05a758034429	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-12 14:36:55.701641+00	
00000000-0000-0000-0000-000000000000	9320c6f7-590e-483b-89b8-1d664f47e276	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-12 14:36:55.710748+00	
00000000-0000-0000-0000-000000000000	592b9e28-234b-4cb8-bf16-9122a6ecc015	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-14 02:34:28.974541+00	
00000000-0000-0000-0000-000000000000	96a279e9-8868-4037-afc4-2988b9fd328b	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-14 02:34:29.000517+00	
00000000-0000-0000-0000-000000000000	ae9a1ef9-2813-4bb8-8770-d4f4810cd4cc	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-14 02:34:29.072865+00	
00000000-0000-0000-0000-000000000000	6ea20340-cc21-40f1-826b-8ac8caedbf57	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-16 07:40:02.752687+00	
00000000-0000-0000-0000-000000000000	63a41e33-3743-40dc-a104-379977ae0efc	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-16 08:20:20.99826+00	
00000000-0000-0000-0000-000000000000	ea24491c-0ebf-4d6f-bdc2-ec2cf2066e27	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-16 08:20:21.013694+00	
00000000-0000-0000-0000-000000000000	7fa8f5f6-3fee-4b2e-8a41-641d1ec07f69	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-16 08:20:21.380429+00	
00000000-0000-0000-0000-000000000000	7cd6b4a7-e856-44ba-a524-821b044153e8	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-16 08:32:22.288048+00	
00000000-0000-0000-0000-000000000000	dc9f391d-3336-47f1-b876-006076af355f	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-16 08:32:22.295645+00	
00000000-0000-0000-0000-000000000000	babe3ffd-49c5-4800-9fd3-7e31f8d6fc47	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-19 06:11:40.574518+00	
00000000-0000-0000-0000-000000000000	558cdfc5-b781-4840-9727-68929c8dcb7f	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-19 06:11:40.599957+00	
00000000-0000-0000-0000-000000000000	34bf8303-19cd-4ffa-a20b-367daf952dbb	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-12-19 06:11:40.676443+00	
00000000-0000-0000-0000-000000000000	4cbebba8-0531-4d9b-a1a4-e2f31d257aea	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-24 08:47:30.101597+00	
00000000-0000-0000-0000-000000000000	7604f7fc-e9e6-406c-887c-d8b283746320	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-24 08:47:30.123307+00	
00000000-0000-0000-0000-000000000000	3881a767-25e7-4c96-bf09-90fe49cb72a6	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-24 08:47:30.375868+00	
00000000-0000-0000-0000-000000000000	7b65b50e-2144-45d7-ad11-822065fb279f	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:18:52.393822+00	
00000000-0000-0000-0000-000000000000	d222bcc3-7706-417a-8fe4-5a469196eeb1	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:18:52.410909+00	
00000000-0000-0000-0000-000000000000	16abf937-e745-406a-aafe-b5807b8e25fa	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:18:52.475512+00	
00000000-0000-0000-0000-000000000000	ecc1342d-40f3-4fbb-81ac-610358133432	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:20:16.06007+00	
00000000-0000-0000-0000-000000000000	0bfcdbcd-ac64-4085-a4a1-99b52df9ad4b	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:20:16.063453+00	
00000000-0000-0000-0000-000000000000	6da7c4fe-04da-472a-8170-1018eda4f6a0	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 16:20:16.426308+00	
00000000-0000-0000-0000-000000000000	7cf80436-9faf-4395-99e0-80d462c57efe	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:16:00.749441+00	
00000000-0000-0000-0000-000000000000	1fc3be60-741f-42ee-a66f-a110a5712d89	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:16:00.758755+00	
00000000-0000-0000-0000-000000000000	4fd1ff89-79c7-49b1-91f5-8f7503f46f04	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-03 17:29:57.838624+00	
00000000-0000-0000-0000-000000000000	17644438-742e-47f1-9ab9-9ea22133c5cc	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-03 17:30:01.680798+00	
00000000-0000-0000-0000-000000000000	1334397c-fb04-4962-b80b-0f92019c28bb	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-03 17:33:59.558854+00	
00000000-0000-0000-0000-000000000000	8956de85-3a14-4cb0-b29c-b5dce5bad2df	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:42:32.543769+00	
00000000-0000-0000-0000-000000000000	c33a0959-2291-4029-9b67-310447df1d81	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:42:32.545014+00	
00000000-0000-0000-0000-000000000000	14fc5ca3-9497-4307-99a0-9def37002d71	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:42:32.714663+00	
00000000-0000-0000-0000-000000000000	1b39f7ac-274c-48ad-b6da-fcd180ab9e49	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:44:32.227168+00	
00000000-0000-0000-0000-000000000000	80a1760b-ba5f-478a-8fb8-af6433e0ddc7	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:44:32.231366+00	
00000000-0000-0000-0000-000000000000	3e90d4c5-adef-40ed-afa0-2f2e7de6633b	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-03 17:44:32.256952+00	
00000000-0000-0000-0000-000000000000	9f85c2b6-ad95-42c1-b635-1b7ce4e54cfd	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-03 17:45:53.687842+00	
00000000-0000-0000-0000-000000000000	610c1d69-c31d-4c6a-a232-37aae6625327	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 03:16:22.652206+00	
00000000-0000-0000-0000-000000000000	775d94d8-b834-4ed3-92f8-1ac9037225ec	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 03:16:22.666626+00	
00000000-0000-0000-0000-000000000000	c248eff8-7e94-489e-8c8e-3fcad55fbd7d	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 03:16:22.750088+00	
00000000-0000-0000-0000-000000000000	0fafc398-b45e-4996-9d8f-2993d88397ac	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 06:21:00.604731+00	
00000000-0000-0000-0000-000000000000	47ddef67-4f86-47f7-b8b3-b73aba272854	{"action":"token_revoked","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 06:21:00.623853+00	
00000000-0000-0000-0000-000000000000	f26597e4-a764-4b46-8abd-96831da75221	{"action":"token_refreshed","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-04 06:21:00.981715+00	
00000000-0000-0000-0000-000000000000	54fc26c8-2e33-47e8-8e55-85c4326d20fd	{"action":"logout","actor_id":"c8b0da7e-4cde-4691-9783-7e2c2f6d32e0","actor_username":"comp.dmce12@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-04 06:21:09.234295+00	
00000000-0000-0000-0000-000000000000	d37b6266-aa6e-42d7-9fb5-c38d63c618eb	{"action":"login","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-04 06:24:56.793023+00	
00000000-0000-0000-0000-000000000000	f6192ff9-3f77-43e1-a453-f2edbb5844ba	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 05:12:35.238552+00	
00000000-0000-0000-0000-000000000000	5fcc2fb2-3258-43c3-ab55-56baf7a84570	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 05:12:35.256966+00	
00000000-0000-0000-0000-000000000000	dd06f846-37b2-4107-a627-ea7e7416bbc4	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 06:55:27.999194+00	
00000000-0000-0000-0000-000000000000	54c213fb-4c9b-4369-b0e4-d5d4ac0dfa5a	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 06:55:28.017789+00	
00000000-0000-0000-0000-000000000000	19bc6d11-b3b9-434f-927d-11e39bc16cbc	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 06:55:28.357812+00	
00000000-0000-0000-0000-000000000000	f589e693-2761-4014-a3f2-c2a68344b64f	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 14:35:24.938983+00	
00000000-0000-0000-0000-000000000000	ef68cf11-21d8-4ca3-a5b9-281e2f564022	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 14:35:24.961268+00	
00000000-0000-0000-0000-000000000000	58b18dee-1cdc-4d31-8237-e9b8efa05241	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-05 14:35:25.026117+00	
00000000-0000-0000-0000-000000000000	681bf7dd-c6e2-4e0d-a484-c087461c923b	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-14 00:18:19.888632+00	
00000000-0000-0000-0000-000000000000	e04b28cd-38e2-4b26-9439-723b7cb0a2d8	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-14 00:18:19.913403+00	
00000000-0000-0000-0000-000000000000	0ba9ff07-8cc9-4e3d-990b-7736de3feecc	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-14 00:18:19.972114+00	
00000000-0000-0000-0000-000000000000	ddebe728-bbfa-408f-bed7-015d30783b52	{"action":"token_refreshed","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-14 13:33:27.287591+00	
00000000-0000-0000-0000-000000000000	0dfe5ba1-259e-4d03-b0f5-f18e46656add	{"action":"token_revoked","actor_id":"39f8e7c3-04a5-49cd-8cc9-acca87e7e51e","actor_username":"patilom4634@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-14 13:33:27.30946+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	{"sem": 4, "sub": "c8b0da7e-4cde-4691-9783-7e2c2f6d32e0", "role": "student", "email": "comp.dmce12@gmail.com", "abc_id": "ABC1122", "fac_id": null, "email_verified": true, "phone_verified": false}	email	2025-04-14 11:11:16.154555+00	2025-04-14 11:11:16.154601+00	2025-05-01 09:53:41.241992+00	366c5f2f-9b66-4809-a47c-3d7b19b5b950
39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	{"sem": null, "sub": "39f8e7c3-04a5-49cd-8cc9-acca87e7e51e", "role": "professor", "email": "patilom4634@gmail.com", "abc_id": null, "fac_id": "FAC001", "email_verified": false, "phone_verified": false}	email	2025-05-08 12:19:27.140835+00	2025-05-08 12:19:27.140899+00	2025-05-08 12:19:27.140899+00	9b9797e7-7334-4ed1-bb39-bb82bc77dc47
15099c4c-0d46-4764-81f5-87286f11ef40	15099c4c-0d46-4764-81f5-87286f11ef40	{"sem": 8, "sub": "15099c4c-0d46-4764-81f5-87286f11ef40", "role": "student", "email": "belllaciao1234@gmail.com", "abc_id": "ABC001", "fac_id": null, "email_verified": false, "phone_verified": false}	email	2025-05-08 12:31:16.990201+00	2025-05-08 12:31:16.990248+00	2025-05-08 12:31:16.990248+00	6e685776-11ec-4eaa-902a-602da50878b1
a86a619e-0322-4cb6-839b-c31f560956c8	a86a619e-0322-4cb6-839b-c31f560956c8	{"sem": 8, "sub": "a86a619e-0322-4cb6-839b-c31f560956c8", "role": "student", "email": "belllaciao124@gmail.com", "abc_id": "ABC003", "email_verified": false, "phone_verified": false}	email	2025-05-08 13:26:34.107381+00	2025-05-08 13:26:34.107461+00	2025-05-08 13:26:34.107461+00	c496553c-abc7-43eb-94c3-0f8546042ab5
9a246526-a93a-4b55-a730-847bad987e94	9a246526-a93a-4b55-a730-847bad987e94	{"sem": null, "sub": "9a246526-a93a-4b55-a730-847bad987e94", "role": "professor", "email": "omp349242@gmail.com", "abc_id": null, "fac_id": "FAC0004", "email_verified": false, "phone_verified": false}	email	2025-05-08 13:51:56.534362+00	2025-05-08 13:51:56.534409+00	2025-05-08 13:51:56.534409+00	f7ad108e-e6a4-4781-af9f-31b4567d0efd
a561911b-bc55-4136-8be4-e76ea631df9e	a561911b-bc55-4136-8be4-e76ea631df9e	{"sem": null, "sub": "a561911b-bc55-4136-8be4-e76ea631df9e", "role": "professor", "email": "belllaciao14@gmail.com", "abc_id": null, "fac_id": "FAC0006", "email_verified": false, "phone_verified": false}	email	2025-05-09 18:33:55.956818+00	2025-05-09 18:33:55.956879+00	2025-05-09 18:33:55.956879+00	656baa98-731d-4129-aa00-c4e087c57910
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
79f43deb-39d6-4b2d-8cd6-e6635e67441c	2025-05-08 12:31:17.006526+00	2025-05-08 12:31:17.006526+00	password	a66afc5a-55a4-4c42-8fa1-bcde0c7ab43d
f8bc98c0-1dae-4f84-bb0f-c5c9dc71ef28	2025-05-08 13:26:34.126661+00	2025-05-08 13:26:34.126661+00	password	a4ad85d5-2320-4272-adf3-8f433e18599a
f47736ba-32c3-47bb-b5b1-a8432fb5efd2	2025-05-08 13:51:56.546911+00	2025-05-08 13:51:56.546911+00	password	e70a87c6-46d7-4b90-bb7a-75da401468eb
9c48a07b-b665-43ea-8883-cc7d629d9b0f	2025-05-09 17:59:39.061866+00	2025-05-09 17:59:39.061866+00	password	831bd52b-6be3-45e8-af14-6f33dbe4f863
92a9349c-1096-482f-8fc7-f7f95e8845e4	2025-05-09 18:33:55.972528+00	2025-05-09 18:33:55.972528+00	password	df64f42c-ffa4-4cff-9d43-737cf229e4fd
15685f23-0af8-46fe-9f2b-766260213336	2025-05-09 18:51:50.94185+00	2025-05-09 18:51:50.94185+00	password	00088e75-aa14-41ae-a6c0-f5fc736d6489
d65e38a9-1ad7-45e8-b3f5-f26050dda3e0	2025-05-10 04:46:50.060381+00	2025-05-10 04:46:50.060381+00	password	46c21103-1acb-44b6-ad22-38b22cc41c95
24e6a891-6ad1-4023-b319-6f427fd52207	2025-05-10 05:27:15.840142+00	2025-05-10 05:27:15.840142+00	password	eb2f9eb1-3492-4397-8839-9ba132ed8f20
7b5d82fe-974b-4ea6-a8e3-298f57ae3d77	2025-05-10 05:27:15.845664+00	2025-05-10 05:27:15.845664+00	password	1b089878-368a-4e5b-b4d4-1bf03d69d656
d52847c2-a21e-488b-acb7-2cd2e0fe7623	2025-05-08 12:19:27.154948+00	2025-05-08 12:19:27.154948+00	password	9b47d8fc-3876-4650-8f3d-476c3a3e4605
3b8e246a-82e3-4d3a-95c7-35a728ebd756	2025-04-14 11:11:16.167911+00	2025-04-14 11:11:16.167911+00	password	a057cc43-aeff-410e-8a7b-a1210e5c8281
ebebd9b7-9633-4042-8b3f-843e326995e6	2025-04-14 11:33:57.866228+00	2025-04-14 11:33:57.866228+00	password	98b494ec-5e52-4201-a05b-b1ed02074bc5
d12c63ab-27a9-490d-bb82-7e670dc816a2	2025-04-14 11:57:06.493438+00	2025-04-14 11:57:06.493438+00	password	94433f59-11ac-455c-8acf-1609934d587c
f4e5c3d1-bf7f-4ff4-9c3d-38fc377225ed	2025-04-14 12:36:19.239399+00	2025-04-14 12:36:19.239399+00	password	34a7672f-b93a-4dd5-823c-915e2cbf9e8a
e6d8b773-8f7f-4d89-b6a0-7ce343d4746b	2025-04-14 13:01:08.236032+00	2025-04-14 13:01:08.236032+00	password	fb4ee768-64d7-4c54-abc9-c38d75058cc7
4c1a1bb0-e601-4f29-bba4-1784c8590676	2025-04-14 13:01:19.782252+00	2025-04-14 13:01:19.782252+00	password	e55c79ee-83e9-4220-8287-8f505ff3c8b1
ffdc409f-ad39-4e4c-8940-4cc42f5f6751	2025-05-01 09:14:00.48587+00	2025-05-01 09:14:00.48587+00	password	6d09cf1d-99e8-47a3-997a-fe70ccadebce
5ea74811-be8a-4ed0-be98-f92cb384cb6a	2025-05-01 09:53:41.252374+00	2025-05-01 09:53:41.252374+00	otp	4cfabfa5-c891-4cf0-951f-4ef9c81b64bc
20a0e293-c68e-4d84-bb2c-59738e1a0977	2025-06-13 07:22:57.064736+00	2025-06-13 07:22:57.064736+00	password	a548be55-0ddd-4fcb-8408-d2caea7b09aa
33a0c150-f78e-4964-aa8c-0bbe6acd270e	2025-06-13 07:23:06.50379+00	2025-06-13 07:23:06.50379+00	password	811b5c6f-6fcc-4ae8-aec5-9b2c46a5aebb
ca5265e3-2202-4f8a-b681-813ffa7564e1	2025-06-13 07:23:23.731584+00	2025-06-13 07:23:23.731584+00	password	6b6abf06-de5c-4b35-8b33-435a23a8e167
ca26ec3a-8d2c-49ba-bd69-56e6ea074159	2025-06-13 07:24:21.402874+00	2025-06-13 07:24:21.402874+00	password	b2f8974e-64b4-49a0-96d6-0a7d691c91ac
3cba8c83-71cd-412e-9715-d14007b053fb	2025-06-13 07:24:44.064659+00	2025-06-13 07:24:44.064659+00	password	d352cb62-bf12-4380-b01e-5c849042bbb8
f8436871-2848-4f5e-bf99-ac0218511b04	2025-06-16 08:02:26.430154+00	2025-06-16 08:02:26.430154+00	password	6572d08a-0dda-49fc-8bcc-990fc2c4cf10
49513f9d-e51a-4316-9ace-c1ca2eb40b0e	2025-06-16 08:02:29.675999+00	2025-06-16 08:02:29.675999+00	password	7b340386-ecdb-4fd7-8321-4f19ad01193d
e7f1c3c8-1e1e-438f-b8c0-551c3960a16c	2025-06-16 08:02:32.816977+00	2025-06-16 08:02:32.816977+00	password	8cb21261-dbc7-4da8-a2f0-d0fcbd1a59ed
cf554fc7-6e93-4621-a75b-117c19fbbf0b	2025-09-10 18:40:53.2799+00	2025-09-10 18:40:53.2799+00	password	62827e57-6ae9-4aba-a8f7-dfd47b7fe1b6
9a6c0a56-5151-4917-af53-353348b19cc6	2025-09-12 09:52:37.346385+00	2025-09-12 09:52:37.346385+00	password	4a2efd34-ad9e-4807-9d98-569505e6e8bc
e140b4b7-6abe-4aad-9644-8117987da378	2025-09-12 10:02:25.987607+00	2025-09-12 10:02:25.987607+00	password	a5db9b19-dff5-4805-a753-17409aaacd2b
b9719817-1762-4280-bb30-1d2468799e38	2025-09-12 14:08:34.113351+00	2025-09-12 14:08:34.113351+00	password	be5ed088-e683-4d19-abf2-a68e5baad285
0aaaf120-9e15-40b9-b3b8-67c1e7a3f4f2	2025-09-26 04:56:01.939258+00	2025-09-26 04:56:01.939258+00	password	d658130f-8069-4169-8f3f-65b646e0e6a2
a469c791-788d-4726-8d5a-913efc1ff6b8	2025-09-26 04:56:10.172088+00	2025-09-26 04:56:10.172088+00	password	dadb33be-e43f-41fe-ae73-de5ca245750c
3d74ac0d-b457-481c-94cd-4618f855a502	2025-09-26 04:56:27.51432+00	2025-09-26 04:56:27.51432+00	password	cdfb6aaa-8ae6-44f1-8303-5af3f7edbdf7
3bd62978-131a-4a33-96e6-57d2af3e3579	2025-09-26 05:00:18.8795+00	2025-09-26 05:00:18.8795+00	password	a232f6de-8c56-445c-8e89-95d8fc4595cb
3497a55d-217a-49e7-9327-329cd4eec640	2025-09-28 18:14:47.280328+00	2025-09-28 18:14:47.280328+00	password	573e0a68-5920-437b-b302-381a97dfd9e3
f7be2635-f083-4ae7-8f26-36f2617f48bb	2025-11-16 16:09:25.862208+00	2025-11-16 16:09:25.862208+00	password	aa0474a5-b1a0-496b-9b0e-4d33bbb0b8d8
3fbfad51-8330-46c5-a1e7-b8aeb2931f4b	2025-11-16 16:31:05.822558+00	2025-11-16 16:31:05.822558+00	password	2360bea3-29b3-46fc-b414-a5d7a5411d7d
cbe9e110-d208-4db5-98a7-19d7078f5d0f	2025-11-16 16:31:20.497049+00	2025-11-16 16:31:20.497049+00	password	741bf8af-7d78-4298-b6cf-65e21e84cdea
8a322258-3086-4f66-8bb3-21477fba2a5c	2025-11-16 16:31:46.290472+00	2025-11-16 16:31:46.290472+00	password	de5ca7e1-6df4-4c0b-9faa-2844245e02f7
354f77a3-793d-49cc-82ae-f1171ef4d584	2025-11-16 16:32:00.465846+00	2025-11-16 16:32:00.465846+00	password	3d60a75e-5a48-45e3-9941-2566a20a4688
f27838ed-da4b-4bf0-b9f6-190d847b6f7e	2025-11-17 05:48:33.799403+00	2025-11-17 05:48:33.799403+00	password	2e9b571e-febe-42b1-a7b3-55665bb9b0c5
81ee22c6-9193-41d8-92ab-101ad7fe83e5	2025-11-24 05:46:15.071359+00	2025-11-24 05:46:15.071359+00	password	1d9678ae-1e93-4843-b70f-0c0dfeec7406
860a2b15-ac5f-413f-8d7d-6924229f15b5	2025-11-24 05:56:16.240867+00	2025-11-24 05:56:16.240867+00	password	a33ccea9-27bf-4a38-9f32-b0de13f7eb64
3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2	2025-12-16 07:40:02.877428+00	2025-12-16 07:40:02.877428+00	password	340de1e1-6577-413e-8ca5-d40ddc73702a
3f06d970-cb17-4866-b457-f408a56e0aba	2026-02-03 17:29:57.88148+00	2026-02-03 17:29:57.88148+00	password	2fd5cc2c-46cd-4b42-b9aa-6066852a55df
1bb75c15-023f-4021-86c8-aa8928acd970	2026-02-03 17:30:01.684788+00	2026-02-03 17:30:01.684788+00	password	8347bf64-6ddf-4eb4-9ea6-b034c8fb1bcb
b5a839c5-8fab-4f97-bff6-eb69abc7563d	2026-02-03 17:33:59.603319+00	2026-02-03 17:33:59.603319+00	password	b4721f0a-c3e0-445f-a472-70a6bb708199
3893d690-53e5-43bf-bc6a-2885b9cce311	2026-02-03 17:45:53.699808+00	2026-02-03 17:45:53.699808+00	password	6be58c8a-958a-4d1e-990a-7d53e26f6fb3
6024052c-5a36-4c65-8fdd-4a127d2e5951	2026-02-04 06:24:56.819254+00	2026-02-04 06:24:56.819254+00	password	af9d152a-8802-4413-8bac-699f4d7fc41b
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
4617c2d6-6d34-49f1-a34a-1695a2b2e8e2	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	email_change_token_new	c0afdd4b20f437021ad801cce8b04649eeb9038fd9b28f94b72ea614	cp0705@gmail.com	2025-05-01 10:01:49.92268	2025-05-01 10:01:49.92268
8dee309a-afae-4406-9ac4-146765b03dcf	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	email_change_token_new	8e41fbceedd08a6a979b3e5aaa5f246bce5f7061447dcecee80fc679	patilom434@gmail.com	2025-05-08 12:19:59.450514	2025-05-08 12:19:59.450514
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	339	0AXWe8UcojgT3scgPqBoOg	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-05-01 09:14:00.481346+00	2025-05-01 09:14:00.481346+00	\N	ffdc409f-ad39-4e4c-8940-4cc42f5f6751
00000000-0000-0000-0000-000000000000	341	nwCDLsSmRXegwaF2kpLcWA	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-05-01 09:53:41.248292+00	2025-05-01 09:53:41.248292+00	\N	5ea74811-be8a-4ed0-be98-f92cb384cb6a
00000000-0000-0000-0000-000000000000	405	21QtIj4WRzyFvPOsKBII0A	a561911b-bc55-4136-8be4-e76ea631df9e	f	2025-05-09 18:33:55.969972+00	2025-05-09 18:33:55.969972+00	\N	92a9349c-1096-482f-8fc7-f7f95e8845e4
00000000-0000-0000-0000-000000000000	412	Fbeiz5etvO7NKSJ0gEzvDw	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-05-10 05:27:15.835906+00	2025-05-10 05:27:15.835906+00	\N	24e6a891-6ad1-4023-b319-6f427fd52207
00000000-0000-0000-0000-000000000000	414	_guOruebQ5BHyuama_x5tA	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-10 05:41:45.991251+00	2025-05-10 06:55:53.202977+00	haiz0MEksDEoRpsJWAAwsQ	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	409	98Isau-A2xAQWbHVNV01wg	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-09 18:51:50.940741+00	2025-05-10 06:56:44.319629+00	\N	15685f23-0af8-46fe-9f2b-766260213336
00000000-0000-0000-0000-000000000000	380	YJMhYalAmTyksdqOvdOhDw	15099c4c-0d46-4764-81f5-87286f11ef40	f	2025-05-08 12:31:17.003727+00	2025-05-08 12:31:17.003727+00	\N	79f43deb-39d6-4b2d-8cd6-e6635e67441c
00000000-0000-0000-0000-000000000000	416	rUlKaREFkLzKtaHOze02Nw	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-10 06:55:53.20825+00	2025-05-10 09:17:29.514934+00	_guOruebQ5BHyuama_x5tA	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	417	JM9lNQvWnBO00nESC6WH1Q	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-10 06:56:44.320637+00	2025-05-13 20:17:45.841715+00	98Isau-A2xAQWbHVNV01wg	15685f23-0af8-46fe-9f2b-766260213336
00000000-0000-0000-0000-000000000000	421	fx2dgoz6vndc	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-05-13 20:17:45.862234+00	2025-05-13 20:17:45.862234+00	JM9lNQvWnBO00nESC6WH1Q	15685f23-0af8-46fe-9f2b-766260213336
00000000-0000-0000-0000-000000000000	389	pFZWu-SM-EQ5e5NFE_d_hA	9a246526-a93a-4b55-a730-847bad987e94	f	2025-05-08 13:51:56.543362+00	2025-05-08 13:51:56.543362+00	\N	f47736ba-32c3-47bb-b5b1-a8432fb5efd2
00000000-0000-0000-0000-000000000000	419	ycVhEpNaAen2bK15D4uUjQ	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-10 09:17:29.516163+00	2025-05-16 14:28:18.02867+00	rUlKaREFkLzKtaHOze02Nw	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	236	KxgYx-1O_mmenV-2lnitmQ	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 11:11:16.165696+00	2025-04-14 11:11:16.165696+00	\N	3b8e246a-82e3-4d3a-95c7-35a728ebd756
00000000-0000-0000-0000-000000000000	238	DFCTN1-LwIYubTdG8pcp3A	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 11:33:57.861107+00	2025-04-14 11:33:57.861107+00	\N	ebebd9b7-9633-4042-8b3f-843e326995e6
00000000-0000-0000-0000-000000000000	240	KhdAMwVQNkmCG7IY_sE7bQ	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 11:57:06.486711+00	2025-04-14 11:57:06.486711+00	\N	d12c63ab-27a9-490d-bb82-7e670dc816a2
00000000-0000-0000-0000-000000000000	242	c3LEgSlOXBSmVJqZeT6Yfw	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 13:01:08.229177+00	2025-04-14 13:01:08.229177+00	\N	e6d8b773-8f7f-4d89-b6a0-7ce343d4746b
00000000-0000-0000-0000-000000000000	243	LVKFGKHC5_jBbPrTpOavyQ	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 13:01:19.781004+00	2025-04-14 13:01:19.781004+00	\N	4c1a1bb0-e601-4f29-bba4-1784c8590676
00000000-0000-0000-0000-000000000000	378	FrFjEhoOUekaap2kw9Bh-Q	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-05-08 12:19:27.15198+00	2025-05-08 12:19:27.15198+00	\N	d52847c2-a21e-488b-acb7-2cd2e0fe7623
00000000-0000-0000-0000-000000000000	381	gGz-X56fxEMhwgAaYLz6xA	a86a619e-0322-4cb6-839b-c31f560956c8	f	2025-05-08 13:26:34.122086+00	2025-05-08 13:26:34.122086+00	\N	f8bc98c0-1dae-4f84-bb0f-c5c9dc71ef28
00000000-0000-0000-0000-000000000000	402	_JbrZZYbNPMvcO4fv6aJ1A	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-09 17:59:39.058715+00	2025-05-09 18:47:40.703005+00	\N	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	407	bxQRQVJUXqyp2qDc7XFF0Q	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-09 18:47:40.705649+00	2025-05-10 04:46:10.757234+00	_JbrZZYbNPMvcO4fv6aJ1A	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	413	4pBMTXRSYhKl1R9GN-FBiA	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-05-10 05:27:15.838137+00	2025-05-10 05:27:15.838137+00	\N	7b5d82fe-974b-4ea6-a8e3-298f57ae3d77
00000000-0000-0000-0000-000000000000	410	haiz0MEksDEoRpsJWAAwsQ	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-05-10 04:46:10.766477+00	2025-05-10 05:41:45.988937+00	bxQRQVJUXqyp2qDc7XFF0Q	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	411	5SqTaR8pYcn7YU-RdLNW_w	15099c4c-0d46-4764-81f5-87286f11ef40	t	2025-05-10 04:46:50.058511+00	2025-05-10 05:47:07.737719+00	\N	d65e38a9-1ad7-45e8-b3f5-f26050dda3e0
00000000-0000-0000-0000-000000000000	415	cUYJS-MGxE6yBHnlLUFxqA	15099c4c-0d46-4764-81f5-87286f11ef40	t	2025-05-10 05:47:07.738986+00	2025-05-10 07:44:27.492765+00	5SqTaR8pYcn7YU-RdLNW_w	d65e38a9-1ad7-45e8-b3f5-f26050dda3e0
00000000-0000-0000-0000-000000000000	418	Mg_1WRodaBBuo8xF0f4kCQ	15099c4c-0d46-4764-81f5-87286f11ef40	t	2025-05-10 07:44:27.495397+00	2025-05-11 16:12:28.439783+00	cUYJS-MGxE6yBHnlLUFxqA	d65e38a9-1ad7-45e8-b3f5-f26050dda3e0
00000000-0000-0000-0000-000000000000	420	XJFsN5s43Ae1walw3ypVAg	15099c4c-0d46-4764-81f5-87286f11ef40	f	2025-05-11 16:12:28.459627+00	2025-05-11 16:12:28.459627+00	Mg_1WRodaBBuo8xF0f4kCQ	d65e38a9-1ad7-45e8-b3f5-f26050dda3e0
00000000-0000-0000-0000-000000000000	422	uquzrzn4i26t	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-05-16 14:28:18.056941+00	2025-05-16 14:28:18.056941+00	ycVhEpNaAen2bK15D4uUjQ	9c48a07b-b665-43ea-8883-cc7d629d9b0f
00000000-0000-0000-0000-000000000000	241	2tZfgjl_QzVEW-s9Ky6bHA	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-04-14 12:36:19.230423+00	2025-04-14 12:36:19.230423+00	\N	f4e5c3d1-bf7f-4ff4-9c3d-38fc377225ed
00000000-0000-0000-0000-000000000000	423	a4ojkrpm4v47	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-13 07:22:57.053274+00	2025-06-13 07:22:57.053274+00	\N	20a0e293-c68e-4d84-bb2c-59738e1a0977
00000000-0000-0000-0000-000000000000	424	ie4mjfnkkglg	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-13 07:23:06.502322+00	2025-06-13 07:23:06.502322+00	\N	33a0c150-f78e-4964-aa8c-0bbe6acd270e
00000000-0000-0000-0000-000000000000	425	am7sr4iunayv	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-13 07:23:23.728993+00	2025-06-13 07:23:23.728993+00	\N	ca5265e3-2202-4f8a-b681-813ffa7564e1
00000000-0000-0000-0000-000000000000	426	trdmpmsffph7	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-13 07:24:21.401709+00	2025-06-13 07:24:21.401709+00	\N	ca26ec3a-8d2c-49ba-bd69-56e6ea074159
00000000-0000-0000-0000-000000000000	427	nlyxtoecikih	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-13 07:24:44.058996+00	2025-06-13 07:24:44.058996+00	\N	3cba8c83-71cd-412e-9715-d14007b053fb
00000000-0000-0000-0000-000000000000	435	qgskqqg2clul	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-16 08:02:26.428085+00	2025-06-16 08:02:26.428085+00	\N	f8436871-2848-4f5e-bf99-ac0218511b04
00000000-0000-0000-0000-000000000000	436	pia6tk3h76ef	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-06-16 08:02:29.667599+00	2025-06-16 08:02:29.667599+00	\N	49513f9d-e51a-4316-9ace-c1ca2eb40b0e
00000000-0000-0000-0000-000000000000	437	rdu6hsitn2yy	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-06-16 08:02:32.814654+00	2025-09-10 18:40:32.161726+00	\N	e7f1c3c8-1e1e-438f-b8c0-551c3960a16c
00000000-0000-0000-0000-000000000000	438	357f5nkntnsj	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-09-10 18:40:32.167409+00	2025-09-10 18:40:32.167409+00	rdu6hsitn2yy	e7f1c3c8-1e1e-438f-b8c0-551c3960a16c
00000000-0000-0000-0000-000000000000	439	lfztrmatu6yj	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-09-10 18:40:53.277229+00	2025-09-10 18:40:53.277229+00	\N	cf554fc7-6e93-4621-a75b-117c19fbbf0b
00000000-0000-0000-0000-000000000000	445	zte3btgofaq5	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-09-12 09:52:37.324428+00	2025-09-12 09:52:37.324428+00	\N	9a6c0a56-5151-4917-af53-353348b19cc6
00000000-0000-0000-0000-000000000000	448	4b2wjzfmjulo	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-09-12 14:08:34.111266+00	2025-09-12 14:08:34.111266+00	\N	b9719817-1762-4280-bb30-1d2468799e38
00000000-0000-0000-0000-000000000000	449	gtex52bhbkb5	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-09-26 04:56:01.928533+00	2025-09-26 04:56:01.928533+00	\N	0aaaf120-9e15-40b9-b3b8-67c1e7a3f4f2
00000000-0000-0000-0000-000000000000	450	gyd27cnwf5vu	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-09-26 04:56:10.170897+00	2025-09-26 04:56:10.170897+00	\N	a469c791-788d-4726-8d5a-913efc1ff6b8
00000000-0000-0000-0000-000000000000	452	2etbvysz2pxt	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-09-26 05:00:18.873398+00	2025-09-26 10:57:36.540918+00	\N	3bd62978-131a-4a33-96e6-57d2af3e3579
00000000-0000-0000-0000-000000000000	454	bq3ihhq2iucz	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-09-28 18:14:47.238272+00	2025-09-28 18:14:47.238272+00	\N	3497a55d-217a-49e7-9327-329cd4eec640
00000000-0000-0000-0000-000000000000	453	s7oi7shl3lll	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-09-26 10:57:36.560271+00	2025-10-04 14:08:24.99474+00	2etbvysz2pxt	3bd62978-131a-4a33-96e6-57d2af3e3579
00000000-0000-0000-0000-000000000000	451	2qe2n6vy5fsb	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-09-26 04:56:27.513092+00	2025-10-06 11:56:54.933137+00	\N	3d74ac0d-b457-481c-94cd-4618f855a502
00000000-0000-0000-0000-000000000000	456	uqm2wn37lg4y	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-10-06 11:56:54.951799+00	2025-10-06 11:56:54.951799+00	2qe2n6vy5fsb	3d74ac0d-b457-481c-94cd-4618f855a502
00000000-0000-0000-0000-000000000000	455	czl7hhnwe6ul	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-10-04 14:08:25.014184+00	2025-10-15 07:26:01.936442+00	s7oi7shl3lll	3bd62978-131a-4a33-96e6-57d2af3e3579
00000000-0000-0000-0000-000000000000	446	fqposhyscos5	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-09-12 10:02:25.977343+00	2026-02-03 17:42:32.5463+00	\N	e140b4b7-6abe-4aad-9644-8117987da378
00000000-0000-0000-0000-000000000000	457	pjj5zlye4l7p	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-10-15 07:26:01.95739+00	2025-10-15 07:26:01.95739+00	czl7hhnwe6ul	3bd62978-131a-4a33-96e6-57d2af3e3579
00000000-0000-0000-0000-000000000000	458	zuok4nlukh7u	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-11-16 16:09:25.750638+00	2025-11-16 16:09:25.750638+00	\N	f7be2635-f083-4ae7-8f26-36f2617f48bb
00000000-0000-0000-0000-000000000000	460	5bjjrxy4n34l	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-11-16 16:31:05.815835+00	2025-11-16 16:31:05.815835+00	\N	3fbfad51-8330-46c5-a1e7-b8aeb2931f4b
00000000-0000-0000-0000-000000000000	461	lbwlnf2j3ik4	9a246526-a93a-4b55-a730-847bad987e94	f	2025-11-16 16:31:20.494568+00	2025-11-16 16:31:20.494568+00	\N	cbe9e110-d208-4db5-98a7-19d7078f5d0f
00000000-0000-0000-0000-000000000000	462	2njpgncp6urh	a561911b-bc55-4136-8be4-e76ea631df9e	f	2025-11-16 16:31:46.268525+00	2025-11-16 16:31:46.268525+00	\N	8a322258-3086-4f66-8bb3-21477fba2a5c
00000000-0000-0000-0000-000000000000	463	7ki6dgtugtuo	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2025-11-16 16:32:00.463942+00	2025-11-16 16:32:00.463942+00	\N	354f77a3-793d-49cc-82ae-f1171ef4d584
00000000-0000-0000-0000-000000000000	466	sjadfgbvk6k3	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-11-17 05:48:33.763443+00	2025-11-17 10:30:39.521453+00	\N	f27838ed-da4b-4bf0-b9f6-190d847b6f7e
00000000-0000-0000-0000-000000000000	467	xl62zjlaside	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-11-17 10:30:39.536379+00	2025-11-17 10:30:39.536379+00	sjadfgbvk6k3	f27838ed-da4b-4bf0-b9f6-190d847b6f7e
00000000-0000-0000-0000-000000000000	474	5aw6s3pwcbdl	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-11-24 05:46:15.028547+00	2025-11-24 08:27:39.461562+00	\N	81ee22c6-9193-41d8-92ab-101ad7fe83e5
00000000-0000-0000-0000-000000000000	475	7s2jzvf7imus	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	t	2025-11-24 05:56:16.233873+00	2025-12-12 14:36:55.71295+00	\N	860a2b15-ac5f-413f-8d7d-6924229f15b5
00000000-0000-0000-0000-000000000000	477	ablvmx4nu5bu	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2025-12-12 14:36:55.718347+00	2025-12-12 14:36:55.718347+00	7s2jzvf7imus	860a2b15-ac5f-413f-8d7d-6924229f15b5
00000000-0000-0000-0000-000000000000	476	jvksfghgikhy	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-11-24 08:27:39.477329+00	2025-12-16 08:20:21.014928+00	5aw6s3pwcbdl	81ee22c6-9193-41d8-92ab-101ad7fe83e5
00000000-0000-0000-0000-000000000000	479	cekbjvbbqqw2	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-12-16 07:40:02.841617+00	2025-12-16 08:32:22.299745+00	\N	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	481	mhcwjg5wsm6s	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-12-16 08:32:22.306563+00	2025-12-19 06:11:40.60308+00	cekbjvbbqqw2	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	482	f3m4vw3vc2oj	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-12-19 06:11:40.625552+00	2026-01-24 08:47:30.125647+00	mhcwjg5wsm6s	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	480	tbgbkf6vm7sr	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2025-12-16 08:20:21.029498+00	2026-02-03 16:18:52.412194+00	jvksfghgikhy	81ee22c6-9193-41d8-92ab-101ad7fe83e5
00000000-0000-0000-0000-000000000000	483	yleiuqspr773	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-01-24 08:47:30.138908+00	2026-02-03 16:20:16.064274+00	f3m4vw3vc2oj	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	485	2ckztaozw3pj	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-03 16:20:16.065047+00	2026-02-03 17:16:00.761243+00	yleiuqspr773	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	486	l3gl3jaen24r	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-03 17:16:00.770591+00	2026-02-03 17:16:00.770591+00	2ckztaozw3pj	3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2
00000000-0000-0000-0000-000000000000	487	rraml3synyp5	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-03 17:29:57.874161+00	2026-02-03 17:29:57.874161+00	\N	3f06d970-cb17-4866-b457-f408a56e0aba
00000000-0000-0000-0000-000000000000	489	7xb46vd6xvh6	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-03 17:33:59.592392+00	2026-02-03 17:33:59.592392+00	\N	b5a839c5-8fab-4f97-bff6-eb69abc7563d
00000000-0000-0000-0000-000000000000	490	wqv4zzqplvrd	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	f	2026-02-03 17:42:32.548775+00	2026-02-03 17:42:32.548775+00	fqposhyscos5	e140b4b7-6abe-4aad-9644-8117987da378
00000000-0000-0000-0000-000000000000	484	pp3cacnh7hrq	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-03 16:18:52.426181+00	2026-02-03 17:44:32.232065+00	tbgbkf6vm7sr	81ee22c6-9193-41d8-92ab-101ad7fe83e5
00000000-0000-0000-0000-000000000000	491	unwycjc6xuve	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-03 17:44:32.236882+00	2026-02-03 17:44:32.236882+00	pp3cacnh7hrq	81ee22c6-9193-41d8-92ab-101ad7fe83e5
00000000-0000-0000-0000-000000000000	492	nkd7xwuvrvpf	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-03 17:45:53.694404+00	2026-02-04 03:16:22.668003+00	\N	3893d690-53e5-43bf-bc6a-2885b9cce311
00000000-0000-0000-0000-000000000000	493	cuwtonriz527	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-04 03:16:22.682689+00	2026-02-05 05:12:35.258429+00	nkd7xwuvrvpf	3893d690-53e5-43bf-bc6a-2885b9cce311
00000000-0000-0000-0000-000000000000	496	nvho5qmjwmrg	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-05 05:12:35.274156+00	2026-02-05 06:55:28.02321+00	cuwtonriz527	3893d690-53e5-43bf-bc6a-2885b9cce311
00000000-0000-0000-0000-000000000000	497	hh527jlj4npu	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-05 06:55:28.037562+00	2026-02-05 06:55:28.037562+00	nvho5qmjwmrg	3893d690-53e5-43bf-bc6a-2885b9cce311
00000000-0000-0000-0000-000000000000	495	y5kzut5o5oow	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-04 06:24:56.813239+00	2026-02-05 14:35:24.961937+00	\N	6024052c-5a36-4c65-8fdd-4a127d2e5951
00000000-0000-0000-0000-000000000000	498	rtvafman6llx	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-05 14:35:24.977626+00	2026-02-05 14:35:24.977626+00	y5kzut5o5oow	6024052c-5a36-4c65-8fdd-4a127d2e5951
00000000-0000-0000-0000-000000000000	488	bzvlf4upjmhs	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-03 17:30:01.683026+00	2026-02-14 00:18:19.915886+00	\N	1bb75c15-023f-4021-86c8-aa8928acd970
00000000-0000-0000-0000-000000000000	499	u7ci4ydwerlq	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	t	2026-02-14 00:18:19.934933+00	2026-02-14 13:33:27.312598+00	bzvlf4upjmhs	1bb75c15-023f-4021-86c8-aa8928acd970
00000000-0000-0000-0000-000000000000	500	tliwt2w7lsor	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	f	2026-02-14 13:33:27.331329+00	2026-02-14 13:33:27.331329+00	u7ci4ydwerlq	1bb75c15-023f-4021-86c8-aa8928acd970
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
d52847c2-a21e-488b-acb7-2cd2e0fe7623	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-05-08 12:19:27.15102+00	2025-05-08 12:19:27.15102+00	\N	aal1	\N	\N	python-httpx/0.28.1	152.58.1.155	\N	\N	\N	\N	\N
79f43deb-39d6-4b2d-8cd6-e6635e67441c	15099c4c-0d46-4764-81f5-87286f11ef40	2025-05-08 12:31:17.002423+00	2025-05-08 12:31:17.002423+00	\N	aal1	\N	\N	python-httpx/0.28.1	152.58.1.155	\N	\N	\N	\N	\N
f8bc98c0-1dae-4f84-bb0f-c5c9dc71ef28	a86a619e-0322-4cb6-839b-c31f560956c8	2025-05-08 13:26:34.120019+00	2025-05-08 13:26:34.120019+00	\N	aal1	\N	\N	python-httpx/0.28.1	152.58.0.116	\N	\N	\N	\N	\N
f47736ba-32c3-47bb-b5b1-a8432fb5efd2	9a246526-a93a-4b55-a730-847bad987e94	2025-05-08 13:51:56.541738+00	2025-05-08 13:51:56.541738+00	\N	aal1	\N	\N	python-httpx/0.28.1	152.58.0.116	\N	\N	\N	\N	\N
9c48a07b-b665-43ea-8883-cc7d629d9b0f	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-05-09 17:59:39.055985+00	2025-05-16 14:28:18.091884+00	\N	aal1	\N	2025-05-16 14:28:18.091796	ktor-client	152.57.18.35	\N	\N	\N	\N	\N
92a9349c-1096-482f-8fc7-f7f95e8845e4	a561911b-bc55-4136-8be4-e76ea631df9e	2025-05-09 18:33:55.968264+00	2025-05-09 18:33:55.968264+00	\N	aal1	\N	\N	python-httpx/0.28.1	152.58.43.235	\N	\N	\N	\N	\N
24e6a891-6ad1-4023-b319-6f427fd52207	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-05-10 05:27:15.832398+00	2025-05-10 05:27:15.832398+00	\N	aal1	\N	\N	ktor-client	152.57.17.42	\N	\N	\N	\N	\N
7b5d82fe-974b-4ea6-a8e3-298f57ae3d77	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-05-10 05:27:15.835512+00	2025-05-10 05:27:15.835512+00	\N	aal1	\N	\N	ktor-client	152.57.17.42	\N	\N	\N	\N	\N
d65e38a9-1ad7-45e8-b3f5-f26050dda3e0	15099c4c-0d46-4764-81f5-87286f11ef40	2025-05-10 04:46:50.054354+00	2025-05-11 16:12:28.51684+00	\N	aal1	\N	2025-05-11 16:12:28.516764	ktor-client	106.193.196.107	\N	\N	\N	\N	\N
15685f23-0af8-46fe-9f2b-766260213336	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-05-09 18:51:50.940105+00	2025-05-13 20:17:45.921373+00	\N	aal1	\N	2025-05-13 20:17:45.921295	ktor-client	49.15.250.214	\N	\N	\N	\N	\N
ffdc409f-ad39-4e4c-8940-4cc42f5f6751	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-05-01 09:14:00.477773+00	2025-05-01 09:14:00.477773+00	\N	aal1	\N	\N	ktor-client	49.15.234.72	\N	\N	\N	\N	\N
5ea74811-be8a-4ed0-be98-f92cb384cb6a	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-05-01 09:53:41.245173+00	2025-05-01 09:53:41.245173+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36	49.15.231.202	\N	\N	\N	\N	\N
3b8e246a-82e3-4d3a-95c7-35a728ebd756	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 11:11:16.164287+00	2025-04-14 11:11:16.164287+00	\N	aal1	\N	\N	python-httpx/0.28.1	1.39.30.154	\N	\N	\N	\N	\N
ebebd9b7-9633-4042-8b3f-843e326995e6	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 11:33:57.85956+00	2025-04-14 11:33:57.85956+00	\N	aal1	\N	\N	ktor-client	1.39.30.156	\N	\N	\N	\N	\N
d12c63ab-27a9-490d-bb82-7e670dc816a2	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 11:57:06.483315+00	2025-04-14 11:57:06.483315+00	\N	aal1	\N	\N	ktor-client	1.39.30.136	\N	\N	\N	\N	\N
f4e5c3d1-bf7f-4ff4-9c3d-38fc377225ed	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 12:36:19.227311+00	2025-04-14 12:36:19.227311+00	\N	aal1	\N	\N	ktor-client	106.78.37.44	\N	\N	\N	\N	\N
e6d8b773-8f7f-4d89-b6a0-7ce343d4746b	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 13:01:08.226241+00	2025-04-14 13:01:08.226241+00	\N	aal1	\N	\N	ktor-client	106.78.36.62	\N	\N	\N	\N	\N
4c1a1bb0-e601-4f29-bba4-1784c8590676	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-04-14 13:01:19.780329+00	2025-04-14 13:01:19.780329+00	\N	aal1	\N	\N	ktor-client	106.78.36.62	\N	\N	\N	\N	\N
20a0e293-c68e-4d84-bb2c-59738e1a0977	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-13 07:22:57.044122+00	2025-06-13 07:22:57.044122+00	\N	aal1	\N	\N	ktor-client	223.233.82.96	\N	\N	\N	\N	\N
33a0c150-f78e-4964-aa8c-0bbe6acd270e	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-13 07:23:06.501665+00	2025-06-13 07:23:06.501665+00	\N	aal1	\N	\N	ktor-client	223.233.82.96	\N	\N	\N	\N	\N
ca5265e3-2202-4f8a-b681-813ffa7564e1	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-13 07:23:23.72781+00	2025-06-13 07:23:23.72781+00	\N	aal1	\N	\N	ktor-client	223.233.82.96	\N	\N	\N	\N	\N
ca26ec3a-8d2c-49ba-bd69-56e6ea074159	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-13 07:24:21.400968+00	2025-06-13 07:24:21.400968+00	\N	aal1	\N	\N	ktor-client	223.233.82.96	\N	\N	\N	\N	\N
3cba8c83-71cd-412e-9715-d14007b053fb	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-13 07:24:44.058256+00	2025-06-13 07:24:44.058256+00	\N	aal1	\N	\N	ktor-client	223.233.82.96	\N	\N	\N	\N	\N
f8436871-2848-4f5e-bf99-ac0218511b04	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-16 08:02:26.426081+00	2025-06-16 08:02:26.426081+00	\N	aal1	\N	\N	ktor-client	103.39.251.238	\N	\N	\N	\N	\N
49513f9d-e51a-4316-9ace-c1ca2eb40b0e	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-16 08:02:29.666825+00	2025-06-16 08:02:29.666825+00	\N	aal1	\N	\N	ktor-client	103.39.251.238	\N	\N	\N	\N	\N
e7f1c3c8-1e1e-438f-b8c0-551c3960a16c	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-06-16 08:02:32.813829+00	2025-09-10 18:40:32.394768+00	\N	aal1	\N	2025-09-10 18:40:32.394677	ktor-client	27.97.87.195	\N	\N	\N	\N	\N
cf554fc7-6e93-4621-a75b-117c19fbbf0b	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-10 18:40:53.275353+00	2025-09-10 18:40:53.275353+00	\N	aal1	\N	\N	ktor-client	27.97.87.195	\N	\N	\N	\N	\N
9a6c0a56-5151-4917-af53-353348b19cc6	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-12 09:52:37.300701+00	2025-09-12 09:52:37.300701+00	\N	aal1	\N	\N	ktor-client	47.11.9.123	\N	\N	\N	\N	\N
f27838ed-da4b-4bf0-b9f6-190d847b6f7e	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-11-17 05:48:33.722323+00	2025-11-17 10:30:39.581815+00	\N	aal1	\N	2025-11-17 10:30:39.581727	ktor-client	47.11.11.96	\N	\N	\N	\N	\N
b9719817-1762-4280-bb30-1d2468799e38	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-09-12 14:08:34.105479+00	2025-09-12 14:08:34.105479+00	\N	aal1	\N	\N	ktor-client	152.58.46.23	\N	\N	\N	\N	\N
0aaaf120-9e15-40b9-b3b8-67c1e7a3f4f2	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-26 04:56:01.923414+00	2025-09-26 04:56:01.923414+00	\N	aal1	\N	\N	ktor-client	152.58.6.23	\N	\N	\N	\N	\N
a469c791-788d-4726-8d5a-913efc1ff6b8	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-26 04:56:10.169746+00	2025-09-26 04:56:10.169746+00	\N	aal1	\N	\N	ktor-client	152.58.6.23	\N	\N	\N	\N	\N
3497a55d-217a-49e7-9327-329cd4eec640	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-09-28 18:14:47.217833+00	2025-09-28 18:14:47.217833+00	\N	aal1	\N	\N	ktor-client	47.11.8.165	\N	\N	\N	\N	\N
3d74ac0d-b457-481c-94cd-4618f855a502	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-26 04:56:27.512298+00	2025-10-06 11:56:55.001348+00	\N	aal1	\N	2025-10-06 11:56:55.001252	ktor-client	152.59.6.221	\N	\N	\N	\N	\N
3893d690-53e5-43bf-bc6a-2885b9cce311	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2026-02-03 17:45:53.690448+00	2026-02-05 06:55:28.361872+00	\N	aal1	\N	2026-02-05 06:55:28.36122	ktor-client	157.33.243.158	\N	\N	\N	\N	\N
3bd62978-131a-4a33-96e6-57d2af3e3579	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-26 05:00:18.868366+00	2025-10-15 07:26:10.528454+00	\N	aal1	\N	2025-10-15 07:26:10.528377	ktor-client	42.108.239.87	\N	\N	\N	\N	\N
f7be2635-f083-4ae7-8f26-36f2617f48bb	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-11-16 16:09:25.646849+00	2025-11-16 16:09:25.646849+00	\N	aal1	\N	\N	ktor-client	49.33.216.42	\N	\N	\N	\N	\N
3fbfad51-8330-46c5-a1e7-b8aeb2931f4b	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-11-16 16:31:05.812713+00	2025-11-16 16:31:05.812713+00	\N	aal1	\N	\N	ktor-client	49.33.192.132	\N	\N	\N	\N	\N
cbe9e110-d208-4db5-98a7-19d7078f5d0f	9a246526-a93a-4b55-a730-847bad987e94	2025-11-16 16:31:20.493799+00	2025-11-16 16:31:20.493799+00	\N	aal1	\N	\N	ktor-client	49.33.192.132	\N	\N	\N	\N	\N
8a322258-3086-4f66-8bb3-21477fba2a5c	a561911b-bc55-4136-8be4-e76ea631df9e	2025-11-16 16:31:46.247534+00	2025-11-16 16:31:46.247534+00	\N	aal1	\N	\N	ktor-client	49.33.192.132	\N	\N	\N	\N	\N
354f77a3-793d-49cc-82ae-f1171ef4d584	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-11-16 16:32:00.461887+00	2025-11-16 16:32:00.461887+00	\N	aal1	\N	\N	ktor-client	49.33.192.132	\N	\N	\N	\N	\N
3a5e51b1-efd9-4a9c-adbb-cf0cd51486f2	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-12-16 07:40:02.783904+00	2026-02-03 17:16:00.783866+00	\N	aal1	\N	2026-02-03 17:16:00.783288	ktor-client	47.11.1.35	\N	\N	\N	\N	\N
3f06d970-cb17-4866-b457-f408a56e0aba	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2026-02-03 17:29:57.857851+00	2026-02-03 17:29:57.857851+00	\N	aal1	\N	\N	ktor-client	47.11.20.154	\N	\N	\N	\N	\N
860a2b15-ac5f-413f-8d7d-6924229f15b5	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-11-24 05:56:16.221224+00	2025-12-12 14:36:55.731105+00	\N	aal1	\N	2025-12-12 14:36:55.730456	ktor-client	47.11.18.167	\N	\N	\N	\N	\N
b5a839c5-8fab-4f97-bff6-eb69abc7563d	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2026-02-03 17:33:59.576508+00	2026-02-03 17:33:59.576508+00	\N	aal1	\N	\N	ktor-client	47.11.17.16	\N	\N	\N	\N	\N
6024052c-5a36-4c65-8fdd-4a127d2e5951	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2026-02-04 06:24:56.803208+00	2026-02-05 14:35:25.028888+00	\N	aal1	\N	2026-02-05 14:35:25.028761	ktor-client	49.32.194.60	\N	\N	\N	\N	\N
e140b4b7-6abe-4aad-9644-8117987da378	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	2025-09-12 10:02:25.969398+00	2026-02-03 17:42:32.716261+00	\N	aal1	\N	2026-02-03 17:42:32.716123	ktor-client	157.32.194.99	\N	\N	\N	\N	\N
81ee22c6-9193-41d8-92ab-101ad7fe83e5	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2025-11-24 05:46:14.981808+00	2026-02-03 17:44:32.258585+00	\N	aal1	\N	2026-02-03 17:44:32.258491	ktor-client	47.11.17.1	\N	\N	\N	\N	\N
1bb75c15-023f-4021-86c8-aa8928acd970	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	2026-02-03 17:30:01.68169+00	2026-02-14 13:33:27.354214+00	\N	aal1	\N	2026-02-14 13:33:27.353588	ktor-client	47.11.13.78	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	a86a619e-0322-4cb6-839b-c31f560956c8	authenticated	authenticated	belllaciao124@gmail.com	$2a$10$kDgFUbVPbdG/N3FVv4iHnOvw8DzMosEOjiCAOxPTmCrtgZdarl79O	2025-05-08 13:26:34.113833+00	\N		\N		\N			\N	2025-05-08 13:26:34.1194+00	{"provider": "email", "providers": ["email"]}	{"sem": 8, "sub": "a86a619e-0322-4cb6-839b-c31f560956c8", "role": "student", "email": "belllaciao124@gmail.com", "abc_id": "ABC003", "email_verified": true, "phone_verified": false}	\N	2025-05-08 13:26:34.093858+00	2025-05-08 13:26:34.125802+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	15099c4c-0d46-4764-81f5-87286f11ef40	authenticated	authenticated	belllaciao1234@gmail.com	$2a$10$jGjPQ3GnFuEfIEH3l1zHqO7OuoigfR2v0fI45tZkjgOU7lbuJnKdy	2025-05-08 12:31:16.995845+00	\N		\N		\N			\N	2025-05-10 04:46:50.054278+00	{"provider": "email", "providers": ["email"]}	{"sem": 8, "sub": "15099c4c-0d46-4764-81f5-87286f11ef40", "role": "student", "email": "belllaciao1234@gmail.com", "abc_id": "ABC001", "email_verified": true, "phone_verified": false}	\N	2025-05-08 12:31:16.985467+00	2025-05-11 16:12:28.47147+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a561911b-bc55-4136-8be4-e76ea631df9e	authenticated	authenticated	belllaciao14@gmail.com	$2a$10$s4FV4QlSzTZtVk3vNkVvmeFKD/P/12x.3SEXSWqXTIJy1t9Q9.Lq.	2025-05-09 18:33:55.961731+00	\N		\N		\N			\N	2025-11-16 16:31:46.246842+00	{"provider": "email", "providers": ["email"]}	{"sub": "a561911b-bc55-4136-8be4-e76ea631df9e", "role": "professor", "email": "belllaciao14@gmail.com", "fac_id": "FAC0006", "email_verified": true, "phone_verified": false}	\N	2025-05-09 18:33:55.940283+00	2025-11-16 16:31:46.2873+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	authenticated	authenticated	comp.dmce12@gmail.com	$2a$10$XA7P5lyzV3D53NEnDBBVUOzq.tJJ3uV2xDdwJT0SPnELXWJa9Fqhe	2025-04-14 11:11:16.160076+00	\N		\N		\N	c0afdd4b20f437021ad801cce8b04649eeb9038fd9b28f94b72ea614	cp0705@gmail.com	2025-05-01 10:01:46.784875+00	2025-11-24 05:56:16.221111+00	{"provider": "email", "providers": ["email"]}	{"sem": 4, "sub": "c8b0da7e-4cde-4691-9783-7e2c2f6d32e0", "role": "student", "email": "cp0705@gmail.com", "abc_id": "ABC1122", "email_verified": true, "phone_verified": false}	\N	2025-04-14 11:11:16.149234+00	2026-02-04 06:21:00.646538+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	9a246526-a93a-4b55-a730-847bad987e94	authenticated	authenticated	omp349242@gmail.com	$2a$10$Zhg2Rf7LSfYJaVIJjmIhUO7WsIOEawEIu8BzpHZLvfLmyOjTu0CVm	2025-05-08 13:51:56.537739+00	\N		\N		\N			\N	2025-11-16 16:31:20.493703+00	{"provider": "email", "providers": ["email"]}	{"sub": "9a246526-a93a-4b55-a730-847bad987e94", "role": "professor", "email": "omp349242@gmail.com", "fac_id": "FAC0004", "email_verified": true, "phone_verified": false}	\N	2025-05-08 13:51:56.529357+00	2025-11-16 16:31:20.496727+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	authenticated	authenticated	patilom4634@gmail.com	$2a$10$ebQs2A9Zh.LcTyHPmYF1gexd9k4d8x9BtpxLxSiq/IzNux5n72deu	2025-05-08 12:19:27.145731+00	\N		\N		\N	8e41fbceedd08a6a979b3e5aaa5f246bce5f7061447dcecee80fc679	patilom434@gmail.com	2025-05-08 12:19:56.487269+00	2026-02-04 06:24:56.803089+00	{"provider": "email", "providers": ["email"]}	{"sub": "39f8e7c3-04a5-49cd-8cc9-acca87e7e51e", "role": "professor", "email": "patilom4634@gmail.com", "fac_id": "FAC001", "email_verified": true, "phone_verified": false}	\N	2025-05-08 12:19:27.121832+00	2026-02-14 13:33:27.342181+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batches (id, name) FROM stdin;
1	Batch 1
2	Batch 2
3	All
4	Batch1
5	Batch2
6	batch1
7	batch2
\.


--
-- Data for Name: days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.days (id, name) FROM stdin;
1	Monday
2	Tuesday
3	Wednesday
4	Thursday
5	Friday
6	Saturday
\.


--
-- Data for Name: fcm_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fcm_tokens (id, user_id, fcm_token, user_role, updated_at) FROM stdin;
\.


--
-- Data for Name: lecture_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lecture_types (id, name) FROM stdin;
1	Theory
2	Practical
3	Seminar
4	Project
5	Elective
6	Recess
\.


--
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures (id, day_id, time_slot_id, semester_id, subject_id, professor_id, batch_id, lecture_type_id) FROM stdin;
45	1	1	4	1	1	3	1
46	1	2	4	7	2	1	2
47	1	2	4	8	3	2	2
48	1	3	4	7	2	1	2
49	1	3	4	8	3	2	2
50	1	4	4	73	11	3	6
51	1	5	4	9	9	1	2
52	1	5	4	7	7	2	2
53	1	6	4	9	9	1	2
54	1	6	4	7	7	2	2
55	1	7	4	6	5	3	1
56	2	1	4	1	1	3	1
57	2	2	4	7	2	1	2
58	2	2	4	8	3	2	2
59	2	3	4	7	2	1	2
60	2	3	4	8	3	2	2
61	2	4	4	73	11	3	6
62	2	5	4	9	9	1	2
63	2	5	4	7	7	2	2
64	2	6	4	9	9	1	2
65	2	6	4	7	7	2	2
66	2	7	4	6	5	3	1
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, professor_name, title, body, created_at, topic) FROM stdin;
31639dd7-6380-4af9-82c8-55c21c718c5d	prof. Chandan Sawarkar	Lecture Cancelled	,,ug	2025-05-10 05:09:23.310854	semester_6
\.


--
-- Data for Name: professor_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professor_subjects (id, professor_id, subject_id) FROM stdin;
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (id, name, department, contact_no, exp, email, password, profile_pic, fac_id) FROM stdin;
28c8a8f0-635f-456a-86b0-8b87c51eee50	prof. Sunil Narse	COMP	8888492362	11	omp349242@gmail.com	$2b$12$CS9T70Rny58APQaMfHriPu3h/Okr0Kha1notzqDDPG9C95Be3Cbxq	hie	FAC0004
f6dcec66-a180-4986-b9f6-2e187b0d91d5	prof. Priya Taywade	COMP	7218178499	4	belllaciao14@gmail.com	$2b$12$9Dnm9wpuJ2k6LfpxLG.ow.PELrSKiPWcdUDlrs3JpMb1uinZGsJja	kjj	FAC0006
f646d8ba-2cda-4d36-854b-82cfb03e436a	prof. Chandan Sawarkar	Computer Engineering	+91 9876543210	40	patilom4634@gmail.com	$2b$12$xvIFNqXJyiFSUowya2liuu83Gz2YZrrK51Wxeb114SvE8J9FeS7Jy	https://example.com/profile_pics/rajesh.jpg	FAC001
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semesters (id, number, name) FROM stdin;
1	1	First
2	2	Second
3	3	Third
4	4	Fourth
5	5	Fiveth
6	6	Sixth
7	7	Seventh
8	8	Eighth
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, name, email, password, rollno, abc_id, sem, department, profile_pic, contact_no) FROM stdin;
525d6700-b776-4d1e-81dc-7d57d32313f8	Lucky Mosby	belllaciao124@gmail.com	$2b$12$gfDGOpVpiGehcKftemdjEuvb01JUHNvZ84hZHaf.BxxFShVaOvNW2	58	ABC003	8	COMP	hd	\N
d4ad2f6e-d7dc-45d9-9b22-0cc6dd721186	Lucky Mosby	belllaciao1234@gmail.com	$2b$12$nrGUJhubHThEbG2KbatAeOol06n.4212MLqYyUjdy9EiLGlXgXsk6	56	ABC001	8	COMP	hrf	9579680705
f73eb899-3293-4016-8077-8c67038aee07	Chinmay Patil	comp.dmce12@gmail.com	$2b$12$8h4X.zScJ.r1qu.aNXgd5.79.rTnhQn2DQv6YF7bXaGtYn9BgpI6K	60	ABC1122	6	Computer Engineering	https://example.com/profile_pics/johndoe.jpg	+91 7218178499
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name, code, sem, is_elective) FROM stdin;
1	Discrete Mathematics and Graph Theory	DM&GT	4	f
2	Data Structure and Program Design	DSPD	4	f
3	Database Management Systems	DBMS	4	f
4	Computer Networks	CN	4	f
5	Theory of Computation	TOC	4	f
6	System Programming	SP	4	f
7	Data Structure and Program Design - Lab	DSPD Practical	4	f
8	Database Management Systems - Lab	DBMS Practical	4	f
9	Computer Workshop-II (Python)	CW II PR	4	f
10	Constitution of India (Audit Course)	COI	4	f
11	Industry Project/Project	PROJECT AND SEMINAR	8	f
12	Social Networks (Elective VI)	SN	8	t
13	Reinforcement Learning (Elective VI)	RL	8	t
14	GPU Architectures and Programming (Elective VI)	GA&P	8	t
17	Computer Vision (Elective VII)	CV	8	t
16	Blockchain and its Applications (Elective VII)	B&A	8	t
15	Predictive Analytics - Regression and Classification (Elective VII)	PARC	8	t
18	Artificial Intelligence	AI	5	f
19	Artificial Intelligence-Lab	AI-Lab	5	f
20	Design & Analysis of Algorithms	DAA	5	f
21	Design & Analysis of Algorithms-Lab	DAA-Lab	5	f
22	Software Engineering & Project Management	SEPM	5	f
23	TCP/IP (Elective-I)	TCP/IP	5	t
24	Design Patterns (Elective-I)	DP	5	t
25	Data Warehousing and Mining (Elective-I)	DWM	5	t
26	Effective Technical Communication	ETC	5	f
27	Professional Skills Lab I	PSL1	5	f
28	Yoga and Meditation (Audit Course)	Y&M	5	f
29	Compiler Design	CD	6	f
30	Compiler Design -Lab	CD-Lab	6	f
31	Machine Learning (Elective-II)	ML	6	t
32	Internet of Things (Elective-II)	IoT	6	t
33	Cluster and Cloud Computing (Elective-II)	C&CC	6	t
34	Data Science (Elective-III)	DS	6	t
35	Distributed Operating Systems (Elective-III)	DOS	6	t
36	Human Computer Interaction (Elective-III)	HCI	6	t
37	Open Elective-I: Linux Fundamentals	OE1-Linux	6	t
38	Open Elective-I: Android Application Development	OE1-Android	6	t
39	Open Elective-I: Blockchain Technologies	OE1-Blockchain	6	t
40	Professional Skills Lab II	PSL2	6	f
41	Hardware Lab	HW-Lab	6	f
42	Mini Project	MiniProj	6	f
43	Economics of IT Industry	EIT	6	f
44	Intellectual Property Rights (Audit Course)	IPR	6	f
45	Cryptography & Network Security	CNS	7	f
46	Cryptography & Network Security Lab	CNS-Lab	7	f
47	Deep Learning (Elective-IV)	DL	7	t
48	Optimization Techniques (Elective-IV)	OT	7	t
49	Gaming Architecture (Elective-IV)	GA	7	t
50	Natural Language Processing (Elective-V)	NLP	7	t
51	Big Data Analytics (Elective-V)	BDA	7	t
52	Mobile Computing (Elective-V)	MC	7	t
53	Open Elective-II: Python Programming	OE2-Python	7	t
54	Open Elective-II: JAVA Programming	OE2-JAVA	7	t
55	Open Elective-II: Basics of Database Management System	OE2-DBMS	7	t
56	Project	Proj	7	f
57	Research Methodology (Audit Course)	RM	7	f
63	Applied Mathematics - III	AM3	3	f
64	Object Oriented Programming with Java	OOPJ	3	f
65	Operating System	OS	3	f
66	Computer Architecture & Digital System	CADS	3	f
67	Ethics in IT	ETI	3	f
68	Object Oriented Programming with Java Lab	OOPJ-Lab	3	f
69	Operating System Lab	OS-Lab	3	f
70	Computer Workshop-I Lab	CW1-Lab	3	f
71	Universal Human Values	UHV	3	f
72	Environment Sciences	EVS	3	f
73	Recess	Recess	4	f
76	Database Managements Systems	\N	\N	f
77	Data Structure and Program Design Lab	\N	\N	f
78	Database Managements Systems Lab	\N	\N	f
79	Internship	\N	\N	f
80	Open Elective-I	\N	\N	f
81	Program Elective-VI MOOC	\N	\N	f
82	Program Elective-VII MOOC	\N	\N	f
83	Elective-II	\N	\N	f
84	Elective-III	\N	\N	f
85	Internship	ITR	4	f
86	Open Elective-I	ENE	6	f
87	Database Management Systems Lab	\N	\N	f
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, name, code) FROM stdin;
2	prof. Ashmita Ghongade	ARG
3	prof. Vaishali Jikar	VVJ
4	prof. Nikita Vairagade	NBV
5	prof. Chandan Sawarkar	CDS
6	prof. Disha Deotale	DMD
7	prof. Devendra Dandekar	DBD
8	prof. Nita Thakare	NT
9	prof. Sunil Narse	SN
11	Recess	RS
14	TBD	TBD
1	prof. Priya Taywade\r\n\r\n	PNT
16	prof. Nikita Vairagade, prof. Disha Deotale	\N
17	prof. Priya Taywade	\N
\.


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slots (id, start_time, end_time, slot) FROM stdin;
6	15:00:00	16:00:00	15:00-16:00
9999	00:00	00:01	\N
2	11:30:00	12:30:00	11:30-12:30
5	14:00:00	15:00:00	14:00-15:00
1	10:30:00	11:30:00	10:30-11:30
4	13:30:00	14:00:00	13:30-14:00
3	12:30:00	13:30:00	12:30-13:30
7	16:00:00	17:00:00	16:00-17:00
\.


--
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timetable (id, semester_id, day_id, time_slot_id, subject_id, professor_id, lecture_type_id, batch_id) FROM stdin;
2598	8	5	1	12	3	1	3
2601	8	5	4	73	11	6	3
2602	8	1	1	12	3	1	3
2603	8	1	2	16	7	1	3
2604	8	1	3	11	16	2	3
2605	8	1	4	73	11	6	3
2606	8	6	1	12	3	1	3
2608	8	6	3	11	16	2	3
2609	8	6	4	73	11	6	3
2610	8	4	1	12	3	1	3
2611	8	4	2	16	7	1	3
2612	8	4	3	11	16	2	3
2613	8	4	4	73	11	6	3
2614	8	2	1	12	3	1	3
2615	8	2	2	16	7	1	3
2616	8	2	3	11	16	2	3
2617	8	2	4	73	11	6	3
2618	8	3	1	12	3	1	3
2619	8	3	2	16	7	1	3
2620	8	3	3	11	16	2	3
2621	8	3	4	73	11	6	3
2622	4	5	1	1	17	1	3
2623	4	5	2	2	2	1	3
2624	4	5	3	4	4	1	3
2625	4	5	4	73	11	6	3
2626	4	1	1	1	17	1	3
2627	4	1	2	2	2	1	3
2628	4	1	3	4	4	1	3
2629	4	1	4	73	11	6	3
2630	4	1	5	77	2	2	4
2631	4	1	5	87	5	2	5
2632	4	1	6	77	2	2	4
2633	4	1	6	87	5	2	5
2634	4	6	1	5	3	1	3
2635	4	6	2	6	7	1	3
2636	4	6	3	3	5	1	3
2637	4	6	4	73	11	6	3
2638	4	4	1	6	7	1	3
2639	4	4	2	4	4	1	3
2640	4	4	3	3	5	1	3
2641	4	4	4	73	11	6	3
2642	4	4	5	9	6	2	4
2643	4	4	5	79	7	2	5
2644	4	4	6	9	6	2	4
2645	4	4	6	79	7	2	5
2646	4	2	1	5	3	1	3
2647	4	2	2	6	7	1	3
2648	4	2	3	3	5	1	3
2649	4	2	4	73	11	6	3
2650	4	2	5	9	6	2	4
2651	4	2	5	79	7	2	5
2652	4	2	6	9	6	2	4
2653	4	2	6	79	7	2	5
2656	4	3	3	5	3	1	3
2657	4	3	4	73	11	6	3
2658	4	3	5	77	2	2	4
2659	4	3	5	87	5	2	5
2660	4	3	6	77	2	2	4
2661	4	3	6	87	5	2	5
2662	6	5	1	29	3	1	3
2663	6	5	2	33	5	1	3
2664	6	5	3	43	2	1	3
2665	6	5	4	73	11	6	3
2666	6	1	1	29	3	1	3
2667	6	1	2	33	5	1	3
2668	6	1	3	43	2	1	3
2669	6	1	4	73	11	6	3
2670	6	1	5	30	3	2	4
2671	6	1	5	40	4	2	5
2672	6	1	6	30	3	2	4
2673	6	1	6	40	4	2	5
2674	6	6	1	35	7	1	3
2675	6	6	2	80	14	1	3
2676	6	6	3	29	3	1	3
2677	6	6	4	73	11	6	3
2678	6	4	1	43	2	1	3
2679	6	4	2	29	3	1	3
2680	6	4	3	80	14	1	3
2681	6	4	4	73	11	6	3
2682	6	4	5	41	5	2	4
2683	6	4	5	42	7	2	5
2684	6	4	6	41	5	2	4
2685	6	4	6	42	7	2	5
2686	6	2	1	35	7	1	3
2687	6	2	2	80	14	1	3
2688	6	2	3	29	3	1	3
2689	6	2	4	73	11	6	3
2690	6	2	5	41	5	2	4
2691	6	2	5	42	7	2	5
2692	6	2	6	41	5	2	4
2693	6	2	6	42	7	2	5
2694	6	3	1	33	5	1	3
2695	6	3	2	35	7	1	3
2696	6	3	3	80	14	1	3
2697	6	3	4	73	11	6	3
2698	6	3	5	30	3	2	4
2699	6	3	5	40	4	2	5
2700	6	3	6	30	3	2	4
2701	6	3	6	40	4	2	5
2655	4	3	1	1	17	1	3
2654	4	3	2	2	2	1	3
2702	4	6	5	2	5	1	3
2599	8	5	3	16	7	1	3
2600	8	5	2	11	16	2	3
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tokens (id, email, token, role, sem, abc_id, fac_id) FROM stdin;
a3823ee8-3ade-4208-84f7-3855f72c4efd	patilom4634@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJhMzgyM2VlOC0zYWRlLTQyMDgtODRmNy0zODU1ZjcyYzRlZmQiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ0NjQwNTU5LCJpYXQiOjE3NDQ2MzY5NTksImVtYWlsIjoicGF0aWxvbTQ2MzRAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhYmNfaWQiOiJBQkMxMzQ1IiwiZW1haWwiOiJwYXRpbG9tNDYzNEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicGhvbmVfdmVyaWZpZWQiOmZhbHNlLCJyb2xlIjoic3R1ZGVudCIsInN1YiI6ImEzODIzZWU4LTNhZGUtNDIwOC04NGY3LTM4NTVmNzJjNGVmZCJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ0NjM2OTU5fV0sInNlc3Npb25faWQiOiIwYmVjNDRiOC00MDJiLTRiNzItYmNmMC0yYjZjOTcxMWRkNjEiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.YBsaNNB6NyIycR5aKTG-8o5u-vHpKlf5T2O5juyTx24	student	\N	\N	\N
c3f83c68-709c-4d7e-874b-c8e920d78aa5	patilom434@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJjM2Y4M2M2OC03MDljLTRkN2UtODc0Yi1jOGU5MjBkNzhhYTUiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2NjMyODA3LCJpYXQiOjE3NDY2MjkyMDcsImVtYWlsIjoicGF0aWxvbTQzNEBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7ImVtYWlsIjoicGF0aWxvbTQzNEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmFjX2lkIjoiRkFDMDAxIiwicGhvbmVfdmVyaWZpZWQiOmZhbHNlLCJyb2xlIjoicHJvZmVzc29yIiwic3ViIjoiYzNmODNjNjgtNzA5Yy00ZDdlLTg3NGItYzhlOTIwZDc4YWE1In0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NDY2MjkyMDd9XSwic2Vzc2lvbl9pZCI6Ijc5ZWYwZDI3LWU3MjAtNDQ4NC1iZTk5LTI3ZWEyZDUzNmY4YiIsImlzX2Fub255bW91cyI6ZmFsc2V9.9_RPI7yIShrthx0RlLNp9WF17pJ5DH6vWeg8Lg64gGs	professor	\N	\N	"FAC001"
2763082c-881e-498d-b3cd-771432f0c053	omp349242@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiIyNzYzMDgyYy04ODFlLTQ5OGQtYjNjZC03NzE0MzJmMGMwNTMiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ0ODIyOTk2LCJpYXQiOjE3NDQ4MTkzOTYsImVtYWlsIjoib21wMzQ5MjQyQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiYWJjX2lkIjoiQUJDODA4NSIsImVtYWlsIjoib21wMzQ5MjQyQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInJvbGUiOiJzdHVkZW50Iiwic2VtIjo2LCJzdWIiOiIyNzYzMDgyYy04ODFlLTQ5OGQtYjNjZC03NzE0MzJmMGMwNTMifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc0NDgxOTM5Nn1dLCJzZXNzaW9uX2lkIjoiNThlN2RkY2QtMTY1Yi00OTkxLWEzMDAtNWQwYzI2NmViNjJmIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.HSSc6TrNuXzItqz3uoGX8wPp_EGfFA3leV3gwP_nFFQ	student	6	"ABC8085"	\N
a9fd2781-5ce9-47d1-8a88-6e75fb4a4c35	omp349242@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJhOWZkMjc4MS01Y2U5LTQ3ZDEtOGE4OC02ZTc1ZmI0YTRjMzUiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2NzE0ODA3LCJpYXQiOjE3NDY3MTEyMDcsImVtYWlsIjoib21wMzQ5MjQyQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJvbXAzNDkyNDJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwicm9sZSI6InByb2Zlc3NvciIsInN1YiI6ImE5ZmQyNzgxLTVjZTktNDdkMS04YTg4LTZlNzVmYjRhNGMzNSJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2NzExMjA3fV0sInNlc3Npb25faWQiOiJhMzQ5OTJhOS02Yzc0LTRhNjQtYmM5MS05MGVkMjNiY2EzN2MiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.VxbIK2j3Fxjg89Cb1iHDq5nmqS8Gh9qu1vJQQyOjOKU	professor	\N	\N	\N
eb9ec5ee-f8f5-49d0-9f65-1d5039abc4b6	omp349242@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlYjllYzVlZS1mOGY1LTQ5ZDAtOWY2NS0xZDUwMzlhYmM0YjYiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2NzE1NTY5LCJpYXQiOjE3NDY3MTE5NjksImVtYWlsIjoib21wMzQ5MjQyQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJvbXAzNDkyNDJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwicm9sZSI6InByb2Zlc3NvciIsInN1YiI6ImViOWVjNWVlLWY4ZjUtNDlkMC05ZjY1LTFkNTAzOWFiYzRiNiJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzQ2NzExOTY5fV0sInNlc3Npb25faWQiOiJiZjcyZWU5MC1lNTc1LTQxZTgtOTgyZC1hYjAxMDNiNDIxZWYiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.fqgvhnqaQmdaGBzrOKnUSx1a1om6dFEUESM96PeFg5s	professor	\N	\N	\N
9a246526-a93a-4b55-a730-847bad987e94	omp349242@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI5YTI0NjUyNi1hOTNhLTRiNTUtYTczMC04NDdiYWQ5ODdlOTQiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2NzE1OTMzLCJpYXQiOjE3NDY3MTIzMzMsImVtYWlsIjoib21wMzQ5MjQyQGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJvbXAzNDkyNDJAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZhY19pZCI6IkZBQzAwMDQiLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInJvbGUiOiJwcm9mZXNzb3IiLCJzdWIiOiI5YTI0NjUyNi1hOTNhLTRiNTUtYTczMC04NDdiYWQ5ODdlOTQifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc0NjcxMjMzM31dLCJzZXNzaW9uX2lkIjoiOTgyNWMwYTQtMDcxNC00ZDgyLTlkYWYtYWNhNWVmNDg1ODg2IiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.W595O6zp6G1jpwHeA-mpvVgeScPeWtKZiBMcfM8XIvw	professor	\N	\N	"FAC0004"
15099c4c-0d46-4764-81f5-87286f11ef40	belllaciao1234@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiIxNTA5OWM0Yy0wZDQ2LTQ3NjQtODFmNS04NzI4NmYxMWVmNDAiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2ODU2MDEwLCJpYXQiOjE3NDY4NTI0MTAsImVtYWlsIjoiYmVsbGxhY2lhbzEyMzRAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhYmNfaWQiOiJBQkMwMDEiLCJlbWFpbCI6ImJlbGxsYWNpYW8xMjM0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInJvbGUiOiJzdHVkZW50Iiwic2VtIjo4LCJzdWIiOiIxNTA5OWM0Yy0wZDQ2LTQ3NjQtODFmNS04NzI4NmYxMWVmNDAifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc0Njg1MjQxMH1dLCJzZXNzaW9uX2lkIjoiZDY1ZTM4YTktMWFkNy00NWU4LWIzZjUtZjI2MDUwZGRhM2UwIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.Tnj93ekJqvIkZk2XfQvkjhBDu-pD_HfGEAcQOyr7l04	student	8	"ABC001"	\N
a561911b-bc55-4136-8be4-e76ea631df9e	belllaciao14@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJhNTYxOTExYi1iYzU1LTQxMzYtOGJlNC1lNzZlYTYzMWRmOWUiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzQ2ODE5MjU2LCJpYXQiOjE3NDY4MTU2NTYsImVtYWlsIjoiYmVsbGxhY2lhbzE0QGdtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJiZWxsbGFjaWFvMTRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZhY19pZCI6IkZBQzAwMDYiLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInJvbGUiOiJwcm9mZXNzb3IiLCJzdWIiOiJhNTYxOTExYi1iYzU1LTQxMzYtOGJlNC1lNzZlYTYzMWRmOWUifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc0NjgxNTY1Nn1dLCJzZXNzaW9uX2lkIjoiOThlYTUzMDQtZmRhMi00ZmNmLWIxMWMtYWVjMWQ3NGM1NTgwIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.L66bPgt1T76ehUGxkC9xZE64AO6Jf8AhAklNi7p374I	professor	\N	\N	"FAC0006"
c8b0da7e-4cde-4691-9783-7e2c2f6d32e0	comp.dmce12@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJjOGIwZGE3ZS00Y2RlLTQ2OTEtOTc4My03ZTJjMmY2ZDMyZTAiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYzOTY3Mzc2LCJpYXQiOjE3NjM5NjM3NzYsImVtYWlsIjoiY29tcC5kbWNlMTJAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJhYmNfaWQiOiJBQkMxMTIyIiwiZW1haWwiOiJjcDA3MDVAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwicm9sZSI6InN0dWRlbnQiLCJzZW0iOjQsInN1YiI6ImM4YjBkYTdlLTRjZGUtNDY5MS05NzgzLTdlMmMyZjZkMzJlMCJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6InBhc3N3b3JkIiwidGltZXN0YW1wIjoxNzYzOTYzNzc2fV0sInNlc3Npb25faWQiOiI4NjBhMmIxNS1hYzVmLTQxM2YtOGQ3ZC02OTI0MjI5ZjE1YjUiLCJpc19hbm9ueW1vdXMiOmZhbHNlfQ.dx6e4Wcwf7nGB6nzT0jQJXwgXvU60j-13xG7FCXZYNg	student	4	"ABC1122"	\N
39f8e7c3-04a5-49cd-8cc9-acca87e7e51e	patilom4634@gmail.com	eyJhbGciOiJIUzI1NiIsImtpZCI6IlcrMDc2M2xuU2tOZWhVTnoiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2JjYnJ2dHF6ZWFkd3NnamloenZ6LnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiIzOWY4ZTdjMy0wNGE1LTQ5Y2QtOGNjOS1hY2NhODdlN2U1MWUiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzcwMTg5ODk2LCJpYXQiOjE3NzAxODYyOTYsImVtYWlsIjoicGF0aWxvbTQ2MzRAZ21haWwuY29tIiwicGhvbmUiOiIiLCJhcHBfbWV0YWRhdGEiOnsicHJvdmlkZXIiOiJlbWFpbCIsInByb3ZpZGVycyI6WyJlbWFpbCJdfSwidXNlcl9tZXRhZGF0YSI6eyJlbWFpbCI6InBhdGlsb200NjM0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmYWNfaWQiOiJGQUMwMDEiLCJwaG9uZV92ZXJpZmllZCI6ZmFsc2UsInJvbGUiOiJwcm9mZXNzb3IiLCJzdWIiOiIzOWY4ZTdjMy0wNGE1LTQ5Y2QtOGNjOS1hY2NhODdlN2U1MWUifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTc3MDE4NjI5Nn1dLCJzZXNzaW9uX2lkIjoiNjAyNDA1MmMtNWEzNi00YzY1LThmZGQtNGExMjdkMmU1OTUxIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.DOZz9UHACXqIeuh3TNo9d-WQTawIby61PKhLCBlGvmc	professor	\N	\N	"FAC001"
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-03-28 09:57:54
20211116045059	2025-03-28 09:57:54
20211116050929	2025-03-28 09:57:55
20211116051442	2025-03-28 09:57:56
20211116212300	2025-03-28 09:57:56
20211116213355	2025-03-28 09:57:57
20211116213934	2025-03-28 09:57:58
20211116214523	2025-03-28 09:57:58
20211122062447	2025-03-28 09:57:59
20211124070109	2025-03-28 09:58:00
20211202204204	2025-03-28 09:58:00
20211202204605	2025-03-28 09:58:01
20211210212804	2025-03-28 09:58:03
20211228014915	2025-03-28 09:58:03
20220107221237	2025-03-28 09:58:04
20220228202821	2025-03-28 09:58:05
20220312004840	2025-03-28 09:58:05
20220603231003	2025-03-28 09:58:06
20220603232444	2025-03-28 09:58:07
20220615214548	2025-03-28 09:58:08
20220712093339	2025-03-28 09:58:08
20220908172859	2025-03-28 09:58:09
20220916233421	2025-03-28 09:58:09
20230119133233	2025-03-28 09:58:10
20230128025114	2025-03-28 09:58:11
20230128025212	2025-03-28 09:58:12
20230227211149	2025-03-28 09:58:12
20230228184745	2025-03-28 09:58:13
20230308225145	2025-03-28 09:58:13
20230328144023	2025-03-28 09:58:14
20231018144023	2025-03-28 09:58:15
20231204144023	2025-03-28 09:58:16
20231204144024	2025-03-28 09:58:16
20231204144025	2025-03-28 09:58:17
20240108234812	2025-03-28 09:58:18
20240109165339	2025-03-28 09:58:18
20240227174441	2025-03-28 09:58:19
20240311171622	2025-03-28 09:58:20
20240321100241	2025-03-28 09:58:22
20240401105812	2025-03-28 09:58:23
20240418121054	2025-03-28 09:58:24
20240523004032	2025-03-28 09:58:26
20240618124746	2025-03-28 09:58:27
20240801235015	2025-03-28 09:58:27
20240805133720	2025-03-28 09:58:28
20240827160934	2025-03-28 09:58:29
20240919163303	2025-03-28 09:58:30
20240919163305	2025-03-28 09:58:30
20241019105805	2025-03-28 09:58:31
20241030150047	2025-03-28 09:58:33
20241108114728	2025-03-28 09:58:34
20241121104152	2025-03-28 09:58:35
20241130184212	2025-03-28 09:58:35
20241220035512	2025-03-28 09:58:36
20241220123912	2025-03-28 09:58:36
20241224161212	2025-03-28 09:58:37
20250107150512	2025-03-28 09:58:38
20250110162412	2025-03-28 09:58:38
20250123174212	2025-03-28 09:58:39
20250128220012	2025-03-28 09:58:40
20250506224012	2025-09-26 04:57:36
20250523164012	2025-09-26 04:57:36
20250714121412	2025-09-26 04:57:37
20250905041441	2025-09-26 04:57:38
20251103001201	2025-11-16 16:08:53
20251120212548	2026-02-04 03:01:35
20251120215549	2026-02-04 03:01:36
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
timetables	timetables	\N	2025-04-16 02:18:36.815745+00	2025-04-16 02:18:36.815745+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-03-28 09:52:33.402088
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-03-28 09:52:33.414935
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-03-28 09:52:33.419949
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-03-28 09:52:33.445139
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-03-28 09:52:33.475101
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-03-28 09:52:33.481105
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-03-28 09:52:33.488075
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-03-28 09:52:33.494961
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-03-28 09:52:33.501308
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-03-28 09:52:33.511486
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-03-28 09:52:33.520071
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-03-28 09:52:33.532774
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-03-28 09:52:33.541979
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-03-28 09:52:33.547819
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-03-28 09:52:33.554379
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-03-28 09:52:33.583491
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-03-28 09:52:33.590008
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-03-28 09:52:33.599477
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-03-28 09:52:33.61215
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-03-28 09:52:33.625232
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-03-28 09:52:33.634473
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-03-28 09:52:33.647098
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-03-28 09:52:33.680069
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-03-28 09:52:33.710341
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-03-28 09:52:33.716581
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-03-28 09:52:33.727997
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-08 19:06:51.446481
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-08 19:06:51.692825
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-08 19:06:51.711091
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-08 19:06:51.733557
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-08 19:06:51.751724
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-08 19:06:51.766731
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-08 19:06:51.793731
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-08 19:06:51.805293
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-08 19:06:51.80717
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-08 19:06:51.817563
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-08 19:06:51.822818
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-08 19:06:51.842262
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-08 19:06:51.846416
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-08 19:06:51.874994
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-08 19:06:51.88051
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-08 19:06:51.892725
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-08 19:06:51.897612
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-08 19:06:51.903538
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-11-24 07:46:49.368486
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-11-24 07:46:49.39333
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-11-24 07:46:49.487217
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-11-24 07:46:49.49127
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2025-11-24 07:46:49.496082
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-24 08:45:09.148004
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
a9c38df8-906a-4c53-91fb-2af9543b1b88	timetables	timetable_Fourth.pdf	\N	2025-05-10 06:59:07.520767+00	2025-10-08 19:06:51.735425+00	2025-05-10 06:59:07.520767+00	{"eTag": "\\"f47712067e1414098da2213baedc42bc\\"", "size": 3344, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-05-10T06:59:08.000Z", "contentLength": 3344, "httpStatusCode": 200}	5c94bec7-01b2-4ad9-91f3-d37c9957781c	\N	{}	1
e3e1502f-3b41-4816-8614-66047cffb02a	timetables	timetable_Sixth.pdf	\N	2025-05-10 06:59:07.86127+00	2025-10-08 19:06:51.735425+00	2025-05-10 06:59:07.86127+00	{"eTag": "\\"02fe801835838efa3c48ffbdca674d91\\"", "size": 3281, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-05-10T06:59:08.000Z", "contentLength": 3281, "httpStatusCode": 200}	e517b5fb-df65-488c-bc60-d5e2948c9107	\N	{}	1
2666d29c-86c8-4da2-9482-f6331320ee47	timetables	timetable_Eighth.pdf	\N	2025-05-10 06:59:08.341238+00	2025-10-08 19:06:51.735425+00	2025-05-10 06:59:08.341238+00	{"eTag": "\\"6aeb90896be01f3b8be3fc814f0b3693\\"", "size": 2749, "mimetype": "application/pdf", "cacheControl": "no-cache", "lastModified": "2025-05-10T06:59:09.000Z", "contentLength": 2749, "httpStatusCode": 200}	1127dfb7-e3f8-49ea-9739-da06f14c350b	\N	{}	1
39e486cc-d226-46da-b28a-06441e81b1d9	timetables	.emptyFolderPlaceholder	\N	2025-04-18 10:49:02.610571+00	2025-10-08 19:06:51.735425+00	2025-04-18 10:49:02.610571+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2025-04-18T10:49:03.000Z", "contentLength": 0, "httpStatusCode": 200}	96928f1e-ee1f-4dd8-a38d-40a1f5b6947e	\N	{}	1
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 500, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.batches_id_seq', 7, true);


--
-- Name: days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.days_id_seq', 6, true);


--
-- Name: fac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fac_id_seq', 6, true);


--
-- Name: lecture_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lecture_types_id_seq', 6, true);


--
-- Name: lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectures_id_seq', 66, true);


--
-- Name: professor_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professor_subjects_id_seq', 1, false);


--
-- Name: semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semesters_id_seq', 9, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 87, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 19, true);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 26, true);


--
-- Name: timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timetable_id_seq', 2702, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: batches batches_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_name_key UNIQUE (name);


--
-- Name: batches batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (id);


--
-- Name: days days_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_name_key UNIQUE (name);


--
-- Name: days days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.days
    ADD CONSTRAINT days_pkey PRIMARY KEY (id);


--
-- Name: fcm_tokens fcm_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fcm_tokens
    ADD CONSTRAINT fcm_tokens_pkey PRIMARY KEY (id);


--
-- Name: lecture_types lecture_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecture_types
    ADD CONSTRAINT lecture_types_name_key UNIQUE (name);


--
-- Name: lecture_types lecture_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecture_types
    ADD CONSTRAINT lecture_types_pkey PRIMARY KEY (id);


--
-- Name: lectures lectures_day_id_time_slot_id_semester_id_batch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_day_id_time_slot_id_semester_id_batch_id_key UNIQUE (day_id, time_slot_id, semester_id, batch_id);


--
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: professor_subjects professor_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor_subjects
    ADD CONSTRAINT professor_subjects_pkey PRIMARY KEY (id);


--
-- Name: professor_subjects professor_subjects_professor_id_subject_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor_subjects
    ADD CONSTRAINT professor_subjects_professor_id_subject_id_key UNIQUE (professor_id, subject_id);


--
-- Name: professors professors_contact_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_contact_no_key UNIQUE (contact_no);


--
-- Name: professors professors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_email_key UNIQUE (email);


--
-- Name: professors professors_fac_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_fac_id_key UNIQUE (fac_id);


--
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- Name: semesters semesters_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_number_key UNIQUE (number);


--
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: students students_abc_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_abc_id_key UNIQUE (abc_id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students students_rollno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_rollno_key UNIQUE (rollno);


--
-- Name: subjects subjects_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_code_key UNIQUE (code);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_code_key UNIQUE (code);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_start_time_end_time_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_start_time_end_time_key UNIQUE (start_time, end_time);


--
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (id);


--
-- Name: timetable timetable_semester_id_day_id_time_slot_id_batch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_semester_id_day_id_time_slot_id_batch_id_key UNIQUE (semester_id, day_id, time_slot_id, batch_id);


--
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_key ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: lectures lectures_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.batches(id);


--
-- Name: lectures lectures_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.days(id);


--
-- Name: lectures lectures_lecture_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_lecture_type_id_fkey FOREIGN KEY (lecture_type_id) REFERENCES public.lecture_types(id);


--
-- Name: lectures lectures_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.teachers(id);


--
-- Name: lectures lectures_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semesters(id);


--
-- Name: lectures lectures_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: lectures lectures_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id);


--
-- Name: professor_subjects professor_subjects_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor_subjects
    ADD CONSTRAINT professor_subjects_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- Name: professor_subjects professor_subjects_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor_subjects
    ADD CONSTRAINT professor_subjects_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE CASCADE;


--
-- Name: subjects subjects_sem_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_sem_fkey FOREIGN KEY (sem) REFERENCES public.semesters(number);


--
-- Name: timetable timetable_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.batches(id);


--
-- Name: timetable timetable_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_day_id_fkey FOREIGN KEY (day_id) REFERENCES public.days(id) ON DELETE CASCADE;


--
-- Name: timetable timetable_lecture_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_lecture_type_id_fkey FOREIGN KEY (lecture_type_id) REFERENCES public.lecture_types(id);


--
-- Name: timetable timetable_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.teachers(id) ON DELETE SET NULL;


--
-- Name: timetable timetable_semester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_semester_id_fkey FOREIGN KEY (semester_id) REFERENCES public.semesters(id) ON DELETE CASCADE;


--
-- Name: timetable timetable_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE SET NULL;


--
-- Name: timetable timetable_time_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_time_slot_id_fkey FOREIGN KEY (time_slot_id) REFERENCES public.time_slots(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow all uploads; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all uploads" ON storage.objects FOR INSERT WITH CHECK (true);


--
-- Name: objects Allow anon delete combined timetable; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon delete combined timetable" ON storage.objects FOR DELETE TO anon USING (((bucket_id = 'timetables'::text) AND (name = 'timetable_combined.pdf'::text)));


--
-- Name: objects Allow anon delete timetable pattern; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon delete timetable pattern" ON storage.objects FOR DELETE TO anon USING (((bucket_id = 'timetables'::text) AND (name ~~ 'timetable_%.pdf'::text)));


--
-- Name: objects Allow anon insert combined timetable; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon insert combined timetable" ON storage.objects FOR INSERT TO anon WITH CHECK (((bucket_id = 'timetables'::text) AND (name = 'timetable_combined.pdf'::text)));


--
-- Name: objects Allow anon insert timetable pattern; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon insert timetable pattern" ON storage.objects FOR INSERT TO anon WITH CHECK (((bucket_id = 'timetables'::text) AND (name ~~ 'timetable_%.pdf'::text)));


--
-- Name: objects Allow anon select combined timetable; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon select combined timetable" ON storage.objects FOR SELECT TO anon USING (((bucket_id = 'timetables'::text) AND (name = 'timetable_combined.pdf'::text)));


--
-- Name: objects Allow anon select timetable pattern; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon select timetable pattern" ON storage.objects FOR SELECT TO anon USING (((bucket_id = 'timetables'::text) AND (name ~~ 'timetable_%.pdf'::text)));


--
-- Name: objects Allow anon update combined timetable; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon update combined timetable" ON storage.objects FOR UPDATE TO anon USING (((bucket_id = 'timetables'::text) AND (name = 'timetable_combined.pdf'::text))) WITH CHECK (((bucket_id = 'timetables'::text) AND (name = 'timetable_combined.pdf'::text)));


--
-- Name: objects Allow anon update timetable pattern; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow anon update timetable pattern" ON storage.objects FOR UPDATE TO anon USING (((bucket_id = 'timetables'::text) AND (name ~~ 'timetable_%.pdf'::text))) WITH CHECK (((bucket_id = 'timetables'::text) AND (name ~~ 'timetable_%.pdf'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION generate_fac_id(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.generate_fac_id() TO anon;
GRANT ALL ON FUNCTION public.generate_fac_id() TO authenticated;
GRANT ALL ON FUNCTION public.generate_fac_id() TO service_role;


--
-- Name: FUNCTION swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer) TO anon;
GRANT ALL ON FUNCTION public.swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer) TO authenticated;
GRANT ALL ON FUNCTION public.swap_timetable_entries_by_id(entry_id1 integer, entry_id2 integer) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION operation(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.operation() TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE batches; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.batches TO anon;
GRANT ALL ON TABLE public.batches TO authenticated;
GRANT ALL ON TABLE public.batches TO service_role;


--
-- Name: SEQUENCE batches_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.batches_id_seq TO anon;
GRANT ALL ON SEQUENCE public.batches_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.batches_id_seq TO service_role;


--
-- Name: TABLE days; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.days TO anon;
GRANT ALL ON TABLE public.days TO authenticated;
GRANT ALL ON TABLE public.days TO service_role;


--
-- Name: SEQUENCE days_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.days_id_seq TO anon;
GRANT ALL ON SEQUENCE public.days_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.days_id_seq TO service_role;


--
-- Name: SEQUENCE fac_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fac_id_seq TO anon;
GRANT ALL ON SEQUENCE public.fac_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.fac_id_seq TO service_role;


--
-- Name: TABLE fcm_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fcm_tokens TO anon;
GRANT ALL ON TABLE public.fcm_tokens TO authenticated;
GRANT ALL ON TABLE public.fcm_tokens TO service_role;


--
-- Name: TABLE lecture_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lecture_types TO anon;
GRANT ALL ON TABLE public.lecture_types TO authenticated;
GRANT ALL ON TABLE public.lecture_types TO service_role;


--
-- Name: SEQUENCE lecture_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lecture_types_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lecture_types_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lecture_types_id_seq TO service_role;


--
-- Name: TABLE lectures; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lectures TO anon;
GRANT ALL ON TABLE public.lectures TO authenticated;
GRANT ALL ON TABLE public.lectures TO service_role;


--
-- Name: SEQUENCE lectures_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lectures_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lectures_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lectures_id_seq TO service_role;


--
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notifications TO anon;
GRANT ALL ON TABLE public.notifications TO authenticated;
GRANT ALL ON TABLE public.notifications TO service_role;


--
-- Name: TABLE professor_subjects; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.professor_subjects TO anon;
GRANT ALL ON TABLE public.professor_subjects TO authenticated;
GRANT ALL ON TABLE public.professor_subjects TO service_role;


--
-- Name: SEQUENCE professor_subjects_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.professor_subjects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.professor_subjects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.professor_subjects_id_seq TO service_role;


--
-- Name: TABLE professors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.professors TO anon;
GRANT ALL ON TABLE public.professors TO authenticated;
GRANT ALL ON TABLE public.professors TO service_role;


--
-- Name: TABLE semesters; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.semesters TO anon;
GRANT ALL ON TABLE public.semesters TO authenticated;
GRANT ALL ON TABLE public.semesters TO service_role;


--
-- Name: SEQUENCE semesters_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.semesters_id_seq TO anon;
GRANT ALL ON SEQUENCE public.semesters_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.semesters_id_seq TO service_role;


--
-- Name: TABLE students; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.students TO anon;
GRANT ALL ON TABLE public.students TO authenticated;
GRANT ALL ON TABLE public.students TO service_role;


--
-- Name: TABLE subjects; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subjects TO anon;
GRANT ALL ON TABLE public.subjects TO authenticated;
GRANT ALL ON TABLE public.subjects TO service_role;


--
-- Name: SEQUENCE subjects_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subjects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.subjects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.subjects_id_seq TO service_role;


--
-- Name: TABLE teachers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teachers TO anon;
GRANT ALL ON TABLE public.teachers TO authenticated;
GRANT ALL ON TABLE public.teachers TO service_role;


--
-- Name: SEQUENCE teachers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.teachers_id_seq TO anon;
GRANT ALL ON SEQUENCE public.teachers_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.teachers_id_seq TO service_role;


--
-- Name: TABLE time_slots; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.time_slots TO anon;
GRANT ALL ON TABLE public.time_slots TO authenticated;
GRANT ALL ON TABLE public.time_slots TO service_role;


--
-- Name: SEQUENCE time_slots_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.time_slots_id_seq TO anon;
GRANT ALL ON SEQUENCE public.time_slots_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.time_slots_id_seq TO service_role;


--
-- Name: TABLE timetable; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.timetable TO anon;
GRANT ALL ON TABLE public.timetable TO authenticated;
GRANT ALL ON TABLE public.timetable TO service_role;


--
-- Name: SEQUENCE timetable_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.timetable_id_seq TO anon;
GRANT ALL ON SEQUENCE public.timetable_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.timetable_id_seq TO service_role;


--
-- Name: TABLE user_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_tokens TO anon;
GRANT ALL ON TABLE public.user_tokens TO authenticated;
GRANT ALL ON TABLE public.user_tokens TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict KIVBFUWNfF6PIzILfWYkGHv5aepxzcQnEiXF8p8QbNU1EEoORnPBYDk6klgDTpg

