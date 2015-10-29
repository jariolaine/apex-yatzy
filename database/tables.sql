create table yatzy_template_score_card
(
  seq_id number(2,0) not null
, input_field char(1) not null
, label_msg varchar2(30) not null
, card_section varchar2(30) not null
, constraint yatzy_template_score_card_pk primary key ( seq_id )
, constraint yatzy_template_score_card_uk1 unique ( label_msg )
, constraint yatzy_template_score_card_ck1 check ( seq_id between 1 and 19 )
, constraint yatzy_template_score_card_ck2 check ( input_field in ( 'N', 'Y' ) )
, constraint yatzy_template_score_card_ck3 check ( card_section in( 'UPPER', 'MIDDLE', 'LOWER', 'TOTAL' ) )
)
/
comment on table yatzy_template_score_card is 'Yatzy score card template. Metadata for Yatzy game'
/
comment on column yatzy_template_score_card.seq_id is 'Primary key / record order in score card'
/
comment on column yatzy_template_score_card.input_field is 'Is score box'
/
comment on column yatzy_template_score_card.label_msg is 'APEX text message for score card row label'
/
comment on column yatzy_template_score_card.card_section is 'Section in score card'
/

create table yatzy_saved_score_card
(
  sgid number not null
, game_id number not null
, insert_time timestamp with time zone default systimestamp not null
, apex_session_id number not null
, seq_id number not null
, player_name varchar2(256) not null
, score number not null
, constraint yatzy_saved_score_card_pk primary key ( sgid )
, constraint yatzy_saved_score_card_uk1 unique ( game_id, sgid )
, constraint yatzy_saved_score_card_uk2 unique ( seq_id, game_id )
, constraint yatzy_saved_score_card_fk1 foreign key ( seq_id ) references yatzy_template_score_card ( seq_id )
, constraint yatzy_saved_score_card_ck1 check ( sgid > 0 )
, constraint yatzy_saved_score_card_ck2 check ( game_id > 0 )
)
/
comment on table yatzy_saved_score_card is 'Yatzy saved scores / Yatzy game high scores'
/
comment on column yatzy_saved_score_card.sgid is 'Surrogate primary key'
/
comment on column yatzy_saved_score_card.game_id is 'Surrogate key for game'
/
comment on column yatzy_saved_score_card.apex_session_id is 'APEX session id'
/
comment on column yatzy_saved_score_card.insert_time is 'Insert time / when game was played'
/
comment on column yatzy_saved_score_card.seq_id is 'Order in score card. references yatzy_template_score_card.seq_id'
/
comment on column yatzy_saved_score_card.player_name is 'Who did play game'
/
comment on column yatzy_saved_score_card.score is 'Player score'
/
create or replace
trigger yatzy_saved_score_card_bi
before insert on yatzy_saved_score_card
for each row
declare
    l_game_id number;
begin
    if inserting then
        if :new.sgid is null then
            :new.sgid := yatzy_seq.nextval;
        end if;
    end if;
end;
/