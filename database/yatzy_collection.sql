create or replace
package yatzy_collection
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this package holds procedures and functions for yatzy game score card
--	apex_collection creation and update
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	function get_collection_name return varchar2;
--------------------------------------------------------------------------------
	procedure create_collection;
--------------------------------------------------------------------------------
	procedure update_possible_points (
		p_seq_id		in number,
		p_result		in number
	);
--------------------------------------------------------------------------------
	procedure update_entered_points (
		p_seq_id		in number,
		p_result		in number
	);
--------------------------------------------------------------------------------
end yatzy_collection;
/
create or replace
package body yatzy_collection
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	  private
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	--	package private constants

	--	score card apex_collection name
	c_score_card_collection		constant varchar2(30)	:= 'YATZY_SCORE_CARD';

	--	score card apex_collection number attribute for possible points
	c_possible_points_attr_num	constant number := 2;
	--	score card apex_collection number attribute for entered points
	c_entered_points_attr_num	constant number := 1;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	global
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns score card apex_collection name
--	from package private constant
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function get_collection_name return varchar2
	as
	begin
		return c_score_card_collection;
	end get_collection_name;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure creates score card apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure create_collection
	as
	begin
		if apex_collection.collection_exists ( c_score_card_collection ) then
			apex_collection.delete_collection ( c_score_card_collection );
		end if;
		apex_collection.create_collection_from_queryb2 (
			p_collection_name => c_score_card_collection,
			p_query => q'[
				select
					case
					when input_field = 'N'
					then
						0
					end as entered_points,			/* n001 */
					0 as possible_points,			/* n002 */
					case when count ( seq_id ) over (
						partition by card_section
						order by seq_id
					) = 1 then
						count ( seq_id ) over (
							partition by card_section 
						)
					end as rowspan,					/* n003 */
					null as n004, 					/* n004 */
					null as n005,					/* n005 */
					null as d001,
					null as d002,
					null as d003,
					null as d004,
					null as d005,
					label_msg,
					input_field,
					case when count ( seq_id ) over (
						partition by card_section
						order by seq_id
					) = 1 and input_field = 'Y' then
						card_section
					else
						' '
					end as section_msg,
					case when input_field = 'Y' then
						'score-box'
					end as input_field_class
				from yatzy_template_score_card
				where 1 = 1
				order by seq_id
			]'
		);
	end create_collection;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure updates possible points to score card apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure update_possible_points (
		p_seq_id		in number,
		p_result		in number
	)
	as
	begin
		apex_collection.update_member_attribute (
			p_collection_name => c_score_card_collection,
			p_seq => p_seq_id,
			p_attr_number => c_possible_points_attr_num,
			p_number_value => p_result
		);
	end update_possible_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure updates entered points to score card apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure update_entered_points (
		p_seq_id		in number,
		p_result		in number
	)
	as
	begin
		apex_collection.update_member_attribute (
			p_collection_name => c_score_card_collection,
			p_seq => p_seq_id,
			p_attr_number => c_entered_points_attr_num,
			p_number_value => p_result
		);
	end update_entered_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end yatzy_collection;
/