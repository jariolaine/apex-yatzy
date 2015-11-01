set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 112 - Yatzy
--
-- Application Export:
--   Application:     112
--   Name:            Yatzy
--   Date and Time:   14:23 Sunday November 1, 2015
--   Exported By:     LAINFJAR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.6.00.03
--   Instance ID:     69419861619727
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                      3
--     Items:                   18
--     Computations:             6
--     Processes:                7
--     Regions:                  9
--   Shared Components:
--     Logic:
--     Navigation:
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 2
--         Region:               2
--         Label:                2
--         Popup LOV:            1
--         Button:               1
--         Report:               2
--       LOVs:                   1
--       Shortcuts:              2
--       Plug-ins:               2
--     Globalization:
--       Messages:              30
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,8438207834150156));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,112);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,112));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,112));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,112),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,112),
  p_owner => nvl(wwv_flow_application_install.get_schema,'YATZY'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Yatzy'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'YATZY'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt=> '5B20E77AEE7CF61628A8F7DBE7E67405FA7E4EB12F59D146B46F24FF3CB9FCA3',
  p_checksum_salt_last_reset => '20151021192254',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> '0',
  p_allow_feedback_yn=> 'N',
  p_date_time_format=> 'DD-MON-YYYY',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 33870331673329112 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:Yatzy',
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'Release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'D',
  p_deep_linking=>'N',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'N',
  p_csv_encoding=> 'Y',
  p_auto_time_zone=> 'N',
  p_content_delivery_network=> 'GOOGLE',
  p_include_legacy_javascript=> 'N',
  p_error_handling_function=> '#OWNER#.yatzy_util.apex_error_handler',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_last_updated_by => 'LAINFJAR',
  p_last_upd_yyyymmddhh24miss=> '20151101142314',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/desktop
wwv_flow_api.create_user_interface (
  p_id => 28255423739835295 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'DESKTOP'
 ,p_display_name => 'Desktop'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 101
 ,p_home_url => 'f?p=&APP_ID.:GAME:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:HOME:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 28237526193835287 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
null;
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/hold_dice
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 28302238794594570 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'HOLD_DICE',
  p_lov_query=> '.'||to_char(28302238794594570 + wwv_flow_api.g_id_offset)||'.');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_static_lov_data (
  p_id=>28302426674594573 + wwv_flow_api.g_id_offset,
  p_lov_id=>28302238794594570 + wwv_flow_api.g_id_offset,
  p_lov_disp_sequence=>10,
  p_lov_disp_value=>'Hold',
  p_lov_return_value=>'X',
  p_lov_data_comment=> '');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: Global Page - Desktop
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 28255423739835295 + wwv_flow_api.g_id_offset
 ,p_name => 'Global Page - Desktop'
 ,p_alias => 'GLOBAL'
 ,p_step_title => 'Global Page - Desktop'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'D'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20151026114752'
  );
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Home
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_user_interface_id => 28255423739835295 + wwv_flow_api.g_id_offset
 ,p_name => 'Home'
 ,p_alias => 'HOME'
 ,p_step_title => 'Yatzy'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Home'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'C'
 ,p_read_only_when_type => 'REQUEST_EQUALS_CONDITION'
 ,p_read_only_when => 'SUBMIT'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20151101090705'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'with qry as('||unistr('\000a')||
'  select null as player_name,'||unistr('\000a')||
'    null as score,'||unistr('\000a')||
'    null as insert_time'||unistr('\000a')||
'  from dual'||unistr('\000a')||
'  connect by level <= 10'||unistr('\000a')||
'  union all'||unistr('\000a')||
'  select'||unistr('\000a')||
'    player_name,'||unistr('\000a')||
'    score,'||unistr('\000a')||
'    insert_time'||unistr('\000a')||
'  from #OWNER#.yatzy_saved_score_card'||unistr('\000a')||
'  where seq_id = #OWNER#.yatzy_util.get_total_row_id'||unistr('\000a')||
')'||unistr('\000a')||
'select'||unistr('\000a')||
'  player_name,'||unistr('\000a')||
'  score'||unistr('\000a')||
'from qry'||unistr('\000a')||
'order by score desc nulls last, insert_time desc nulls last';

wwv_flow_api.create_report_region (
  p_id=> 20103726964458455 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'High Scores Top 10',
  p_region_name=>'',
  p_template=> 19775521219774986+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'REGION_POSITION_03',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 20101430699204099+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No High Scores Found.',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '10',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 20104110985458463 + wwv_flow_api.g_id_offset,
  p_region_id=> 20103726964458455 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'PLAYER_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Player',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 22962712752253188 + wwv_flow_api.g_id_offset,
  p_region_id=> 20103726964458455 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SCORE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Score',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 35600523183298987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Start New Game',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19775521219774986+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35600817961303088 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PLAYER_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 35600523183298987+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Player Name',
  p_source=>'#OWNER#.yatzy_util.get_player_name_cookie',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 30,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098900725920402+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35602338599341218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_START',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 35600523183298987+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Start',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(19748023719981001 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.yatzy_util.start_game ( :P1_PLAYER_NAME );';

wwv_flow_api.create_page_process(
  p_id     => 35601235912321594 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Start Game',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Game
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_user_interface_id => 28255423739835295 + wwv_flow_api.g_id_offset
 ,p_name => 'Game'
 ,p_alias => 'GAME'
 ,p_step_title => 'Yatzy'
 ,p_allow_duplicate_submissions => 'N'
 ,p_step_sub_title => 'Play Yatzy'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 19743726384970222 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_browser_cache => 'N'
 ,p_deep_linking => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20151101091525'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'#OWNER#.yatzy_util.render_game_round_info ( :P2_ROUNDS_LEFT, :P2_THROWS_LEFT );';

wwv_flow_api.create_page_plug (
  p_id=> 19742513760959128 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Game info',
  p_region_name=>'',
  p_region_css_classes=>'message',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_plug_display_when_condition => 'P2_ROUNDS_LEFT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'"GAME_OVER"';

wwv_flow_api.create_page_plug (
  p_id=> 22970620129190675 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Game over',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'ITEM_IS_NULL_OR_ZERO',
  p_plug_display_when_condition => 'P2_ROUNDS_LEFT',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'"YATZY_RULES"';

wwv_flow_api.create_page_plug (
  p_id=> 35308426002229207 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Rules',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19775521219774986+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT_WITH_SHORTCUTS',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_plug_display_when_condition => 'P2_ROUNDS_LEFT',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 35308820967229211 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Board',
  p_region_name=>'',
  p_region_css_classes=>'side-region',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'BELOW',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'ITEM_NOT_NULL_OR_ZERO',
  p_plug_display_when_condition => 'P2_ROUNDS_LEFT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 22971011949197775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Dice',
  p_region_name=>'',
  p_parent_plug_id=>35308820967229211 + wwv_flow_api.g_id_offset,
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 22973929180221630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Hold',
  p_region_name=>'',
  p_parent_plug_id=>35308820967229211 + wwv_flow_api.g_id_offset,
  p_region_css_classes=>'hideme',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'PLSQL_EXPRESSION',
  p_plug_display_when_condition => '#OWNER#.yatzy_util.get_max_throws > :P2_THROWS_LEFT',
  p_plug_read_only_when_type=>'ITEM_IS_NULL_OR_ZERO',
  p_plug_read_only_when=>'P2_THROWS_LEFT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'with score_card_qry as ('||unistr('\000a')||
'	select seq_id,'||unistr('\000a')||
'		label,'||unistr('\000a')||
'		input_field,'||unistr('\000a')||
'		entered_points,'||unistr('\000a')||
'		possible_points,'||unistr('\000a')||
'		case '||unistr('\000a')||
'		when input_field = ''Y'''||unistr('\000a')||
'		and entered_points is null'||unistr('\000a')||
'		then'||unistr('\000a')||
'			#OWNER#.yatzy_util.enter_points_link ( seq_id, possible_points, ''P2_SEQ_ID'', :WORKSPACE_IMAGES )'||unistr('\000a')||
'		end as link,'||unistr('\000a')||
'		rowspan,'||unistr('\000a')||
'		section_label,'||unistr('\000a')||
'		input_field_class'||unistr('\000a')||
'	from #OWNER#.yatzy_score_card_vw '||unistr('\000a')||
')	'||unistr('\000a')||
'select label,'||unistr('\000a')||
'	case '||unistr('\000a')||
'	when i';

s:=s||'nput_field = ''N'''||unistr('\000a')||
'		or entered_points is not null'||unistr('\000a')||
'		or #OWNER#.yatzy_util.get_max_throws = :P2_THROWS_LEFT'||unistr('\000a')||
'	then'||unistr('\000a')||
'		to_char( entered_points )'||unistr('\000a')||
'	when :P2_THROWS_LEFT <= 0 then'||unistr('\000a')||
'		link'||unistr('\000a')||
'	when possible_points > 0 then'||unistr('\000a')||
'		link'||unistr('\000a')||
'	end as score,'||unistr('\000a')||
'	seq_id,'||unistr('\000a')||
'	rowspan,'||unistr('\000a')||
'	section_label,'||unistr('\000a')||
'	input_field_class'||unistr('\000a')||
'from score_card_qry'||unistr('\000a')||
'order by seq_id';

wwv_flow_api.create_report_region (
  p_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_name=> 'Score Card',
  p_region_name=>'',
  p_template=> 19746415704974770+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_region_css_classes=>'side-region',
  p_new_grid         => false,
  p_new_grid_row     => true,
  p_new_grid_column  => true,
  p_display_column=> null,
  p_display_point=> 'BODY_3',
  p_item_display_point=> 'ABOVE',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'N',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 22986431953356039+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'NO_HEADINGS',
  p_query_num_rows=> '19',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> '0',
  p_query_row_count_max=> '19',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 35311630224229217 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LABEL',
  p_column_display_sequence=> 2,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 35311714397229218 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'SCORE',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'RIGHT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 21209026213793202 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SEQ_ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 22987328213448859 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'ROWSPAN',
  p_column_display_sequence=> 4,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 22994324890088466 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'SECTION_LABEL',
  p_column_display_sequence=> 5,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 23447028541064284 + wwv_flow_api.g_id_offset,
  p_region_id=> 35311416441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'INPUT_FIELD_CLASS',
  p_column_display_sequence=> 6,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>35313840596229221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>23485919928848691 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'EXIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 160,
  p_item_plug_id => 22970620129190675+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Exit',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(19748023719981001 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35309020468229212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'THROW',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 90,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Throw',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(19748023719981001 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>':P2_THROWS_LEFT between 1 and #OWNER#.yatzy_util.get_max_throws',
  p_display_when_type=>'PLSQL_EXPRESSION',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35309231182229214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_DICE_1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dice One',
  p_source=>'#OWNER#.yatzy_util.roll_dice',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P2_HOLD_1',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35309440157229214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_DICE_2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dice Two',
  p_source=>'#OWNER#.yatzy_util.roll_dice',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P2_HOLD_2',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35309619003229214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_DICE_3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dice Three',
  p_source=>'#OWNER#.yatzy_util.roll_dice',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P2_HOLD_3',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35309834550229214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_DICE_4',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dice Four',
  p_source=>'#OWNER#.yatzy_util.roll_dice',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P2_HOLD_4',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35310024536229214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_DICE_5',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 22971011949197775+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dice Five',
  p_source=>'#OWNER#.yatzy_util.roll_dice',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_read_only_when=>'P2_HOLD_5',
  p_read_only_when_type=>'ITEM_IS_NOT_NULL',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35310230608229215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_HOLD_1',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 100,
  p_item_plug_id => 22973929180221630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Hold Dice One',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'P2_DICE_1',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35310422343229215 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_HOLD_2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 22973929180221630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Hold Dice Two',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'P2_DICE_2',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35310612555229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_HOLD_3',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 22973929180221630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Hold Dice Three',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'P2_DICE_3',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35310812441229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_HOLD_4',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 22973929180221630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Hold Dice Four',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'P2_DICE_4',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35311014955229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_HOLD_5',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 140,
  p_item_plug_id => 22973929180221630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Hold Dice Five',
  p_source_type=> 'STATIC',
  p_display_as=> 'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 20098223923897950+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'P2_DICE_5',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35311225103229216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_THROWS_LEFT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 35311416441229216+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'#OWNER#.yatzy_util.get_max_throws',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>35311942675229218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_SEQ_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 35311416441229216+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>36530530351707525 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_ROUNDS_LEFT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 35311416441229216+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'#OWNER#.yatzy_util.get_rounds_left',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'S',
  p_escape_on_http_output => 'Y',
  p_restricted_characters => 'US_ONLY',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>36533434855735776 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'SUBMIT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 22970620129190675+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Save',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(19748023719981001 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_protection_level => 'S',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35312218616229219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 10,
  p_computation_item=> 'P2_DICE_1',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '#OWNER#.yatzy_util.roll_dice',
  p_compute_when => 'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_1, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35312430413229219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 20,
  p_computation_item=> 'P2_DICE_2',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '#OWNER#.yatzy_util.roll_dice',
  p_compute_when => 'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_2, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35312641287229219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 30,
  p_computation_item=> 'P2_DICE_3',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '#OWNER#.yatzy_util.roll_dice',
  p_compute_when => 'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_3, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35312830853229220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 40,
  p_computation_item=> 'P2_DICE_4',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '#OWNER#.yatzy_util.roll_dice',
  p_compute_when => 'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_4, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35313022647229220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 50,
  p_computation_item=> 'P2_DICE_5',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '#OWNER#.yatzy_util.roll_dice',
  p_compute_when => 'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_5, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 35313220856229220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_computation_sequence => 60,
  p_computation_item=> 'P2_THROWS_LEFT',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'FUNCTION_BODY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'return case '||unistr('\000a')||
'	when :P2_THROWS_LEFT > 0 then'||unistr('\000a')||
'		:P2_THROWS_LEFT - 1'||unistr('\000a')||
'	else'||unistr('\000a')||
'		0'||unistr('\000a')||
'	end;',
  p_compute_when => '#OWNER#.yatzy_util.g_throw = :REQUEST',
  p_compute_when_type=>'PLSQL_EXPRESSION');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.yatzy_util.enter_points ( :P2_SEQ_ID );';

wwv_flow_api.create_page_process(
  p_id     => 35313536521229221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Enter points',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'#OWNER#.yatzy_util.g_enter_points = :REQUEST',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P2_HOLD_1,P2_HOLD_2,P2_HOLD_3,P2_HOLD_4,P2_HOLD_5,P2_THROWS_LEFT,P2_ROUNDS_LEFT';

wwv_flow_api.create_page_process(
  p_id     => 38713129550507865 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Clear items',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'#OWNER#.yatzy_util.g_enter_points = :REQUEST',
  p_process_when_type=>'PLSQL_EXPRESSION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.yatzy_util.calc_possible_points ('||unistr('\000a')||
'	#OWNER#.yatzy_num_tab('||unistr('\000a')||
'		:P2_DICE_1,'||unistr('\000a')||
'		:P2_DICE_2,'||unistr('\000a')||
'		:P2_DICE_3,'||unistr('\000a')||
'		:P2_DICE_4,'||unistr('\000a')||
'		:P2_DICE_5'||unistr('\000a')||
'	)'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 35313313064229220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Calculate possible points',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>35309020468229212 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#.yatzy_util.save_score_card ('||unistr('\000a')||
'	p_app_id		=> :APP_ID,'||unistr('\000a')||
'	p_app_session	=> :APP_SESSION,'||unistr('\000a')||
'	p_player_name	=> :APP_USER'||unistr('\000a')||
');';

wwv_flow_api.create_page_process(
  p_id     => 21214211408031027 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Save scores',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>36533434855735776 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.logout ( :APP_SESSION, :APP_ID );';

wwv_flow_api.create_page_process(
  p_id     => 23486817021909458 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Exit without saving',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>23485919928848691 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'yatzy_collection.create_collection;'||unistr('\000a')||
'for c1 in ('||unistr('\000a')||
'select seq_id'||unistr('\000a')||
'from yatzy_score_card_vw'||unistr('\000a')||
')'||unistr('\000a')||
'loop'||unistr('\000a')||
'yatzy_collection.update_entered_points(c1.seq_id,10);'||unistr('\000a')||
'yatzy_collection.update_possible_points(2,10);'||unistr('\000a')||
'yatzy_collection.update_possible_points(3,10);'||unistr('\000a')||
'yatzy_collection.update_possible_points(4,10);'||unistr('\000a')||
'yatzy_collection.update_possible_points(5,10);'||unistr('\000a')||
'end loop;'||unistr('\000a')||
':P2_THROWS_LEFT := 0;';

wwv_flow_api.create_page_process(
  p_id     => 23487612301377863 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 40,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'test',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'',
  p_process_when_type=>'NEVER',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 28256733161835297 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=>28257026154835297 + wwv_flow_api.g_id_offset,
  p_menu_id=>28256733161835297 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Home',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 112
--
--application/shared_components/user_interface/templates/page/game
prompt  ......Page template 19743726384970222
 
begin
 
wwv_flow_api.create_template (
  p_id => 19743726384970222 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Game'
 ,p_is_popup => false
 ,p_css_file_urls => '#WORKSPACE_IMAGES#yatzy#MIN#.css'
 ,p_header_template => '<!doctype html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE.">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'  #THEME_CSS#'||unistr('\000a')||
'  #TEMPLATE_CSS#'||unistr('\000a')||
'  #PAGE_CSS#'||unistr('\000a')||
'  #HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<div class="messages">'||unistr('\000a')||
' #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
' <!--[if lt IE 9]><div class="warning">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div class="container">'||unistr('\000a')||
' <div class="info">'||unistr('\000a')||
'  #REGION_POSITION_01#'||unistr('\000a')||
'  <section class="board clearfix">'||unistr('\000a')||
'   <div class="col_50">'||unistr('\000a')||
'    #BOX_BODY#<div class="clearfix"></div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'   <div class="col_33">'||unistr('\000a')||
'    #REGION_POSITION_03#<div class="clearfix"></div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </section>'||unistr('\000a')||
' </div>'
 ,p_footer_template => 
' <footer class="footer clearfix">'||unistr('\000a')||
' </footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#  '||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success">#SUCCESS_MESSAGE#</div>'
 ,p_notification_message => '<div class="warning">#MESSAGE#</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 3
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 3
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '#COLUMNS#'||unistr('\000a')||
''
 ,p_grid_column_template => '#CONTENT#'
 ,p_has_edit_links => true
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 19773229681294620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 19743726384970222 + wwv_flow_api.g_id_offset
 ,p_name => 'Main Content'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 2
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_column
prompt  ......Page template 20065924578710362
 
begin
 
wwv_flow_api.create_template (
  p_id => 20065924578710362 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 101
 ,p_name => 'Two Column'
 ,p_is_popup => false
 ,p_css_file_urls => '#WORKSPACE_IMAGES#yatzy#MIN#.css'
 ,p_header_template => '<!doctype html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE.">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="UTF-8">'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width,initial-scale=1">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'  #THEME_CSS#'||unistr('\000a')||
'  #TEMPLATE_CSS#'||unistr('\000a')||
'  #PAGE_CSS# '||unistr('\000a')||
'  #HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'||unistr('\000a')||
'<div class="messages">'||unistr('\000a')||
' #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
' <!--[if lt IE 9]><div class="warning">#OUTDATED_BROWSER#</div><![endif]-->'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''
 ,p_box => 
'<div class="container">'||unistr('\000a')||
' <header class="header clearfix">'||unistr('\000a')||
'  <div class="logo">#LOGO#</div>'||unistr('\000a')||
' </header>'||unistr('\000a')||
'  <div class="info">'||unistr('\000a')||
'   #REGION_POSITION_02#'||unistr('\000a')||
'   <section class="board clearfix">'||unistr('\000a')||
'    <div class="col_50">'||unistr('\000a')||
'     #BOX_BODY#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'    <div class="col_40">'||unistr('\000a')||
'     #REGION_POSITION_03#'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'   </section>'||unistr('\000a')||
' </div>'
 ,p_footer_template => 
' <footer class="footer clearfix"></footer>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#  '||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="success">'||unistr('\000a')||
' <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>'||unistr('\000a')||
' #SUCCESS_MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="warning">'||unistr('\000a')||
' <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>'||unistr('\000a')||
' #MESSAGE#'||unistr('\000a')||
'</div>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#">#TEXT#</a>#EDIT#'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<div>'||unistr('\000a')||
' <p><strong>#MESSAGE#</strong></p>'||unistr('\000a')||
' <p>#ADDITIONAL_INFO#</p>'||unistr('\000a')||
' <div>#TECHNICAL_INFO#</div>'||unistr('\000a')||
' <p><a href="f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION."><strong>#RETURN_TO_APPLICATION#</strong></a></p>'||unistr('\000a')||
'</div>'
 ,p_grid_type => 'FIXED'
 ,p_grid_max_columns => 8
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => true
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '#ROWS#'
 ,p_grid_row_template => '<div class="clearfix">#COLUMNS#</div>'||unistr('\000a')||
''
 ,p_grid_column_template => '<div class="grid-column">#CONTENT#</div>'
 ,p_has_edit_links => true
  );
wwv_flow_api.create_page_tmpl_display_point (
  p_id => 20066214823710364 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_template_id => 20065924578710362 + wwv_flow_api.g_id_offset
 ,p_name => 'Main Content'
 ,p_placeholder => 'BOX_BODY'
 ,p_has_grid_support => true
 ,p_max_fixed_grid_columns => 8
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 19748023719981001
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 19748023719981001 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<button class="button #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_hot_template => 
'<button class="button hot #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
 ,p_theme_class_id => 1
 ,p_theme_id => 101
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/div_region_with_id
prompt  ......region template 19746415704974770
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 19746415704974770 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> '||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'DIV Region with ID'
 ,p_theme_id => 101
 ,p_theme_class_id => 11
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_with_title
prompt  ......region template 19775521219774986
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 19775521219774986 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="region #REGION_CSS_CLASSES#">'||unistr('\000a')||
'<h2>#TITLE#</h2>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region with Title'
 ,p_theme_id => 101
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
  );
null;
 
end;
/

prompt  ...List Templates
--
prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/standard_report
prompt  ......report template 20101430699204099
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 20101430699204099 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="paper">',
  p_row_template_after_rows =>'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table><tbody>#PAGINATION#</tbody></table>'||unistr('\000a')||
'',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<thead>',
  p_column_heading_template=>'<th class="cell#" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_after_column_heading=>'</thead>'||unistr('\000a')||
'<tbody>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_pagination_template=>'<span class="instructiontext">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""> #PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt=""></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""> #PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 20101430699204099 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/score_card
prompt  ......report template 22986431953356039
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr>'||unistr('\000a')||
'<td rowspan="#ROWSPAN#" class="top-border side"><div>#SECTION_LABEL#</div></td>'||unistr('\000a')||
'<td class="top-border cell1">#LABEL#</td>'||unistr('\000a')||
'<td class="top-border cell2 #INPUT_FIELD_CLASS#">#SCORE#</td>'||unistr('\000a')||
'</tr>';

c2:=c2||'<tr>'||unistr('\000a')||
'<td class="cell1">#LABEL#</td>'||unistr('\000a')||
'<td class="cell2 #INPUT_FIELD_CLASS#">#SCORE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 22986431953356039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Score Card',
  p_row_template1=> c1,
  p_row_template_condition1=> ':ROWSPAN is not null',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table class="paper score-card"><tbody>',
  p_row_template_after_rows =>'</tbody></table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 101,
  p_theme_class_id => 8,
  p_row_template_comment=> '');
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 20098223923897950
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 20098223923897950 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="hideme">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span>#ERROR_MESSAGE#</span>',
  p_theme_id  => 101,
  p_theme_class_id => 13,
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 20098900725920402
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 20098900725920402 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" class="label-optional">',
  p_template_body2=>'</label>'||unistr('\000a')||
'<div class="item-container">',
  p_before_item=>'',
  p_after_item=>'</div>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<span class="label-error">#ERROR_MESSAGE#</span>',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 19768410606005560
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 19768410606005560 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width=13 height=13',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>',
  p_page_body_attr=>'bgcolor=white OnLoad=first_field()',
  p_before_field_text=>' ',
  p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-family:arial; background-color:#ffffff;} </style>',
  p_page_footer_text =>'</center></td></tr></table>',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div><br />',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW#',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'',
  p_after_result_set   =>'');
end;
null;
 
end;
/

prompt  ...calendar templates
--
prompt  ...application themes
--
--application/shared_components/user_interface/themes/simple
prompt  ......theme 19731819870721688
begin
wwv_flow_api.create_theme (
  p_id =>19731819870721688 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 101,
  p_theme_name=>'Simple',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>20065924578710362 + wwv_flow_api.g_id_offset,
  p_error_template=>20065924578710362 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>null + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'',
  p_sidebar_display_point=>'',
  p_login_template=>null + wwv_flow_api.g_id_offset,
  p_default_button_template=>19748023719981001 + wwv_flow_api.g_id_offset,
  p_default_region_template=>19775521219774986 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>null + wwv_flow_api.g_id_offset,
  p_default_form_template  =>null + wwv_flow_api.g_id_offset,
  p_default_reportr_template => null,
  p_default_tabform_template=>null + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>null + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>null + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template   =>20101430699204099 + wwv_flow_api.g_id_offset,
  p_default_label_template=>null + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>null + wwv_flow_api.g_id_offset,
  p_default_list_template=>null + wwv_flow_api.g_id_offset,
  p_default_option_label=>null + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>null + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 112
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
prompt  ......Message game_over
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<p>Game over</p>'||unistr('\000a')||
'<p>Click ''Save'' to save score card or ''Exit'' to leave without saving</p>';

wwv_flow_api.create_message (
  p_id=>20063805152384419 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'GAME_OVER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message generic_error
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ooops... We are sorry! Unexpected internal error have occurred.';

wwv_flow_api.create_message (
  p_id=>23336725413484363 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'GENERIC_ERROR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message enter_points_no_data
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ooops... Did you press browser back button?';

wwv_flow_api.create_message (
  p_id=>23336914605519756 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'ENTER_POINTS_NO_DATA',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message return_to_application
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Please return to game.';

wwv_flow_api.create_message (
  p_id=>23507100243532304 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'RETURN_TO_APPLICATION',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message apex_page_duplicate_submit
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ooops... Too many throws.';

wwv_flow_api.create_message (
  p_id=>23507322659537120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'APEX.PAGE.DUPLICATE_SUBMIT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message outdated_browser
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/"><strong>upgrade your browser</strong></a> to improve your experience.';

wwv_flow_api.create_message (
  p_id=>23519513301828547 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'OUTDATED_BROWSER',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message ones
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Ones';

wwv_flow_api.create_message (
  p_id=>28438615182123884 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'ONES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message twos
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Twos';

wwv_flow_api.create_message (
  p_id=>28438813025124886 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TWOS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message threes
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Threes';

wwv_flow_api.create_message (
  p_id=>28439042774126249 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'THREES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message fours
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fours';

wwv_flow_api.create_message (
  p_id=>28439240402127389 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FOURS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message fives
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Fives';

wwv_flow_api.create_message (
  p_id=>28439438676128181 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FIVES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message sixes
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sixes';

wwv_flow_api.create_message (
  p_id=>28439635657129554 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SIXES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message sum
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Sum';

wwv_flow_api.create_message (
  p_id=>28439831128131652 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SUM',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message bonus
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Bonus';

wwv_flow_api.create_message (
  p_id=>28440029619132375 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'BONUS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message pair
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'One Pair';

wwv_flow_api.create_message (
  p_id=>28440222933135422 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'PAIR',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message two_pairs
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Two Pairs';

wwv_flow_api.create_message (
  p_id=>28440418404137588 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TWO_PAIRS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message three_of_kind
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Three of Kind';

wwv_flow_api.create_message (
  p_id=>28440613228139982 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'THREE_OF_KIND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message four_of_kind
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Four of Kind';

wwv_flow_api.create_message (
  p_id=>28440841036142217 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FOUR_OF_KIND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message small_straight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Small Straight';

wwv_flow_api.create_message (
  p_id=>28441036507144301 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'SMALL_STRAIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message large_straight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Large Straight';

wwv_flow_api.create_message (
  p_id=>28441232194146365 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'LARGE_STRAIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message jump_straight
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Jump Straight';

wwv_flow_api.create_message (
  p_id=>28441424430149953 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'JUMP_STRAIGHT',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message full_house
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Full House';

wwv_flow_api.create_message (
  p_id=>28441618823152541 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'FULL_HOUSE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message chance
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Chance';

wwv_flow_api.create_message (
  p_id=>28441814294154600 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'CHANCE',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message yatzy
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Yatzy';

wwv_flow_api.create_message (
  p_id=>28442010412156389 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'YATZY',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message total
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Total';

wwv_flow_api.create_message (
  p_id=>28442238867158464 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'TOTAL',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message start_round
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<p>Click ''Throw'' to begin the round...</p>';

wwv_flow_api.create_message (
  p_id=>28571511120611866 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'START_ROUND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message yatzy_rules
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<p>'||unistr('\000a')||
'Roll the dice and collect your scores. You can re-roll twice and hold any dice.'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'The game is finished when you have filled all the slots in the scoreboard.<br/>'||unistr('\000a')||
'You can place your roll on any of the blank slots at the scoreboard, but you will receive zero points if you don''t have the right combination'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'If sum of upper section is 63 points or more, you receive 50 bonus points.'||unistr('\000a')||
'<';

h:=h||'/p>'||unistr('\000a')||
'<h3>Upper section:</h3>'||unistr('\000a')||
'<ul><li>'||unistr('\000a')||
'Collect dice with all same numbers'||unistr('\000a')||
'</li></ul>'||unistr('\000a')||
'<h3>Lower section:</h3>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>One Pair: Two same numbers</li>'||unistr('\000a')||
'<li>Two Pairs: Two pairs of dice</li>'||unistr('\000a')||
'<li>Thee of Kind: Three same numbers</li>'||unistr('\000a')||
'<li>Small Straight: 1,2,3,4,5</li>'||unistr('\000a')||
'<li>Large Straight: 2,3,4,5,6</li>'||unistr('\000a')||
'<li>Jump Straight: 1,3,4,5,6 or 1,2,3,4,6</li>'||unistr('\000a')||
'<li>Full House: Three same and pair</li>'||unistr('\000a')||
'<li>Chance: An';

h:=h||'y combination</li>'||unistr('\000a')||
'<li>Yatzy: All dice same numbers</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<p>From Yatzy you receive constant 50 points.</p>';

wwv_flow_api.create_message (
  p_id=>34520229259157271 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'YATZY_RULES',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message continue_round
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<p>You have %0 rolls left</p>'||unistr('\000a')||
'<p>Click dice(s) to hold it and then click ''Throw'' to re-roll.</p>'||unistr('\000a')||
'<p>Or you can place score to score card and end the round.</p>';

wwv_flow_api.create_message (
  p_id=>34522628932294174 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'CONTINUE_ROUND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message end_round
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'<p>You have %0 rolls left</p>'||unistr('\000a')||
'<p>Place your points at score box of your choice. If you have no match, you need place a zero.</p>';

wwv_flow_api.create_message (
  p_id=>34522929782308945 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'END_ROUND',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

prompt  ......Message enter_points
declare
  h varchar2(32767) := null;
 
begin
 
h:=h||'Enter Points';

wwv_flow_api.create_message (
  p_id=>37309435582226446 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_name=>'ENTER_POINTS',
  p_message_language=>'en',
  p_message_text=>h);
null;
 
end;
/

--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/game_over
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 22957706596724053 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'GAME_OVER',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/yatzy_rules
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1 := null;
wwv_flow_api.create_shortcut (
 p_id=> 34519923017145000 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'YATZY_RULES',
 p_shortcut_type=> 'MESSAGE',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/yatzy_custom_athentication
prompt  ......authentication 33870331673329112
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 33870331673329112 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Yatzy Custom Athentication'
 ,p_scheme_type => 'NATIVE_CUSTOM'
 ,p_attribute_05 => 'N'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/item_type/com_tilaa_cloud_jaris_dice
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 28263831988140433 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.TILAA.CLOUD.JARIS.DICE'
 ,p_display_name => 'Dice'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => '#OWNER#.yatzy_plugin.render_dice'
 ,p_standard_attributes => 'VISIBLE:READONLY:SOURCE:FORMAT_MASK_NUMBER'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
null;
 
end;
/

--application/shared_components/plugins/item_type/com_tilaa_cloud_jaris_hold_dice
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 47341151642871617 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.TILAA.CLOUD.JARIS.HOLD_DICE'
 ,p_display_name => 'Hold Dice'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => '#OWNER#.yatzy_plugin.render_hold_dice'
 ,p_standard_attributes => 'VISIBLE:SESSION_STATE:READONLY:SOURCE'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_version_identifier => '1.0'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 47353446713101776 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 47341151642871617 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Dice Item'
 ,p_attribute_type => 'PAGE ITEM'
 ,p_is_required => true
 ,p_is_translatable => false
  );
null;
 
end;
/

prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s:=s||'drop view yatzy_score_card_vw'||unistr('\000a')||
'/'||unistr('\000a')||
'drop table yatzy_saved_score_card'||unistr('\000a')||
'/'||unistr('\000a')||
'drop table yatzy_template_score_card'||unistr('\000a')||
'/'||unistr('\000a')||
'drop sequence yatzy_seq'||unistr('\000a')||
'/'||unistr('\000a')||
'drop type yatzy_num_tab'||unistr('\000a')||
'/'||unistr('\000a')||
'drop package yatzy_util'||unistr('\000a')||
'/'||unistr('\000a')||
'drop package yatzy_plugin'||unistr('\000a')||
'/'||unistr('\000a')||
'drop package yatzy_collection'||unistr('\000a')||
'/'||unistr('\000a')||
'begin'||unistr('\000a')||
'    wwv_flow_api.create_or_remove_file('||unistr('\000a')||
'        p_location => ''WORKSPACE'','||unistr('\000a')||
'        p_name     => ''pencil2_16x16.gif'','||unistr('\000a')||
'        p_mode     => ''REMOVE'',';

s:=s||''||unistr('\000a')||
'        p_type     => ''IMAGE'');'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'    wwv_flow_api.create_or_remove_file( '||unistr('\000a')||
'        p_location => ''WORKSPACE'','||unistr('\000a')||
'        p_name     => ''yatzy.css'','||unistr('\000a')||
'        p_mode     => ''REMOVE'','||unistr('\000a')||
'        p_type     => ''CSS'');'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
'    wwv_flow_api.create_or_remove_file( '||unistr('\000a')||
'        p_location => ''WORKSPACE'','||unistr('\000a')||
'        p_name     => ''yatzy.min.css'','||unistr('\000a')||
'        p_mode     => ''REMOVE'','||unistr('\000a')||
'        p_type    ';

s:=s||' => ''CSS'');'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install (
  p_id => 28289916032294764 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_welcome_message => 'This application installer will guide you through the process of creating your database objects and seed data.',
  p_license_message    => '<pre>'||unistr('\000a')||
'The MIT License (MIT)'||unistr('\000a')||
''||unistr('\000a')||
'Copyright (c) 2015 Jari Laine'||unistr('\000a')||
''||unistr('\000a')||
'Permission is hereby granted, free of charge, to any person obtaining a copy'||unistr('\000a')||
'of this software and associated documentation files (the "Software"), to deal'||unistr('\000a')||
'in the Software without restriction, including without limitation the rights'||unistr('\000a')||
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell'||unistr('\000a')||
'copies of the Software, and to permit persons to whom the Software is'||unistr('\000a')||
'furnished to do so, subject to the following conditions:'||unistr('\000a')||
''||unistr('\000a')||
'The above copyright notice and this permission notice shall be included in all'||unistr('\000a')||
'copies or substantial portions of the Software.'||unistr('\000a')||
''||unistr('\000a')||
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'||unistr('\000a')||
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'||unistr('\000a')||
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE'||unistr('\000a')||
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'||unistr('\000a')||
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,'||unistr('\000a')||
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE'||unistr('\000a')||
'SOFTWARE.'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'Cascading Style Sheets yatzy.css and yatzy.min.css of the application uses parts from 3party code that is listed here:'||unistr('\000a')||
''||unistr('\000a')||
'---'||unistr('\000a')||
''||unistr('\000a')||
'CSS Dice An Experiment by Jonathan Sampson - @jonathansampson'||unistr('\000a')||
'http://sampsonblog.com/289/of-dice-dabblet-and-css'||unistr('\000a')||
''||unistr('\000a')||
'---'||unistr('\000a')||
''||unistr('\000a')||
'normalize.css v3.0.3'||unistr('\000a')||
'https://github.com/necolas/normalize.css'||unistr('\000a')||
''||unistr('\000a')||
'Copyright (c) Nicolas Gallagher and Jonathan Neal'||unistr('\000a')||
''||unistr('\000a')||
'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:'||unistr('\000a')||
''||unistr('\000a')||
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.'||unistr('\000a')||
''||unistr('\000a')||
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'||unistr('\000a')||
''||unistr('\000a')||
'---'||unistr('\000a')||
''||unistr('\000a')||
'"Simpliste" is a simple responsive HTML5 template'||unistr('\000a')||
'http://cssr.ru/simpliste/'||unistr('\000a')||
''||unistr('\000a')||
'Copyright (c) 2012 Renat Rafikov'||unistr('\000a')||
''||unistr('\000a')||
'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:'||unistr('\000a')||
''||unistr('\000a')||
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'||unistr('\000a')||
''||unistr('\000a')||
'</pre>',
  p_configuration_message => 'You can configure the following attributes of your application.',
  p_build_options_message => 'You can choose to include the following build options.',
  p_validation_message => 'The following validations will be performed to ensure your system is compatible with this application.',
  p_install_message=> 'Please confirm that you would like to install this application''s supporting objects.',
  p_install_success_message => 'Your application''s supporting objects have been installed.',
  p_install_failure_message => 'Installation of database objects and seed data has failed.',
  p_upgrade_message => 'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.',
  p_upgrade_confirm_message => 'Please confirm that you would like to install this application''s supporting objects.',
  p_upgrade_success_message => 'Your application''s supporting objects have been installed.',
  p_upgrade_failure_message => 'Installation of database objects and seed data has failed.',
  p_deinstall_success_message => 'Deinstallation complete.',
  p_deinstall_script_clob => s,
  p_required_free_kb => 100,
  p_required_sys_privs => 'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW',
  p_required_names_available => 'YATZY_COLLECTION:YATZY_NUM_TAB:YATZY_PLUGIN:YATZY_SAVED_SCORE_CARD:YATZY_SAVED_SCORE_CARD_BI:YATZY_SCORE_CARD_VW:YATZY_SEQ:YATZY_TEMPLATE_SCORE_CARD:YATZY_UTIL',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace type yatzy_num_tab is table of number;'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 28438023939103418 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'type',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create sequence yatzy_seq'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 28291013458483274 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'sequence',
  p_sequence=> 20,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create table yatzy_template_score_card'||unistr('\000a')||
'('||unistr('\000a')||
'  seq_id number(2,0) not null'||unistr('\000a')||
', input_field char(1) not null'||unistr('\000a')||
', label_msg varchar2(30) not null'||unistr('\000a')||
', card_section varchar2(30) not null'||unistr('\000a')||
', constraint yatzy_template_score_card_pk primary key ( seq_id )'||unistr('\000a')||
', constraint yatzy_template_score_card_uk1 unique ( label_msg )'||unistr('\000a')||
', constraint yatzy_template_score_card_ck1 check ( seq_id between 1 and 19 )'||unistr('\000a')||
', constraint yatzy_te';

s:=s||'mplate_score_card_ck2 check ( input_field in ( ''N'', ''Y'' ) )'||unistr('\000a')||
', constraint yatzy_template_score_card_ck3 check ( card_section in( ''UPPER'', ''MIDDLE'', ''LOWER'', ''TOTAL'' ) )'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'comment on table yatzy_template_score_card is ''Yatzy score card template. Metadata for Yatzy game'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_template_score_card.seq_id is ''Primary key / record order in score card'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_temp';

s:=s||'late_score_card.input_field is ''Is score box'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_template_score_card.label_msg is ''APEX text message for score card row label'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_template_score_card.card_section is ''Section in score card'''||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'create table yatzy_saved_score_card'||unistr('\000a')||
'('||unistr('\000a')||
'  sgid number not null'||unistr('\000a')||
', game_id number not null'||unistr('\000a')||
', insert_time timestamp with time zone default systimestamp not null'||unistr('\000a')||
', ape';

s:=s||'x_session_id number not null'||unistr('\000a')||
', seq_id number not null'||unistr('\000a')||
', player_name varchar2(256) not null'||unistr('\000a')||
', score number not null'||unistr('\000a')||
', constraint yatzy_saved_score_card_pk primary key ( sgid )'||unistr('\000a')||
', constraint yatzy_saved_score_card_uk1 unique ( game_id, sgid )'||unistr('\000a')||
', constraint yatzy_saved_score_card_uk2 unique ( seq_id, game_id )'||unistr('\000a')||
', constraint yatzy_saved_score_card_fk1 foreign key ( seq_id ) references yatzy_template_scor';

s:=s||'e_card ( seq_id )'||unistr('\000a')||
', constraint yatzy_saved_score_card_ck1 check ( sgid > 0 )'||unistr('\000a')||
', constraint yatzy_saved_score_card_ck2 check ( game_id > 0 )'||unistr('\000a')||
')'||unistr('\000a')||
'/'||unistr('\000a')||
'comment on table yatzy_saved_score_card is ''Yatzy saved scores / Yatzy game high scores'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_card.sgid is ''Surrogate primary key'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_card.game_id is ''Surrogate key for game'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on c';

s:=s||'olumn yatzy_saved_score_card.apex_session_id is ''APEX session id'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_card.insert_time is ''Insert time / when game was played'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_card.seq_id is ''Order in score card. references yatzy_template_score_card.seq_id'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_card.player_name is ''Who did play game'''||unistr('\000a')||
'/'||unistr('\000a')||
'comment on column yatzy_saved_score_car';

s:=s||'d.score is ''Player score'''||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'trigger yatzy_saved_score_card_bi'||unistr('\000a')||
'before insert on yatzy_saved_score_card'||unistr('\000a')||
'for each row'||unistr('\000a')||
'declare'||unistr('\000a')||
'    l_game_id number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'    if inserting then'||unistr('\000a')||
'        if :new.sgid is null then'||unistr('\000a')||
'            :new.sgid := yatzy_seq.nextval;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    end if;'||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 28290326075297659 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'tables',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'package yatzy_collection'||unistr('\000a')||
'authid definer'||unistr('\000a')||
'as'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this package holds procedures and functions for yatzy game score card'||unistr('\000a')||
'--    apex_collection creation and update'||unistr('\000a')||
'-----------------------------------------------------------';

s:=s||'---------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_collection_name return varchar2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure create_collection;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure update_possible_points ('||unistr('\000a')||
'        p_seq';

s:=s||'_id        in number,'||unistr('\000a')||
'        p_result        in number'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure update_entered_points ('||unistr('\000a')||
'        p_seq_id        in number,'||unistr('\000a')||
'        p_result        in number'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_collection;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'package body yatzy_';

s:=s||'collection'||unistr('\000a')||
'as'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--      private'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    --    package private constants'||unistr('\000a')||
''||unistr('\000a')||
'    --   ';

s:=s||' score card apex_collection name'||unistr('\000a')||
'    c_score_card_collection        constant varchar2(30)    := ''YATZY_SCORE_CARD'';'||unistr('\000a')||
''||unistr('\000a')||
'    --    score card apex_collection number attribute for possible points'||unistr('\000a')||
'    c_possible_points_attr_num    constant number := 2;'||unistr('\000a')||
'    --    score card apex_collection number attribute for entered points'||unistr('\000a')||
'    c_entered_points_attr_num    constant number := 1;'||unistr('\000a')||
''||unistr('\000a')||
'------------------------';

s:=s||'--------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    global'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns score card apex_collection name'||unistr('\000a')||
'--    from package private ';

s:=s||'constant'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_collection_name return varchar2'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return c_score_card_collection;'||unistr('\000a')||
'    end get_collection_name;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'---------------------------------------';

s:=s||'-----------------------------------------'||unistr('\000a')||
'--    this procedure creates score card apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure create_collection'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        if apex_collection.collection_exists ( c_score_card_collection ) then'||unistr('\000a')||
'            apex_collection.delete_coll';

s:=s||'ection ( c_score_card_collection );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        apex_collection.create_collection_from_queryb2 ('||unistr('\000a')||
'            p_collection_name => c_score_card_collection,'||unistr('\000a')||
'            p_query => q''['||unistr('\000a')||
'                select'||unistr('\000a')||
'                    case'||unistr('\000a')||
'                    when input_field = ''N'''||unistr('\000a')||
'                    then'||unistr('\000a')||
'                        0'||unistr('\000a')||
'                    end as entered_points,            /* n001 */';

s:=s||''||unistr('\000a')||
'                    0 as possible_points,            /* n002 */'||unistr('\000a')||
'                    case when count ( seq_id ) over ('||unistr('\000a')||
'                        partition by card_section'||unistr('\000a')||
'                        order by seq_id'||unistr('\000a')||
'                    ) = 1 then'||unistr('\000a')||
'                        count ( seq_id ) over ('||unistr('\000a')||
'                            partition by card_section '||unistr('\000a')||
'                        )'||unistr('\000a')||
'                    end as rows';

s:=s||'pan,                    /* n003 */'||unistr('\000a')||
'                    null as n004,                     /* n004 */'||unistr('\000a')||
'                    null as n005,                    /* n005 */'||unistr('\000a')||
'                    null as d001,'||unistr('\000a')||
'                    null as d002,'||unistr('\000a')||
'                    null as d003,'||unistr('\000a')||
'                    null as d004,'||unistr('\000a')||
'                    null as d005,'||unistr('\000a')||
'                    label_msg,'||unistr('\000a')||
'                    input_field,'||unistr('\000a')||
'  ';

s:=s||'                  case when count ( seq_id ) over ('||unistr('\000a')||
'                        partition by card_section'||unistr('\000a')||
'                        order by seq_id'||unistr('\000a')||
'                    ) = 1 and input_field = ''Y'' then'||unistr('\000a')||
'                        card_section'||unistr('\000a')||
'                    else'||unistr('\000a')||
'                        '' '''||unistr('\000a')||
'                    end as section_msg,'||unistr('\000a')||
'                    case when input_field = ''Y'' then'||unistr('\000a')||
'                      ';

s:=s||'  ''score-box'''||unistr('\000a')||
'                    end as input_field_class'||unistr('\000a')||
'                from yatzy_template_score_card'||unistr('\000a')||
'                where 1 = 1'||unistr('\000a')||
'                order by seq_id'||unistr('\000a')||
'            ]'''||unistr('\000a')||
'        );'||unistr('\000a')||
'    end create_collection;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedur';

s:=s||'e updates possible points to score card apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure update_possible_points ('||unistr('\000a')||
'        p_seq_id        in number,'||unistr('\000a')||
'        p_result        in number'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        apex_collection.update_member_attribute ('||unistr('\000a')||
'            p_collection_na';

s:=s||'me => c_score_card_collection,'||unistr('\000a')||
'            p_seq => p_seq_id,'||unistr('\000a')||
'            p_attr_number => c_possible_points_attr_num,'||unistr('\000a')||
'            p_number_value => p_result'||unistr('\000a')||
'        );'||unistr('\000a')||
'    end update_possible_points;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure updates entered ';

s:=s||'points to score card apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure update_entered_points ('||unistr('\000a')||
'        p_seq_id        in number,'||unistr('\000a')||
'        p_result        in number'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        apex_collection.update_member_attribute ('||unistr('\000a')||
'            p_collection_name => c_score_card_c';

s:=s||'ollection,'||unistr('\000a')||
'            p_seq => p_seq_id,'||unistr('\000a')||
'            p_attr_number => c_entered_points_attr_num,'||unistr('\000a')||
'            p_number_value => p_result'||unistr('\000a')||
'        );'||unistr('\000a')||
'    end update_entered_points;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_collection;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 30749029878426529 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'yatzy_collection',
  p_sequence=> 40,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace view yatzy_score_card_vw'||unistr('\000a')||
'as'||unistr('\000a')||
'select seq_id,'||unistr('\000a')||
'    c001 as label_mesg,'||unistr('\000a')||
'    apex_lang.message ( c001 ) as label,'||unistr('\000a')||
'    c002 as input_field,'||unistr('\000a')||
'    c003 as card_section,'||unistr('\000a')||
'    n001 as entered_points,'||unistr('\000a')||
'    n002 as possible_points,'||unistr('\000a')||
'    n003 as rowspan,'||unistr('\000a')||
'    apex_lang.lang ( c003 ) as section_label,'||unistr('\000a')||
'    c004 as input_field_class'||unistr('\000a')||
'from apex_collections'||unistr('\000a')||
'where 1 = 1'||unistr('\000a')||
'and collection_name = yatzy_collect';

s:=s||'ion.get_collection_name'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 28536833963305036 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'view',
  p_sequence=> 50,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'package yatzy_util'||unistr('\000a')||
'authid definer'||unistr('\000a')||
'as'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this package holds procedures and functions for yatzy game'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------------------------------';

s:=s||'----------------------------------------------'||unistr('\000a')||
'    --    package global constants'||unistr('\000a')||
''||unistr('\000a')||
'    --    APEX button requests'||unistr('\000a')||
'    g_throw                constant varchar2(30) := ''THROW'';'||unistr('\000a')||
'    g_save_score_card    constant varchar2(30) := ''SUBMIT'';'||unistr('\000a')||
'    g_enter_points        constant varchar2(30) := ''ENTER'';'||unistr('\000a')||
''||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_player';

s:=s||'_name_cookie return varchar2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_max_throws return number;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_rounds_left return number;'||unistr('\000a')||
'--------------------------------------------------------------------------------    '||unistr('\000a')||
'    function get_total_row_id return';

s:=s||' number;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function roll_dice return number;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function hold_dice ('||unistr('\000a')||
'        p_request        in varchar2,'||unistr('\000a')||
'        p_hold            in varchar2,'||unistr('\000a')||
'        p_throws_left    in number,'||unistr('\000a')||
'        p_rounds_left    in number'||unistr('\000a')||
'    ) return boole';

s:=s||'an;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function enter_points_link ('||unistr('\000a')||
'        p_seq_id        in number,'||unistr('\000a')||
'        p_points        in number,'||unistr('\000a')||
'        p_seq_item        in varchar2,'||unistr('\000a')||
'        p_link_img_url    in varchar2,'||unistr('\000a')||
'        p_link_img_name    in varchar2 default ''pencil2_16x16.gif'''||unistr('\000a')||
'    ) return varchar2;'||unistr('\000a')||
'--------------------------------------------';

s:=s||'------------------------------------'||unistr('\000a')||
'    procedure render_game_round_info ('||unistr('\000a')||
'        p_rounds_left    in number,'||unistr('\000a')||
'        p_throws_left    in number'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure start_game ('||unistr('\000a')||
'        p_player_name    in varchar2'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure';

s:=s||' calc_possible_points ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure enter_points ('||unistr('\000a')||
'        p_seq_id        in number'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure save_score_card ('||unistr('\000a')||
'        p_app_id        in number,'||unistr('\000a')||
'        p_app_session    in ';

s:=s||'number,'||unistr('\000a')||
'        p_player_name    in varchar2'||unistr('\000a')||
'    );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function apex_error_handler('||unistr('\000a')||
'        p_error in apex_error.t_error'||unistr('\000a')||
'    ) return apex_error.t_error_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_util;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'package body yatzy_util'||unistr('\000a')||
'as'||unistr('\000a')||
'------------';

s:=s||'--------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    private'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    --    package private constants'||unistr('\000a')||
''||unistr('\000a')||
'    --    player name cookie'||unistr('\000a')||
'    c_pl';

s:=s||'ayer_name_cookie        constant varchar2(30)    := ''yatzy_player'';'||unistr('\000a')||
'    c_cookie_expires            constant date            := sysdate + 365;'||unistr('\000a')||
'    '||unistr('\000a')||
'    --    APEX messages'||unistr('\000a')||
'    c_enter_points_msg            constant varchar2(30)    := ''ENTER_POINTS'';'||unistr('\000a')||
'    c_start_round_msg            constant varchar2(30)    := ''START_ROUND'';'||unistr('\000a')||
'    c_continue_round_msg        constant varchar2(30)    := ''CONTINUE_ROUN';

s:=s||'D'';'||unistr('\000a')||
'    c_end_round_msg                constant varchar2(30)    := ''END_ROUND'';'||unistr('\000a')||
'    '||unistr('\000a')||
'    --    error codes and APEX messages'||unistr('\000a')||
'    c_generic_error                constant varchar2(30)    := ''GENERIC_ERROR'';'||unistr('\000a')||
'    c_enter_points_no_data        constant number            := -20001;'||unistr('\000a')||
'    c_enter_points_no_data_msg    constant varchar2(30)    := ''ENTER_POINTS_NO_DATA'';'||unistr('\000a')||
'    '||unistr('\000a')||
'    --    constant score card se';

s:=s||'q_ids'||unistr('\000a')||
'    c_upper_sum                    constant number := 7;'||unistr('\000a')||
'    c_bonus                        constant number := 8;'||unistr('\000a')||
'    c_pair                        constant number := 9;'||unistr('\000a')||
'    c_two_pairs                    constant number := 10;'||unistr('\000a')||
'    c_three_of_kind                constant number := 11;'||unistr('\000a')||
'    c_four_of_kind                constant number := 12;'||unistr('\000a')||
'    c_small_straight            constant number := ';

s:=s||'13;'||unistr('\000a')||
'    c_large_straight            constant number := 14;'||unistr('\000a')||
'    c_jump_straight                constant number := 15;'||unistr('\000a')||
'    c_full_house                constant number := 16;'||unistr('\000a')||
'    c_chance                    constant number := 17;'||unistr('\000a')||
'    c_yatzy                        constant number := 18;'||unistr('\000a')||
'    c_total                        constant number := 19;'||unistr('\000a')||
'    '||unistr('\000a')||
'    --    constant points'||unistr('\000a')||
'    c_yatzy_points        ';

s:=s||'        constant number    := 50;'||unistr('\000a')||
'    c_bonus_points                constant number    := 50;'||unistr('\000a')||
''||unistr('\000a')||
'    --    upper section sum limit for bonus'||unistr('\000a')||
'    c_bonus_limit                constant number    := 63;'||unistr('\000a')||
''||unistr('\000a')||
'    --    constant dice count'||unistr('\000a')||
'    c_dice_count                constant number    := 5;'||unistr('\000a')||
''||unistr('\000a')||
'    -- constant dice min and max points'||unistr('\000a')||
'    c_dice_min_points            constant number    := 1;'||unistr('\000a')||
'    c_dice_max_';

s:=s||'points            constant number    := 6;'||unistr('\000a')||
''||unistr('\000a')||
'    -- max throws in game round'||unistr('\000a')||
'    c_max_throws                constant number    := 3;'||unistr('\000a')||
''||unistr('\000a')||
'    --    package private variables. used to cache values'||unistr('\000a')||
'    g_two_pairs_points    number;'||unistr('\000a')||
'    g_dice_sum_tab        yatzy_num_tab := yatzy_num_tab( null, null, null, null, null, null, null );'||unistr('\000a')||
''||unistr('\000a')||
'-----------------------------------------------------------------------';

s:=s||'---------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function converts number array to string e.g. for debuging'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function num_tab_to_string ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab,'||unistr('\000a')||
'        p_sep            in';

s:=s||' varchar2 default '':'''||unistr('\000a')||
'    ) return varchar2'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result varchar2(32700);'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        for i in 1 .. p_num_tab.count'||unistr('\000a')||
'        loop'||unistr('\000a')||
'            l_result := l_result'||unistr('\000a')||
'                ||'||unistr('\000a')||
'                case when l_result is not null then'||unistr('\000a')||
'                    p_sep'||unistr('\000a')||
'                end'||unistr('\000a')||
'                ||'||unistr('\000a')||
'                case when p_num_tab ( i ) is null then'||unistr('\000a')||
'                    ''null'''||unistr('\000a')||
'   ';

s:=s||'             else'||unistr('\000a')||
'                    p_num_tab ( i )'||unistr('\000a')||
'                end;'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end num_tab_to_string;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function sorts number array to ascending order'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.20';

s:=s||'15 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function sort_num_tab ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    ) return yatzy_num_tab'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_num_tab    yatzy_num_tab;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        select column_value'||unistr('\000a')||
'        bulk collect into l_num_tab'||unistr('\000a')||
'        from table ( p_num_tab )'||unistr('\000a')||
'        order by column_value'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        -- r';

s:=s||'eturn sorted array'||unistr('\000a')||
'        return l_num_tab;'||unistr('\000a')||
'    end sort_num_tab;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure saves player name to cookie'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'-------------------------------------------------------------------';

s:=s||'-------------'||unistr('\000a')||
'    procedure send_player_name_cookie ('||unistr('\000a')||
'        p_player_name    in varchar2'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        sys.owa_util.mime_header(''text/html'', false);'||unistr('\000a')||
'        sys.owa_cookie.send('||unistr('\000a')||
'            name    => c_player_name_cookie,'||unistr('\000a')||
'            value   => p_player_name,'||unistr('\000a')||
'            expires => c_cookie_expires'||unistr('\000a')||
'        );'||unistr('\000a')||
'        --sys.owa_util.http_header_close;'||unistr('\000a')||
'    end send_player_name_co';

s:=s||'okie;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns distinct values from array'||unistr('\000a')||
'--'||unistr('\000a')||
'--    example:'||unistr('\000a')||
'--    distinct_num_count ( yatzy_num_tab(5,6,5,4,6) );'||unistr('\000a')||
'--     returns yatzy_num_tab(6,5,4)'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'-------------';

s:=s||'-------------------------------------------------------------------'||unistr('\000a')||
'    function distinct_num_tab ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    ) return yatzy_num_tab'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_distinct_t    yatzy_num_tab;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        l_distinct_t := p_num_tab multiset union distinct p_num_tab;'||unistr('\000a')||
'        return l_distinct_t;'||unistr('\000a')||
'    end distinct_num_tab;'||unistr('\000a')||
'---------------------------------------------------';

s:=s||'-----------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns sum for specified number(s) in array.'||unistr('\000a')||
'--    if parameter p_x is zero (0) all numbers sum is returned (e.g. chance, full house...).'||unistr('\000a')||
'--    values are cached to private global variable g_dice_sum_tab array'||unistr('\000a')||
'--'||unistr('\000a')||
'--    example:'||unistr('\000a')||
'--    calc_x_sum ( p_num_tab => yatzy_nu';

s:=s||'m_tab(1,6,5,4,6), p_x => 6 );'||unistr('\000a')||
'--    returns sum of sixes (12)'||unistr('\000a')||
'--    calc_x_sum ( p_num_tab => yatzy_num_tab(1,6,5,4,6), p_x => 0 );'||unistr('\000a')||
'--    returns sum of all dices (22)'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function calc_x_sum ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab,'||unistr('\000a')||
'        p_x                ';

s:=s||'in number'||unistr('\000a')||
'    ) return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result    number;'||unistr('\000a')||
'        l_result_id    number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    all numbers sum is in postion one (1)'||unistr('\000a')||
'        l_result_id := p_x + 1;'||unistr('\000a')||
'        --    if we haven''t already count sum for p_x'||unistr('\000a')||
'        if g_dice_sum_tab ( l_result_id ) is null then'||unistr('\000a')||
'            --    count sum for x zero (0) for all'||unistr('\000a')||
'            select sum ( column_value )'||unistr('\000a')||
'          ';

s:=s||'      into l_result'||unistr('\000a')||
'            from table ( p_num_tab )'||unistr('\000a')||
'            where column_value = p_x or p_x = 0'||unistr('\000a')||
'            ;'||unistr('\000a')||
'            l_result := coalesce ( l_result, 0 );'||unistr('\000a')||
'            --    cache sum for later use'||unistr('\000a')||
'            g_dice_sum_tab ( l_result_id ) := l_result;'||unistr('\000a')||
''||unistr('\000a')||
'        --    else return value from cache'||unistr('\000a')||
'        else'||unistr('\000a')||
'            --    return from cache'||unistr('\000a')||
'            l_result := g_dice_sum_tab (';

s:=s||' l_result_id );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end calc_x_sum;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns max sum for x of kind'||unistr('\000a')||
'--'||unistr('\000a')||
'--    example:'||unistr('\000a')||
'--    calc_x_sum ( p_num_tab => yatzy_num_tab(2,2,5,5,5), p_x => 2 );'||unistr('\000a')||
'--    returns sum of tw';

s:=s||'o fives (10)'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function calc_x_of_kind ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab,'||unistr('\000a')||
'        p_distinct_tab    in yatzy_num_tab,'||unistr('\000a')||
'        p_x                in number'||unistr('\000a')||
'    ) return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_x_of_kind_sum    number;'||unistr('\000a')||
'        l_result        number;'||unistr('\000a')||
'   ';

s:=s||'     l_result_t        yatzy_num_tab;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    initialize number table.'||unistr('\000a')||
'        --    table is used to store sums. At end we select max sum from table.'||unistr('\000a')||
'        l_result_t := yatzy_num_tab ();'||unistr('\000a')||
'        --    loop dices'||unistr('\000a')||
'        for i in 1 .. p_distinct_tab.count'||unistr('\000a')||
'        loop'||unistr('\000a')||
'            --    get sum for number'||unistr('\000a')||
'            l_result := calc_x_sum ( p_num_tab, p_distinct_tab ( i ) );'||unistr('\000a')||
'   ';

s:=s||'         --    calculate points for x of kind'||unistr('\000a')||
'            l_x_of_kind_sum := p_distinct_tab ( i ) * p_x;'||unistr('\000a')||
'            --    if number sum equals or more than x of kind sum,'||unistr('\000a')||
'            --    then store x of kind sum to number table for later use'||unistr('\000a')||
'            if l_result >= l_x_of_kind_sum then'||unistr('\000a')||
'                --    extend table'||unistr('\000a')||
'                l_result_t.extend ( 1 );'||unistr('\000a')||
'                l_result_t ( l_';

s:=s||'result_t.last ) := l_x_of_kind_sum;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'        --    find max value and return'||unistr('\000a')||
'        select max ( column_value )'||unistr('\000a')||
'        into l_result'||unistr('\000a')||
'        from table ( l_result_t )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        l_result := coalesce ( l_result, 0 );'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end calc_x_of_kind;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------';

s:=s||'------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns two pair points and helps determine is result full house.'||unistr('\000a')||
'--    result is cached to private global variable g_two_pair_points'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function calc_two_pair ('||unistr('\000a')||
'        ';

s:=s||'p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    ) return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result    number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    if we haven''t already count two pairs points'||unistr('\000a')||
'        if g_two_pairs_points is null then'||unistr('\000a')||
'            with num_cnt as ('||unistr('\000a')||
'                select column_value,'||unistr('\000a')||
'                    count(1) as cnt'||unistr('\000a')||
'                from table ( p_num_tab )'||unistr('\000a')||
'                group by column_value'||unistr('\000a')||
'            ), tw';

s:=s||'o_or_more as ('||unistr('\000a')||
'                select count ( 1 ) over () as row_cnt,'||unistr('\000a')||
'                    column_value'||unistr('\000a')||
'                from num_cnt'||unistr('\000a')||
'                where cnt >= 2'||unistr('\000a')||
'            )'||unistr('\000a')||
'            select sum ( column_value * 2 )'||unistr('\000a')||
'            into l_result'||unistr('\000a')||
'            from two_or_more'||unistr('\000a')||
'            where row_cnt = 2'||unistr('\000a')||
'            ;'||unistr('\000a')||
'            l_result := coalesce ( l_result, 0 );'||unistr('\000a')||
'            g_two_pairs_points';

s:=s||' := l_result;'||unistr('\000a')||
''||unistr('\000a')||
'        --    else return value from cache'||unistr('\000a')||
'        else'||unistr('\000a')||
'            l_result := g_two_pairs_points;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end calc_two_pair;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure calculate score card upper section pos';

s:=s||'sible points'||unistr('\000a')||
'--    and store result to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure possible_upper_points ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result    number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        for c1 in ('||unistr('\000a')||
'            select seq_id'||unistr('\000a')||
'            from yatzy_score_car';

s:=s||'d_vw'||unistr('\000a')||
'            where seq_id <= c_dice_max_points'||unistr('\000a')||
'            and entered_points is null'||unistr('\000a')||
'        ) loop'||unistr('\000a')||
'            l_result := calc_x_sum ( p_num_tab, c1.seq_id );'||unistr('\000a')||
'            yatzy_collection.update_possible_points ('||unistr('\000a')||
'                p_seq_id => c1.seq_id,'||unistr('\000a')||
'                p_result => l_result'||unistr('\000a')||
'            );'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'    end possible_upper_points;'||unistr('\000a')||
'----------------------------------------';

s:=s||'----------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure calculate score card lower section possible points'||unistr('\000a')||
'--    and store result to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure possible_lower';

s:=s||'_points ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result            number;'||unistr('\000a')||
'        l_all_dice_sum        number;'||unistr('\000a')||
'        l_distinct_dice_cnt    number;'||unistr('\000a')||
'        l_distinct_dice_tab    yatzy_num_tab;'||unistr('\000a')||
'        l_sorted_num_tab    yatzy_num_tab;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    sort dice numbers for straight determination'||unistr('\000a')||
'        l_sorted_num_tab    := sort_num_tab ( p_num_tab );'||unistr('\000a')||
'     ';

s:=s||'   --    sum of all dices'||unistr('\000a')||
'        l_all_dice_sum        := calc_x_sum ( p_num_tab, 0 );'||unistr('\000a')||
'        --    distinct dice count'||unistr('\000a')||
'        l_distinct_dice_tab    := distinct_num_tab ( p_num_tab );'||unistr('\000a')||
'        l_distinct_dice_cnt    := l_distinct_dice_tab.count;'||unistr('\000a')||
'        for c1 in ('||unistr('\000a')||
'            select seq_id'||unistr('\000a')||
'            from yatzy_score_card_vw'||unistr('\000a')||
'            where seq_id '||unistr('\000a')||
'            between c_pair and c_yatzy'||unistr('\000a')||
'   ';

s:=s||'         and entered_points is null'||unistr('\000a')||
'        ) loop'||unistr('\000a')||
'            l_result := case'||unistr('\000a')||
'                --    if it''s pair, return max points for pair'||unistr('\000a')||
'                when c1.seq_id = c_pair'||unistr('\000a')||
'                and l_distinct_dice_cnt <= 4'||unistr('\000a')||
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 2 )'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s two pairs, return sum of two pair'||unistr('\000a')||
'                when c1.seq_id = ';

s:=s||'c_two_pairs'||unistr('\000a')||
'                and l_distinct_dice_cnt between 2 and 3'||unistr('\000a')||
'                then calc_two_pair ( p_num_tab )'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s three of kind, return sum of three same dice'||unistr('\000a')||
'                when c1.seq_id = c_three_of_kind'||unistr('\000a')||
'                and l_distinct_dice_cnt <= 3'||unistr('\000a')||
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 3 )'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s four of ';

s:=s||'kind, return sum of four same dice'||unistr('\000a')||
'                when c1.seq_id = c_four_of_kind'||unistr('\000a')||
'                and l_distinct_dice_cnt <= 2'||unistr('\000a')||
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 4 )'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s small straight return sum of all dices.'||unistr('\000a')||
'                --    small straight 1, 2, 3, 4, 5'||unistr('\000a')||
'                when c1.seq_id = c_small_straight'||unistr('\000a')||
'                and l_dist';

s:=s||'inct_dice_cnt = c_dice_count'||unistr('\000a')||
'                and l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 5 ) = 5'||unistr('\000a')||
'                then l_all_dice_sum'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s large straight, return sum of all dices'||unistr('\000a')||
'                --    large straight 2, 3, 4, 6, 5'||unistr('\000a')||
'                when c1.seq_id = c_large_straight'||unistr('\000a')||
'                and l_distinct_dice_cnt = c_dice_count'||unistr('\000a')||
'                and l_sorted_n';

s:=s||'um_tab ( 1 ) = 2 and l_sorted_num_tab ( 5 ) = 6'||unistr('\000a')||
'                then l_all_dice_sum'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s jump straight, return sum of all dices'||unistr('\000a')||
'                when c1.seq_id = c_jump_straight'||unistr('\000a')||
'                and l_distinct_dice_cnt = c_dice_count'||unistr('\000a')||
'                and (    -- "small" jump straight 1, 2, 3, 4, 6'||unistr('\000a')||
'                        ( l_sorted_num_tab ( 4 ) = 4 and l_sorted_num_tab ( 5 ';

s:=s||') = 6 )'||unistr('\000a')||
'                    or'||unistr('\000a')||
'                        -- "large" jump straight 1, 3, 4, 5, 6'||unistr('\000a')||
'                        ( l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 2 ) = 3 )'||unistr('\000a')||
'                )'||unistr('\000a')||
'                then l_all_dice_sum'||unistr('\000a')||
''||unistr('\000a')||
'                --    if full house, return sum of all dices'||unistr('\000a')||
'                --    we know it is full house if distinct dice count is 2'||unistr('\000a')||
'                --    and cal';

s:=s||'culation for two pair returns more than zero'||unistr('\000a')||
'                when c1.seq_id = c_full_house'||unistr('\000a')||
'                and    l_distinct_dice_cnt = 2'||unistr('\000a')||
'                and calc_two_pair ( p_num_tab ) > 0'||unistr('\000a')||
'                then l_all_dice_sum'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s chance, return sum of all dices'||unistr('\000a')||
'                when c1.seq_id = c_chance'||unistr('\000a')||
'                then l_all_dice_sum'||unistr('\000a')||
''||unistr('\000a')||
'                --    if it''s ya';

s:=s||'tzy, return constant points'||unistr('\000a')||
'                --    we know it is yatzy if distinct dice count is 1'||unistr('\000a')||
'                when c1.seq_id = c_yatzy'||unistr('\000a')||
'                and l_distinct_dice_cnt = 1'||unistr('\000a')||
'                then c_yatzy_points'||unistr('\000a')||
''||unistr('\000a')||
'                --    if none match, return zero'||unistr('\000a')||
'                else 0'||unistr('\000a')||
'            end;'||unistr('\000a')||
'            yatzy_collection.update_possible_points ('||unistr('\000a')||
'                p_seq_id => c1.seq_id';

s:=s||','||unistr('\000a')||
'                p_result => l_result'||unistr('\000a')||
'            );'||unistr('\000a')||
'        end loop;'||unistr('\000a')||
'    end possible_lower_points;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure enters upper section sum and bonus to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'-----';

s:=s||'---------------------------------------------------------------------------'||unistr('\000a')||
'    procedure enter_upper_sum_and_bonus'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result            number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        select sum ( entered_points )'||unistr('\000a')||
'        into l_result'||unistr('\000a')||
'        from yatzy_score_card_vw'||unistr('\000a')||
'        where seq_id <= c_dice_max_points'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        l_result := coalesce ( l_result, 0 );'||unistr('\000a')||
''||unistr('\000a')||
'        yatzy_collection.update_entered';

s:=s||'_points ('||unistr('\000a')||
'            p_seq_id => c_upper_sum,'||unistr('\000a')||
'            p_result => l_result'||unistr('\000a')||
'        );'||unistr('\000a')||
'        if l_result >= c_bonus_limit then'||unistr('\000a')||
'            yatzy_collection.update_entered_points ('||unistr('\000a')||
'                p_seq_id => c_bonus,'||unistr('\000a')||
'                p_result => c_bonus_points'||unistr('\000a')||
'            );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    end enter_upper_sum_and_bonus;'||unistr('\000a')||
'--------------------------------------------------------------------';

s:=s||'------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure enters total points to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure enter_total_points'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result    number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    select sum from en';

s:=s||'tered points'||unistr('\000a')||
'        select sum( entered_points )'||unistr('\000a')||
'        into l_result'||unistr('\000a')||
'        from yatzy_score_card_vw'||unistr('\000a')||
'        where seq_id '||unistr('\000a')||
'        between c_upper_sum    and c_yatzy'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        --    insert to collection'||unistr('\000a')||
'        yatzy_collection.update_entered_points ('||unistr('\000a')||
'            p_seq_id => c_total,'||unistr('\000a')||
'            p_result => l_result'||unistr('\000a')||
'        );'||unistr('\000a')||
'    end enter_total_points;'||unistr('\000a')||
'-------------------------------';

s:=s||'-------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--      Global'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns player name from cookie'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JL';

s:=s||'a / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_player_name_cookie return varchar2'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return apex_authentication.get_login_username_cookie ('||unistr('\000a')||
'            p_cookie_name => c_player_name_cookie'||unistr('\000a')||
'        );'||unistr('\000a')||
'    end get_player_name_cookie;'||unistr('\000a')||
'-------------------------------------------------------------------------------';

s:=s||'-'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns max throws for game round'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_max_throws return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return c_max_throws;'||unistr('\000a')||
'    end get_max_throws;'||unistr('\000a')||
'---------------';

s:=s||'-----------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns how many rounds there is left for game'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_rounds_left return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'';

s:=s||'        l_result number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        select count ( 1 )'||unistr('\000a')||
'            into l_result'||unistr('\000a')||
'        from yatzy_score_card_vw'||unistr('\000a')||
'        where input_field = ''Y'''||unistr('\000a')||
'        and entered_points is null'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end get_rounds_left;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'-----------------------------------------------------------------------';

s:=s||'---------'||unistr('\000a')||
'--    this function returns score card total row seq_id'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function get_total_row_id return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return c_total;'||unistr('\000a')||
'    end get_total_row_id;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'------';

s:=s||'--------------------------------------------------------------------------'||unistr('\000a')||
'--    this function returns random number for dice points'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function roll_dice return number'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_num number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        l_num := round ( sys.dbms_random.value ( c_dice';

s:=s||'_min_points, c_dice_max_points ) );'||unistr('\000a')||
'        return l_num;'||unistr('\000a')||
'    end roll_dice;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this function checks should new random number generated for dice'||unistr('\000a')||
'--    depending APEX request, does player like hold dice'||unistr('\000a')||
'--    and is there throws left in';

s:=s||' game round'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function hold_dice ('||unistr('\000a')||
'        p_request        in varchar2,'||unistr('\000a')||
'        p_hold            in varchar2,'||unistr('\000a')||
'        p_throws_left    in number,'||unistr('\000a')||
'        p_rounds_left    in number'||unistr('\000a')||
'    ) return boolean'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return case'||unistr('\000a')||
'            when p_re';

s:=s||'quest = g_throw'||unistr('\000a')||
'            and p_hold is null'||unistr('\000a')||
'            and p_throws_left > 0'||unistr('\000a')||
'            and p_rounds_left > 0'||unistr('\000a')||
'            then'||unistr('\000a')||
'                false'||unistr('\000a')||
'            else'||unistr('\000a')||
'                true'||unistr('\000a')||
'            end;'||unistr('\000a')||
'    end hold_dice;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this';

s:=s||' function returns link to enter points to score card'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function enter_points_link ('||unistr('\000a')||
'        p_seq_id        in number,'||unistr('\000a')||
'        p_points        in number,'||unistr('\000a')||
'        p_seq_item        in varchar2,'||unistr('\000a')||
'        p_link_img_url    in varchar2,'||unistr('\000a')||
'        p_link_img_name    in ';

s:=s||'varchar2 default ''pencil2_16x16.gif'''||unistr('\000a')||
'    ) return varchar2'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        return    ''<a href="'''||unistr('\000a')||
'            ||    apex_util.prepare_url ('||unistr('\000a')||
'                    p_url => ''f?p='''||unistr('\000a')||
'                        ||    apex_application.g_flow_id        || '':'''||unistr('\000a')||
'                        ||    apex_application.g_flow_step_id    || '':'''||unistr('\000a')||
'                        ||    apex_application.g_instance        || '':'''||unistr('\000a')||
' ';

s:=s||'                       ||    g_enter_points                    || '':'''||unistr('\000a')||
'                        ||    case'||unistr('\000a')||
'                            when apex_application.g_debug'||unistr('\000a')||
'                            then'||unistr('\000a')||
'                                ''YES'''||unistr('\000a')||
'                            else'||unistr('\000a')||
'                                ''NO'''||unistr('\000a')||
'                            end'||unistr('\000a')||
'                        ||    ''::'''||unistr('\000a')||
'                        ||   ';

s:=s||' p_seq_item || '':'''||unistr('\000a')||
'                        ||    p_seq_id,'||unistr('\000a')||
'                    p_checksum_type => ''SESSION'''||unistr('\000a')||
'                )'||unistr('\000a')||
'            ||    ''"><span>'''||unistr('\000a')||
'            ||    p_points'||unistr('\000a')||
'            ||    ''</span><img src="'''||unistr('\000a')||
'            ||    p_link_img_url'||unistr('\000a')||
'            ||    p_link_img_name'||unistr('\000a')||
'            ||    ''" alt="'''||unistr('\000a')||
'            ||    apex_lang.message ( c_enter_points_msg )'||unistr('\000a')||
'            ||    ''">'''||unistr('\000a')||
'   ';

s:=s||'         ||    ''</a>'''||unistr('\000a')||
'        ;'||unistr('\000a')||
'    end enter_points_link;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure renders game round info, if there is rounds left'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'------------------------------------------------------';

s:=s||'--------------------------        '||unistr('\000a')||
'    procedure render_game_round_info ('||unistr('\000a')||
'        p_rounds_left    in number,'||unistr('\000a')||
'        p_throws_left    in number'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_mesg    varchar2(30);'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        if p_rounds_left > 0 then'||unistr('\000a')||
'            if p_throws_left = 3 then'||unistr('\000a')||
'                l_mesg := c_start_round_msg;'||unistr('\000a')||
'            elsif p_throws_left > 0 then'||unistr('\000a')||
'                l_mesg := c_continue_round';

s:=s||'_msg;'||unistr('\000a')||
'            else'||unistr('\000a')||
'                l_mesg := c_end_round_msg;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            sys.htp.prn( apex_lang.message( l_mesg, p_throws_left ) );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'    end render_game_round_info;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure initialize n';

s:=s||'ew game'||unistr('\000a')||
'--    procedure saves player name to cookie,'||unistr('\000a')||
'--    get next APEX session id for game,'||unistr('\000a')||
'--    authenticates APEX session and creates score card'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure start_game ('||unistr('\000a')||
'        p_player_name    in varchar2'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        send_player_name_co';

s:=s||'okie ( p_player_name );'||unistr('\000a')||
'        apex_custom_auth.set_session_id_to_next_value;'||unistr('\000a')||
'        apex_authentication.post_login('||unistr('\000a')||
'            p_username => p_player_name,'||unistr('\000a')||
'            p_password => null,'||unistr('\000a')||
'            p_uppercase_username => false'||unistr('\000a')||
'        );'||unistr('\000a')||
'        yatzy_collection.create_collection;'||unistr('\000a')||
'    end start_game;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'----------';

s:=s||'----------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure calculate all possible points for throw'||unistr('\000a')||
'--    and stores results to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure calc_possible_points ('||unistr('\000a')||
'        p_num_tab        in yatzy_num_tab'||unistr('\000a')||
'    )'||unistr('\000a')||
'   ';

s:=s||' as'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        possible_upper_points ( p_num_tab );'||unistr('\000a')||
'        possible_lower_points ( p_num_tab );'||unistr('\000a')||
'    end calc_possible_points;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure enter points to apex_collection'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created';

wwv_flow_api.create_install_script(
  p_id => 28437125215145445 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'yatzy_util',
  p_sequence=> 60,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||''||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure enter_points ('||unistr('\000a')||
'        p_seq_id        in number'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result    number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        select possible_points'||unistr('\000a')||
'            into l_result'||unistr('\000a')||
'        from yatzy_score_card_vw'||unistr('\000a')||
'        where input_field = ''Y'''||unistr('\000a')||
'        and entered_points is null'||unistr('\000a')||
'        and seq_id = p_seq_id'||unistr('\000a')||
'        ;'||unistr('\000a')||
'    ';

s:=s||'    yatzy_collection.update_entered_points ('||unistr('\000a')||
'            p_seq_id => p_seq_id,'||unistr('\000a')||
'            p_result => l_result'||unistr('\000a')||
'        );'||unistr('\000a')||
'        --    calculate upper section sum and bonus'||unistr('\000a')||
'        --    only if we save points to upper section'||unistr('\000a')||
'        if p_seq_id <= c_dice_max_points then'||unistr('\000a')||
'            enter_upper_sum_and_bonus;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        --    calculate grand total'||unistr('\000a')||
'        enter_total_points;'||unistr('\000a')||
'    ex';

s:=s||'ception when no_data_found then'||unistr('\000a')||
'        raise_application_error ( c_enter_points_no_data, ''No data found when fetch score card seq_id.'' );'||unistr('\000a')||
'    end enter_points;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    this procedure save scores to database'||unistr('\000a')||
'--    procedure should be called';

s:=s||' only when all game rounds are played'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    procedure save_score_card ('||unistr('\000a')||
'        p_app_id        in number,'||unistr('\000a')||
'        p_app_session    in number,'||unistr('\000a')||
'        p_player_name    in varchar2'||unistr('\000a')||
'    )'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_game_id number;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        --    get id for game from se';

s:=s||'quence'||unistr('\000a')||
'        l_game_id := yatzy_seq.nextval;'||unistr('\000a')||
'        --    insert score card from apex_collection'||unistr('\000a')||
'        insert into yatzy_saved_score_card ('||unistr('\000a')||
'            game_id,'||unistr('\000a')||
'            apex_session_id,'||unistr('\000a')||
'            seq_id,'||unistr('\000a')||
'            player_name,'||unistr('\000a')||
'            score'||unistr('\000a')||
'        )'||unistr('\000a')||
'        select '||unistr('\000a')||
'            l_game_id as game_id,'||unistr('\000a')||
'            p_app_session as apex_session_id,'||unistr('\000a')||
'            seq_id,'||unistr('\000a')||
'            p_pl';

s:=s||'ayer_name as player_name,'||unistr('\000a')||
'            entered_points'||unistr('\000a')||
'        from yatzy_score_card_vw'||unistr('\000a')||
'        ;'||unistr('\000a')||
'        --    logout player from APEX session'||unistr('\000a')||
'        apex_authentication.logout ( p_app_session, p_app_id );'||unistr('\000a')||
'    end save_score_card;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--    t';

s:=s||'his function handles APEX application errors'||unistr('\000a')||
'--'||unistr('\000a')||
'--    change log:'||unistr('\000a')||
'--    18.10.2015 JLa / created'||unistr('\000a')||
'--'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function apex_error_handler('||unistr('\000a')||
'        p_error in apex_error.t_error'||unistr('\000a')||
'    ) return apex_error.t_error_result'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_result          apex_error.t_error_result;'||unistr('\000a')||
'        l_error           apex_error.t_error;'||unistr('\000a')||
'   ';

s:=s||'     l_reference_id    pls_integer;'||unistr('\000a')||
'        l_constraint_name varchar2(255);'||unistr('\000a')||
'        l_err_msg         varchar2(32700);'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        l_result := apex_error.init_error_result ( p_error => p_error );'||unistr('\000a')||
'        --    If it''s an internal error raised by APEX, like an invalid statement or'||unistr('\000a')||
'        --    code which can''t be executed, the error text might contain security sensitive'||unistr('\000a')||
'        --    inform';

s:=s||'ation. To avoid this security problem we can rewrite the error to'||unistr('\000a')||
'        --    a generic error message and log the original error message for further'||unistr('\000a')||
'        --    investigation by the help desk.'||unistr('\000a')||
'        if p_error.is_internal_error then'||unistr('\000a')||
'            --    Access Denied errors raised by application or page authorization should'||unistr('\000a')||
'            --    still show up with the original error message'||unistr('\000a')||
'       ';

s:=s||'     if not p_error.apex_error_code like ''APEX.SESSION_STATE.%'''||unistr('\000a')||
'            and not p_error.apex_error_code = ''APEX.AUTHORIZATION.ACCESS_DENIED'''||unistr('\000a')||
'            and not p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'''||unistr('\000a')||
'            and not p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'''||unistr('\000a')||
'            and not p_error.apex_error_code = ''APEX.PAGE.DUPLICATE_SUBMI';

s:=s||'T'''||unistr('\000a')||
'            then'||unistr('\000a')||
'                -- log error to application debug information'||unistr('\000a')||
'                apex_debug.error('||unistr('\000a')||
'                    ''Error handler: %s %s %s'','||unistr('\000a')||
'                    p_error.apex_error_code,'||unistr('\000a')||
'                    l_result.message,'||unistr('\000a')||
'                    l_result.additional_info'||unistr('\000a')||
'                );'||unistr('\000a')||
'                --    Change the message to the generic error message '||unistr('\000a')||
'                -- ';

s:=s||'   which doesn''t expose any sensitive information.'||unistr('\000a')||
'                l_result.message := apex_lang.message ( c_generic_error );'||unistr('\000a')||
'                '||unistr('\000a')||
'                l_result.additional_info := null;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        else'||unistr('\000a')||
'            --    If it''s a constraint violation like'||unistr('\000a')||
'            --'||unistr('\000a')||
'            --        -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated'||unistr('\000a')||
'      ';

s:=s||'      --        -) : transaction rolled back (-> can hide a deferred constraint)'||unistr('\000a')||
'            --        -) : check constraint violated'||unistr('\000a')||
'            --        -) : integrity constraint violated - parent key not found'||unistr('\000a')||
'            --        -) : integrity constraint violated - child record found'||unistr('\000a')||
'            --'||unistr('\000a')||
'            --    we try to get a friendly error message from our constraint lookup configura';

s:=s||'tion.'||unistr('\000a')||
'            --    If we don''t find the constraint in our lookup table we fallback to'||unistr('\000a')||
'            --    the original ORA error message.'||unistr('\000a')||
'            if p_error.ora_sqlcode in ( -1, -2091, -2290, -2291, -2292 ) then'||unistr('\000a')||
'                '||unistr('\000a')||
'                l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );'||unistr('\000a')||
'                '||unistr('\000a')||
'                l_err_msg := apex_lang.message ( l_';

s:=s||'constraint_name );'||unistr('\000a')||
'                -- not every constraint has to be in our lookup table'||unistr('\000a')||
'                if not l_err_msg = l_constraint_name then'||unistr('\000a')||
'                    l_result.message := l_err_msg;'||unistr('\000a')||
'                end if;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            --    Game specific errors'||unistr('\000a')||
'            if p_error.ora_sqlcode in ( c_enter_points_no_data ) then'||unistr('\000a')||
'                l_result.message := ';

s:=s||'apex_lang.message ( c_enter_points_no_data_msg );'||unistr('\000a')||
'                l_result.additional_info := null;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            --    If an ORA error has been raised, for example a raise_application_error(-20xxx, ''...'')'||unistr('\000a')||
'            --    in a table trigger or in a PL/SQL package called by a process and we'||unistr('\000a')||
'            --    haven''t found the error in our lookup table, then we just ';

s:=s||'want to see'||unistr('\000a')||
'            --    the actual error text and not the full error stack with all the ORA error numbers.'||unistr('\000a')||
'            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then'||unistr('\000a')||
'                l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'            --    If no associated page item/tabular form column ha';

s:=s||'s been set, we can use'||unistr('\000a')||
'            --    apex_error.auto_set_associated_item to automatically guess the affected'||unistr('\000a')||
'            --    error field by examine the ORA error for constraint names or column names.'||unistr('\000a')||
'            if l_result.page_item_name is null and l_result.column_alias is null then'||unistr('\000a')||
'                apex_error.auto_set_associated_item ('||unistr('\000a')||
'                    p_error            => p_error,'||unistr('\000a')||
'   ';

s:=s||'                 p_error_result    => l_result'||unistr('\000a')||
'                );'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            '||unistr('\000a')||
'        end if;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end apex_error_handler;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_util;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.append_to_install_script(
  p_id => 28437125215145445 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'package yatzy_plugin'||unistr('\000a')||
'authid definer'||unistr('\000a')||
'as'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function render_dice ('||unistr('\000a')||
'        p_item                in apex_plugin.t_page_item,'||unistr('\000a')||
'        p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'        p_value               in varchar2,'||unistr('\000a')||
'        p_is_readonly         in boolean,'||unistr('\000a')||
'        p_is_printer_friendly in bool';

s:=s||'ean'||unistr('\000a')||
'    ) return apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function render_hold_dice ('||unistr('\000a')||
'        p_item                in apex_plugin.t_page_item,'||unistr('\000a')||
'        p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'        p_value               in varchar2,'||unistr('\000a')||
'        p_is_readonly         in boolean,'||unistr('\000a')||
'        p_is_printer_friendly in ';

s:=s||'boolean'||unistr('\000a')||
'    ) return apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_plugin;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'package body yatzy_plugin'||unistr('\000a')||
'as'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'    function render_dice ('||unistr('\000a')||
'   ';

s:=s||'     p_item                    in apex_plugin.t_page_item,'||unistr('\000a')||
'        p_plugin                in apex_plugin.t_plugin,'||unistr('\000a')||
'        p_value                    in varchar2,'||unistr('\000a')||
'        p_is_readonly            in boolean,'||unistr('\000a')||
'        p_is_printer_friendly    in boolean'||unistr('\000a')||
'    ) return apex_plugin.t_page_item_render_result'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_dots        varchar2(30);'||unistr('\000a')||
'        l_value        number;'||unistr('\000a')||
'        l_result    ap';

s:=s||'ex_plugin.t_page_item_render_result;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'    '||unistr('\000a')||
'        begin'||unistr('\000a')||
'            l_value := round ( to_number( p_value ) );'||unistr('\000a')||
'            if not l_value between 1 and 6 then'||unistr('\000a')||
'                l_value := null;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'        exception when'||unistr('\000a')||
'            value_error or'||unistr('\000a')||
'            invalid_number'||unistr('\000a')||
'        then'||unistr('\000a')||
'            l_value := null;'||unistr('\000a')||
'        end;'||unistr('\000a')||
'        '||unistr('\000a')||
'        l_dots := to_char( to_date ( ';

s:=s||'l_value, ''j'' ) , ''jsp'' );'||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'                ''<div id="'' || p_item.name || ''" class="die-container'''||unistr('\000a')||
'            ||    case when p_is_readonly then'||unistr('\000a')||
'                    '' hold-die'''||unistr('\000a')||
'                end'||unistr('\000a')||
'            ||    ''"><div class="die'''||unistr('\000a')||
'            ||    case when l_dots is not null then'||unistr('\000a')||
'                    '' '' || l_dots || ''" title="'' || apex_lang.lang ( initcap( l_dots ) )'||unistr('\000a')||
'      ';

s:=s||'          end'||unistr('\000a')||
'            ||    ''">'''||unistr('\000a')||
'            ||    ''<span class="dot"></span></div></div>'''||unistr('\000a')||
'        );'||unistr('\000a')||
''||unistr('\000a')||
'        -- tell apex that this field is not navigable'||unistr('\000a')||
'        l_result.is_navigable := false;'||unistr('\000a')||
'        return l_result;'||unistr('\000a')||
'    end render_dice;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'------------------------------------------------------------------------';

s:=s||'--------'||unistr('\000a')||
'    function render_hold_dice ('||unistr('\000a')||
'        p_item                    in apex_plugin.t_page_item,'||unistr('\000a')||
'        p_plugin                in apex_plugin.t_plugin,'||unistr('\000a')||
'        p_value                    in varchar2,'||unistr('\000a')||
'        p_is_readonly            in boolean,'||unistr('\000a')||
'        p_is_printer_friendly    in boolean'||unistr('\000a')||
'    ) return apex_plugin.t_page_item_render_result'||unistr('\000a')||
'    as'||unistr('\000a')||
'        l_speed        number;'||unistr('\000a')||
'        l_dist';

s:=s||'ance    varchar2(30);'||unistr('\000a')||
'        l_times        varchar2(30);'||unistr('\000a')||
'        l_name        varchar2(30);'||unistr('\000a')||
'        l_dice_id    varchar2(30);'||unistr('\000a')||
'        l_effect    varchar2(30);'||unistr('\000a')||
'        l_code        varchar2(256);'||unistr('\000a')||
'        l_value        constant varchar2(30) := ''HOLD'';'||unistr('\000a')||
'        l_result    apex_plugin.t_page_item_render_result;'||unistr('\000a')||
'    begin'||unistr('\000a')||
'        l_name        := apex_plugin.get_input_name_for_page_item ( false ';

s:=s||');'||unistr('\000a')||
'        l_dice_id    := p_item.attribute_01;'||unistr('\000a')||
'        '||unistr('\000a')||
'        sys.htp.p('||unistr('\000a')||
'                ''<input type="hidden"'''||unistr('\000a')||
'            ||    case when p_value is not null then'||unistr('\000a')||
'                    '' value="'' || l_value || ''"'''||unistr('\000a')||
'                else'||unistr('\000a')||
'                    '' value=""'''||unistr('\000a')||
'                end'||unistr('\000a')||
'            ||    '' name="'' || l_name || ''" id="'' || p_item.name || ''">'''||unistr('\000a')||
'        );'||unistr('\000a')||
''||unistr('\000a')||
'        if p_value is nul';

s:=s||'l then'||unistr('\000a')||
'            l_times    := to_char ( round ( dbms_random.value ( 4, 8 ), 0 ), ''fm999990'' );'||unistr('\000a')||
'            l_distance := to_char ( round ( dbms_random.value ( 30, 50 ), 0 ), ''fm999990'' );'||unistr('\000a')||
'            '||unistr('\000a')||
'            l_speed    := round ( dbms_random.value ( 120, 140 ), 0 );'||unistr('\000a')||
'            if to_number( regexp_replace ( apex_application.g_flow_schema_owner, ''[^[:digit:]]'' ) ) <  50000 then'||unistr('\000a')||
'           ';

s:=s||'     l_effect    := ''jquery.effects.bounce'';'||unistr('\000a')||
'            else'||unistr('\000a')||
'                l_effect    := ''jquery.ui.effect-bounce'';'||unistr('\000a')||
'                l_speed        := l_speed * 2.2;'||unistr('\000a')||
'            end if;'||unistr('\000a')||
'            apex_javascript.add_3rd_party_library_file ('||unistr('\000a')||
'                p_library    =>    apex_javascript.c_library_jquery_ui,'||unistr('\000a')||
'                p_file_name    =>    l_effect'||unistr('\000a')||
'            );'||unistr('\000a')||
'            l_code :=';

s:=s||' ''.effect("bounce",{distance:'' || l_distance || '',times:'' || l_times || ''},'' || to_char ( l_speed, ''fm999990'' ) || '')'';'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        if not p_is_readonly then'||unistr('\000a')||
'            l_code := l_code'||unistr('\000a')||
'                ||    ''.click(function(e){'''||unistr('\000a')||
'                ||    ''$(this).toggleClass("hold-die");'''||unistr('\000a')||
'                ||    ''$("#'' || p_item.name || ''").val('''||unistr('\000a')||
'                ||    ''$("#'' || p_item.nam';

s:=s||'e || ''").val().length===0?"'' || l_value || ''":""'''||unistr('\000a')||
'                ||    '')});'''||unistr('\000a')||
'            ;'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        if l_code is not null then'||unistr('\000a')||
'            apex_javascript.add_onload_code ('||unistr('\000a')||
'                p_code => ''$("#'' || l_dice_id || '' ")'' || l_code'||unistr('\000a')||
'            );'||unistr('\000a')||
'        end if;'||unistr('\000a')||
''||unistr('\000a')||
'        -- tell apex that this field is not navigable'||unistr('\000a')||
'        l_result.is_navigable := false;'||unistr('\000a')||
'        return l_r';

s:=s||'esult;'||unistr('\000a')||
'    end render_hold_dice;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'end yatzy_plugin;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 34595314641054279 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'yatzy_plugin',
  p_sequence=> 70,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''ONES'',1,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TWOS'',2,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''THREES'',3,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,';

s:=s||'input_field,card_section) values (''FOURS'',4,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FIVES'',5,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SIXES'',6,''Y'',''UPPER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SUM'',7,''N'',''MIDDLE'')';

s:=s||''||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''BONUS'',8,''N'',''MIDDLE'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''PAIR'',9,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TWO_PAIRS'',10,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_ms';

s:=s||'g,seq_id,input_field,card_section) values (''THREE_OF_KIND'',11,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FOUR_OF_KIND'',12,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SMALL_STRAIGHT'',13,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_se';

s:=s||'ction) values (''LARGE_STRAIGHT'',14,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''JUMP_STRAIGHT'',15,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FULL_HOUSE'',16,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''CHANCE'',17,''Y''';

s:=s||',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''YATZY'',18,''Y'',''LOWER'')'||unistr('\000a')||
'/'||unistr('\000a')||
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TOTAL'',19,''N'',''TOTAL'')'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 28291611642501573 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'metadata',
  p_sequence=> 80,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||' '||unistr('\000a')||
'begin'||unistr('\000a')||
' '||unistr('\000a')||
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(1) := ''47494638396110001000D52500A3A11DFFFB4CFFFC4DD2CF58FFD479FFD478D5D224D2D059D4D124A3A01CFEF9D9FEFAD9D2D058F09C79E48C67D5D225FA3E00FA3F00FFE1ADC0C0C0FDF9D9C8C64AB8B52EFFFC4CFFE1ACD4D224B1BAC45E5E5EFDF9D8'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(2) := ''9D9D9DC8C549F9B3989E9E9EA3A11C5F5F5FFAB498C8C';

s:=s||'54AFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(3) := ''000000000021F90401000025002C0000000010001000000662C09270482C1A8F0DC7D1D8187D944B2163E269402051068534B14422CB83E222486800CBC142102018D0C70327202020E0467120507884D2146C050609690B7B768547030A6B6E78450C12'';'||unistr('\000a')||
'ww';

s:=s||'v_flow_api.g_varchar2_table(4) := ''15050577510318936F51251D20190F90471B2200A34641003B'';'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'declare'||unistr('\000a')||
'    l_name   varchar2(255);'||unistr('\000a')||
'begin'||unistr('\000a')||
'    l_name := ''pencil2_16x16.gif'';'||unistr('\000a')||
' '||unistr('\000a')||
'  wwv_flow_api.create_or_remove_file('||unistr('\000a')||
'     p_name=> l_name,'||unistr('\000a')||
'     p_varchar2_table=> wwv_flow_api.g_varchar2_table,'||unistr('\000a')||
'     p_mimetype=> ''image/gif'','||unistr('\000a')||
'     p_location=> ''WORKSPACE'','||unistr('\000a')||
'     p_nlang=> ''0'','||unistr('\000a')||
'     p_mode=> ''CREATE_OR_R';

s:=s||'EPLACE'','||unistr('\000a')||
'     p_type=> ''IMAGE'');'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 22965811079809659 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'pencil2_16x16.gif',
  p_sequence=> 90,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||' '||unistr('\000a')||
'begin'||unistr('\000a')||
' '||unistr('\000a')||
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(1) := ''2F2A0A2A0A2A0954686973204353532066696C65206973206261736564206F6E3A0A2A092D2043535320446963653A20416E204578706572696D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70736F6E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(2) := ''20687474703A2F2F73616D70736F6E626C6F672E636F6';

s:=s||'D2F3238392F6F662D646963652D646162626C65742D616E642D6373730A2A092D206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(3) := ''6C61732F6E6F726D616C697A652E63737320436F7079726967687420286329204E69636F6C61732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A092D202253696D706C69737465222074656D706C61746520616E6420225369'';'||unistr('\000a')||
'ww';

s:=s||'v_flow_api.g_varchar2_table(4) := ''6D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374652F20436F707972696768742028632920323031322052656E617420526166696B6F760A2A0A2A2F0A0A2F2A0A09435353'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(5) := ''2052657365743A204261736564206F6E206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F6C6';

s:=s||'1732F6E6F726D616C697A652E6373730A09436F7079726967687420286329204E69636F6C61'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(6) := ''732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A2F0A68746D6C207B20666F6E742D66616D696C793A2056657264616E612C73616E732D73657269663B202D6D732D746578742D73697A652D61646A7573743A20313030253B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(7) := ''202D7765626B69742D746578742D73697A652D61646A7';

s:=s||'573743A20313030253B207D0A626F6479207B206D617267696E3A20303B206261636B67726F756E643A20236632663266323B207D0A666F6F7465722C6865616465722C73656374696F6E207B20'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(8) := ''646973706C61793A20626C6F636B3B207D0A5B68696464656E5D7B20646973706C61793A206E6F6E653B207D0A61207B206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B207D0A61207B20636F6C6F723A20233266323B2074'';'||unistr('\000a')||
'ww';

s:=s||'v_flow_api.g_varchar2_table(9) := ''6578742D6465636F726174696F6E3A206E6F6E653B207D0A613A6163746976652C613A686F766572207B206F75746C696E653A20303B207D0A622C7374726F6E67207B20666F6E742D7765696768743A20626F6C643B207D0A696D67207B20626F726465'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(10) := ''723A20303B207D0A627574746F6E2C696E707574207B20636F6C6F723A20696E68657269743B20666F6E743A20696E68657269743B206D617267696E3A20';

s:=s||'303B207D0A627574746F6E207B206F766572666C6F773A2076697369626C653B20746578742D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(11) := ''7472616E73666F726D3A206E6F6E653B202D7765626B69742D617070656172616E63653A20627574746F6E3B20637572736F723A20706F696E7465723B207D0A627574746F6E5B64697361626C65645D20207B20637572736F723A2064656661756C743B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(12) := ''207D0A627574746F6E3A3A2D6D6F7A2D666F637573';

s:=s||'2D696E6E65722C696E7075743A3A2D6D6F7A2D666F6375732D696E6E6572207B20626F726465723A20303B2070616464696E673A20303B207D0A696E707574207B206C696E652D6865696768743A20'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(13) := ''6E6F726D616C3B207D0A7461626C65207B20626F726465722D636F6C6C617073653A20636F6C6C617073653B626F726465722D73706163696E673A20303B207D0A74642C7468207B2070616464696E673A20303B207D0A756C207B206C6973742D737479''';

s:=s||';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(14) := ''6C653A6E6F6E65207D0A756C206C69207B2070616464696E673A30203020302E34656D20303B207D0A6831207B20666F6E742D73697A653A2032656D3B206D617267696E3A20302E3637656D20303B207D0A68312C68322C6833207B20666F6E742D7765'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(15) := ''696768743A6E6F726D616C3B207D0A2F2A20456E6420435353205265736574202A2F0A0A0A2F2A0A0943535320446963653A20416E2045787065726';

s:=s||'96D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(16) := ''736F6E20687474703A2F2F73616D70736F6E626C6F672E636F6D2F7461672F7765622D64657369676E0A2A2F0A2E6469652E6F6E65202E646F74207B0A09626F782D736861646F773A2030202E32656D203020236666660A7D0A2E6469652E74776F202E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(17) := ''646F74207B0A096261636B67726F756E643A2';

s:=s||'07472616E73706172656E743B0A09626F782D736861646F773A092D322E33656D202D322E33656D203020233334352C0A09090909322E33656D2020322E33656D203020233334352C0A090909092D322E33'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(18) := ''656D202D322E33656D203020236666662C0A09090909322E33656D2020322E34656D203020236666660A7D0A2E6469652E7468726565202E646F74207B0A09626F782D736861646F773A092D322E33656D202D322E33656D203020233334352C0A09';

s:=s||'0909'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(19) := ''09322E33656D2020322E33656D203020233334352C0A090909092D322E33656D202D322E33656D203020236666662C0A09090909322E33656D2020322E34656D203020236666662C0A0909090930202E32656D203020236666660A7D0A2E6469652E666F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(20) := ''7572202E646F74207B0A096261636B67726F756E643A207472616E73706172656E743B0A2020202020202020626F782D736861646F773A202D';

s:=s||'322E33656D202D322E33656D203020233334352C0A0909090909322E33656D20322E33656D203020233334'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(21) := ''352C0A09090909092D322E33656D20322E33656D203020233334352C0A0909090909322E33656D202D322E33656D203020233334352C0A09090909092D322E33656D202D322E33656D203020236666662C0A0909090909322E33656D20322E34656D2030'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(22) := ''20236666662C0A09090909092D322E33';

s:=s||'656D20322E34656D203020236666662C0A0909090909322E33656D202D322E33656D203020236666660A7D0A2E6469652E66697665202E646F74207B0A09626F782D736861646F773A092D322E33656D202D322E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(23) := ''33656D203020233334352C0A09090909322E33656D20322E33656D203020233334352C0A090909092D322E33656D20322E33656D203020233334352C0A09090909322E33656D202D322E33656D203020233334352C0A090909092D322E33656';

s:=s||'D202D322E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(24) := ''32656D203020236666662C0A09090909322E33656D202D322E32656D203020236666662C0A09090909322E33656D20322E34656D203020236666662C0A090909092D322E33656D20322E34656D203020236666662C0A0909090930202E32656D20302023'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(25) := ''6666660A7D0A2E6469652E736978202E646F74207B0A096261636B67726F756E643A207472616E73706172656E743B0A09626F782D736';

s:=s||'861646F773A202D322E33656D202D322E33656D203020233334352C0A090909092D322E33656D20302030202333'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(26) := ''34352C0A090909092D322E33656D20322E33656D203020233334352C0A09090909322E33656D202D322E33656D203020233334352C0A09090909322E33656D2030203020233334352C0A09090909322E33656D20322E33656D203020233334352C0A0909'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(27) := ''09092D322E33656D202D322E316';

s:=s||'56D203020236666662C0A090909092D322E33656D202E32656D203020236666662C0A090909092D322E33656D20322E34656D203020236666662C0A09090909322E33656D20322E34656D203020236666662C0A090909'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(28) := ''09322E33656D202E32656D203020236666662C0A09090909322E33656D202D322E31656D203020236666660A7D0A2E646965207B0A09626F726465722D746F703A2031707820736F6C696420236631663166313B0A0977696474683A20';

s:=s||'353070783B2068'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(29) := ''65696768743A20353070783B0A09626F726465722D7261646975733A20313070783B0A09706F736974696F6E3A2072656C61746976653B0A096D617267696E3A20313070783B0A09666F6E742D73697A653A203670783B0A09646973706C61793A20696E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(30) := ''6C696E652D626C6F636B3B0A09626F782D736861646F773A2030707820357078203020234343432C203020367078203370782023';

s:=s||'3434342C203020313070782035707820233333333B0A096261636B67726F756E642D696D6167653A202D7765626B6974'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(31) := ''2D72616469616C2D6772616469656E7428236665666566652C2023663066306630293B0A096261636B67726F756E642D696D6167653A2072616469616C2D6772616469656E7428236665666566652C2023663066306630293B0A096261636B67726F756E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(32) := ''642D636F6C6F723A202366';

s:=s||'61666166613B0A7D0A2E646F74207B0A0977696474683A203230253B0A096865696768743A203230253B0A096C6566743A203530253B0A09746F703A203530253B0A096D617267696E3A202D3130253B0A096261636B67726F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(33) := ''756E643A20233334353B0A09626F726465722D7261646975733A203530253B0A09646973706C61793A20626C6F636B3B0A09706F736974696F6E3A206162736F6C7574653B0A7D0A2F2A20456E64204353532044696365202A2F0';

s:=s||'A0A2F2A0A095468656D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(34) := ''653A204261736564206F6E202253696D706C69737465222074656D706C61746520616E64202253696D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374650A09436F70797269'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(35) := ''6768742028632920323031322052656E617420526166696B6F760A2A2F0A0A2F2A2A2A2A2048656C70657220636C6173736';

s:=s||'573202A2A2A2A2F0A2E686964656D657B20646973706C61793A6E6F6E653B207D0A2E696D67207B206D61782D77696474683A'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(36) := ''313030253B6865696768743A6175746F207D0A0A0A2F2A2A2A2A2050616765202A2A2A2A2F0A2E636F6E7461696E6572207B0A096D61782D77696474683A3133303070783B0A096D617267696E3A30206175746F3B0A7D0A2E686561646572207B0A2020'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(37) := ''6D617267696E3A317';

s:=s||'07820302033656D20303B0A202070616464696E673A32656D20322520302032253B0A7D0A2E6C6F676F207B0A2020666C6F61743A6C6566743B0A2020646973706C61793A696E6C696E652D626C6F636B3B0A202070616464696E67'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(38) := ''3A3020302031656D3B0A2020666F6E742D73697A653A313870783B0A2020636F6C6F723A233333333B0A7D0A2E696E666F207B2070616464696E673A302031252031656D2031253B207D0A2E626F617264207B0A09626163';

s:=s||'6B67726F756E643A20233037'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(39) := ''303B0A09626F726465722D7261646975733A203570783B0A09626F782D736861646F773A093020302039707820337078202333333320696E7365742C0A090909093020302035307078202331313120696E7365742C0A0909090930203330707820333070'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(40) := ''78202D32307078202333333320696E7365743B0A0970616464696E673A2031357078203020313570782032253B0A09';

s:=s||'6D617267696E3A2030203020322520303B0A09636F6C6F723A20236661666166613B0A7D0A2E666F6F746572207B0A097061646469'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(41) := ''6E673A31656D2033252033656D2033253B0A09636F6C6F723A233731373137313B0A09666F6E742D73697A653A313270783B0A7D0A2F2A0A2E636C6561726669783A6265666F72652C0A2E636C6561726669783A6166746572207B20636F6E74656E743A'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(42) := ''22223B206469';

s:=s||'73706C61793A7461626C653B207D0A2E636C6561726669783A6166746572207B20636C6561723A626F74683B207D0A2A2F0A2F2A20436F6C756D6E73202A2F0A2E636F6C5F3235207B0A202077696474683A3233253B0A20206D61726769'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(43) := ''6E3A30203225203020303B0A2020666C6F61743A6C6566743B0A7D0A2E636F6C5F3333207B0A0977696474683A3331253B0A096D617267696E3A30203225203020303B0A09666C6F61743A6C6566743B0A7D0A2E636';

s:=s||'F6C5F3430207B0A0977696474683A'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(44) := ''3338253B0A09666C6F61743A6C6566743B0A7D0A2E636F6C5F3530207B0A0977696474683A3438253B0A096D617267696E3A30203225203020303B0A09666C6F61743A6C6566743B0A7D0A2E677269642D636F6C756D6E207B0A096D617267696E3A3020'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(45) := ''313670782038707820303B0A09646973706C61793A696E6C696E652D626C6F636B3B0A09626F782D73697A696';

s:=s||'E673A20626F726465722D626F783B0A7D0A0A0A2F2A2A2A2A20526567696F6E202A2A2A2A2F0A2E726567696F6E207B0A096D617267696E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(46) := ''3A2030203132707820367078203370783B0A7D0A2E736964652D726567696F6E207B0A09666C6F61743A206C6566743B0A096D617267696E3A3020313070782035707820303B0A7D0A2F2A0A2E6D6F64616C5F4C4F41444552207B0A202020206261636B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(47) := ''67726F7';

s:=s||'56E642D636F6C6F723A20726762612835312C2035312C2035312C20302E33293B0A20202020637572736F723A20776169743B0A202020206865696768743A20313030253B0A202020206C6566743A20303B0A20202020706F736974696F6E3A20'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(48) := ''66697865643B0A20202020746F703A20303B0A2020202077696474683A20313030253B0A202020207A2D696E6465783A20393939393B0A7D0A2E6D6F64616C5F4C4F4144455220696D67207B0A202020206375';

s:=s||'72736F723A20776169743B0A202020206C'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(49) := ''6566743A203438253B0A20202020706F736974696F6E3A2072656C61746976653B0A20202020746F703A203334253B0A7D0A2A2F0A0A0A2F2A2A2A2A204D657373616765202A2A2A2A2F0A2E7761726E696E67207B0A2020626F726465723A3170782073'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(50) := ''6F6C696420236563323532653B0A2020636F6C6F723A236666663B0A202070616464696E673A38707820';

s:=s||'313470783B0A20206261636B67726F756E643A236561303030303B0A2020626F726465722D7261646975733A3870783B0A7D0A2E737563636573'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(51) := ''73207B0A2020626F726465723A31707820736F6C696420233339396631363B0A2020636F6C6F723A236666663B0A20206261636B67726F756E643A233339396631363B0A202070616464696E673A38707820313470783B0A2020626F726465722D726164'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(52) := ''69';

s:=s||'75733A3870783B0A7D0A2E6D657373616765207B0A2020626F726465723A31707820736F6C696420236631656463663B0A2020636F6C6F723A233030303B0A20206261636B67726F756E643A236662663865333B0A202070616464696E673A38707820'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(53) := ''313470783B0A2020626F726465722D7261646975733A3870783B0A7D0A2E6D657373616765203E2061207B0A09636F6C6F723A20233030346464390A7D0A2E6D65737361676573207B0A09706F7369746';

s:=s||'96F6E3A206162736F6C7574653B0A0977696474'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(54) := ''683A20313030253B0A09746F703A20303B0A096D617267696E3A20303B0A0970616464696E673A20303B0A097A2D696E6465783A20393939393B0A7D0A2E6D65737361676573203E20646976207B0A0977696474683A203630253B0A096D617267696E3A'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(55) := ''2030206175746F3B0A09626F726465722D7261646975733A2030203020387078203870783B0A097';

s:=s||'06F736974696F6E3A2072656C61746976653B0A7D0A0A0A2F2A2A2A2A20427574746F6E202A2A2A2A2F0A2E627574746F6E207B0A202020206261636B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(56) := ''67726F756E642D636F6C6F723A20236363633B0A20202020626F782D736861646F773A093020302033707820327078202365656520696E7365742C0A0909090930203370782033707820233333333B0A20202020626F726465723A2031707820736F6C69'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(57) :';

s:=s||'= ''6420233838383B0A20202020636F6C6F723A20233333333B0A09746578742D736861646F773A20317078203170782031707820236464643B0A09626F726465722D7261646975733A20313570783B0A09746578742D616C69676E3A63656E7465723B0A09'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(58) := ''746578742D6465636F726174696F6E3A6E6F6E653B0A0970616464696E673A3130707820323070783B0A09646973706C61793A696E6C696E652D626C6F636B3B0A096D617267696E3A203370783B';

s:=s||'0A7D0A2E627574746F6E3A686F766572207B0A202020'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(59) := ''206261636B67726F756E642D636F6C6F723A20236161613B0A09626F726465722D636F6C6F723A20233636363B0A20202020626F782D736861646F773A093020302033707820327078202363636320696E7365742C0A0909090930203370782033707820'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(60) := ''233131313B0A7D0A2E627574746F6E2E686F74207B0A202020206261636B67726F756E642D';

s:=s||'636F6C6F723A20233263323B0A20202020626F726465723A2031707820736F6C696420233238323B0A20202020626F782D736861646F773A09302030203370'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(61) := ''7820327078202332653220696E7365742C0A0909090930203370782033707820233333333B0A20202020636F6C6F723A20236631663166313B0A09746578742D736861646F773A317078203170782031707820233333333B0A096D617267696E3A203370'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(';

s:=s||'62) := ''783B0A7D0A2E627574746F6E2E686F743A686F766572207B0A202020206261636B67726F756E642D636F6C6F723A20233261323B0A09626F726465722D636F6C6F723A20233236323B0A20202020626F782D736861646F773A0930203020337078203270'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(63) := ''78202332633220696E7365742C0A0909090930203370782033707820233131313B0A7D0A0A2F2A2A2A2A204974656D202A2A2A2A2F0A2E746578745F6669656C64207B0A096261636B67726';

s:=s||'F756E642D636F6C6F723A20236661666166613B0A09626F72'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(64) := ''6465723A2031707820736F6C696420236330633063303B0A09626F726465722D7261646975733A203370783B0A09626F782D736861646F773A20337078203370782033707820233333333B0A09626F782D73697A696E673A20626F726465722D626F783B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(65) := ''0A09636F6C6F723A20233333333B0A096865696768743A20313030253B0A097061646';

s:=s||'4696E673A20327078203570783B0A096D617267696E3A203370783B0A7D0A0A2F2A2A2A2A2044696365206974656D20706C7567696E202A2A2A2A2F0A2E6469652D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(66) := ''636F6E7461696E6572207B0A0977696474683A20373070783B0A096865696768743A20383070783B0A09626F726465722D7261646975733A203870783B0A096D617267696E3A2030203020387078203870780A7D0A2E686F6C642D646965207B0A096261'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_t';

s:=s||'able(67) := ''636B67726F756E642D636F6C6F723A20233030626230303B0A09626F782D736861646F773A203020302031707820317078202332643220696E7365743B0A7D0A0A2F2A2A2A2A204C6162656C202A2A2A2A2F0A7370616E2E6C6162656C2D6572726F7220'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(68) := ''7B0A20202020636F6C6F723A20236563323532653B0A20202020646973706C61793A20626C6F636B3B0A202020206D617267696E3A203020337078203370783B0A7D0A6C6162656C2E';

s:=s||'6C6162656C2D6F7074696F6E616C207B0A20202020646973706C61'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(69) := ''793A20626C6F636B3B0A202020206D617267696E3A203132707820337078203370783B0A7D0A0A2F2A2A2A2A205265706F7274202A2A2A2A2F0A2E7061706572207B0A096D617267696E2D72696768743A203670783B0A096D617267696E2D626F74746F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(70) := ''6D3A20313870783B0A096261636B67726F756E642D636F6C6F723A2023666566';

s:=s||'6566653B0A09626F726465722D7261646975733A203170783B0A096C65747465722D73706163696E673A202D3170783B0A09636F6C6F723A20233636363B0A0977696474'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(71) := ''683A313030253B0A09666F6E742D73697A653A312E34656D3B0A09746578742D616C69676E3A2063656E7465723B0A09626F782D736861646F773A093020302033307078207267626128302C20302C20302C20302E312920696E7365742C0A0909090931'';'||unistr('\000a')||
'wwv_flow_api.g_varch';

s:=s||'ar2_table(72) := ''7078203170782030207267626128302C302C302C302E313030292C0A090909093370782033707820302072676261283234302C3234302C3234302C20312E30292C0A09090909347078203470782030207267626128302C302C302C302E313235292C0A09'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(73) := ''0909093670782036707820302072676261283234302C3234302C3234302C312E30292C0A09090909377078203770782030207267626128302C302C302C302E313530292C0A090';

s:=s||'909093970782039707820302072676261283234302C3234302C3234302C'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(74) := ''312E30292C0A090909093130707820313070782030207267626128302C302C302C302E313735292C0A090909093130707820313270782034707820233333333B0A7D0A2E7061706572207464207B0A09626F726465722D746F703A31707820736F6C6964'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(75) := ''20233931643164333B0A09636F6C6F723A233333333B0A7D0A2E7061706';

s:=s||'572207468207B0A09666F6E742D7765696768743A20626F6C643B0A7D0A2E73636F72652D63617264207B0A0977696474683A206175746F3B0A09666F6E742D73697A653A302E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(76) := ''38656D3B0A096D617267696E2D626F74746F6D3A20313270783B0A7D0A2E73636F72652D636172642074642E63656C6C31207B0A09626F726465722D6C6566743A2031707820736F6C696420233931643164333B0A0970616464696E672D6C6566743A20'';'||unistr('\000a')||
'wwv_flow_api.g_';

s:=s||'varchar2_table(77) := ''3870783B0A09746578742D616C69676E3A206C6566743B0A7D0A2E73636F72652D636172642074642E63656C6C32207B0A0970616464696E673A20317078203870783B0A09746578742D616C69676E3A2072696768743B0A7D0A2E73636F72652D636172'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(78) := ''642074642E746F702D626F72646572207B0A09626F726465722D746F703A2032707820736F6C696420233636363B0A7D0A2E73636F72652D636172642074642E73696465';

s:=s||'203E20646976207B0A20202020666C6F61743A206C6566743B0A202020206D61'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(79) := ''7267696E3A20303B0A2020202070616464696E673A20303B0A20202020626F74746F6D3A20303B0A096C6566743A20303B0A096F766572666C6F773A2076697369626C653B0A0977686974652D73706163653A206E6F777261703B0A202020202D776562'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(80) := ''6B69742D7472616E73666F726D3A20726F74617465282D39306465';

s:=s||'67293B0A20202020202020202D6D732D7472616E73666F726D3A20726F74617465282D3930646567293B0A2020202020202020202020207472616E73666F726D3A20726F7461746528'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(81) := ''2D3930646567293B0A2020202077696474683A20323070783B0A7D0A2E73636F72652D636172642074642E73636F72652D626F78207B0A096865696768743A20323870783B0A0977696474683A20343870783B0A7D0A2E73636F72652D63617264207464'';'||unistr('\000a')||
'wwv_flow_a';

s:=s||'pi.g_varchar2_table(82) := ''2E73636F72652D626F78203E2061207B0A202020206261636B67726F756E642D636F6C6F723A20236661666166613B0A20202020626F726465723A2031707820736F6C696420236330633063303B0A20202020626F726465722D7261646975733A203370'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(83) := ''783B0A20202020626F782D73697A696E673A20626F726465722D626F783B0A20202020636F6C6F723A20233333333B0A20202020646973706C61793A20626C6F636';

s:=s||'B3B0A20202020666F6E742D7765696768743A20626F6C643B0A202020207061646469'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(84) := ''6E673A2030203570783B0A2020202077696474683A20313030253B0A096865696768743A20313030253B0A09626F782D736861646F773A2030203020317078202333333320696E7365743B0A7D0A2E73636F72652D636172642074642E73636F72652D62'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(85) := ''6F78203E2061203E207370616E207B0A202020206D6172676';

s:=s||'96E2D72696768743A203370783B0A7D0A2E73636F72652D63617264202074723A66697273742D6368696C64207464207B0A20202020626F726465722D746F703A206E6F6E653B0A7D0A2E73'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(86) := ''636F72652D63617264202074723A6C6173742D6368696C64207464207B0A20202020666F6E742D7765696768743A20626F6C643B0A0970616464696E672D746F703A203270783B0A0970616464696E672D626F74746F6D3A203270783B0A7D0A0A2F2A2A'';'||unistr('\000a')||
'wwv_f';

s:=s||'low_api.g_varchar2_table(87) := ''2A2A20726573706F6E73697665202A2A2A2A2F0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A373530707829207B202F2A205461626C6574202A2F0A092E636F6C5F32352C0A092E636F6C5F33332C0A092E636F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(88) := ''6C5F34302C0A092E636F6C5F353020207B0A090977696474683A3938253B0A0909666C6F61743A6E6F6E653B0A097D0A092E6D65737361676573207B20706F';

s:=s||'736974696F6E3A207374617469633B207D0A7D0A406D65646961206F6E6C79207363726565'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(89) := ''6E20616E6420286D61782D77696474683A343830707829207B202F2A20536D61727470686F6E65202A2F0A092E686561646572207B0A09096D617267696E2D626F74746F6D3A303B0A097D0A092E6C6F676F7B0A0909646973706C61793A626C6F636B3B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(90) := ''0A0909666C6F61743A6E6F6E653B0A0909746578742D';

s:=s||'616C69676E3A63656E7465723B0A097D0A092E626F617264207B0A090970616464696E672D746F703A2031253B0A090970616464696E672D6C6566743A2031253B0A097D0A7D0A2F2A20456E6420'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(91) := ''435353205468656D65202A2F'';'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'declare'||unistr('\000a')||
'  l_name   varchar2(255);'||unistr('\000a')||
'begin'||unistr('\000a')||
'  l_name := ''yatzy.css'';'||unistr('\000a')||
' '||unistr('\000a')||
'  wwv_flow_api.create_or_remove_file('||unistr('\000a')||
'     p_name=> l_name,'||unistr('\000a')||
'     p_varchar2_table=> wwv_flow_api.g_';

s:=s||'varchar2_table,'||unistr('\000a')||
'     p_mimetype=> ''text/css'','||unistr('\000a')||
'     p_location=> ''WORKSPACE'','||unistr('\000a')||
'     p_mode=> ''CREATE_OR_REPLACE'','||unistr('\000a')||
'     p_type=> ''CSS'');'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 23634211794489135 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'yatzy.css',
  p_sequence=> 100,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||' '||unistr('\000a')||
'begin'||unistr('\000a')||
' '||unistr('\000a')||
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(1) := ''2F2A0A2A0A2A0954686973204353532066696C65206973206261736564206F6E3A0A2A092D2043535320446963653A20416E204578706572696D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70736F6E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(2) := ''20687474703A2F2F73616D70736F6E626C6F672E636F6';

s:=s||'D2F3238392F6F662D646963652D646162626C65742D616E642D6373730A2A092D206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(3) := ''6C61732F6E6F726D616C697A652E63737320436F7079726967687420286329204E69636F6C61732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A092D202253696D706C69737465222074656D706C61746520616E6420225369'';'||unistr('\000a')||
'ww';

s:=s||'v_flow_api.g_varchar2_table(4) := ''6D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374652F20436F707972696768742028632920323031322052656E617420526166696B6F760A2A0A2A2F0A68746D6C7B666F6E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(5) := ''742D66616D696C793A56657264616E612C73616E732D73657269663B2D6D732D746578742D73697A652D61646A7573743A313030253B2D7765626B69742D7';

s:=s||'46578742D73697A652D61646A7573743A313030257D626F64797B6D617267696E3A303B6261'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(6) := ''636B67726F756E643A236632663266327D666F6F7465722C6865616465722C73656374696F6E7B646973706C61793A626C6F636B7D617B6261636B67726F756E642D636F6C6F723A7472616E73706172656E743B636F6C6F723A233266323B746578742D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(7) := ''6465636F726174696F6E3A6E6F6E657D613A616374697';

s:=s||'6652C613A686F7665727B6F75746C696E653A307D696D677B626F726465723A307D627574746F6E2C696E7075747B636F6C6F723A696E68657269743B666F6E743A696E68657269743B6D617267'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(8) := ''696E3A307D627574746F6E7B6F766572666C6F773A76697369626C653B746578742D7472616E73666F726D3A6E6F6E653B2D7765626B69742D617070656172616E63653A627574746F6E3B637572736F723A706F696E7465727D627574746F6E5B646973'';'||unistr('\000a')||
'ww';

s:=s||'v_flow_api.g_varchar2_table(9) := ''61626C65645D7B637572736F723A64656661756C747D627574746F6E3A3A2D6D6F7A2D666F6375732D696E6E65722C696E7075743A3A2D6D6F7A2D666F6375732D696E6E65727B626F726465723A303B70616464696E673A307D696E7075747B6C696E65'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(10) := ''2D6865696768743A6E6F726D616C7D7461626C657B626F726465722D636F6C6C617073653A636F6C6C617073653B626F726465722D73706163696E673A30';

s:=s||'7D74642C74687B70616464696E673A307D756C7B6C6973742D7374796C653A6E6F6E657D756C'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(11) := ''206C697B70616464696E673A302030202E34656D7D68317B666F6E742D73697A653A32656D3B6D617267696E3A2E3637656D20307D68312C68322C68337B666F6E742D7765696768743A3430307D2E6469652D636F6E7461696E65727B77696474683A37'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(12) := ''3070783B6865696768743A383070783B626F726465';

s:=s||'722D7261646975733A3870783B6D617267696E3A30203020387078203870787D2E686F6C642D6469657B6261636B67726F756E642D636F6C6F723A233062303B626F782D736861646F773A30203020'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(13) := ''31707820317078202332643220696E7365747D2E6469652E6F6E65202E646F747B626F782D736861646F773A30202E32656D203020236666667D2E6469652E74776F202E646F747B6261636B67726F756E643A7472616E73706172656E743B626F782D73''';

s:=s||';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(14) := ''6861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C202D322E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666667D2E6469652E746872656520'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(15) := ''2E646F747B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C202D3';

s:=s||'22E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666662C20'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(16) := ''30202E32656D203020236666667D2E6469652E666F7572202E646F747B6261636B67726F756E643A7472616E73706172656E743B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D20302023'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(17) := ''3334352C202D322E33656D20322E33656D203';

s:=s||'020233334352C20322E33656D202D322E33656D203020233334352C202D322E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666662C202D322E33656D20322E3465'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(18) := ''6D203020236666662C20322E33656D202D322E33656D203020236666667D2E6469652E66697665202E646F747B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C20';

s:=s||'2D32'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(19) := ''2E33656D20322E33656D203020233334352C20322E33656D202D322E33656D203020233334352C202D322E33656D202D322E32656D203020236666662C20322E33656D202D322E32656D203020236666662C20322E33656D20322E34656D203020236666'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(20) := ''662C202D322E33656D20322E34656D203020236666662C2030202E32656D203020236666667D2E6469652E736978202E646F747B6261636B67';

s:=s||'726F756E643A7472616E73706172656E743B626F782D736861646F773A2D322E33656D202D322E33656D20'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(21) := ''3020233334352C202D322E33656D2030203020233334352C202D322E33656D20322E33656D203020233334352C20322E33656D202D322E33656D203020233334352C20322E33656D2030203020233334352C20322E33656D20322E33656D203020233334'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(22) := ''352C202D322E33656D202D322E31656D';

s:=s||'203020236666662C202D322E33656D202E32656D203020236666662C202D322E33656D20322E34656D203020236666662C20322E33656D20322E34656D203020236666662C20322E33656D202E32656D20302023'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(23) := ''6666662C20322E33656D202D322E31656D203020236666667D2E6469657B626F726465722D746F703A31707820736F6C696420236631663166313B77696474683A353070783B6865696768743A353070783B626F726465722D7261646975733';

s:=s||'A31307078'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(24) := ''3B706F736974696F6E3A72656C61746976653B6D617267696E3A313070783B666F6E742D73697A653A3670783B646973706C61793A696E6C696E652D626C6F636B3B626F782D736861646F773A3020357078203020234343432C20302036707820337078'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(25) := ''20233434342C203020313070782035707820233333333B6261636B67726F756E642D696D6167653A72616469616C2D6772616469656E7';

s:=s||'428236665666566652C2023663066306630293B6261636B67726F756E642D636F6C6F723A236661666166617D2E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(26) := ''646F747B77696474683A3230253B6865696768743A3230253B6C6566743A3530253B746F703A3530253B6D617267696E3A2D3130253B6261636B67726F756E643A233334353B626F726465722D7261646975733A3530253B646973706C61793A626C6F63'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(27) := ''6B3B706F736974696F6E3A61627';

s:=s||'36F6C7574657D2E686964656D652C5B68696464656E5D7B646973706C61793A6E6F6E657D2E696D677B6D61782D77696474683A313030253B6865696768743A6175746F7D2E636F6E7461696E65727B6D61782D776964'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(28) := ''74683A3133303070783B6D617267696E3A30206175746F7D2E6865616465727B6D617267696E3A31707820302033656D3B70616464696E673A32656D20322520307D2E6C6F676F7B666C6F61743A6C6566743B646973706C61793A696E';

s:=s||'6C696E652D626C'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(29) := ''6F636B3B70616464696E673A3020302031656D3B666F6E742D73697A653A313870783B636F6C6F723A233333337D2E696E666F7B70616464696E673A302031252031656D7D2E626F6172647B6261636B67726F756E643A233037303B626F726465722D72'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(30) := ''61646975733A3570783B626F782D736861646F773A3020302039707820337078202333333320696E7365742C2030203020353070';

s:=s||'78202331313120696E7365742C203020333070782033307078202D32307078202333333320696E7365743B7061646469'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(31) := ''6E673A31357078203020313570782032253B6D617267696E3A3020302032253B636F6C6F723A236661666166617D2E666F6F7465727B70616464696E673A31656D2033252033656D3B636F6C6F723A233731373137313B666F6E742D73697A653A313270'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(32) := ''787D2E636F6C5F32357B77';

s:=s||'696474683A3233253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E636F6C5F33337B77696474683A3331253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E636F6C5F34307B'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(33) := ''77696474683A3338253B666C6F61743A6C6566747D2E636F6C5F35307B77696474683A3438253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E677269642D636F6C756D6E7B6D617267696E3A302031367';

s:=s||'0782038707820303B64'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(34) := ''6973706C61793A696E6C696E652D626C6F636B3B626F782D73697A696E673A626F726465722D626F787D2E726567696F6E7B6D617267696E3A30203132707820367078203370787D2E736964652D726567696F6E7B666C6F61743A6C6566743B6D617267'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(35) := ''696E3A3020313070782035707820307D2E7761726E696E677B626F726465723A31707820736F6C696420236563323532653';

s:=s||'B636F6C6F723A236666663B70616464696E673A38707820313470783B6261636B67726F756E643A236561303030303B626F72'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(36) := ''6465722D7261646975733A3870787D2E737563636573737B626F726465723A31707820736F6C696420233339396631363B636F6C6F723A236666663B6261636B67726F756E643A233339396631363B70616464696E673A38707820313470783B626F7264'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(37) := ''65722D72616469757';

s:=s||'33A3870787D2E6D6573736167657B626F726465723A31707820736F6C696420236631656463663B636F6C6F723A233030303B6261636B67726F756E643A236662663865333B70616464696E673A38707820313470783B626F726465'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(38) := ''722D7261646975733A3870787D2E6D657373616765203E20617B636F6C6F723A233030346464397D2E6D657373616765737B706F736974696F6E3A6162736F6C7574653B77696474683A313030253B746F703A303B6D6172';

s:=s||'67696E3A303B70616464696E'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(39) := ''673A303B7A2D696E6465783A393939397D2E6D65737361676573203E206469767B77696474683A3630253B6D617267696E3A30206175746F3B626F726465722D7261646975733A30203020387078203870783B706F736974696F6E3A72656C6174697665'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(40) := ''7D2E627574746F6E7B6261636B67726F756E642D636F6C6F723A236363633B626F782D736861646F773A3020302033';

s:=s||'707820327078202365656520696E7365742C2030203370782033707820233333333B626F726465723A31707820736F6C6964202338'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(41) := ''38383B636F6C6F723A233333333B746578742D736861646F773A317078203170782031707820236464643B626F726465722D7261646975733A313570783B746578742D616C69676E3A63656E7465723B746578742D6465636F726174696F6E3A6E6F6E65'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(42) := ''3B7061646469';

s:=s||'6E673A3130707820323070783B646973706C61793A696E6C696E652D626C6F636B3B6D617267696E3A3370787D2E627574746F6E3A686F7665727B6261636B67726F756E642D636F6C6F723A236161613B626F726465722D636F6C6F723A'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(43) := ''233636363B626F782D736861646F773A3020302033707820327078202363636320696E7365742C2030203370782033707820233131317D2E627574746F6E2E686F747B6261636B67726F756E642D636F6C6F723A233';

s:=s||'263323B626F726465723A31707820'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(44) := ''736F6C696420233238323B626F782D736861646F773A3020302033707820327078202332653220696E7365742C2030203370782033707820233333333B636F6C6F723A236631663166313B746578742D736861646F773A31707820317078203170782023'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(45) := ''3333333B6D617267696E3A3370787D2E627574746F6E2E686F743A686F7665727B6261636B67726F756E642D6';

s:=s||'36F6C6F723A233261323B626F726465722D636F6C6F723A233236323B626F782D736861646F773A30203020337078203270782023326332'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(46) := ''20696E7365742C2030203370782033707820233131317D2E746578745F6669656C647B6261636B67726F756E642D636F6C6F723A236661666166613B626F726465723A31707820736F6C69642073696C7665723B626F726465722D7261646975733A3370'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(47) := ''783B626';

s:=s||'F782D736861646F773A337078203370782033707820233333333B626F782D73697A696E673A626F726465722D626F783B636F6C6F723A233333333B6865696768743A313030253B70616464696E673A327078203570783B6D617267696E3A3370'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(48) := ''787D7370616E2E6C6162656C2D6572726F727B636F6C6F723A236563323532653B646973706C61793A626C6F636B3B6D617267696E3A3020337078203370787D6C6162656C2E6C6162656C2D6F7074696F6E61';

s:=s||'6C7B646973706C61793A626C6F636B3B6D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(49) := ''617267696E3A3132707820337078203370787D2E70617065727B6D617267696E2D72696768743A3670783B6D617267696E2D626F74746F6D3A313870783B6261636B67726F756E642D636F6C6F723A236665666566653B626F726465722D726164697573'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(50) := ''3A3170783B6C65747465722D73706163696E673A2D3170783B636F6C6F723A233636363B77696474683A';

s:=s||'313030253B666F6E742D73697A653A312E34656D3B746578742D616C69676E3A63656E7465723B626F782D736861646F773A3020302033307078'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(51) := ''207267626128302C20302C20302C20302E312920696E7365742C20317078203170782030207267626128302C302C302C302E313030292C203370782033707820302072676261283234302C3234302C3234302C20312E30292C2034707820347078203020'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(52) := ''72';

s:=s||'67626128302C302C302C302E313235292C203670782036707820302072676261283234302C3234302C3234302C312E30292C20377078203770782030207267626128302C302C302C302E313530292C203970782039707820302072676261283234302C'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(53) := ''3234302C3234302C312E30292C203130707820313070782030207267626128302C302C302C302E313735292C203130707820313270782034707820233333337D2E70617065722074647B626F726465722';

s:=s||'D746F703A31707820736F6C6964202339316431'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(54) := ''64333B636F6C6F723A233333337D2E70617065722074682C622C7374726F6E677B666F6E742D7765696768743A3730307D2E73636F72652D636172647B77696474683A6175746F3B666F6E742D73697A653A2E38656D3B6D617267696E2D626F74746F6D'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(55) := ''3A313270787D2E73636F72652D636172642074642E63656C6C317B626F726465722D6C6566743A3';

s:=s||'1707820736F6C696420233931643164333B70616464696E672D6C6566743A3870783B746578742D616C69676E3A6C6566747D2E73636F72652D636172'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(56) := ''642074642E63656C6C327B70616464696E673A317078203870783B746578742D616C69676E3A72696768747D2E73636F72652D636172642074642E746F702D626F726465727B626F726465722D746F703A32707820736F6C696420233636367D2E73636F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(57) :';

s:=s||'= ''72652D636172642074642E73696465203E206469767B666C6F61743A6C6566743B6D617267696E3A303B70616464696E673A303B626F74746F6D3A303B6C6566743A303B6F766572666C6F773A76697369626C653B77686974652D73706163653A6E6F77'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(58) := ''7261703B2D7765626B69742D7472616E73666F726D3A726F74617465282D3930646567293B2D6D732D7472616E73666F726D3A726F74617465282D3930646567293B7472616E73666F726D3A726F';

s:=s||'74617465282D3930646567293B77696474683A323070'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(59) := ''787D2E73636F72652D636172642074642E73636F72652D626F787B6865696768743A323870783B77696474683A343870787D2E73636F72652D636172642074642E73636F72652D626F78203E20617B6261636B67726F756E642D636F6C6F723A23666166'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(60) := ''6166613B626F726465723A31707820736F6C69642073696C7665723B626F726465722D7261';

s:=s||'646975733A3370783B626F782D73697A696E673A626F726465722D626F783B636F6C6F723A233333333B646973706C61793A626C6F636B3B666F6E742D7765'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(61) := ''696768743A3730303B70616464696E673A30203570783B77696474683A313030253B6865696768743A313030253B626F782D736861646F773A30203020317078202333333320696E7365747D2E73636F72652D636172642074642E73636F72652D626F78'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(';

s:=s||'62) := ''203E2061203E207370616E7B6D617267696E2D72696768743A3370787D2E73636F72652D636172642074723A66697273742D6368696C642074647B626F726465722D746F703A6E6F6E657D2E73636F72652D636172642074723A6C6173742D6368696C64'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(63) := ''2074647B666F6E742D7765696768743A3730303B70616464696E672D746F703A3270783B70616464696E672D626F74746F6D3A3270787D0A406D65646961206F6E6C792073637265656E206';

s:=s||'16E6420286D61782D77696474683A3735307078297B2E636F'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(64) := ''6C5F32352C2E636F6C5F33332C2E636F6C5F34302C2E636F6C5F35307B77696474683A3938253B666C6F61743A6E6F6E657D2E6D65737361676573207B706F736974696F6E3A207374617469637D7D0A406D65646961206F6E6C792073637265656E2061'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(65) := ''6E6420286D61782D77696474683A3438307078297B2E6865616465727B6D617267696';

s:=s||'E2D626F74746F6D3A307D2E6C6F676F7B646973706C61793A626C6F636B3B666C6F61743A6E6F6E653B746578742D616C69676E3A63656E7465727D2E626F617264'';'||unistr('\000a')||
'wwv_flow_api.g_varchar2_table(66) := ''7B70616464696E672D746F703A31253B70616464696E672D6C6566743A31257D7D'';'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'declare'||unistr('\000a')||
'  l_name   varchar2(255);'||unistr('\000a')||
'begin'||unistr('\000a')||
'  l_name := ''yatzy.min.css'';'||unistr('\000a')||
' '||unistr('\000a')||
'  wwv_flow_api.create_or_remove_file('||unistr('\000a')||
'     p_name=> l_name,'||unistr('\000a')||
'     p_varchar2_ta';

s:=s||'ble=> wwv_flow_api.g_varchar2_table,'||unistr('\000a')||
'     p_mimetype=> ''text/css'','||unistr('\000a')||
'     p_location=> ''WORKSPACE'','||unistr('\000a')||
'     p_mode=> ''CREATE_OR_REPLACE'','||unistr('\000a')||
'     p_type=> ''CSS'');'||unistr('\000a')||
' '||unistr('\000a')||
'end;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 23634300486489139 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 28289916032294764 + wwv_flow_api.g_id_offset,
  p_name => 'yatzy.min.css',
  p_sequence=> 110,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
