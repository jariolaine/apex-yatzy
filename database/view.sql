create or replace view yatzy_score_card_vw
as
select seq_id,
	c001 as label_mesg,
	apex_lang.message ( c001 ) as label,
	c002 as input_field,
	c003 as card_section,
	n001 as entered_points,
	n002 as possible_points,
	n003 as rowspan,
	apex_lang.lang ( c003 ) as section_label,
	c004 as input_field_class
from apex_collections
where 1 = 1
and collection_name = yatzy_collection.get_collection_name
/