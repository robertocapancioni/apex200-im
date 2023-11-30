select * from APEX_APPL_WORKFLOWS where application_id = 959 order by LAST_UPDATED_ON desc
select * from APEX_APPL_WORKFLOW_ACTIVITIES where application_id = 959
select * from APEX_APPL_WORKFLOW_ACT_VARS where application_id = 959
select * from APEX_APPL_WORKFLOW_BRANCHES where application_id = 959
select * from APEX_APPL_WORKFLOW_COMP_PARAMS where application_id = 959
select * from APEX_APPL_WORKFLOW_PARAMS where application_id = 959
select * from APEX_APPL_WORKFLOW_PARTICIPANT where application_id = 959
select * from APEX_APPL_WORKFLOW_TRANSITIONS where application_id = 959
select * from APEX_APPL_WORKFLOW_VARIABLES where application_id = 959
select * from APEX_APPL_WORKFLOW_VERSIONS where application_id = 959
  
select * from APEX_WORKFLOWS where application_id = 959 and workflow_id = 17187744451679923 order by LAST_UPDATED_ON desc
select * from APEX_WORKFLOW_ACTIVITIES where application_id = 959 and workflow_id = 17187744451679923 order by END_TIME desc
select * from APEX_WORKFLOW_ACTIVITY_VARS where application_id = 959 and workflow_id = 17187744451679923
select * from APEX_WORKFLOW_AUDIT where application_id = 959 and workflow_id = 17187744451679923 order by LAST_UPDATED_ON desc
select * from APEX_WORKFLOW_PARAMETERS where application_id = 959 and workflow_id = 17187744451679923
select * from APEX_WORKFLOW_PARTICIPANTS
select * from APEX_WORKFLOW_VARIABLES where application_id = 959 and workflow_id = 17187744451679923
