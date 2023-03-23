CREATE OR REPLACE FUNCTION log_shift_status()
    RETURNS trigger AS $$
    BEGIN
    INSERT INTO shift_status_log(shift_id, status) VALUES (NEW.id, NEW.status);
    END;
    $$ LANGUAGE plpgsql;
    
CREATE TRIGGER log_shift_status_change AFTER UPDATE ON "public"."shift" FOR EACH ROW EXECUTE PROCEDURE log_shift_status();
