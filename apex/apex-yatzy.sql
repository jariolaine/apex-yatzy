set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.2.00.06'
,p_default_workspace_id=>11276526621935354783
,p_default_application_id=>2192
,p_default_owner=>'YATZY'
);
end;
/
prompt --application/set_environment
 
prompt APPLICATION 2192 - Yatzy
--
-- Application Export:
--   Application:     2192
--   Name:            Yatzy
--   Date and Time:   13:38 Sunday November 1, 2015
--   Exported By:     JARIOLAINE
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.0.2.00.06
--   Instance ID:     63113759365424
--

-- Application Statistics:
--   Pages:                      3
--     Items:                   14
--     Computations:             6
--     Processes:                6
--     Regions:                  9
--     Buttons:                  4
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
--   Supporting Objects:  Included (auto-install)
--     Install scripts:         11

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,2192)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'YATZY')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Yatzy')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'YATZY')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'90A42DF3FFF909D0122E57709DDEBD7B63E1F15FB47779624035A31289E803AF'
,p_checksum_salt_last_reset=>'20151101132752'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'5.0'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'0'
,p_date_time_format=>'DD-MON-YYYY'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(16010653767948677974)
,p_application_tab_set=>0
,p_logo_image=>'TEXT:Yatzy'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'#OWNER#.yatzy_util.apex_error_handler'
,p_last_updated_by=>'JARIOLAINE'
,p_last_upd_yyyymmddhh24miss=>'20151101133059'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists
begin
null;
end;
/
prompt --application/shared_components/files
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(15976783828884349002)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(15976783946449349002)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(16005020962469184149)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
);
end;
/
prompt --application/shared_components/security/authorizations
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
null;
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(16005085675069943432)
,p_lov_name=>'HOLD_DICE'
,p_lov_query=>'.'||wwv_flow_api.id(16005085675069943432)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(16005085862949943435)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Hold'
,p_lov_return_value=>'X'
);
end;
/
prompt --application/shared_components/navigation/trees
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(16005040169437184159)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(16005040462430184159)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(15996527162660319084)
,p_theme_id=>101
,p_name=>'Game'
,p_is_popup=>false
,p_css_file_urls=>'#WORKSPACE_IMAGES#yatzy#MIN#.css'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'  <meta charset="UTF-8">',
'  <meta name="viewport" content="width=device-width,initial-scale=1">',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'#TEMPLATE_CSS#',
'  #APPLICATION_CSS#',
'#PAGE_CSS#',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>',
'<div class="messages">',
' #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
' <!--[if lt IE 9]><div class="warning">#OUTDATED_BROWSER#</div><![endif]-->',
'</div>',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
' <div class="info">',
'  #REGION_POSITION_01#',
'  <section class="board clearfix">',
'   <div class="col_50">',
'    #BODY#<div class="clearfix"></div>',
'   </div>',
'   <div class="col_33">',
'    #REGION_POSITION_03#<div class="clearfix"></div>',
'   </div>',
'  </section>',
' </div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <footer class="footer clearfix">',
' </footer>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="success">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="warning">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#">#TEXT#</a>#EDIT#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_grid_type=>'FIXED'
,p_grid_max_columns=>3
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#COLUMNS#',
''))
,p_grid_column_template=>'#CONTENT#'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(15996556665956643482)
,p_page_template_id=>wwv_flow_api.id(15996527162660319084)
,p_name=>'Main Content'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>2
);
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(15996849360854059224)
,p_theme_id=>101
,p_name=>'Two Column'
,p_is_popup=>false
,p_css_file_urls=>'#WORKSPACE_IMAGES#yatzy#MIN#.css'
,p_header_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'  <meta charset="UTF-8">',
'  <meta name="viewport" content="width=device-width,initial-scale=1">',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'  #THEME_STYLE_CSS#',
'  #THEME_CSS#',
'#TEMPLATE_CSS#',
'  #APPLICATION_CSS#',
'#PAGE_CSS# ',
'  #HEAD#',
'</head>',
'<body #ONLOAD#>',
'<div class="messages">',
' #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
' <!--[if lt IE 9]><div class="warning">#OUTDATED_BROWSER#</div><![endif]-->',
'</div>',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="container">',
' <header class="header clearfix">',
'  <div class="logo">#LOGO#</div>',
' </header>',
'  <div class="info">',
'   #REGION_POSITION_02#',
'   <section class="board clearfix">',
'    <div class="col_50">',
'     #BODY#',
'    </div>',
'    <div class="col_40">',
'     #REGION_POSITION_03#',
'    </div>',
'   </section>',
' </div>'))
,p_footer_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' <footer class="footer clearfix"></footer>',
'</div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="success">',
' <h2 class="visuallyhidden">#SUCCESS_MESSAGE_HEADING#</h2>',
' #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="warning">',
' <h2 class="visuallyhidden">#ERROR_MESSAGE_HEADING#</h2>',
' #MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#">#TEXT#</a>#EDIT#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div>',
' <p><strong>#MESSAGE#</strong></p>',
' <p>#ADDITIONAL_INFO#</p>',
' <div>#TECHNICAL_INFO#</div>',
' <p><a href="f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION."><strong>#RETURN_TO_APPLICATION#</strong></a></p>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>8
,p_grid_always_use_max_columns=>false
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>'#ROWS#'
,p_grid_row_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div class="clearfix">#COLUMNS#</div>',
''))
,p_grid_column_template=>'<div class="grid-column">#CONTENT#</div>'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(15996849651099059226)
,p_page_template_id=>wwv_flow_api.id(15996849360854059224)
,p_name=>'Main Content'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(15996531459995329863)
,p_template_name=>'Button'
,p_template=>'<button class="button #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
,p_hot_template=>'<button class="button hot #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL#</span></button> '
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>101
);
end;
/
prompt --application/shared_components/user_interface/templates/region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(15996529851980323632)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#BODY#',
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'</div>'))
,p_page_plug_template_name=>'DIV Region with ID'
,p_theme_id=>101
,p_theme_class_id=>11
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(15996558957495123848)
,p_layout=>'TABLE'
,p_template=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="region #REGION_CSS_CLASSES#">',
'<h2>#TITLE#</h2>',
'#BODY#',
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'</div>'))
,p_page_plug_template_name=>'Region with Title'
,p_theme_id=>101
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(15996884866974552961)
,p_row_template_name=>'Standard Report'
,p_row_template1=>'<td headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>'<table class="paper">'
,p_row_template_after_rows=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</tbody>',
'</table>',
'<table><tbody>#PAGINATION#</tbody></table>',
''))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="cell#" id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="instructiontext">#TEXT#</span>'
,p_next_page_template=>'<a href="#LINK#" class="uPaginationNext">#PAGINATION_NEXT# <img src="#IMAGE_PREFIX#f_spacer.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""> #PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#">#PAGINATION_NEXT_SET# <img src="#IMAGE_PREFIX#f_spacer.gif" alt=""></a>'
,p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#f_spacer.gif" alt=""> #PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>101
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(15996884866974552961)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(15999769868228704901)
,p_row_template_name=>'Score Card'
,p_row_template1=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr>',
'<td rowspan="#ROWSPAN#" class="top-border side"><div>#SECTION_LABEL#</div></td>',
'<td class="top-border cell1">#LABEL#</td>',
'<td class="top-border cell2 #INPUT_FIELD_CLASS#">#SCORE#</td>',
'</tr>'))
,p_row_template_condition1=>':ROWSPAN is not null'
,p_row_template2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<tr>',
'<td class="cell1">#LABEL#</td>',
'<td class="cell2 #INPUT_FIELD_CLASS#">#SCORE#</td>',
'</tr>',
''))
,p_row_template_before_rows=>'<table class="paper score-card"><tbody>'
,p_row_template_after_rows=>'</tbody></table>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>101
,p_theme_class_id=>8
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(15996881660199246812)
,p_template_name=>'No Label'
,p_template_body1=>'<span class="hideme">'
,p_template_body2=>'</span>'
,p_on_error_after_label=>'<span>#ERROR_MESSAGE#</span>'
,p_theme_id=>101
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(15996882337001269264)
,p_template_name=>'Optional'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="label-optional">'
,p_template_body2=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'</label>',
'<div class="item-container">'))
,p_after_item=>'</div>'
,p_on_error_after_label=>'<span class="label-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>101
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(15996551846881354422)
,p_popup_icon=>'#IMAGE_PREFIX#list.gif'
,p_popup_icon_attr=>'width=13 height=13'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>',
'</head>'))
,p_page_body_attr=>'bgcolor=white OnLoad=first_field()'
,p_before_field_text=>' '
,p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-fami'
||'ly:arial; background-color:#ffffff;} </style>'
,p_page_footer_text=>'</center></td></tr></table>'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next'
,p_prev_button_text=>'Previous'
,p_after_field_text=>'</div><br />'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW#'
,p_result_rows_per_pg=>10
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(15996515256146070550)
,p_theme_id=>101
,p_theme_name=>'Simple'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(15996849360854059224)
,p_error_template=>wwv_flow_api.id(15996849360854059224)
,p_default_button_template=>wwv_flow_api.id(15996531459995329863)
,p_default_region_template=>wwv_flow_api.id(15996558957495123848)
,p_default_report_template=>wwv_flow_api.id(15996884866974552961)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(101),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(15996847241427733281)
,p_name=>'GAME_OVER'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>Game over</p>',
'<p>Click ''Save'' to save score card or ''Exit'' to leave without saving</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16000120161688833225)
,p_name=>'GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16000120350880868618)
,p_name=>'ENTER_POINTS_NO_DATA'
,p_message_text=>'Ooops... Did you press browser back button?'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16000290536518881166)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_text=>'Please return to game.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16000290758934885982)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_text=>'Ooops... Too many throws.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16000302949577177409)
,p_name=>'OUTDATED_BROWSER'
,p_message_text=>'You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/"><strong>upgrade your browser</strong></a> to improve your experience.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005222051457472746)
,p_name=>'ONES'
,p_message_text=>'Ones'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005222249300473748)
,p_name=>'TWOS'
,p_message_text=>'Twos'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005222479049475111)
,p_name=>'THREES'
,p_message_text=>'Threes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005222676677476251)
,p_name=>'FOURS'
,p_message_text=>'Fours'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005222874951477043)
,p_name=>'FIVES'
,p_message_text=>'Fives'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005223071932478416)
,p_name=>'SIXES'
,p_message_text=>'Sixes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005223267403480514)
,p_name=>'SUM'
,p_message_text=>'Sum'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005223465894481237)
,p_name=>'BONUS'
,p_message_text=>'Bonus'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005223659208484284)
,p_name=>'PAIR'
,p_message_text=>'One Pair'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005223854679486450)
,p_name=>'TWO_PAIRS'
,p_message_text=>'Two Pairs'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005224049503488844)
,p_name=>'THREE_OF_KIND'
,p_message_text=>'Three of Kind'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005224277311491079)
,p_name=>'FOUR_OF_KIND'
,p_message_text=>'Four of Kind'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005224472782493163)
,p_name=>'SMALL_STRAIGHT'
,p_message_text=>'Small Straight'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005224668469495227)
,p_name=>'LARGE_STRAIGHT'
,p_message_text=>'Large Straight'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005224860705498815)
,p_name=>'JUMP_STRAIGHT'
,p_message_text=>'Jump Straight'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005225055098501403)
,p_name=>'FULL_HOUSE'
,p_message_text=>'Full House'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005225250569503462)
,p_name=>'CHANCE'
,p_message_text=>'Chance'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005225446687505251)
,p_name=>'YATZY'
,p_message_text=>'Yatzy'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005225675142507326)
,p_name=>'TOTAL'
,p_message_text=>'Total'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16005354947395960728)
,p_name=>'START_ROUND'
,p_message_text=>'<p>Click ''Throw'' to begin the round...</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16011303665534506133)
,p_name=>'YATZY_RULES'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'Roll the dice and collect your scores. You can re-roll twice and hold any dice.',
'</p>',
'<p>',
'The game is finished when you have filled all the slots in the scoreboard.<br/>',
'You can place your roll on any of the blank slots at the scoreboard, but you will receive zero points if you don''t have the right combination',
'</p>',
'<p>',
'If sum of upper section is 63 points or more, you receive 50 bonus points.',
'</p>',
'<h3>Upper section:</h3>',
'<ul><li>',
'Collect dice with all same numbers',
'</li></ul>',
'<h3>Lower section:</h3>',
'<ul>',
'<li>One Pair: Two same numbers</li>',
'<li>Two Pairs: Two pairs of dice</li>',
'<li>Thee of Kind: Three same numbers</li>',
'<li>Small Straight: 1,2,3,4,5</li>',
'<li>Large Straight: 2,3,4,5,6</li>',
'<li>Jump Straight: 1,3,4,5,6 or 1,2,3,4,6</li>',
'<li>Full House: Three same and pair</li>',
'<li>Chance: Any combination</li>',
'<li>Yatzy: All dice same numbers</li>',
'</ul>',
'<p>From Yatzy you receive constant 50 points.</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16011306065207643036)
,p_name=>'CONTINUE_ROUND'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>You have %0 rolls left</p>',
'<p>Click dice(s) to hold it and then click ''Throw'' to re-roll.</p>',
'<p>Or you can place score to score card and end the round.</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16011306366057657807)
,p_name=>'END_ROUND'
,p_message_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>You have %0 rolls left</p>',
'<p>Place your points at score box of your choice. If you have no match, you need place a zero.</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(16014092871857575308)
,p_name=>'ENTER_POINTS'
,p_message_text=>'Enter Points'
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(15999741142872072915)
,p_shortcut_name=>'GAME_OVER'
,p_shortcut_type=>'MESSAGE'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(16011303359292493862)
,p_shortcut_name=>'YATZY_RULES'
,p_shortcut_type=>'MESSAGE'
);
end;
/
prompt --application/shared_components/security/authentications
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(16010653767948677974)
,p_name=>'Yatzy Custom Athentication'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/item_type/com_tilaa_cloud_jaris_dice
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(16005047268263489295)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.TILAA.CLOUD.JARIS.DICE'
,p_display_name=>'Dice'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.TILAA.CLOUD.JARIS.DICE'),'')
,p_render_function=>'#OWNER#.yatzy_plugin.render_dice'
,p_standard_attributes=>'VISIBLE:READONLY:SOURCE:FORMAT_MASK_NUMBER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_tilaa_cloud_jaris_hold_dice
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(16024124587918220479)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_display_name=>'Hold Dice'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.TILAA.CLOUD.JARIS.HOLD_DICE'),'')
,p_render_function=>'#OWNER#.yatzy_plugin.render_hold_dice'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:SOURCE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(16024136882988450638)
,p_plugin_id=>wwv_flow_api.id(16024124587918220479)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Dice Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(16005038860015184157)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>101
,p_home_url=>'f?p=&APP_ID.:GAME:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:HOME:&SESSION.'
,p_global_page_id=>0
,p_nav_list_template_options=>'#DEFAULT#'
,p_content_delivery_network=>'GOOGLE'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(16005038860015184157)
,p_name=>'Global Page - Desktop'
,p_alias=>'GLOBAL'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - Desktop'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'JARIOLAINE'
,p_last_upd_yyyymmddhh24miss=>'20151026114752'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(16005038860015184157)
,p_name=>'Home'
,p_alias=>'HOME'
,p_page_mode=>'NORMAL'
,p_step_title=>'Yatzy'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_read_only_when_type=>'REQUEST_EQUALS_CONDITION'
,p_read_only_when=>'SUBMIT'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'JARIOLAINE'
,p_last_upd_yyyymmddhh24miss=>'20151101090705'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(15996887163239807317)
,p_name=>'High Scores Top 10'
,p_template=>wwv_flow_api.id(15996558957495123848)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'REGION_POSITION_03'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'with qry as(',
'  select null as player_name,',
'    null as score,',
'    null as insert_time',
'  from dual',
'  connect by level <= 10',
'  union all',
'  select',
'    player_name,',
'    score,',
'    insert_time',
'  from #OWNER#.yatzy_saved_score_card',
'  where seq_id = #OWNER#.yatzy_util.get_total_row_id',
')',
'select',
'  player_name,',
'  score',
'from qry',
'order by score desc nulls last, insert_time desc nulls last'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(15996884866974552961)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No High Scores Found.'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>10
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15996887547260807325)
,p_query_column_id=>1
,p_column_alias=>'PLAYER_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Player'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15999746149027602050)
,p_query_column_id=>2
,p_column_alias=>'SCORE'
,p_column_display_sequence=>2
,p_column_heading=>'Score'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16012383959458647849)
,p_plug_name=>'Start New Game'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996558957495123848)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16012385774874690080)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16012383959458647849)
,p_button_name=>'P1_START'
,p_button_static_id=>'P1_START'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15996531459995329863)
,p_button_image_alt=>'Start'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012384254236651950)
,p_name=>'P1_PLAYER_NAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16012383959458647849)
,p_prompt=>'Player Name'
,p_source=>'#OWNER#.yatzy_util.get_player_name_cookie'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>20
,p_cMaxlength=>30
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996882337001269264)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16012384672187670456)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Start Game'
,p_process_sql_clob=>'#OWNER#.yatzy_util.start_game ( :P1_PLAYER_NAME );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(16005038860015184157)
,p_name=>'Game'
,p_alias=>'GAME'
,p_page_mode=>'NORMAL'
,p_step_title=>'Yatzy'
,p_allow_duplicate_submissions=>'N'
,p_step_sub_title=>'Play Yatzy'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(15996527162660319084)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_nav_list_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'C'
,p_browser_cache=>'N'
,p_deep_linking=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_last_updated_by=>'JARIOLAINE'
,p_last_upd_yyyymmddhh24miss=>'20151101133059'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15996525950036307990)
,p_plug_name=>'Game info'
,p_region_css_classes=>'message'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996529851980323632)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'#OWNER#.yatzy_util.render_game_round_info ( :P2_ROUNDS_LEFT, :P2_THROWS_LEFT );'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P2_ROUNDS_LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15999754056404539537)
,p_plug_name=>'Game over'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996529851980323632)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'"GAME_OVER"'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P2_ROUNDS_LEFT'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16012091862277578069)
,p_plug_name=>'Rules'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996558957495123848)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'"YATZY_RULES"'
,p_plug_query_row_template=>1
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P2_ROUNDS_LEFT'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'Y'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16012092257242578073)
,p_plug_name=>'Board'
,p_region_css_classes=>'side-region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996529851980323632)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY_3'
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'P2_ROUNDS_LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15999754448224546637)
,p_plug_name=>'Dice'
,p_parent_plug_id=>wwv_flow_api.id(16012092257242578073)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996529851980323632)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15999757365455570492)
,p_plug_name=>'Hold'
,p_parent_plug_id=>wwv_flow_api.id(16012092257242578073)
,p_region_css_classes=>'hideme'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(15996529851980323632)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_translate_title=>'N'
,p_plug_query_row_template=>1
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>'#OWNER#.yatzy_util.get_max_throws > :P2_THROWS_LEFT'
,p_plug_read_only_when_type=>'ITEM_IS_NULL_OR_ZERO'
,p_plug_read_only_when=>'P2_THROWS_LEFT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(16012094852716578078)
,p_name=>'Score Card'
,p_template=>wwv_flow_api.id(15996529851980323632)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_css_classes=>'side-region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY_3'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'with score_card_qry as (',
'	select seq_id,',
'		label,',
'		input_field,',
'		entered_points,',
'		possible_points,',
'		case ',
'		when input_field = ''Y''',
'		and entered_points is null',
'		then',
'			#OWNER#.yatzy_util.enter_points_link ( seq_id, possible_points, ''P2_SEQ_ID'', :WORKSPACE_IMAGES )',
'		end as link,',
'		rowspan,',
'		section_label,',
'		input_field_class',
'	from #OWNER#.yatzy_score_card_vw ',
')	',
'select label,',
'	case ',
'	when input_field = ''N''',
'		or entered_points is not null',
'		or #OWNER#.yatzy_util.get_max_throws = :P2_THROWS_LEFT',
'	then',
'		to_char( entered_points )',
'	when :P2_THROWS_LEFT <= 0 then',
'		link',
'	when possible_points > 0 then',
'		link',
'	end as score,',
'	seq_id,',
'	rowspan,',
'	section_label,',
'	input_field_class',
'from score_card_qry',
'order by seq_id'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_translate_title=>'N'
,p_ajax_enabled=>'N'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(15999769868228704901)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>19
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>19
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16012095066499578079)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16012095150672578080)
,p_query_column_id=>2
,p_column_alias=>'SCORE'
,p_column_display_sequence=>3
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15997992462489142064)
,p_query_column_id=>3
,p_column_alias=>'SEQ_ID'
,p_column_display_sequence=>1
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15999770764488797721)
,p_query_column_id=>4
,p_column_alias=>'ROWSPAN'
,p_column_display_sequence=>4
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(15999777761165437328)
,p_query_column_id=>5
,p_column_alias=>'SECTION_LABEL'
,p_column_display_sequence=>5
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(16000230464816413146)
,p_query_column_id=>6
,p_column_alias=>'INPUT_FIELD_CLASS'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16012092456743578074)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_button_name=>'THROW'
,p_button_static_id=>'THROW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15996531459995329863)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Throw'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_button_condition=>':P2_THROWS_LEFT between 1 and #OWNER#.yatzy_util.get_max_throws'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16013316871131084638)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_api.id(15999754056404539537)
,p_button_name=>'SUBMIT'
,p_button_static_id=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15996531459995329863)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16000269356204197553)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_api.id(15999754056404539537)
,p_button_name=>'EXIT'
,p_button_static_id=>'EXIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15996531459995329863)
,p_button_image_alt=>'Exit'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16012097276871578083)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012092667457578076)
,p_name=>'P2_DICE_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_prompt=>'Dice One'
,p_source=>'#OWNER#.yatzy_util.roll_dice'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P2_HOLD_1'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012092876432578076)
,p_name=>'P2_DICE_2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_prompt=>'Dice Two'
,p_source=>'#OWNER#.yatzy_util.roll_dice'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P2_HOLD_2'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012093055278578076)
,p_name=>'P2_DICE_3'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_prompt=>'Dice Three'
,p_source=>'#OWNER#.yatzy_util.roll_dice'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P2_HOLD_3'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012093270825578076)
,p_name=>'P2_DICE_4'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_prompt=>'Dice Four'
,p_source=>'#OWNER#.yatzy_util.roll_dice'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P2_HOLD_4'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012093460811578076)
,p_name=>'P2_DICE_5'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(15999754448224546637)
,p_prompt=>'Dice Five'
,p_source=>'#OWNER#.yatzy_util.roll_dice'
,p_source_type=>'FUNCTION'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_read_only_when=>'P2_HOLD_5'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012093666883578077)
,p_name=>'P2_HOLD_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(15999757365455570492)
,p_prompt=>'Hold Dice One'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'P2_DICE_1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012093858618578077)
,p_name=>'P2_HOLD_2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(15999757365455570492)
,p_prompt=>'Hold Dice Two'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'P2_DICE_2'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012094048830578078)
,p_name=>'P2_HOLD_3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(15999757365455570492)
,p_prompt=>'Hold Dice Three'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'P2_DICE_3'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012094248716578078)
,p_name=>'P2_HOLD_4'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(15999757365455570492)
,p_prompt=>'Hold Dice Four'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'P2_DICE_4'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012094451230578078)
,p_name=>'P2_HOLD_5'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(15999757365455570492)
,p_prompt=>'Hold Dice Five'
,p_display_as=>'PLUGIN_COM.TILAA.CLOUD.JARIS.HOLD_DICE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(15996881660199246812)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'P2_DICE_5'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012094661378578078)
,p_name=>'P2_THROWS_LEFT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16012094852716578078)
,p_source=>'#OWNER#.yatzy_util.get_max_throws'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012095378950578080)
,p_name=>'P2_SEQ_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16012094852716578078)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16013313966627056387)
,p_name=>'P2_ROUNDS_LEFT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(16012094852716578078)
,p_source=>'#OWNER#.yatzy_util.get_rounds_left'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012095654891578081)
,p_computation_sequence=>10
,p_computation_item=>'P2_DICE_1'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'#OWNER#.yatzy_util.roll_dice'
,p_compute_when=>'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_1, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012095866688578081)
,p_computation_sequence=>20
,p_computation_item=>'P2_DICE_2'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'#OWNER#.yatzy_util.roll_dice'
,p_compute_when=>'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_2, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012096077562578081)
,p_computation_sequence=>30
,p_computation_item=>'P2_DICE_3'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'#OWNER#.yatzy_util.roll_dice'
,p_compute_when=>'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_3, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012096267128578082)
,p_computation_sequence=>40
,p_computation_item=>'P2_DICE_4'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'#OWNER#.yatzy_util.roll_dice'
,p_compute_when=>'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_4, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012096458922578082)
,p_computation_sequence=>50
,p_computation_item=>'P2_DICE_5'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'#OWNER#.yatzy_util.roll_dice'
,p_compute_when=>'not #OWNER#.yatzy_util.hold_dice ( :REQUEST, :P2_HOLD_5, :P2_THROWS_LEFT, :P2_ROUNDS_LEFT )'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(16012096657131578082)
,p_computation_sequence=>60
,p_computation_item=>'P2_THROWS_LEFT'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'return case ',
'	when :P2_THROWS_LEFT > 0 then',
'		:P2_THROWS_LEFT - 1',
'	else',
'		0',
'	end;'))
,p_compute_when=>'#OWNER#.yatzy_util.g_throw = :REQUEST'
,p_compute_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16012096972796578083)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enter points'
,p_process_sql_clob=>'#OWNER#.yatzy_util.enter_points ( :P2_SEQ_ID );'
,p_process_when=>'#OWNER#.yatzy_util.g_enter_points = :REQUEST'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16015496565825856727)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear items'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P2_HOLD_1,P2_HOLD_2,P2_HOLD_3,P2_HOLD_4,P2_HOLD_5,P2_THROWS_LEFT,P2_ROUNDS_LEFT'
,p_process_when=>'#OWNER#.yatzy_util.g_enter_points = :REQUEST'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16012096749339578082)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate possible points'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.yatzy_util.calc_possible_points (',
'	#OWNER#.yatzy_num_tab(',
'		:P2_DICE_1,',
'		:P2_DICE_2,',
'		:P2_DICE_3,',
'		:P2_DICE_4,',
'		:P2_DICE_5',
'	)',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16012092456743578074)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15997997647683379889)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save scores'
,p_process_sql_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#OWNER#.yatzy_util.save_score_card (',
'	p_app_id		=> :APP_ID,',
'	p_app_session	=> :APP_SESSION,',
'	p_player_name	=> :APP_USER',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16013316871131084638)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16000270253297258320)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Exit without saving'
,p_process_sql_clob=>'apex_authentication.logout ( :APP_SESSION, :APP_ID );'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(16000269356204197553)
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(16005073352307643626)
,p_welcome_message=>'This application installer will guide you through the process of creating your database objects and seed data.'
,p_license_message=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<pre>',
'The MIT License (MIT)',
'',
'Copyright (c) 2015 Jari Laine',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy',
'of this software and associated documentation files (the "Software"), to deal',
'in the Software without restriction, including without limitation the rights',
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell',
'copies of the Software, and to permit persons to whom the Software is',
'furnished to do so, subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all',
'copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,',
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE',
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER',
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,',
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE',
'SOFTWARE.',
'',
'',
'Cascading Style Sheets yatzy.css and yatzy.min.css of the application uses parts from 3party code that is listed here:',
'',
'---',
'',
'CSS Dice An Experiment by Jonathan Sampson - @jonathansampson',
'http://sampsonblog.com/289/of-dice-dabblet-and-css',
'',
'---',
'',
'normalize.css v3.0.3',
'https://github.com/necolas/normalize.css',
'',
'Copyright (c) Nicolas Gallagher and Jonathan Neal',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modi'
||'fy, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDE'
||'RS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
'',
'---',
'',
'"Simpliste" is a simple responsive HTML5 template',
'http://cssr.ru/simpliste/',
'',
'Copyright (c) 2012 Renat Rafikov',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modi'
||'fy, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDE'
||'RS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
'',
'</pre>'))
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_install_success_message=>'Your application''s supporting objects have been installed.'
,p_install_failure_message=>'Installation of database objects and seed data has failed.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'drop view yatzy_score_card_vw',
'/',
'drop table yatzy_saved_score_card',
'/',
'drop table yatzy_template_score_card',
'/',
'drop sequence yatzy_seq',
'/',
'drop type yatzy_num_tab',
'/',
'drop package yatzy_util',
'/',
'drop package yatzy_plugin',
'/',
'drop package yatzy_collection',
'/',
'begin',
'    wwv_flow_api.create_or_remove_file(',
'        p_location => ''WORKSPACE'',',
'        p_name     => ''pencil2_16x16.gif'',',
'        p_mode     => ''REMOVE'',',
'        p_type     => ''IMAGE'');',
'end;',
'/',
'',
'begin',
'    wwv_flow_api.create_or_remove_file( ',
'        p_location => ''WORKSPACE'',',
'        p_name     => ''yatzy.css'',',
'        p_mode     => ''REMOVE'',',
'        p_type     => ''CSS'');',
'end;',
'/',
'',
'',
'begin',
'    wwv_flow_api.create_or_remove_file( ',
'        p_location => ''WORKSPACE'',',
'        p_name     => ''yatzy.min.css'',',
'        p_mode     => ''REMOVE'',',
'        p_type     => ''CSS'');',
'end;',
'/',
'',
''))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW'
,p_required_names_available=>'YATZY_COLLECTION:YATZY_NUM_TAB:YATZY_PLUGIN:YATZY_SAVED_SCORE_CARD:YATZY_SAVED_SCORE_CARD_BI:YATZY_SCORE_CARD_VW:YATZY_SEQ:YATZY_TEMPLATE_SCORE_CARD:YATZY_UTIL'
);
end;
/
prompt --application/deployment/install
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005221460214452280)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'type'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create or replace type yatzy_num_tab is table of number;',
'/'))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005074449733832136)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'sequence'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create sequence yatzy_seq',
'/'))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005073762350646521)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'tables'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create table yatzy_template_score_card',
'(',
'  seq_id number(2,0) not null',
', input_field char(1) not null',
', label_msg varchar2(30) not null',
', card_section varchar2(30) not null',
', constraint yatzy_template_score_card_pk primary key ( seq_id )',
', constraint yatzy_template_score_card_uk1 unique ( label_msg )',
', constraint yatzy_template_score_card_ck1 check ( seq_id between 1 and 19 )',
', constraint yatzy_template_score_card_ck2 check ( input_field in ( ''N'', ''Y'' ) )',
', constraint yatzy_template_score_card_ck3 check ( card_section in( ''UPPER'', ''MIDDLE'', ''LOWER'', ''TOTAL'' ) )',
')',
'/',
'comment on table yatzy_template_score_card is ''Yatzy score card template. Metadata for Yatzy game''',
'/',
'comment on column yatzy_template_score_card.seq_id is ''Primary key / record order in score card''',
'/',
'comment on column yatzy_template_score_card.input_field is ''Is score box''',
'/',
'comment on column yatzy_template_score_card.label_msg is ''APEX text message for score card row label''',
'/',
'comment on column yatzy_template_score_card.card_section is ''Section in score card''',
'/',
'',
'create table yatzy_saved_score_card',
'(',
'  sgid number not null',
', game_id number not null',
', insert_time timestamp with time zone default systimestamp not null',
', apex_session_id number not null',
', seq_id number not null',
', player_name varchar2(256) not null',
', score number not null',
', constraint yatzy_saved_score_card_pk primary key ( sgid )',
', constraint yatzy_saved_score_card_uk1 unique ( game_id, sgid )',
', constraint yatzy_saved_score_card_uk2 unique ( seq_id, game_id )',
', constraint yatzy_saved_score_card_fk1 foreign key ( seq_id ) references yatzy_template_score_card ( seq_id )',
', constraint yatzy_saved_score_card_ck1 check ( sgid > 0 )',
', constraint yatzy_saved_score_card_ck2 check ( game_id > 0 )',
')',
'/',
'comment on table yatzy_saved_score_card is ''Yatzy saved scores / Yatzy game high scores''',
'/',
'comment on column yatzy_saved_score_card.sgid is ''Surrogate primary key''',
'/',
'comment on column yatzy_saved_score_card.game_id is ''Surrogate key for game''',
'/',
'comment on column yatzy_saved_score_card.apex_session_id is ''APEX session id''',
'/',
'comment on column yatzy_saved_score_card.insert_time is ''Insert time / when game was played''',
'/',
'comment on column yatzy_saved_score_card.seq_id is ''Order in score card. references yatzy_template_score_card.seq_id''',
'/',
'comment on column yatzy_saved_score_card.player_name is ''Who did play game''',
'/',
'comment on column yatzy_saved_score_card.score is ''Player score''',
'/',
'create or replace',
'trigger yatzy_saved_score_card_bi',
'before insert on yatzy_saved_score_card',
'for each row',
'declare',
'    l_game_id number;',
'begin',
'    if inserting then',
'        if :new.sgid is null then',
'            :new.sgid := yatzy_seq.nextval;',
'        end if;',
'    end if;',
'end;',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16007532466153775391)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'yatzy_collection'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create or replace',
'package yatzy_collection',
'authid definer',
'as',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this package holds procedures and functions for yatzy game score card',
'--    apex_collection creation and update',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    function get_collection_name return varchar2;',
'--------------------------------------------------------------------------------',
'    procedure create_collection;',
'--------------------------------------------------------------------------------',
'    procedure update_possible_points (',
'        p_seq_id        in number,',
'        p_result        in number',
'    );',
'--------------------------------------------------------------------------------',
'    procedure update_entered_points (',
'        p_seq_id        in number,',
'        p_result        in number',
'    );',
'--------------------------------------------------------------------------------',
'end yatzy_collection;',
'/',
'create or replace',
'package body yatzy_collection',
'as',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--      private',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    --    package private constants',
'',
'    --    score card apex_collection name',
'    c_score_card_collection        constant varchar2(30)    := ''YATZY_SCORE_CARD'';',
'',
'    --    score card apex_collection number attribute for possible points',
'    c_possible_points_attr_num    constant number := 2;',
'    --    score card apex_collection number attribute for entered points',
'    c_entered_points_attr_num    constant number := 1;',
'',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    global',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns score card apex_collection name',
'--    from package private constant',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function get_collection_name return varchar2',
'    as',
'    begin',
'        return c_score_card_collection;',
'    end get_collection_name;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure creates score card apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure create_collection',
'    as',
'    begin',
'        if apex_collection.collection_exists ( c_score_card_collection ) then',
'            apex_collection.delete_collection ( c_score_card_collection );',
'        end if;',
'        apex_collection.create_collection_from_queryb2 (',
'            p_collection_name => c_score_card_collection,',
'            p_query => q''[',
'                select',
'                    case',
'                    when input_field = ''N''',
'                    then',
'                        0',
'                    end as entered_points,            /* n001 */',
'                    0 as possible_points,            /* n002 */',
'                    case when count ( seq_id ) over (',
'                        partition by card_section',
'                        order by seq_id',
'                    ) = 1 then',
'                        count ( seq_id ) over (',
'                            partition by card_section ',
'                        )',
'                    end as rowspan,                    /* n003 */',
'                    null as n004,                     /* n004 */',
'                    null as n005,                    /* n005 */',
'                    null as d001,',
'                    null as d002,',
'                    null as d003,',
'                    null as d004,',
'                    null as d005,',
'                    label_msg,',
'                    input_field,',
'                    case when count ( seq_id ) over (',
'                        partition by card_section',
'                        order by seq_id',
'                    ) = 1 and input_field = ''Y'' then',
'                        card_section',
'                    else',
'                        '' ''',
'                    end as section_msg,',
'                    case when input_field = ''Y'' then',
'                        ''score-box''',
'                    end as input_field_class',
'                from yatzy_template_score_card',
'                where 1 = 1',
'                order by seq_id',
'            ]''',
'        );',
'    end create_collection;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure updates possible points to score card apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure update_possible_points (',
'        p_seq_id        in number,',
'        p_result        in number',
'    )',
'    as',
'    begin',
'        apex_collection.update_member_attribute (',
'            p_collection_name => c_score_card_collection,',
'            p_seq => p_seq_id,',
'            p_attr_number => c_possible_points_attr_num,',
'            p_number_value => p_result',
'        );',
'    end update_possible_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure updates entered points to score card apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure update_entered_points (',
'        p_seq_id        in number,',
'        p_result        in number',
'    )',
'    as',
'    begin',
'        apex_collection.update_member_attribute (',
'            p_collection_name => c_score_card_collection,',
'            p_seq => p_seq_id,',
'            p_attr_number => c_entered_points_attr_num,',
'            p_number_value => p_result',
'        );',
'    end update_entered_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'end yatzy_collection;',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005320270238653898)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'view'
,p_sequence=>50
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create or replace view yatzy_score_card_vw',
'as',
'select seq_id,',
'    c001 as label_mesg,',
'    apex_lang.message ( c001 ) as label,',
'    c002 as input_field,',
'    c003 as card_section,',
'    n001 as entered_points,',
'    n002 as possible_points,',
'    n003 as rowspan,',
'    apex_lang.lang ( c003 ) as section_label,',
'    c004 as input_field_class',
'from apex_collections',
'where 1 = 1',
'and collection_name = yatzy_collection.get_collection_name',
'/'))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005220561490494307)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'yatzy_util'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create or replace',
'package yatzy_util',
'authid definer',
'as',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this package holds procedures and functions for yatzy game',
'--',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    --    package global constants',
'',
'    --    APEX button requests',
'    g_throw                constant varchar2(30) := ''THROW'';',
'    g_save_score_card    constant varchar2(30) := ''SUBMIT'';',
'    g_enter_points        constant varchar2(30) := ''ENTER'';',
'',
'--------------------------------------------------------------------------------',
'    function get_player_name_cookie return varchar2;',
'--------------------------------------------------------------------------------',
'    function get_max_throws return number;',
'--------------------------------------------------------------------------------',
'    function get_rounds_left return number;',
'--------------------------------------------------------------------------------    ',
'    function get_total_row_id return number;',
'--------------------------------------------------------------------------------',
'    function roll_dice return number;',
'--------------------------------------------------------------------------------',
'    function hold_dice (',
'        p_request        in varchar2,',
'        p_hold            in varchar2,',
'        p_throws_left    in number,',
'        p_rounds_left    in number',
'    ) return boolean;',
'--------------------------------------------------------------------------------',
'    function enter_points_link (',
'        p_seq_id        in number,',
'        p_points        in number,',
'        p_seq_item        in varchar2,',
'        p_link_img_url    in varchar2,',
'        p_link_img_name    in varchar2 default ''pencil2_16x16.gif''',
'    ) return varchar2;',
'--------------------------------------------------------------------------------',
'    procedure render_game_round_info (',
'        p_rounds_left    in number,',
'        p_throws_left    in number',
'    );',
'--------------------------------------------------------------------------------',
'    procedure start_game (',
'        p_player_name    in varchar2',
'    );',
'--------------------------------------------------------------------------------',
'    procedure calc_possible_points (',
'        p_num_tab        in yatzy_num_tab',
'    );',
'--------------------------------------------------------------------------------',
'    procedure enter_points (',
'        p_seq_id        in number',
'    );',
'--------------------------------------------------------------------------------',
'    procedure save_score_card (',
'        p_app_id        in number,',
'        p_app_session    in number,',
'        p_player_name    in varchar2',
'    );',
'--------------------------------------------------------------------------------',
'    function apex_error_handler(',
'        p_error in apex_error.t_error',
'    ) return apex_error.t_error_result;',
'--------------------------------------------------------------------------------',
'end yatzy_util;',
'/',
'create or replace',
'package body yatzy_util',
'as',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    private',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    --    package private constants',
'',
'    --    player name cookie',
'    c_player_name_cookie        constant varchar2(30)    := ''yatzy_player'';',
'    c_cookie_expires            constant date            := sysdate + 365;',
'    ',
'    --    APEX messages',
'    c_enter_points_msg            constant varchar2(30)    := ''ENTER_POINTS'';',
'    c_start_round_msg            constant varchar2(30)    := ''START_ROUND'';',
'    c_continue_round_msg        constant varchar2(30)    := ''CONTINUE_ROUND'';',
'    c_end_round_msg                constant varchar2(30)    := ''END_ROUND'';',
'    ',
'    --    error codes and APEX messages',
'    c_generic_error                constant varchar2(30)    := ''GENERIC_ERROR'';',
'    c_enter_points_no_data        constant number            := -20001;',
'    c_enter_points_no_data_msg    constant varchar2(30)    := ''ENTER_POINTS_NO_DATA'';',
'    ',
'    --    constant score card seq_ids',
'    c_upper_sum                    constant number := 7;',
'    c_bonus                        constant number := 8;',
'    c_pair                        constant number := 9;',
'    c_two_pairs                    constant number := 10;',
'    c_three_of_kind                constant number := 11;',
'    c_four_of_kind                constant number := 12;',
'    c_small_straight            constant number := 13;',
'    c_large_straight            constant number := 14;',
'    c_jump_straight                constant number := 15;',
'    c_full_house                constant number := 16;',
'    c_chance                    constant number := 17;',
'    c_yatzy                        constant number := 18;',
'    c_total                        constant number := 19;',
'    ',
'    --    constant points',
'    c_yatzy_points                constant number    := 50;',
'    c_bonus_points                constant number    := 50;',
'',
'    --    upper section sum limit for bonus',
'    c_bonus_limit                constant number    := 63;',
'',
'    --    constant dice count',
'    c_dice_count                constant number    := 5;',
'',
'    -- constant dice min and max points',
'    c_dice_min_points            constant number    := 1;',
'    c_dice_max_points            constant number    := 6;',
'',
'    -- max throws in game round',
'    c_max_throws                constant number    := 3;',
'',
'    --    package private variables. used to cache values',
'    g_two_pairs_points    number;',
'    g_dice_sum_tab        yatzy_num_tab := yatzy_num_tab( null, null, null, null, null, null, null );',
'',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function converts number array to string e.g. for debuging',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function num_tab_to_string (',
'        p_num_tab        in yatzy_num_tab,',
'        p_sep            in varchar2 default '':''',
'    ) return varchar2',
'    as',
'        l_result varchar2(32700);',
'    begin',
'        for i in 1 .. p_num_tab.count',
'        loop',
'            l_result := l_result',
'                ||',
'                case when l_result is not null then',
'                    p_sep',
'                end',
'                ||',
'                case when p_num_tab ( i ) is null then',
'                    ''null''',
'                else',
'                    p_num_tab ( i )',
'                end;',
'        end loop;',
'        return l_result;',
'    end num_tab_to_string;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function sorts number array to ascending order',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function sort_num_tab (',
'        p_num_tab        in yatzy_num_tab',
'    ) return yatzy_num_tab',
'    as',
'        l_num_tab    yatzy_num_tab;',
'    begin',
'        select column_value',
'        bulk collect into l_num_tab',
'        from table ( p_num_tab )',
'        order by column_value',
'        ;',
'        -- return sorted array',
'        return l_num_tab;',
'    end sort_num_tab;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure saves player name to cookie',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure send_player_name_cookie (',
'        p_player_name    in varchar2',
'    )',
'    as',
'    begin',
'        sys.owa_util.mime_header(''text/html'', false);',
'        sys.owa_cookie.send(',
'            name    => c_player_name_cookie,',
'            value   => p_player_name,',
'            expires => c_cookie_expires',
'        );',
'        --sys.owa_util.http_header_close;',
'    end send_player_name_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns distinct values from array',
'--',
'--    example:',
'--    distinct_num_count ( yatzy_num_tab(5,6,5,4,6) );',
'--     returns yatzy_num_tab(6,5,4)',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function distinct_num_tab (',
'        p_num_tab        in yatzy_num_tab',
'    ) return yatzy_num_tab',
'    as',
'        l_distinct_t    yatzy_num_tab;',
'    begin',
'        l_distinct_t := p_num_tab multiset union distinct p_num_tab;',
'        return l_distinct_t;',
'    end distinct_num_tab;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns sum for specified number(s) in array.',
'--    if parameter p_x is zero (0) all numbers sum is returned (e.g. chance, full house...).',
'--    values are cached to private global variable g_dice_sum_tab array',
'--',
'--    example:',
'--    calc_x_sum ( p_num_tab => yatzy_num_tab(1,6,5,4,6), p_x => 6 );',
'--    returns sum of sixes (12)',
'--    calc_x_sum ( p_num_tab => yatzy_num_tab(1,6,5,4,6), p_x => 0 );',
'--    returns sum of all dices (22)',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function calc_x_sum (',
'        p_num_tab        in yatzy_num_tab,',
'        p_x                in number',
'    ) return number',
'    as',
'        l_result    number;',
'        l_result_id    number;',
'    begin',
'        --    all numbers sum is in postion one (1)',
'        l_result_id := p_x + 1;',
'        --    if we haven''t already count sum for p_x',
'        if g_dice_sum_tab ( l_result_id ) is null then',
'            --    count sum for x zero (0) for all',
'            select sum ( column_value )',
'                into l_result',
'            from table ( p_num_tab )',
'            where column_value = p_x or p_x = 0',
'            ;',
'            l_result := coalesce ( l_result, 0 );',
'            --    cache sum for later use',
'            g_dice_sum_tab ( l_result_id ) := l_result;',
'',
'        --    else return value from cache',
'        else',
'            --    return from cache',
'            l_result := g_dice_sum_tab ( l_result_id );',
'        end if;',
'        return l_result;',
'    end calc_x_sum;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns max sum for x of kind',
'--',
'--    example:',
'--    calc_x_sum ( p_num_tab => yatzy_num_tab(2,2,5,5,5), p_x => 2 );',
'--    returns sum of two fives (10)',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function calc_x_of_kind (',
'        p_num_tab        in yatzy_num_tab,',
'        p_distinct_tab    in yatzy_num_tab,',
'        p_x                in number',
'    ) return number',
'    as',
'        l_x_of_kind_sum    number;',
'        l_result        number;',
'        l_result_t        yatzy_num_tab;',
'    begin',
'        --    initialize number table.',
'        --    table is used to store sums. At end we select max sum from table.',
'        l_result_t := yatzy_num_tab ();',
'        --    loop dices',
'        for i in 1 .. p_distinct_tab.count',
'        loop',
'            --    get sum for number',
'            l_result := calc_x_sum ( p_num_tab, p_distinct_tab ( i ) );',
'            --    calculate points for x of kind',
'            l_x_of_kind_sum := p_distinct_tab ( i ) * p_x;',
'            --    if number sum equals or more than x of kind sum,',
'            --    then store x of kind sum to number table for later use',
'            if l_result >= l_x_of_kind_sum then',
'                --    extend table',
'                l_result_t.extend ( 1 );',
'                l_result_t ( l_result_t.last ) := l_x_of_kind_sum;',
'            end if;',
'        end loop;',
'        --    find max value and return',
'        select max ( column_value )',
'        into l_result',
'        from table ( l_result_t )',
'        ;',
'        l_result := coalesce ( l_result, 0 );',
'        return l_result;',
'    end calc_x_of_kind;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns two pair points and helps determine is result full house.',
'--    result is cached to private global variable g_two_pair_points',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function calc_two_pair (',
'        p_num_tab        in yatzy_num_tab',
'    ) return number',
'    as',
'        l_result    number;',
'    begin',
'        --    if we haven''t already count two pairs points',
'        if g_two_pairs_points is null then',
'            with num_cnt as (',
'                select column_value,',
'                    count(1) as cnt',
'                from table ( p_num_tab )',
'                group by column_value',
'            ), two_or_more as (',
'                select count ( 1 ) over () as row_cnt,',
'                    column_value',
'                from num_cnt',
'                where cnt >= 2',
'            )',
'            select sum ( column_value * 2 )',
'            into l_result',
'            from two_or_more',
'            where row_cnt = 2',
'            ;',
'            l_result := coalesce ( l_result, 0 );',
'            g_two_pairs_points := l_result;',
'',
'        --    else return value from cache',
'        else',
'            l_result := g_two_pairs_points;',
'        end if;',
'        return l_result;',
'    end calc_two_pair;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure calculate score card upper section possible points',
'--    and store result to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure possible_upper_points (',
'        p_num_tab        in yatzy_num_tab',
'    )',
'    as',
'        l_result    number;',
'    begin',
'        for c1 in (',
'            select seq_id',
'            from yatzy_score_card_vw',
'            where seq_id <= c_dice_max_points',
'            and entered_points is null',
'        ) loop',
'            l_result := calc_x_sum ( p_num_tab, c1.seq_id );',
'            yatzy_collection.update_possible_points (',
'                p_seq_id => c1.seq_id,',
'                p_result => l_result',
'            );',
'        end loop;',
'    end possible_upper_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure calculate score card lower section possible points',
'--    and store result to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure possible_lower_points (',
'        p_num_tab        in yatzy_num_tab',
'    )',
'    as',
'        l_result            number;',
'        l_all_dice_sum        number;',
'        l_distinct_dice_cnt    number;',
'        l_distinct_dice_tab    yatzy_num_tab;',
'        l_sorted_num_tab    yatzy_num_tab;',
'    begin',
'        --    sort dice numbers for straight determination',
'        l_sorted_num_tab    := sort_num_tab ( p_num_tab );',
'        --    sum of all dices',
'        l_all_dice_sum        := calc_x_sum ( p_num_tab, 0 );',
'        --    distinct dice count',
'        l_distinct_dice_tab    := distinct_num_tab ( p_num_tab );',
'        l_distinct_dice_cnt    := l_distinct_dice_tab.count;',
'        for c1 in (',
'            select seq_id',
'            from yatzy_score_card_vw',
'            where seq_id ',
'            between c_pair and c_yatzy',
'            and entered_points is null',
'        ) loop',
'            l_result := case',
'                --    if it''s pair, return max points for pair',
'                when c1.seq_id = c_pair',
'                and l_distinct_dice_cnt <= 4',
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 2 )',
'',
'                --    if it''s two pairs, return sum of two pair',
'                when c1.seq_id = c_two_pairs',
'                and l_distinct_dice_cnt between 2 and 3',
'                then calc_two_pair ( p_num_tab )',
'',
'                --    if it''s three of kind, return sum of three same dice',
'                when c1.seq_id = c_three_of_kind',
'                and l_distinct_dice_cnt <= 3',
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 3 )',
'',
'                --    if it''s four of kind, return sum of four same dice',
'                when c1.seq_id = c_four_of_kind',
'                and l_distinct_dice_cnt <= 2',
'                then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 4 )',
'',
'                --    if it''s small straight return sum of all dices.',
'                --    small straight 1, 2, 3, 4, 5',
'                when c1.seq_id = c_small_straight',
'                and l_distinct_dice_cnt = c_dice_count',
'                and l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 5 ) = 5',
'                then l_all_dice_sum',
'',
'                --    if it''s large straight, return sum of all dices',
'                --    large straight 2, 3, 4, 6, 5',
'                when c1.seq_id = c_large_straight',
'                and l_distinct_dice_cnt = c_dice_count',
'                and l_sorted_num_tab ( 1 ) = 2 and l_sorted_num_tab ( 5 ) = 6',
'                then l_all_dice_sum',
'',
'                --    if it''s jump straight, return sum of all dices',
'                when c1.seq_id = c_jump_straight',
'                and l_distinct_dice_cnt = c_dice_count',
'                and (    -- "small" jump straight 1, 2, 3, 4, 6',
'                        ( l_sorted_num_tab ( 4 ) = 4 and l_sorted_num_tab ( 5 ) = 6 )',
'                    or',
'                        -- "large" jump straight 1, 3, 4, 5, 6',
'                        ( l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 2 ) = 3 )',
'                )',
'                then l_all_dice_sum',
'',
'                --    if full house, return sum of all dices',
'                --    we know it is full house if distinct dice count is 2',
'                --    and calculation for two pair returns more than zero',
'                when c1.seq_id = c_full_house',
'                and    l_distinct_dice_cnt = 2',
'                and calc_two_pair ( p_num_tab ) > 0',
'                then l_all_dice_sum',
'',
'                --    if it''s chance, return sum of all dices',
'                when c1.seq_id = c_chance',
'                then l_all_dice_sum',
'',
'                --    if it''s yatzy, return constant points',
'                --    we know it is yatzy if distinct dice count is 1',
'                when c1.seq_id = c_yatzy',
'                and l_distinct_dice_cnt = 1',
'                then c_yatzy_points',
'',
'                --    if none match, return zero',
'                else 0',
'            end;',
'            yatzy_collection.update_possible_points (',
'                p_seq_id => c1.seq_id,',
'                p_result => l_result',
'            );',
'        end loop;',
'    end possible_lower_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure enters upper section sum and bonus to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure enter_upper_sum_and_bonus',
'    as',
'        l_result            number;',
'    begin',
'        select sum ( entered_points )',
'        into l_result',
'        from yatzy_score_card_vw',
'        where seq_id <= c_dice_max_points',
'        ;',
'        l_result := coalesce ( l_result, 0 );',
'',
'        yatzy_collection.update_entered_points (',
'            p_seq_id => c_upper_sum,',
'            p_result => l_result',
'        );',
'        if l_result >= c_bonus_limit then',
'            yatzy_collection.update_entered_points (',
'                p_seq_id => c_bonus,',
'                p_result => c_bonus_points',
'            );',
'        end if;',
'    end enter_upper_sum_and_bonus;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure enters total points to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure enter_total_points',
'    as',
'        l_result    number;',
'    begin',
'        --    select sum from entered points',
'        select sum( entered_points )',
'        into l_result',
'        from yatzy_score_card_vw',
'        where seq_id ',
'        between c_upper_sum    and c_yatzy',
'        ;',
'        --    insert to collection',
'        yatzy_collection.update_entered_points (',
'            p_seq_id => c_total,',
'            p_result => l_result',
'        );',
'    end enter_total_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--      Global',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns player name from cookie',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function get_player_name_cookie return varchar2',
'    as',
'    begin',
'        return apex_authentication.get_login_username_cookie (',
'            p_cookie_name => c_player_name_cookie',
'        );',
'    end get_player_name_cookie;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns max throws for game round',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function get_max_throws return number',
'    as',
'    begin',
'        return c_max_throws;',
'    end get_max_throws;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns how many rounds there is left for game',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function get_rounds_left return number',
'    as',
'        l_result number;',
'    begin',
'        select count ( 1 )',
'            into l_result',
'        from yatzy_score_card_vw',
'        where input_field = ''Y''',
'        and entered_points is null',
'        ;',
'        return l_result;',
'    end get_rounds_left;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns score card total row seq_id',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function get_total_row_id return number',
'    as',
'    begin',
'        return c_total;',
'    end get_total_row_id;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns random number for dice points',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function roll_dice return number',
'    as',
'        l_num number;',
'    begin',
'        l_num := round ( sys.dbms_random.value ( c_dice_min_points, c_dice_max_points ) );',
'        return l_num;',
'    end roll_dice;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function checks should new random number generated for dice',
'--    depending APEX request, does player like hold dice',
'--    and is there throws left in game round',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function hold_dice (',
'        p_request        in varchar2,',
'        p_hold            in varchar2,',
'        p_throws_left    in number,',
'        p_rounds_left    in number',
'    ) return boolean',
'    as',
'    begin',
'        return case',
'            when p_request = g_throw',
'            and p_hold is null',
'            and p_throws_left > 0',
'            and p_rounds_left > 0',
'            then',
'                false',
'            else',
'                true',
'            end;',
'    end hold_dice;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function returns link to enter points to score card',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function enter_points_link (',
'        p_seq_id        in number,',
'        p_points        in number,',
'        p_seq_item        in varchar2,',
'        p_link_img_url    in varchar2,',
'        p_link_img_name    in varchar2 default ''pencil2_16x16.gif''',
'    ) return varchar2',
'    as',
'    begin',
'        return    ''<a href="''',
'            ||    apex_util.prepare_url (',
'                    p_url => ''f?p=''',
'                        ||    apex_application.g_flow_id        || '':''',
'                        ||    apex_application.g_flow_step_id    || '':''',
'                        ||    apex_application.g_instance        || '':''',
'                        ||    g_enter_points                    || '':''',
'                        ||    case',
'                            when apex_application.g_debug',
'                            then',
'                                ''YES''',
'                            else',
'                                ''NO''',
'                            end',
'                        ||    ''::''',
'                        ||    p_seq_item || '':''',
'                        ||    p_seq_id,',
'                    p_checksum_type => ''SESSION''',
'                )',
'            ||    ''"><span>''',
'            ||    p_points',
'            ||    ''</span><img src="''',
'            ||    p_link_img_url',
'            ||    p_link_img_name',
'            ||    ''" alt="''',
'            ||    apex_lang.message ( c_enter_points_msg )',
'            ||    ''">''',
'            ||    ''</a>''',
'        ;',
'    end enter_points_link;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure renders game round info, if there is rounds left',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------        ',
'    procedure render_game_round_info (',
'        p_rounds_left    in number,',
'        p_throws_left    in number',
'    )',
'    as',
'        l_mesg    varchar2(30);',
'    begin',
'        if p_rounds_left > 0 then',
'            if p_throws_left = 3 then',
'                l_mesg := c_start_round_msg;',
'            elsif p_throws_left > 0 then',
'                l_mesg := c_continue_round_msg;',
'            else',
'                l_mesg := c_end_round_msg;',
'            end if;',
'            sys.htp.prn( apex_lang.message( l_mesg, p_throws_left ) );',
'        end if;',
'    end render_game_round_info;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure initialize new game',
'--    procedure saves player name to cookie,',
'--    get next APEX session id for game,',
'--    authenticates APEX session and creates score card',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure start_game (',
'        p_player_name    in varchar2',
'    )',
'    as',
'    begin',
'        send_player_name_cookie ( p_player_name );',
'        apex_custom_auth.set_session_id_to_next_value;',
'        apex_authentication.post_login(',
'            p_username => p_player_name,',
'            p_password => null,',
'            p_uppercase_username => false',
'        );',
'        yatzy_collection.create_collection;',
'    end start_game;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure calculate all possible points for throw',
'--    and stores results to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure calc_possible_points (',
'        p_num_tab        in yatzy_num_tab',
'    )',
'    as',
'    begin',
'        possible_upper_points ( p_num_tab );',
'        possible_lower_points ( p_num_tab );',
'    end calc_possible_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure enter points to apex_collection',
'--',
'--    change log:',
'--    18.10.2015 JLa / created'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(16005220561490494307)
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'',
'--',
'--------------------------------------------------------------------------------',
'    procedure enter_points (',
'        p_seq_id        in number',
'    )',
'    as',
'        l_result    number;',
'    begin',
'        select possible_points',
'            into l_result',
'        from yatzy_score_card_vw',
'        where input_field = ''Y''',
'        and entered_points is null',
'        and seq_id = p_seq_id',
'        ;',
'        yatzy_collection.update_entered_points (',
'            p_seq_id => p_seq_id,',
'            p_result => l_result',
'        );',
'        --    calculate upper section sum and bonus',
'        --    only if we save points to upper section',
'        if p_seq_id <= c_dice_max_points then',
'            enter_upper_sum_and_bonus;',
'        end if;',
'        --    calculate grand total',
'        enter_total_points;',
'    exception when no_data_found then',
'        raise_application_error ( c_enter_points_no_data, ''No data found when fetch score card seq_id.'' );',
'    end enter_points;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this procedure save scores to database',
'--    procedure should be called only when all game rounds are played',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    procedure save_score_card (',
'        p_app_id        in number,',
'        p_app_session    in number,',
'        p_player_name    in varchar2',
'    )',
'    as',
'        l_game_id number;',
'    begin',
'        --    get id for game from sequence',
'        l_game_id := yatzy_seq.nextval;',
'        --    insert score card from apex_collection',
'        insert into yatzy_saved_score_card (',
'            game_id,',
'            apex_session_id,',
'            seq_id,',
'            player_name,',
'            score',
'        )',
'        select ',
'            l_game_id as game_id,',
'            p_app_session as apex_session_id,',
'            seq_id,',
'            p_player_name as player_name,',
'            entered_points',
'        from yatzy_score_card_vw',
'        ;',
'        --    logout player from APEX session',
'        apex_authentication.logout ( p_app_session, p_app_id );',
'    end save_score_card;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'--    this function handles APEX application errors',
'--',
'--    change log:',
'--    18.10.2015 JLa / created',
'--',
'--------------------------------------------------------------------------------',
'    function apex_error_handler(',
'        p_error in apex_error.t_error',
'    ) return apex_error.t_error_result',
'    as',
'        l_result          apex_error.t_error_result;',
'        l_error           apex_error.t_error;',
'        l_reference_id    pls_integer;',
'        l_constraint_name varchar2(255);',
'        l_err_msg         varchar2(32700);',
'    begin',
'        l_result := apex_error.init_error_result ( p_error => p_error );',
'        --    If it''s an internal error raised by APEX, like an invalid statement or',
'        --    code which can''t be executed, the error text might contain security sensitive',
'        --    information. To avoid this security problem we can rewrite the error to',
'        --    a generic error message and log the original error message for further',
'        --    investigation by the help desk.',
'        if p_error.is_internal_error then',
'            --    Access Denied errors raised by application or page authorization should',
'            --    still show up with the original error message',
'            if not p_error.apex_error_code like ''APEX.SESSION_STATE.%''',
'            and not p_error.apex_error_code = ''APEX.AUTHORIZATION.ACCESS_DENIED''',
'            and not p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE''',
'            and not p_error.apex_error_code = ''APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY''',
'            and not p_error.apex_error_code = ''APEX.PAGE.DUPLICATE_SUBMIT''',
'            then',
'                -- log error to application debug information',
'                apex_debug.error(',
'                    ''Error handler: %s %s %s'',',
'                    p_error.apex_error_code,',
'                    l_result.message,',
'                    l_result.additional_info',
'                );',
'                --    Change the message to the generic error message ',
'                --    which doesn''t expose any sensitive information.',
'                l_result.message := apex_lang.message ( c_generic_error );',
'                ',
'                l_result.additional_info := null;',
'            end if;',
'        else',
'            --    If it''s a constraint violation like',
'            --',
'            --        -) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated',
'            --        -) : transaction rolled back (-> can hide a deferred constraint)',
'            --        -) : check constraint violated',
'            --        -) : integrity constraint violated - parent key not found',
'            --        -) : integrity constraint violated - child record found',
'            --',
'            --    we try to get a friendly error message from our constraint lookup configuration.',
'            --    If we don''t find the constraint in our lookup table we fallback to',
'            --    the original ORA error message.',
'            if p_error.ora_sqlcode in ( -1, -2091, -2290, -2291, -2292 ) then',
'                ',
'                l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );',
'                ',
'                l_err_msg := apex_lang.message ( l_constraint_name );',
'                -- not every constraint has to be in our lookup table',
'                if not l_err_msg = l_constraint_name then',
'                    l_result.message := l_err_msg;',
'                end if;',
'            end if;',
'            ',
'            --    Game specific errors',
'            if p_error.ora_sqlcode in ( c_enter_points_no_data ) then',
'                l_result.message := apex_lang.message ( c_enter_points_no_data_msg );',
'                l_result.additional_info := null;',
'            end if;',
'            ',
'            --    If an ORA error has been raised, for example a raise_application_error(-20xxx, ''...'')',
'            --    in a table trigger or in a PL/SQL package called by a process and we',
'            --    haven''t found the error in our lookup table, then we just want to see',
'            --    the actual error text and not the full error stack with all the ORA error numbers.',
'            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then',
'                l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );',
'            end if;',
'            ',
'            --    If no associated page item/tabular form column has been set, we can use',
'            --    apex_error.auto_set_associated_item to automatically guess the affected',
'            --    error field by examine the ORA error for constraint names or column names.',
'            if l_result.page_item_name is null and l_result.column_alias is null then',
'                apex_error.auto_set_associated_item (',
'                    p_error            => p_error,',
'                    p_error_result    => l_result',
'                );',
'            end if;',
'            ',
'        end if;',
'        return l_result;',
'    end apex_error_handler;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'end yatzy_util;',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16011378750916403141)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'yatzy_plugin'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'create or replace',
'package yatzy_plugin',
'authid definer',
'as',
'--------------------------------------------------------------------------------',
'    function render_dice (',
'        p_item                in apex_plugin.t_page_item,',
'        p_plugin              in apex_plugin.t_plugin,',
'        p_value               in varchar2,',
'        p_is_readonly         in boolean,',
'        p_is_printer_friendly in boolean',
'    ) return apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'    function render_hold_dice (',
'        p_item                in apex_plugin.t_page_item,',
'        p_plugin              in apex_plugin.t_plugin,',
'        p_value               in varchar2,',
'        p_is_readonly         in boolean,',
'        p_is_printer_friendly in boolean',
'    ) return apex_plugin.t_page_item_render_result;',
'--------------------------------------------------------------------------------',
'end yatzy_plugin;',
'/',
'create or replace',
'package body yatzy_plugin',
'as',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    function render_dice (',
'        p_item                    in apex_plugin.t_page_item,',
'        p_plugin                in apex_plugin.t_plugin,',
'        p_value                    in varchar2,',
'        p_is_readonly            in boolean,',
'        p_is_printer_friendly    in boolean',
'    ) return apex_plugin.t_page_item_render_result',
'    as',
'        l_dots        varchar2(30);',
'        l_value        number;',
'        l_result    apex_plugin.t_page_item_render_result;',
'    begin',
'    ',
'        begin',
'            l_value := round ( to_number( p_value ) );',
'            if not l_value between 1 and 6 then',
'                l_value := null;',
'            end if;',
'        exception when',
'            value_error or',
'            invalid_number',
'        then',
'            l_value := null;',
'        end;',
'        ',
'        l_dots := to_char( to_date ( l_value, ''j'' ) , ''jsp'' );',
'        sys.htp.p(',
'                ''<div id="'' || p_item.name || ''" class="die-container''',
'            ||    case when p_is_readonly then',
'                    '' hold-die''',
'                end',
'            ||    ''"><div class="die''',
'            ||    case when l_dots is not null then',
'                    '' '' || l_dots || ''" title="'' || apex_lang.lang ( initcap( l_dots ) )',
'                end',
'            ||    ''">''',
'            ||    ''<span class="dot"></span></div></div>''',
'        );',
'',
'        -- tell apex that this field is not navigable',
'        l_result.is_navigable := false;',
'        return l_result;',
'    end render_dice;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'    function render_hold_dice (',
'        p_item                    in apex_plugin.t_page_item,',
'        p_plugin                in apex_plugin.t_plugin,',
'        p_value                    in varchar2,',
'        p_is_readonly            in boolean,',
'        p_is_printer_friendly    in boolean',
'    ) return apex_plugin.t_page_item_render_result',
'    as',
'        l_speed        number;',
'        l_distance    varchar2(30);',
'        l_times        varchar2(30);',
'        l_name        varchar2(30);',
'        l_dice_id    varchar2(30);',
'        l_effect    varchar2(30);',
'        l_code        varchar2(256);',
'        l_value        constant varchar2(30) := ''HOLD'';',
'        l_result    apex_plugin.t_page_item_render_result;',
'    begin',
'        l_name        := apex_plugin.get_input_name_for_page_item ( false );',
'        l_dice_id    := p_item.attribute_01;',
'        ',
'        sys.htp.p(',
'                ''<input type="hidden"''',
'            ||    case when p_value is not null then',
'                    '' value="'' || l_value || ''"''',
'                else',
'                    '' value=""''',
'                end',
'            ||    '' name="'' || l_name || ''" id="'' || p_item.name || ''">''',
'        );',
'',
'        if p_value is null then',
'            l_times    := to_char ( round ( dbms_random.value ( 4, 8 ), 0 ), ''fm999990'' );',
'            l_distance := to_char ( round ( dbms_random.value ( 30, 50 ), 0 ), ''fm999990'' );',
'            ',
'            l_speed    := round ( dbms_random.value ( 120, 140 ), 0 );',
'            if to_number( regexp_replace ( apex_application.g_flow_schema_owner, ''[^[:digit:]]'' ) ) <  50000 then',
'                l_effect    := ''jquery.effects.bounce'';',
'            else',
'                l_effect    := ''jquery.ui.effect-bounce'';',
'                l_speed        := l_speed * 2.2;',
'            end if;',
'            apex_javascript.add_3rd_party_library_file (',
'                p_library    =>    apex_javascript.c_library_jquery_ui,',
'                p_file_name    =>    l_effect',
'            );',
'            l_code := ''.effect("bounce",{distance:'' || l_distance || '',times:'' || l_times || ''},'' || to_char ( l_speed, ''fm999990'' ) || '')'';',
'        end if;',
'',
'        if not p_is_readonly then',
'            l_code := l_code',
'                ||    ''.click(function(e){''',
'                ||    ''$(this).toggleClass("hold-die");''',
'                ||    ''$("#'' || p_item.name || ''").val(''',
'                ||    ''$("#'' || p_item.name || ''").val().length===0?"'' || l_value || ''":""''',
'                ||    '')});''',
'            ;',
'        end if;',
'',
'        if l_code is not null then',
'            apex_javascript.add_onload_code (',
'                p_code => ''$("#'' || l_dice_id || '' ")'' || l_code',
'            );',
'        end if;',
'',
'        -- tell apex that this field is not navigable',
'        l_result.is_navigable := false;',
'        return l_result;',
'    end render_hold_dice;',
'--------------------------------------------------------------------------------',
'--------------------------------------------------------------------------------',
'end yatzy_plugin;',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16005075047917850435)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'metadata'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''ONES'',1,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TWOS'',2,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''THREES'',3,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FOURS'',4,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FIVES'',5,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SIXES'',6,''Y'',''UPPER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SUM'',7,''N'',''MIDDLE'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''BONUS'',8,''N'',''MIDDLE'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''PAIR'',9,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TWO_PAIRS'',10,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''THREE_OF_KIND'',11,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FOUR_OF_KIND'',12,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''SMALL_STRAIGHT'',13,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''LARGE_STRAIGHT'',14,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''JUMP_STRAIGHT'',15,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''FULL_HOUSE'',16,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''CHANCE'',17,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''YATZY'',18,''Y'',''LOWER'')',
'/',
'insert into yatzy_template_score_card (label_msg,seq_id,input_field,card_section) values (''TOTAL'',19,''N'',''TOTAL'')',
'/',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(15999749247355158521)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'pencil2_16x16.gif'
,p_sequence=>90
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' ',
'begin',
' ',
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;',
'wwv_flow_api.g_varchar2_table(1) := ''47494638396110001000D52500A3A11DFFFB4CFFFC4DD2CF58FFD479FFD478D5D224D2D059D4D124A3A01CFEF9D9FEFAD9D2D058F09C79E48C67D5D225FA3E00FA3F00FFE1ADC0C0C0FDF9D9C8C64AB8B52EFFFC4CFFE1ACD4D224B1BAC45E5E5EFDF9D8'';',
'wwv_flow_api.g_varchar2_table(2) := ''9D9D9DC8C549F9B3989E9E9EA3A11C5F5F5FFAB498C8C54AFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'';',
'wwv_flow_api.g_varchar2_table(3) := ''000000000021F90401000025002C0000000010001000000662C09270482C1A8F0DC7D1D8187D944B2163E269402051068534B14422CB83E222486800CBC142102018D0C70327202020E0467120507884D2146C050609690B7B768547030A6B6E78450C12'';',
'wwv_flow_api.g_varchar2_table(4) := ''15050577510318936F51251D20190F90471B2200A34641003B'';',
' ',
'end;',
'/',
'',
'declare',
'    l_name   varchar2(255);',
'begin',
'    l_name := ''pencil2_16x16.gif'';',
' ',
'  wwv_flow_api.create_or_remove_file(',
'     p_name=> l_name,',
'     p_varchar2_table=> wwv_flow_api.g_varchar2_table,',
'     p_mimetype=> ''image/gif'',',
'     p_location=> ''WORKSPACE'',',
'     p_nlang=> ''0'',',
'     p_mode=> ''CREATE_OR_REPLACE'',',
'     p_type=> ''IMAGE'');',
' ',
'end;',
'/',
'',
''))
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16000417648069837997)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'yatzy.css'
,p_sequence=>100
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' ',
'begin',
' ',
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;',
'wwv_flow_api.g_varchar2_table(1) := ''2F2A0A2A0A2A0954686973204353532066696C65206973206261736564206F6E3A0A2A092D2043535320446963653A20416E204578706572696D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70736F6E'';',
'wwv_flow_api.g_varchar2_table(2) := ''20687474703A2F2F73616D70736F6E626C6F672E636F6D2F3238392F6F662D646963652D646162626C65742D616E642D6373730A2A092D206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F'';',
'wwv_flow_api.g_varchar2_table(3) := ''6C61732F6E6F726D616C697A652E63737320436F7079726967687420286329204E69636F6C61732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A092D202253696D706C69737465222074656D706C61746520616E6420225369'';',
'wwv_flow_api.g_varchar2_table(4) := ''6D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374652F20436F707972696768742028632920323031322052656E617420526166696B6F760A2A0A2A2F0A0A2F2A0A09435353'';',
'wwv_flow_api.g_varchar2_table(5) := ''2052657365743A204261736564206F6E206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F6C61732F6E6F726D616C697A652E6373730A09436F7079726967687420286329204E69636F6C61'';',
'wwv_flow_api.g_varchar2_table(6) := ''732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A2F0A68746D6C207B20666F6E742D66616D696C793A2056657264616E612C73616E732D73657269663B202D6D732D746578742D73697A652D61646A7573743A20313030253B'';',
'wwv_flow_api.g_varchar2_table(7) := ''202D7765626B69742D746578742D73697A652D61646A7573743A20313030253B207D0A626F6479207B206D617267696E3A20303B206261636B67726F756E643A20236632663266323B207D0A666F6F7465722C6865616465722C73656374696F6E207B20'';',
'wwv_flow_api.g_varchar2_table(8) := ''646973706C61793A20626C6F636B3B207D0A5B68696464656E5D7B20646973706C61793A206E6F6E653B207D0A61207B206261636B67726F756E642D636F6C6F723A207472616E73706172656E743B207D0A61207B20636F6C6F723A20233266323B2074'';',
'wwv_flow_api.g_varchar2_table(9) := ''6578742D6465636F726174696F6E3A206E6F6E653B207D0A613A6163746976652C613A686F766572207B206F75746C696E653A20303B207D0A622C7374726F6E67207B20666F6E742D7765696768743A20626F6C643B207D0A696D67207B20626F726465'';',
'wwv_flow_api.g_varchar2_table(10) := ''723A20303B207D0A627574746F6E2C696E707574207B20636F6C6F723A20696E68657269743B20666F6E743A20696E68657269743B206D617267696E3A20303B207D0A627574746F6E207B206F766572666C6F773A2076697369626C653B20746578742D'';',
'wwv_flow_api.g_varchar2_table(11) := ''7472616E73666F726D3A206E6F6E653B202D7765626B69742D617070656172616E63653A20627574746F6E3B20637572736F723A20706F696E7465723B207D0A627574746F6E5B64697361626C65645D20207B20637572736F723A2064656661756C743B'';',
'wwv_flow_api.g_varchar2_table(12) := ''207D0A627574746F6E3A3A2D6D6F7A2D666F6375732D696E6E65722C696E7075743A3A2D6D6F7A2D666F6375732D696E6E6572207B20626F726465723A20303B2070616464696E673A20303B207D0A696E707574207B206C696E652D6865696768743A20'';',
'wwv_flow_api.g_varchar2_table(13) := ''6E6F726D616C3B207D0A7461626C65207B20626F726465722D636F6C6C617073653A20636F6C6C617073653B626F726465722D73706163696E673A20303B207D0A74642C7468207B2070616464696E673A20303B207D0A756C207B206C6973742D737479'';',
'wwv_flow_api.g_varchar2_table(14) := ''6C653A6E6F6E65207D0A756C206C69207B2070616464696E673A30203020302E34656D20303B207D0A6831207B20666F6E742D73697A653A2032656D3B206D617267696E3A20302E3637656D20303B207D0A68312C68322C6833207B20666F6E742D7765'';',
'wwv_flow_api.g_varchar2_table(15) := ''696768743A6E6F726D616C3B207D0A2F2A20456E6420435353205265736574202A2F0A0A0A2F2A0A0943535320446963653A20416E204578706572696D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70'';',
'wwv_flow_api.g_varchar2_table(16) := ''736F6E20687474703A2F2F73616D70736F6E626C6F672E636F6D2F7461672F7765622D64657369676E0A2A2F0A2E6469652E6F6E65202E646F74207B0A09626F782D736861646F773A2030202E32656D203020236666660A7D0A2E6469652E74776F202E'';',
'wwv_flow_api.g_varchar2_table(17) := ''646F74207B0A096261636B67726F756E643A207472616E73706172656E743B0A09626F782D736861646F773A092D322E33656D202D322E33656D203020233334352C0A09090909322E33656D2020322E33656D203020233334352C0A090909092D322E33'';',
'wwv_flow_api.g_varchar2_table(18) := ''656D202D322E33656D203020236666662C0A09090909322E33656D2020322E34656D203020236666660A7D0A2E6469652E7468726565202E646F74207B0A09626F782D736861646F773A092D322E33656D202D322E33656D203020233334352C0A090909'';',
'wwv_flow_api.g_varchar2_table(19) := ''09322E33656D2020322E33656D203020233334352C0A090909092D322E33656D202D322E33656D203020236666662C0A09090909322E33656D2020322E34656D203020236666662C0A0909090930202E32656D203020236666660A7D0A2E6469652E666F'';',
'wwv_flow_api.g_varchar2_table(20) := ''7572202E646F74207B0A096261636B67726F756E643A207472616E73706172656E743B0A2020202020202020626F782D736861646F773A202D322E33656D202D322E33656D203020233334352C0A0909090909322E33656D20322E33656D203020233334'';',
'wwv_flow_api.g_varchar2_table(21) := ''352C0A09090909092D322E33656D20322E33656D203020233334352C0A0909090909322E33656D202D322E33656D203020233334352C0A09090909092D322E33656D202D322E33656D203020236666662C0A0909090909322E33656D20322E34656D2030'';',
'wwv_flow_api.g_varchar2_table(22) := ''20236666662C0A09090909092D322E33656D20322E34656D203020236666662C0A0909090909322E33656D202D322E33656D203020236666660A7D0A2E6469652E66697665202E646F74207B0A09626F782D736861646F773A092D322E33656D202D322E'';',
'wwv_flow_api.g_varchar2_table(23) := ''33656D203020233334352C0A09090909322E33656D20322E33656D203020233334352C0A090909092D322E33656D20322E33656D203020233334352C0A09090909322E33656D202D322E33656D203020233334352C0A090909092D322E33656D202D322E'';',
'wwv_flow_api.g_varchar2_table(24) := ''32656D203020236666662C0A09090909322E33656D202D322E32656D203020236666662C0A09090909322E33656D20322E34656D203020236666662C0A090909092D322E33656D20322E34656D203020236666662C0A0909090930202E32656D20302023'';',
'wwv_flow_api.g_varchar2_table(25) := ''6666660A7D0A2E6469652E736978202E646F74207B0A096261636B67726F756E643A207472616E73706172656E743B0A09626F782D736861646F773A202D322E33656D202D322E33656D203020233334352C0A090909092D322E33656D20302030202333'';',
'wwv_flow_api.g_varchar2_table(26) := ''34352C0A090909092D322E33656D20322E33656D203020233334352C0A09090909322E33656D202D322E33656D203020233334352C0A09090909322E33656D2030203020233334352C0A09090909322E33656D20322E33656D203020233334352C0A0909'';',
'wwv_flow_api.g_varchar2_table(27) := ''09092D322E33656D202D322E31656D203020236666662C0A090909092D322E33656D202E32656D203020236666662C0A090909092D322E33656D20322E34656D203020236666662C0A09090909322E33656D20322E34656D203020236666662C0A090909'';',
'wwv_flow_api.g_varchar2_table(28) := ''09322E33656D202E32656D203020236666662C0A09090909322E33656D202D322E31656D203020236666660A7D0A2E646965207B0A09626F726465722D746F703A2031707820736F6C696420236631663166313B0A0977696474683A20353070783B2068'';',
'wwv_flow_api.g_varchar2_table(29) := ''65696768743A20353070783B0A09626F726465722D7261646975733A20313070783B0A09706F736974696F6E3A2072656C61746976653B0A096D617267696E3A20313070783B0A09666F6E742D73697A653A203670783B0A09646973706C61793A20696E'';',
'wwv_flow_api.g_varchar2_table(30) := ''6C696E652D626C6F636B3B0A09626F782D736861646F773A2030707820357078203020234343432C2030203670782033707820233434342C203020313070782035707820233333333B0A096261636B67726F756E642D696D6167653A202D7765626B6974'';',
'wwv_flow_api.g_varchar2_table(31) := ''2D72616469616C2D6772616469656E7428236665666566652C2023663066306630293B0A096261636B67726F756E642D696D6167653A2072616469616C2D6772616469656E7428236665666566652C2023663066306630293B0A096261636B67726F756E'';',
'wwv_flow_api.g_varchar2_table(32) := ''642D636F6C6F723A20236661666166613B0A7D0A2E646F74207B0A0977696474683A203230253B0A096865696768743A203230253B0A096C6566743A203530253B0A09746F703A203530253B0A096D617267696E3A202D3130253B0A096261636B67726F'';',
'wwv_flow_api.g_varchar2_table(33) := ''756E643A20233334353B0A09626F726465722D7261646975733A203530253B0A09646973706C61793A20626C6F636B3B0A09706F736974696F6E3A206162736F6C7574653B0A7D0A2F2A20456E64204353532044696365202A2F0A0A2F2A0A095468656D'';',
'wwv_flow_api.g_varchar2_table(34) := ''653A204261736564206F6E202253696D706C69737465222074656D706C61746520616E64202253696D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374650A09436F70797269'';',
'wwv_flow_api.g_varchar2_table(35) := ''6768742028632920323031322052656E617420526166696B6F760A2A2F0A0A2F2A2A2A2A2048656C70657220636C6173736573202A2A2A2A2F0A2E686964656D657B20646973706C61793A6E6F6E653B207D0A2E696D67207B206D61782D77696474683A'';',
'wwv_flow_api.g_varchar2_table(36) := ''313030253B6865696768743A6175746F207D0A0A0A2F2A2A2A2A2050616765202A2A2A2A2F0A2E636F6E7461696E6572207B0A096D61782D77696474683A3133303070783B0A096D617267696E3A30206175746F3B0A7D0A2E686561646572207B0A2020'';',
'wwv_flow_api.g_varchar2_table(37) := ''6D617267696E3A31707820302033656D20303B0A202070616464696E673A32656D20322520302032253B0A7D0A2E6C6F676F207B0A2020666C6F61743A6C6566743B0A2020646973706C61793A696E6C696E652D626C6F636B3B0A202070616464696E67'';',
'wwv_flow_api.g_varchar2_table(38) := ''3A3020302031656D3B0A2020666F6E742D73697A653A313870783B0A2020636F6C6F723A233333333B0A7D0A2E696E666F207B2070616464696E673A302031252031656D2031253B207D0A2E626F617264207B0A096261636B67726F756E643A20233037'';',
'wwv_flow_api.g_varchar2_table(39) := ''303B0A09626F726465722D7261646975733A203570783B0A09626F782D736861646F773A093020302039707820337078202333333320696E7365742C0A090909093020302035307078202331313120696E7365742C0A0909090930203330707820333070'';',
'wwv_flow_api.g_varchar2_table(40) := ''78202D32307078202333333320696E7365743B0A0970616464696E673A2031357078203020313570782032253B0A096D617267696E3A2030203020322520303B0A09636F6C6F723A20236661666166613B0A7D0A2E666F6F746572207B0A097061646469'';',
'wwv_flow_api.g_varchar2_table(41) := ''6E673A31656D2033252033656D2033253B0A09636F6C6F723A233731373137313B0A09666F6E742D73697A653A313270783B0A7D0A2F2A0A2E636C6561726669783A6265666F72652C0A2E636C6561726669783A6166746572207B20636F6E74656E743A'';',
'wwv_flow_api.g_varchar2_table(42) := ''22223B20646973706C61793A7461626C653B207D0A2E636C6561726669783A6166746572207B20636C6561723A626F74683B207D0A2A2F0A2F2A20436F6C756D6E73202A2F0A2E636F6C5F3235207B0A202077696474683A3233253B0A20206D61726769'';',
'wwv_flow_api.g_varchar2_table(43) := ''6E3A30203225203020303B0A2020666C6F61743A6C6566743B0A7D0A2E636F6C5F3333207B0A0977696474683A3331253B0A096D617267696E3A30203225203020303B0A09666C6F61743A6C6566743B0A7D0A2E636F6C5F3430207B0A0977696474683A'';',
'wwv_flow_api.g_varchar2_table(44) := ''3338253B0A09666C6F61743A6C6566743B0A7D0A2E636F6C5F3530207B0A0977696474683A3438253B0A096D617267696E3A30203225203020303B0A09666C6F61743A6C6566743B0A7D0A2E677269642D636F6C756D6E207B0A096D617267696E3A3020'';',
'wwv_flow_api.g_varchar2_table(45) := ''313670782038707820303B0A09646973706C61793A696E6C696E652D626C6F636B3B0A09626F782D73697A696E673A20626F726465722D626F783B0A7D0A0A0A2F2A2A2A2A20526567696F6E202A2A2A2A2F0A2E726567696F6E207B0A096D617267696E'';',
'wwv_flow_api.g_varchar2_table(46) := ''3A2030203132707820367078203370783B0A7D0A2E736964652D726567696F6E207B0A09666C6F61743A206C6566743B0A096D617267696E3A3020313070782035707820303B0A7D0A2F2A0A2E6D6F64616C5F4C4F41444552207B0A202020206261636B'';',
'wwv_flow_api.g_varchar2_table(47) := ''67726F756E642D636F6C6F723A20726762612835312C2035312C2035312C20302E33293B0A20202020637572736F723A20776169743B0A202020206865696768743A20313030253B0A202020206C6566743A20303B0A20202020706F736974696F6E3A20'';',
'wwv_flow_api.g_varchar2_table(48) := ''66697865643B0A20202020746F703A20303B0A2020202077696474683A20313030253B0A202020207A2D696E6465783A20393939393B0A7D0A2E6D6F64616C5F4C4F4144455220696D67207B0A20202020637572736F723A20776169743B0A202020206C'';',
'wwv_flow_api.g_varchar2_table(49) := ''6566743A203438253B0A20202020706F736974696F6E3A2072656C61746976653B0A20202020746F703A203334253B0A7D0A2A2F0A0A0A2F2A2A2A2A204D657373616765202A2A2A2A2F0A2E7761726E696E67207B0A2020626F726465723A3170782073'';',
'wwv_flow_api.g_varchar2_table(50) := ''6F6C696420236563323532653B0A2020636F6C6F723A236666663B0A202070616464696E673A38707820313470783B0A20206261636B67726F756E643A236561303030303B0A2020626F726465722D7261646975733A3870783B0A7D0A2E737563636573'';',
'wwv_flow_api.g_varchar2_table(51) := ''73207B0A2020626F726465723A31707820736F6C696420233339396631363B0A2020636F6C6F723A236666663B0A20206261636B67726F756E643A233339396631363B0A202070616464696E673A38707820313470783B0A2020626F726465722D726164'';',
'wwv_flow_api.g_varchar2_table(52) := ''6975733A3870783B0A7D0A2E6D657373616765207B0A2020626F726465723A31707820736F6C696420236631656463663B0A2020636F6C6F723A233030303B0A20206261636B67726F756E643A236662663865333B0A202070616464696E673A38707820'';',
'wwv_flow_api.g_varchar2_table(53) := ''313470783B0A2020626F726465722D7261646975733A3870783B0A7D0A2E6D657373616765203E2061207B0A09636F6C6F723A20233030346464390A7D0A2E6D65737361676573207B0A09706F736974696F6E3A206162736F6C7574653B0A0977696474'';',
'wwv_flow_api.g_varchar2_table(54) := ''683A20313030253B0A09746F703A20303B0A096D617267696E3A20303B0A0970616464696E673A20303B0A097A2D696E6465783A20393939393B0A7D0A2E6D65737361676573203E20646976207B0A0977696474683A203630253B0A096D617267696E3A'';',
'wwv_flow_api.g_varchar2_table(55) := ''2030206175746F3B0A09626F726465722D7261646975733A2030203020387078203870783B0A09706F736974696F6E3A2072656C61746976653B0A7D0A0A0A2F2A2A2A2A20427574746F6E202A2A2A2A2F0A2E627574746F6E207B0A202020206261636B'';',
'wwv_flow_api.g_varchar2_table(56) := ''67726F756E642D636F6C6F723A20236363633B0A20202020626F782D736861646F773A093020302033707820327078202365656520696E7365742C0A0909090930203370782033707820233333333B0A20202020626F726465723A2031707820736F6C69'';',
'wwv_flow_api.g_varchar2_table(57) := ''6420233838383B0A20202020636F6C6F723A20233333333B0A09746578742D736861646F773A20317078203170782031707820236464643B0A09626F726465722D7261646975733A20313570783B0A09746578742D616C69676E3A63656E7465723B0A09'';',
'wwv_flow_api.g_varchar2_table(58) := ''746578742D6465636F726174696F6E3A6E6F6E653B0A0970616464696E673A3130707820323070783B0A09646973706C61793A696E6C696E652D626C6F636B3B0A096D617267696E3A203370783B0A7D0A2E627574746F6E3A686F766572207B0A202020'';',
'wwv_flow_api.g_varchar2_table(59) := ''206261636B67726F756E642D636F6C6F723A20236161613B0A09626F726465722D636F6C6F723A20233636363B0A20202020626F782D736861646F773A093020302033707820327078202363636320696E7365742C0A0909090930203370782033707820'';',
'wwv_flow_api.g_varchar2_table(60) := ''233131313B0A7D0A2E627574746F6E2E686F74207B0A202020206261636B67726F756E642D636F6C6F723A20233263323B0A20202020626F726465723A2031707820736F6C696420233238323B0A20202020626F782D736861646F773A09302030203370'';',
'wwv_flow_api.g_varchar2_table(61) := ''7820327078202332653220696E7365742C0A0909090930203370782033707820233333333B0A20202020636F6C6F723A20236631663166313B0A09746578742D736861646F773A317078203170782031707820233333333B0A096D617267696E3A203370'';',
'wwv_flow_api.g_varchar2_table(62) := ''783B0A7D0A2E627574746F6E2E686F743A686F766572207B0A202020206261636B67726F756E642D636F6C6F723A20233261323B0A09626F726465722D636F6C6F723A20233236323B0A20202020626F782D736861646F773A0930203020337078203270'';',
'wwv_flow_api.g_varchar2_table(63) := ''78202332633220696E7365742C0A0909090930203370782033707820233131313B0A7D0A0A2F2A2A2A2A204974656D202A2A2A2A2F0A2E746578745F6669656C64207B0A096261636B67726F756E642D636F6C6F723A20236661666166613B0A09626F72'';',
'wwv_flow_api.g_varchar2_table(64) := ''6465723A2031707820736F6C696420236330633063303B0A09626F726465722D7261646975733A203370783B0A09626F782D736861646F773A20337078203370782033707820233333333B0A09626F782D73697A696E673A20626F726465722D626F783B'';',
'wwv_flow_api.g_varchar2_table(65) := ''0A09636F6C6F723A20233333333B0A096865696768743A20313030253B0A0970616464696E673A20327078203570783B0A096D617267696E3A203370783B0A7D0A0A2F2A2A2A2A2044696365206974656D20706C7567696E202A2A2A2A2F0A2E6469652D'';',
'wwv_flow_api.g_varchar2_table(66) := ''636F6E7461696E6572207B0A0977696474683A20373070783B0A096865696768743A20383070783B0A09626F726465722D7261646975733A203870783B0A096D617267696E3A2030203020387078203870780A7D0A2E686F6C642D646965207B0A096261'';',
'wwv_flow_api.g_varchar2_table(67) := ''636B67726F756E642D636F6C6F723A20233030626230303B0A09626F782D736861646F773A203020302031707820317078202332643220696E7365743B0A7D0A0A2F2A2A2A2A204C6162656C202A2A2A2A2F0A7370616E2E6C6162656C2D6572726F7220'';',
'wwv_flow_api.g_varchar2_table(68) := ''7B0A20202020636F6C6F723A20236563323532653B0A20202020646973706C61793A20626C6F636B3B0A202020206D617267696E3A203020337078203370783B0A7D0A6C6162656C2E6C6162656C2D6F7074696F6E616C207B0A20202020646973706C61'';',
'wwv_flow_api.g_varchar2_table(69) := ''793A20626C6F636B3B0A202020206D617267696E3A203132707820337078203370783B0A7D0A0A2F2A2A2A2A205265706F7274202A2A2A2A2F0A2E7061706572207B0A096D617267696E2D72696768743A203670783B0A096D617267696E2D626F74746F'';',
'wwv_flow_api.g_varchar2_table(70) := ''6D3A20313870783B0A096261636B67726F756E642D636F6C6F723A20236665666566653B0A09626F726465722D7261646975733A203170783B0A096C65747465722D73706163696E673A202D3170783B0A09636F6C6F723A20233636363B0A0977696474'';',
'wwv_flow_api.g_varchar2_table(71) := ''683A313030253B0A09666F6E742D73697A653A312E34656D3B0A09746578742D616C69676E3A2063656E7465723B0A09626F782D736861646F773A093020302033307078207267626128302C20302C20302C20302E312920696E7365742C0A0909090931'';',
'wwv_flow_api.g_varchar2_table(72) := ''7078203170782030207267626128302C302C302C302E313030292C0A090909093370782033707820302072676261283234302C3234302C3234302C20312E30292C0A09090909347078203470782030207267626128302C302C302C302E313235292C0A09'';',
'wwv_flow_api.g_varchar2_table(73) := ''0909093670782036707820302072676261283234302C3234302C3234302C312E30292C0A09090909377078203770782030207267626128302C302C302C302E313530292C0A090909093970782039707820302072676261283234302C3234302C3234302C'';',
'wwv_flow_api.g_varchar2_table(74) := ''312E30292C0A090909093130707820313070782030207267626128302C302C302C302E313735292C0A090909093130707820313270782034707820233333333B0A7D0A2E7061706572207464207B0A09626F726465722D746F703A31707820736F6C6964'';',
'wwv_flow_api.g_varchar2_table(75) := ''20233931643164333B0A09636F6C6F723A233333333B0A7D0A2E7061706572207468207B0A09666F6E742D7765696768743A20626F6C643B0A7D0A2E73636F72652D63617264207B0A0977696474683A206175746F3B0A09666F6E742D73697A653A302E'';',
'wwv_flow_api.g_varchar2_table(76) := ''38656D3B0A096D617267696E2D626F74746F6D3A20313270783B0A7D0A2E73636F72652D636172642074642E63656C6C31207B0A09626F726465722D6C6566743A2031707820736F6C696420233931643164333B0A0970616464696E672D6C6566743A20'';',
'wwv_flow_api.g_varchar2_table(77) := ''3870783B0A09746578742D616C69676E3A206C6566743B0A7D0A2E73636F72652D636172642074642E63656C6C32207B0A0970616464696E673A20317078203870783B0A09746578742D616C69676E3A2072696768743B0A7D0A2E73636F72652D636172'';',
'wwv_flow_api.g_varchar2_table(78) := ''642074642E746F702D626F72646572207B0A09626F726465722D746F703A2032707820736F6C696420233636363B0A7D0A2E73636F72652D636172642074642E73696465203E20646976207B0A20202020666C6F61743A206C6566743B0A202020206D61'';',
'wwv_flow_api.g_varchar2_table(79) := ''7267696E3A20303B0A2020202070616464696E673A20303B0A20202020626F74746F6D3A20303B0A096C6566743A20303B0A096F766572666C6F773A2076697369626C653B0A0977686974652D73706163653A206E6F777261703B0A202020202D776562'';',
'wwv_flow_api.g_varchar2_table(80) := ''6B69742D7472616E73666F726D3A20726F74617465282D3930646567293B0A20202020202020202D6D732D7472616E73666F726D3A20726F74617465282D3930646567293B0A2020202020202020202020207472616E73666F726D3A20726F7461746528'';',
'wwv_flow_api.g_varchar2_table(81) := ''2D3930646567293B0A2020202077696474683A20323070783B0A7D0A2E73636F72652D636172642074642E73636F72652D626F78207B0A096865696768743A20323870783B0A0977696474683A20343870783B0A7D0A2E73636F72652D63617264207464'';',
'wwv_flow_api.g_varchar2_table(82) := ''2E73636F72652D626F78203E2061207B0A202020206261636B67726F756E642D636F6C6F723A20236661666166613B0A20202020626F726465723A2031707820736F6C696420236330633063303B0A20202020626F726465722D7261646975733A203370'';',
'wwv_flow_api.g_varchar2_table(83) := ''783B0A20202020626F782D73697A696E673A20626F726465722D626F783B0A20202020636F6C6F723A20233333333B0A20202020646973706C61793A20626C6F636B3B0A20202020666F6E742D7765696768743A20626F6C643B0A202020207061646469'';',
'wwv_flow_api.g_varchar2_table(84) := ''6E673A2030203570783B0A2020202077696474683A20313030253B0A096865696768743A20313030253B0A09626F782D736861646F773A2030203020317078202333333320696E7365743B0A7D0A2E73636F72652D636172642074642E73636F72652D62'';',
'wwv_flow_api.g_varchar2_table(85) := ''6F78203E2061203E207370616E207B0A202020206D617267696E2D72696768743A203370783B0A7D0A2E73636F72652D63617264202074723A66697273742D6368696C64207464207B0A20202020626F726465722D746F703A206E6F6E653B0A7D0A2E73'';',
'wwv_flow_api.g_varchar2_table(86) := ''636F72652D63617264202074723A6C6173742D6368696C64207464207B0A20202020666F6E742D7765696768743A20626F6C643B0A0970616464696E672D746F703A203270783B0A0970616464696E672D626F74746F6D3A203270783B0A7D0A0A2F2A2A'';',
'wwv_flow_api.g_varchar2_table(87) := ''2A2A20726573706F6E73697665202A2A2A2A2F0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A373530707829207B202F2A205461626C6574202A2F0A092E636F6C5F32352C0A092E636F6C5F33332C0A092E636F'';',
'wwv_flow_api.g_varchar2_table(88) := ''6C5F34302C0A092E636F6C5F353020207B0A090977696474683A3938253B0A0909666C6F61743A6E6F6E653B0A097D0A092E6D65737361676573207B20706F736974696F6E3A207374617469633B207D0A7D0A406D65646961206F6E6C79207363726565'';',
'wwv_flow_api.g_varchar2_table(89) := ''6E20616E6420286D61782D77696474683A343830707829207B202F2A20536D61727470686F6E65202A2F0A092E686561646572207B0A09096D617267696E2D626F74746F6D3A303B0A097D0A092E6C6F676F7B0A0909646973706C61793A626C6F636B3B'';',
'wwv_flow_api.g_varchar2_table(90) := ''0A0909666C6F61743A6E6F6E653B0A0909746578742D616C69676E3A63656E7465723B0A097D0A092E626F617264207B0A090970616464696E672D746F703A2031253B0A090970616464696E672D6C6566743A2031253B0A097D0A7D0A2F2A20456E6420'';',
'wwv_flow_api.g_varchar2_table(91) := ''435353205468656D65202A2F'';',
' ',
'end;',
'/',
'',
'declare',
'  l_name   varchar2(255);',
'begin',
'  l_name := ''yatzy.css'';',
' ',
'  wwv_flow_api.create_or_remove_file(',
'     p_name=> l_name,',
'     p_varchar2_table=> wwv_flow_api.g_varchar2_table,',
'     p_mimetype=> ''text/css'',',
'     p_location=> ''WORKSPACE'',',
'     p_mode=> ''CREATE_OR_REPLACE'',',
'     p_type=> ''CSS'');',
' ',
'end;',
'/',
'',
''))
);
end;
/
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(16000417736761838001)
,p_install_id=>wwv_flow_api.id(16005073352307643626)
,p_name=>'yatzy.min.css'
,p_sequence=>110
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
' ',
'begin',
' ',
'wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;',
'wwv_flow_api.g_varchar2_table(1) := ''2F2A0A2A0A2A0954686973204353532066696C65206973206261736564206F6E3A0A2A092D2043535320446963653A20416E204578706572696D656E74206279204A6F6E617468616E2053616D70736F6E202D20406A6F6E617468616E73616D70736F6E'';',
'wwv_flow_api.g_varchar2_table(2) := ''20687474703A2F2F73616D70736F6E626C6F672E636F6D2F3238392F6F662D646963652D646162626C65742D616E642D6373730A2A092D206E6F726D616C697A652E6373732076332E302E332068747470733A2F2F6769746875622E636F6D2F6E65636F'';',
'wwv_flow_api.g_varchar2_table(3) := ''6C61732F6E6F726D616C697A652E63737320436F7079726967687420286329204E69636F6C61732047616C6C616768657220616E64204A6F6E617468616E204E65616C0A2A092D202253696D706C69737465222074656D706C61746520616E6420225369'';',
'wwv_flow_api.g_varchar2_table(4) := ''6D706C652220736B696E2062792052656E617420526166696B6F7620687474703A2F2F637373722E72752F73696D706C697374652F20436F707972696768742028632920323031322052656E617420526166696B6F760A2A0A2A2F0A68746D6C7B666F6E'';',
'wwv_flow_api.g_varchar2_table(5) := ''742D66616D696C793A56657264616E612C73616E732D73657269663B2D6D732D746578742D73697A652D61646A7573743A313030253B2D7765626B69742D746578742D73697A652D61646A7573743A313030257D626F64797B6D617267696E3A303B6261'';',
'wwv_flow_api.g_varchar2_table(6) := ''636B67726F756E643A236632663266327D666F6F7465722C6865616465722C73656374696F6E7B646973706C61793A626C6F636B7D617B6261636B67726F756E642D636F6C6F723A7472616E73706172656E743B636F6C6F723A233266323B746578742D'';',
'wwv_flow_api.g_varchar2_table(7) := ''6465636F726174696F6E3A6E6F6E657D613A6163746976652C613A686F7665727B6F75746C696E653A307D696D677B626F726465723A307D627574746F6E2C696E7075747B636F6C6F723A696E68657269743B666F6E743A696E68657269743B6D617267'';',
'wwv_flow_api.g_varchar2_table(8) := ''696E3A307D627574746F6E7B6F766572666C6F773A76697369626C653B746578742D7472616E73666F726D3A6E6F6E653B2D7765626B69742D617070656172616E63653A627574746F6E3B637572736F723A706F696E7465727D627574746F6E5B646973'';',
'wwv_flow_api.g_varchar2_table(9) := ''61626C65645D7B637572736F723A64656661756C747D627574746F6E3A3A2D6D6F7A2D666F6375732D696E6E65722C696E7075743A3A2D6D6F7A2D666F6375732D696E6E65727B626F726465723A303B70616464696E673A307D696E7075747B6C696E65'';',
'wwv_flow_api.g_varchar2_table(10) := ''2D6865696768743A6E6F726D616C7D7461626C657B626F726465722D636F6C6C617073653A636F6C6C617073653B626F726465722D73706163696E673A307D74642C74687B70616464696E673A307D756C7B6C6973742D7374796C653A6E6F6E657D756C'';',
'wwv_flow_api.g_varchar2_table(11) := ''206C697B70616464696E673A302030202E34656D7D68317B666F6E742D73697A653A32656D3B6D617267696E3A2E3637656D20307D68312C68322C68337B666F6E742D7765696768743A3430307D2E6469652D636F6E7461696E65727B77696474683A37'';',
'wwv_flow_api.g_varchar2_table(12) := ''3070783B6865696768743A383070783B626F726465722D7261646975733A3870783B6D617267696E3A30203020387078203870787D2E686F6C642D6469657B6261636B67726F756E642D636F6C6F723A233062303B626F782D736861646F773A30203020'';',
'wwv_flow_api.g_varchar2_table(13) := ''31707820317078202332643220696E7365747D2E6469652E6F6E65202E646F747B626F782D736861646F773A30202E32656D203020236666667D2E6469652E74776F202E646F747B6261636B67726F756E643A7472616E73706172656E743B626F782D73'';',
'wwv_flow_api.g_varchar2_table(14) := ''6861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C202D322E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666667D2E6469652E746872656520'';',
'wwv_flow_api.g_varchar2_table(15) := ''2E646F747B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C202D322E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666662C20'';',
'wwv_flow_api.g_varchar2_table(16) := ''30202E32656D203020236666667D2E6469652E666F7572202E646F747B6261636B67726F756E643A7472616E73706172656E743B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D20302023'';',
'wwv_flow_api.g_varchar2_table(17) := ''3334352C202D322E33656D20322E33656D203020233334352C20322E33656D202D322E33656D203020233334352C202D322E33656D202D322E33656D203020236666662C20322E33656D20322E34656D203020236666662C202D322E33656D20322E3465'';',
'wwv_flow_api.g_varchar2_table(18) := ''6D203020236666662C20322E33656D202D322E33656D203020236666667D2E6469652E66697665202E646F747B626F782D736861646F773A2D322E33656D202D322E33656D203020233334352C20322E33656D20322E33656D203020233334352C202D32'';',
'wwv_flow_api.g_varchar2_table(19) := ''2E33656D20322E33656D203020233334352C20322E33656D202D322E33656D203020233334352C202D322E33656D202D322E32656D203020236666662C20322E33656D202D322E32656D203020236666662C20322E33656D20322E34656D203020236666'';',
'wwv_flow_api.g_varchar2_table(20) := ''662C202D322E33656D20322E34656D203020236666662C2030202E32656D203020236666667D2E6469652E736978202E646F747B6261636B67726F756E643A7472616E73706172656E743B626F782D736861646F773A2D322E33656D202D322E33656D20'';',
'wwv_flow_api.g_varchar2_table(21) := ''3020233334352C202D322E33656D2030203020233334352C202D322E33656D20322E33656D203020233334352C20322E33656D202D322E33656D203020233334352C20322E33656D2030203020233334352C20322E33656D20322E33656D203020233334'';',
'wwv_flow_api.g_varchar2_table(22) := ''352C202D322E33656D202D322E31656D203020236666662C202D322E33656D202E32656D203020236666662C202D322E33656D20322E34656D203020236666662C20322E33656D20322E34656D203020236666662C20322E33656D202E32656D20302023'';',
'wwv_flow_api.g_varchar2_table(23) := ''6666662C20322E33656D202D322E31656D203020236666667D2E6469657B626F726465722D746F703A31707820736F6C696420236631663166313B77696474683A353070783B6865696768743A353070783B626F726465722D7261646975733A31307078'';',
'wwv_flow_api.g_varchar2_table(24) := ''3B706F736974696F6E3A72656C61746976653B6D617267696E3A313070783B666F6E742D73697A653A3670783B646973706C61793A696E6C696E652D626C6F636B3B626F782D736861646F773A3020357078203020234343432C20302036707820337078'';',
'wwv_flow_api.g_varchar2_table(25) := ''20233434342C203020313070782035707820233333333B6261636B67726F756E642D696D6167653A72616469616C2D6772616469656E7428236665666566652C2023663066306630293B6261636B67726F756E642D636F6C6F723A236661666166617D2E'';',
'wwv_flow_api.g_varchar2_table(26) := ''646F747B77696474683A3230253B6865696768743A3230253B6C6566743A3530253B746F703A3530253B6D617267696E3A2D3130253B6261636B67726F756E643A233334353B626F726465722D7261646975733A3530253B646973706C61793A626C6F63'';',
'wwv_flow_api.g_varchar2_table(27) := ''6B3B706F736974696F6E3A6162736F6C7574657D2E686964656D652C5B68696464656E5D7B646973706C61793A6E6F6E657D2E696D677B6D61782D77696474683A313030253B6865696768743A6175746F7D2E636F6E7461696E65727B6D61782D776964'';',
'wwv_flow_api.g_varchar2_table(28) := ''74683A3133303070783B6D617267696E3A30206175746F7D2E6865616465727B6D617267696E3A31707820302033656D3B70616464696E673A32656D20322520307D2E6C6F676F7B666C6F61743A6C6566743B646973706C61793A696E6C696E652D626C'';',
'wwv_flow_api.g_varchar2_table(29) := ''6F636B3B70616464696E673A3020302031656D3B666F6E742D73697A653A313870783B636F6C6F723A233333337D2E696E666F7B70616464696E673A302031252031656D7D2E626F6172647B6261636B67726F756E643A233037303B626F726465722D72'';',
'wwv_flow_api.g_varchar2_table(30) := ''61646975733A3570783B626F782D736861646F773A3020302039707820337078202333333320696E7365742C203020302035307078202331313120696E7365742C203020333070782033307078202D32307078202333333320696E7365743B7061646469'';',
'wwv_flow_api.g_varchar2_table(31) := ''6E673A31357078203020313570782032253B6D617267696E3A3020302032253B636F6C6F723A236661666166617D2E666F6F7465727B70616464696E673A31656D2033252033656D3B636F6C6F723A233731373137313B666F6E742D73697A653A313270'';',
'wwv_flow_api.g_varchar2_table(32) := ''787D2E636F6C5F32357B77696474683A3233253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E636F6C5F33337B77696474683A3331253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E636F6C5F34307B'';',
'wwv_flow_api.g_varchar2_table(33) := ''77696474683A3338253B666C6F61743A6C6566747D2E636F6C5F35307B77696474683A3438253B6D617267696E3A30203225203020303B666C6F61743A6C6566747D2E677269642D636F6C756D6E7B6D617267696E3A3020313670782038707820303B64'';',
'wwv_flow_api.g_varchar2_table(34) := ''6973706C61793A696E6C696E652D626C6F636B3B626F782D73697A696E673A626F726465722D626F787D2E726567696F6E7B6D617267696E3A30203132707820367078203370787D2E736964652D726567696F6E7B666C6F61743A6C6566743B6D617267'';',
'wwv_flow_api.g_varchar2_table(35) := ''696E3A3020313070782035707820307D2E7761726E696E677B626F726465723A31707820736F6C696420236563323532653B636F6C6F723A236666663B70616464696E673A38707820313470783B6261636B67726F756E643A236561303030303B626F72'';',
'wwv_flow_api.g_varchar2_table(36) := ''6465722D7261646975733A3870787D2E737563636573737B626F726465723A31707820736F6C696420233339396631363B636F6C6F723A236666663B6261636B67726F756E643A233339396631363B70616464696E673A38707820313470783B626F7264'';',
'wwv_flow_api.g_varchar2_table(37) := ''65722D7261646975733A3870787D2E6D6573736167657B626F726465723A31707820736F6C696420236631656463663B636F6C6F723A233030303B6261636B67726F756E643A236662663865333B70616464696E673A38707820313470783B626F726465'';',
'wwv_flow_api.g_varchar2_table(38) := ''722D7261646975733A3870787D2E6D657373616765203E20617B636F6C6F723A233030346464397D2E6D657373616765737B706F736974696F6E3A6162736F6C7574653B77696474683A313030253B746F703A303B6D617267696E3A303B70616464696E'';',
'wwv_flow_api.g_varchar2_table(39) := ''673A303B7A2D696E6465783A393939397D2E6D65737361676573203E206469767B77696474683A3630253B6D617267696E3A30206175746F3B626F726465722D7261646975733A30203020387078203870783B706F736974696F6E3A72656C6174697665'';',
'wwv_flow_api.g_varchar2_table(40) := ''7D2E627574746F6E7B6261636B67726F756E642D636F6C6F723A236363633B626F782D736861646F773A3020302033707820327078202365656520696E7365742C2030203370782033707820233333333B626F726465723A31707820736F6C6964202338'';',
'wwv_flow_api.g_varchar2_table(41) := ''38383B636F6C6F723A233333333B746578742D736861646F773A317078203170782031707820236464643B626F726465722D7261646975733A313570783B746578742D616C69676E3A63656E7465723B746578742D6465636F726174696F6E3A6E6F6E65'';',
'wwv_flow_api.g_varchar2_table(42) := ''3B70616464696E673A3130707820323070783B646973706C61793A696E6C696E652D626C6F636B3B6D617267696E3A3370787D2E627574746F6E3A686F7665727B6261636B67726F756E642D636F6C6F723A236161613B626F726465722D636F6C6F723A'';',
'wwv_flow_api.g_varchar2_table(43) := ''233636363B626F782D736861646F773A3020302033707820327078202363636320696E7365742C2030203370782033707820233131317D2E627574746F6E2E686F747B6261636B67726F756E642D636F6C6F723A233263323B626F726465723A31707820'';',
'wwv_flow_api.g_varchar2_table(44) := ''736F6C696420233238323B626F782D736861646F773A3020302033707820327078202332653220696E7365742C2030203370782033707820233333333B636F6C6F723A236631663166313B746578742D736861646F773A31707820317078203170782023'';',
'wwv_flow_api.g_varchar2_table(45) := ''3333333B6D617267696E3A3370787D2E627574746F6E2E686F743A686F7665727B6261636B67726F756E642D636F6C6F723A233261323B626F726465722D636F6C6F723A233236323B626F782D736861646F773A30203020337078203270782023326332'';',
'wwv_flow_api.g_varchar2_table(46) := ''20696E7365742C2030203370782033707820233131317D2E746578745F6669656C647B6261636B67726F756E642D636F6C6F723A236661666166613B626F726465723A31707820736F6C69642073696C7665723B626F726465722D7261646975733A3370'';',
'wwv_flow_api.g_varchar2_table(47) := ''783B626F782D736861646F773A337078203370782033707820233333333B626F782D73697A696E673A626F726465722D626F783B636F6C6F723A233333333B6865696768743A313030253B70616464696E673A327078203570783B6D617267696E3A3370'';',
'wwv_flow_api.g_varchar2_table(48) := ''787D7370616E2E6C6162656C2D6572726F727B636F6C6F723A236563323532653B646973706C61793A626C6F636B3B6D617267696E3A3020337078203370787D6C6162656C2E6C6162656C2D6F7074696F6E616C7B646973706C61793A626C6F636B3B6D'';',
'wwv_flow_api.g_varchar2_table(49) := ''617267696E3A3132707820337078203370787D2E70617065727B6D617267696E2D72696768743A3670783B6D617267696E2D626F74746F6D3A313870783B6261636B67726F756E642D636F6C6F723A236665666566653B626F726465722D726164697573'';',
'wwv_flow_api.g_varchar2_table(50) := ''3A3170783B6C65747465722D73706163696E673A2D3170783B636F6C6F723A233636363B77696474683A313030253B666F6E742D73697A653A312E34656D3B746578742D616C69676E3A63656E7465723B626F782D736861646F773A3020302033307078'';',
'wwv_flow_api.g_varchar2_table(51) := ''207267626128302C20302C20302C20302E312920696E7365742C20317078203170782030207267626128302C302C302C302E313030292C203370782033707820302072676261283234302C3234302C3234302C20312E30292C2034707820347078203020'';',
'wwv_flow_api.g_varchar2_table(52) := ''7267626128302C302C302C302E313235292C203670782036707820302072676261283234302C3234302C3234302C312E30292C20377078203770782030207267626128302C302C302C302E313530292C203970782039707820302072676261283234302C'';',
'wwv_flow_api.g_varchar2_table(53) := ''3234302C3234302C312E30292C203130707820313070782030207267626128302C302C302C302E313735292C203130707820313270782034707820233333337D2E70617065722074647B626F726465722D746F703A31707820736F6C6964202339316431'';',
'wwv_flow_api.g_varchar2_table(54) := ''64333B636F6C6F723A233333337D2E70617065722074682C622C7374726F6E677B666F6E742D7765696768743A3730307D2E73636F72652D636172647B77696474683A6175746F3B666F6E742D73697A653A2E38656D3B6D617267696E2D626F74746F6D'';',
'wwv_flow_api.g_varchar2_table(55) := ''3A313270787D2E73636F72652D636172642074642E63656C6C317B626F726465722D6C6566743A31707820736F6C696420233931643164333B70616464696E672D6C6566743A3870783B746578742D616C69676E3A6C6566747D2E73636F72652D636172'';',
'wwv_flow_api.g_varchar2_table(56) := ''642074642E63656C6C327B70616464696E673A317078203870783B746578742D616C69676E3A72696768747D2E73636F72652D636172642074642E746F702D626F726465727B626F726465722D746F703A32707820736F6C696420233636367D2E73636F'';',
'wwv_flow_api.g_varchar2_table(57) := ''72652D636172642074642E73696465203E206469767B666C6F61743A6C6566743B6D617267696E3A303B70616464696E673A303B626F74746F6D3A303B6C6566743A303B6F766572666C6F773A76697369626C653B77686974652D73706163653A6E6F77'';',
'wwv_flow_api.g_varchar2_table(58) := ''7261703B2D7765626B69742D7472616E73666F726D3A726F74617465282D3930646567293B2D6D732D7472616E73666F726D3A726F74617465282D3930646567293B7472616E73666F726D3A726F74617465282D3930646567293B77696474683A323070'';',
'wwv_flow_api.g_varchar2_table(59) := ''787D2E73636F72652D636172642074642E73636F72652D626F787B6865696768743A323870783B77696474683A343870787D2E73636F72652D636172642074642E73636F72652D626F78203E20617B6261636B67726F756E642D636F6C6F723A23666166'';',
'wwv_flow_api.g_varchar2_table(60) := ''6166613B626F726465723A31707820736F6C69642073696C7665723B626F726465722D7261646975733A3370783B626F782D73697A696E673A626F726465722D626F783B636F6C6F723A233333333B646973706C61793A626C6F636B3B666F6E742D7765'';',
'wwv_flow_api.g_varchar2_table(61) := ''696768743A3730303B70616464696E673A30203570783B77696474683A313030253B6865696768743A313030253B626F782D736861646F773A30203020317078202333333320696E7365747D2E73636F72652D636172642074642E73636F72652D626F78'';',
'wwv_flow_api.g_varchar2_table(62) := ''203E2061203E207370616E7B6D617267696E2D72696768743A3370787D2E73636F72652D636172642074723A66697273742D6368696C642074647B626F726465722D746F703A6E6F6E657D2E73636F72652D636172642074723A6C6173742D6368696C64'';',
'wwv_flow_api.g_varchar2_table(63) := ''2074647B666F6E742D7765696768743A3730303B70616464696E672D746F703A3270783B70616464696E672D626F74746F6D3A3270787D0A406D65646961206F6E6C792073637265656E20616E6420286D61782D77696474683A3735307078297B2E636F'';',
'wwv_flow_api.g_varchar2_table(64) := ''6C5F32352C2E636F6C5F33332C2E636F6C5F34302C2E636F6C5F35307B77696474683A3938253B666C6F61743A6E6F6E657D2E6D65737361676573207B706F736974696F6E3A207374617469637D7D0A406D65646961206F6E6C792073637265656E2061'';',
'wwv_flow_api.g_varchar2_table(65) := ''6E6420286D61782D77696474683A3438307078297B2E6865616465727B6D617267696E2D626F74746F6D3A307D2E6C6F676F7B646973706C61793A626C6F636B3B666C6F61743A6E6F6E653B746578742D616C69676E3A63656E7465727D2E626F617264'';',
'wwv_flow_api.g_varchar2_table(66) := ''7B70616464696E672D746F703A31253B70616464696E672D6C6566743A31257D7D'';',
' ',
'end;',
'/',
'',
'declare',
'  l_name   varchar2(255);',
'begin',
'  l_name := ''yatzy.min.css'';',
' ',
'  wwv_flow_api.create_or_remove_file(',
'     p_name=> l_name,',
'     p_varchar2_table=> wwv_flow_api.g_varchar2_table,',
'     p_mimetype=> ''text/css'',',
'     p_location=> ''WORKSPACE'',',
'     p_mode=> ''CREATE_OR_REPLACE'',',
'     p_type=> ''CSS'');',
' ',
'end;',
'/',
'',
''))
);
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, true));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
