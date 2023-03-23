CREATE OR REPLACE FUNCTION log_shift_status()
    RETURNS trigger AS $$
    BEGIN
    INSERT INTO shift_status_log(shift_id, status) VALUES (NEW.id, NEW.status);
    RETURN null;
    END;
    $$ LANGUAGE plpgsql;
