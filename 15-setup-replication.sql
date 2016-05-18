ALTER SYSTEM SET wal_level = hot_standby;
ALTER SYSTEM SET max_wal_senders = 16;
ALTER SYSTEM SET max_replication_slots = 10;
ALTER SYSTEM SET wal_keep_segments = 32;
