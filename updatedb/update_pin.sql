USE cmm;

DELIMITER $$

CREATE OR REPLACE PROCEDURE update_pin(
  IN pMeetingDetailId CHAR(50),
  IN pMeetingId CHAR(50)
)
BEGIN
  DECLARE v_pin INT DEFAULT 0;

SELECT pin
INTO v_pin
FROM call_command
WHERE meeting_detail_id = pMeetingDetailId
    LIMIT 1;

IF v_pin = 0 THEN
UPDATE call_command
SET pin = 1
WHERE meeting_detail_id = pMeetingDetailId;

UPDATE call_command
SET pin = 0
WHERE meeting_detail_id <> pMeetingDetailId
  AND meeting_id = pMeetingId;
ELSE
UPDATE call_command
SET pin = 0
WHERE meeting_detail_id = pMeetingDetailId;
END IF;

END$$

DELIMITER ;
