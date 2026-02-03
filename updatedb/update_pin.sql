CREATE OR REPLACE PROCEDURE update_pin(IN pMeetingDetailId CHAR(50),IN pMeetingId CHAR(50))
BEGIN

declare v_pin int;
select pin into v_pin from call_command where meeting_detail_id=pMeetingDetailId;

if v_pin=0 then
update call_command set pin=1 where meeting_detail_id=pMeetingDetailId;
update call_command set pin=0 where meeting_detail_id<>pMeetingDetailId and meeting_id=pMeetingId;
else
update call_command set pin=0 where meeting_detail_id=pMeetingDetailId;
end if;

commit;
END;