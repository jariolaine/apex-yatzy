create or replace
package yatzy_plugin
authid definer
as
--------------------------------------------------------------------------------
	function render_dice (
		p_item                in apex_plugin.t_page_item,
		p_plugin              in apex_plugin.t_plugin,
		p_value               in varchar2,
		p_is_readonly         in boolean,
		p_is_printer_friendly in boolean
	) return apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
	function render_hold_dice (
		p_item                in apex_plugin.t_page_item,
		p_plugin              in apex_plugin.t_plugin,
		p_value               in varchar2,
		p_is_readonly         in boolean,
		p_is_printer_friendly in boolean
	) return apex_plugin.t_page_item_render_result;
--------------------------------------------------------------------------------
end yatzy_plugin;
/
create or replace
package body yatzy_plugin
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	function render_dice (
		p_item					in apex_plugin.t_page_item,
		p_plugin				in apex_plugin.t_plugin,
		p_value					in varchar2,
		p_is_readonly			in boolean,
		p_is_printer_friendly	in boolean
	) return apex_plugin.t_page_item_render_result
	as
		l_dots		varchar2(30);
		l_value		number;
		l_result	apex_plugin.t_page_item_render_result;
	begin
	
		begin
			l_value := round ( to_number( p_value ) );
			if not l_value between 1 and 6 then
				l_value := null;
			end if;
		exception when
			value_error or
			invalid_number
		then
			l_value := null;
		end;
		
		l_dots := to_char( to_date ( l_value, 'j' ) , 'jsp' );
		sys.htp.p(
				'<div id="' || p_item.name || '" class="die-container'
			||	case when p_is_readonly then
					' hold-die'
				end
			||	'"><div class="die'
			||	case when l_dots is not null then
					' ' || l_dots || '" title="' || apex_lang.lang ( initcap( l_dots ) )
				end
			||	'">'
			||	'<span class="dot"></span></div></div>'
		);

		-- tell apex that this field is not navigable
		l_result.is_navigable := false;
		return l_result;
	end render_dice;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	function render_hold_dice (
		p_item					in apex_plugin.t_page_item,
		p_plugin				in apex_plugin.t_plugin,
		p_value					in varchar2,
		p_is_readonly			in boolean,
		p_is_printer_friendly	in boolean
	) return apex_plugin.t_page_item_render_result
	as
		l_speed		number;
		l_distance	varchar2(30);
		l_times		varchar2(30);
		l_name		varchar2(30);
		l_dice_id	varchar2(30);
		l_effect	varchar2(30);
		l_code		varchar2(256);
		l_value		constant varchar2(30) := 'HOLD';
		l_result	apex_plugin.t_page_item_render_result;
	begin
		l_name		:= apex_plugin.get_input_name_for_page_item ( false );
		l_dice_id	:= p_item.attribute_01;
		
		sys.htp.p(
				'<input type="hidden"'
			||	case when p_value is not null then
					' value="' || l_value || '"'
				else
					' value=""'
				end
			||	' name="' || l_name || '" id="' || p_item.name || '">'
		);

		if p_value is null then
			l_times	:= to_char ( round ( dbms_random.value ( 4, 8 ), 0 ), 'fm999990' );
			l_distance := to_char ( round ( dbms_random.value ( 30, 50 ), 0 ), 'fm999990' );
			
			l_speed	:= round ( dbms_random.value ( 120, 140 ), 0 );
			if to_number( regexp_replace ( apex_application.g_flow_schema_owner, '[^[:digit:]]' ) ) <  50000 then
				l_effect	:= 'jquery.effects.bounce';
			else
				l_effect	:= 'jquery.ui.effect-bounce';
				l_speed		:= l_speed * 2.2;
			end if;
			apex_javascript.add_3rd_party_library_file (
				p_library	=>	apex_javascript.c_library_jquery_ui,
				p_file_name	=>	l_effect
			);
			l_code := '.effect("bounce",{distance:' || l_distance || ',times:' || l_times || '},' || to_char ( l_speed, 'fm999990' ) || ')';
		end if;

		if not p_is_readonly then
			l_code := l_code
				||	'.click(function(e){'
				||	'$(this).toggleClass("hold-die");'
				||	'$("#' || p_item.name || '").val('
				||	'$("#' || p_item.name || '").val().length===0?"' || l_value || '":""'
				||	')});'
			;
		end if;

		if l_code is not null then
			apex_javascript.add_onload_code (
				p_code => '$("#' || l_dice_id || ' ")' || l_code
			);
		end if;

		-- tell apex that this field is not navigable
		l_result.is_navigable := false;
		return l_result;
	end render_hold_dice;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end yatzy_plugin;
/