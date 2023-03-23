CREATE OR REPLACE FUNCTION log_shift_status()
    RETURNS trigger AS $$
    BEGIN
    INSERT INTO shift_status_log(shift_id, status, worker_id) VALUES (NEW.id, NEW.status, NEW.worker_id);
    RETURN null;
    END;
    $$ LANGUAGE plpgsql;
