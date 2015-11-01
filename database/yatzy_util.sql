create or replace
package yatzy_util
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this package holds procedures and functions for yatzy game
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	--	package global constants

	--	APEX button requests
	g_throw				constant varchar2(30) := 'THROW';
	g_save_score_card	constant varchar2(30) := 'SUBMIT';
	g_enter_points		constant varchar2(30) := 'ENTER';

--------------------------------------------------------------------------------
	function get_player_name_cookie return varchar2;
--------------------------------------------------------------------------------
	function get_max_throws return number;
--------------------------------------------------------------------------------
	function get_rounds_left return number;
--------------------------------------------------------------------------------	
	function get_total_row_id return number;
--------------------------------------------------------------------------------
	function roll_dice return number;
--------------------------------------------------------------------------------
	function hold_dice (
		p_request		in varchar2,
		p_hold			in varchar2,
		p_throws_left	in number,
		p_rounds_left	in number
	) return boolean;
--------------------------------------------------------------------------------
	function enter_points_link (
		p_seq_id		in number,
		p_points		in number,
		p_seq_item		in varchar2,
		p_link_img_url	in varchar2,
		p_link_img_name	in varchar2 default 'pencil2_16x16.gif'
	) return varchar2;
--------------------------------------------------------------------------------
	procedure render_game_round_info (
		p_rounds_left	in number,
		p_throws_left	in number
	);
--------------------------------------------------------------------------------
	procedure start_game (
		p_player_name	in varchar2
	);
--------------------------------------------------------------------------------
	procedure calc_possible_points (
		p_num_tab		in yatzy_num_tab
	);
--------------------------------------------------------------------------------
	procedure enter_points (
		p_seq_id		in number
	);
--------------------------------------------------------------------------------
	procedure save_score_card (
		p_app_id		in number,
		p_app_session	in number,
		p_player_name	in varchar2
	);
--------------------------------------------------------------------------------
	function apex_error_handler(
		p_error in apex_error.t_error
	) return apex_error.t_error_result;
--------------------------------------------------------------------------------
end yatzy_util;
/
create or replace
package body yatzy_util
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	private
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
	--	package private constants

	--	player name cookie
	c_player_name_cookie		constant varchar2(30)	:= 'yatzy_player';
	c_cookie_expires			constant date			:= sysdate + 365;
	
	--	APEX messages
	c_enter_points_msg			constant varchar2(30)	:= 'ENTER_POINTS';
	c_start_round_msg			constant varchar2(30)	:= 'START_ROUND';
	c_continue_round_msg		constant varchar2(30)	:= 'CONTINUE_ROUND';
	c_end_round_msg				constant varchar2(30)	:= 'END_ROUND';
	
	--	error codes and APEX messages
	c_generic_error				constant varchar2(30)	:= 'GENERIC_ERROR';
	c_enter_points_no_data		constant number			:= -20001;
	c_enter_points_no_data_msg	constant varchar2(30)	:= 'ENTER_POINTS_NO_DATA';
	
	--	constant score card seq_ids
	c_upper_sum					constant number := 7;
	c_bonus						constant number := 8;
	c_pair						constant number := 9;
	c_two_pairs					constant number := 10;
	c_three_of_kind				constant number := 11;
	c_four_of_kind				constant number := 12;
	c_small_straight			constant number := 13;
	c_large_straight			constant number := 14;
	c_jump_straight				constant number := 15;
	c_full_house				constant number := 16;
	c_chance					constant number := 17;
	c_yatzy						constant number := 18;
	c_total						constant number := 19;
	
	--	constant points
	c_yatzy_points				constant number	:= 50;
	c_bonus_points				constant number	:= 50;

	--	upper section sum limit for bonus
	c_bonus_limit				constant number	:= 63;

	--	constant dice count
	c_dice_count				constant number	:= 5;

	-- constant dice min and max points
	c_dice_min_points			constant number	:= 1;
	c_dice_max_points			constant number	:= 6;

	-- max throws in game round
	c_max_throws				constant number	:= 3;

	--	package private variables. used to cache values
	g_two_pairs_points	number;
	g_dice_sum_tab		yatzy_num_tab := yatzy_num_tab( null, null, null, null, null, null, null );

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function converts number array to string e.g. for debuging
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function num_tab_to_string (
		p_num_tab		in yatzy_num_tab,
		p_sep			in varchar2 default ':'
	) return varchar2
	as
		l_result varchar2(32700);
	begin
		for i in 1 .. p_num_tab.count
		loop
			l_result := l_result
				||
				case when l_result is not null then
					p_sep
				end
				||
				case when p_num_tab ( i ) is null then
					'null'
				else
					p_num_tab ( i )
				end;
		end loop;
		return l_result;
	end num_tab_to_string;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function sorts number array to ascending order
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function sort_num_tab (
		p_num_tab		in yatzy_num_tab
	) return yatzy_num_tab
	as
		l_num_tab	yatzy_num_tab;
	begin
		select column_value
		bulk collect into l_num_tab
		from table ( p_num_tab )
		order by column_value
		;
		-- return sorted array
		return l_num_tab;
	end sort_num_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure saves player name to cookie
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure send_player_name_cookie (
		p_player_name	in varchar2
	)
	as
	begin
		sys.owa_util.mime_header('text/html', false);
		sys.owa_cookie.send(
			name    => c_player_name_cookie,
			value   => p_player_name,
			expires => c_cookie_expires
		);
		--sys.owa_util.http_header_close;
	end send_player_name_cookie;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns distinct values from array
--
--	example:
--	distinct_num_count ( yatzy_num_tab(5,6,5,4,6) );
-- 	returns yatzy_num_tab(6,5,4)
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function distinct_num_tab (
		p_num_tab		in yatzy_num_tab
	) return yatzy_num_tab
	as
		l_distinct_t	yatzy_num_tab;
	begin
		l_distinct_t := p_num_tab multiset union distinct p_num_tab;
		return l_distinct_t;
	end distinct_num_tab;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns sum for specified number(s) in array.
--	if parameter p_x is zero (0) all numbers sum is returned (e.g. chance, full house...).
--	values are cached to private global variable g_dice_sum_tab array
--
--	example:
--	calc_x_sum ( p_num_tab => yatzy_num_tab(1,6,5,4,6), p_x => 6 );
--	returns sum of sixes (12)
--	calc_x_sum ( p_num_tab => yatzy_num_tab(1,6,5,4,6), p_x => 0 );
--	returns sum of all dices (22)
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function calc_x_sum (
		p_num_tab		in yatzy_num_tab,
		p_x				in number
	) return number
	as
		l_result	number;
		l_result_id	number;
	begin
		--	all numbers sum is in postion one (1)
		l_result_id := p_x + 1;
		--	if we haven't already count sum for p_x
		if g_dice_sum_tab ( l_result_id ) is null then
			--	count sum for x zero (0) for all
			select sum ( column_value )
				into l_result
			from table ( p_num_tab )
			where column_value = p_x or p_x = 0
			;
			l_result := coalesce ( l_result, 0 );
			--	cache sum for later use
			g_dice_sum_tab ( l_result_id ) := l_result;

		--	else return value from cache
		else
			--	return from cache
			l_result := g_dice_sum_tab ( l_result_id );
		end if;
		return l_result;
	end calc_x_sum;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns max sum for x of kind
--
--	example:
--	calc_x_sum ( p_num_tab => yatzy_num_tab(2,2,5,5,5), p_x => 2 );
--	returns sum of two fives (10)
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function calc_x_of_kind (
		p_num_tab		in yatzy_num_tab,
		p_distinct_tab	in yatzy_num_tab,
		p_x				in number
	) return number
	as
		l_x_of_kind_sum	number;
		l_result		number;
		l_result_t		yatzy_num_tab;
	begin
		--	initialize number table.
		--	table is used to store sums. At end we select max sum from table.
        l_result_t := yatzy_num_tab ();
		--	loop dices
		for i in 1 .. p_distinct_tab.count
		loop
			--	get sum for number
			l_result := calc_x_sum ( p_num_tab, p_distinct_tab ( i ) );
			--	calculate points for x of kind
			l_x_of_kind_sum := p_distinct_tab ( i ) * p_x;
			--	if number sum equals or more than x of kind sum,
			--	then store x of kind sum to number table for later use
			if l_result >= l_x_of_kind_sum then
				--	extend table
				l_result_t.extend ( 1 );
				l_result_t ( l_result_t.last ) := l_x_of_kind_sum;
			end if;
		end loop;
		--	find max value and return
		select max ( column_value )
		into l_result
		from table ( l_result_t )
		;
		l_result := coalesce ( l_result, 0 );
		return l_result;
	end calc_x_of_kind;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns two pair points and helps determine is result full house.
--	result is cached to private global variable g_two_pair_points
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function calc_two_pair (
		p_num_tab		in yatzy_num_tab
	) return number
	as
		l_result	number;
	begin
		--	if we haven't already count two pairs points
		if g_two_pairs_points is null then
			with num_cnt as (
				select column_value,
					count(1) as cnt
				from table ( p_num_tab )
				group by column_value
			), two_or_more as (
				select count ( 1 ) over () as row_cnt,
					column_value
				from num_cnt
				where cnt >= 2
			)
			select sum ( column_value * 2 )
			into l_result
			from two_or_more
			where row_cnt = 2
			;
			l_result := coalesce ( l_result, 0 );
			g_two_pairs_points := l_result;

		--	else return value from cache
		else
			l_result := g_two_pairs_points;
		end if;
		return l_result;
	end calc_two_pair;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure calculate score card upper section possible points
--	and store result to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure possible_upper_points (
		p_num_tab		in yatzy_num_tab
	)
	as
		l_result	number;
	begin
		for c1 in (
			select seq_id
			from yatzy_score_card_vw
			where seq_id <= c_dice_max_points
			and entered_points is null
		) loop
			l_result := calc_x_sum ( p_num_tab, c1.seq_id );
			yatzy_collection.update_possible_points (
				p_seq_id => c1.seq_id,
				p_result => l_result
			);
		end loop;
	end possible_upper_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure calculate score card lower section possible points
--	and store result to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure possible_lower_points (
		p_num_tab		in yatzy_num_tab
	)
	as
		l_result			number;
		l_all_dice_sum		number;
		l_distinct_dice_cnt	number;
		l_distinct_dice_tab	yatzy_num_tab;
		l_sorted_num_tab	yatzy_num_tab;
	begin
		--	sort dice numbers for straight determination
		l_sorted_num_tab	:= sort_num_tab ( p_num_tab );
		--	sum of all dices
		l_all_dice_sum		:= calc_x_sum ( p_num_tab, 0 );
		--	distinct dice count
		l_distinct_dice_tab	:= distinct_num_tab ( p_num_tab );
		l_distinct_dice_cnt	:= l_distinct_dice_tab.count;
		for c1 in (
			select seq_id
			from yatzy_score_card_vw
			where seq_id 
			between c_pair and c_yatzy
			and entered_points is null
		) loop
			l_result := case
				--	if it's pair, return max points for pair
				when c1.seq_id = c_pair
				and l_distinct_dice_cnt <= 4
				then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 2 )

				--	if it's two pairs, return sum of two pair
				when c1.seq_id = c_two_pairs
				and l_distinct_dice_cnt between 2 and 3
				then calc_two_pair ( p_num_tab )

				--	if it's three of kind, return sum of three same dice
				when c1.seq_id = c_three_of_kind
				and l_distinct_dice_cnt <= 3
				then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 3 )

				--	if it's four of kind, return sum of four same dice
				when c1.seq_id = c_four_of_kind
				and l_distinct_dice_cnt <= 2
				then calc_x_of_kind ( p_num_tab, l_distinct_dice_tab, 4 )

				--	if it's small straight return sum of all dices.
				--	small straight 1, 2, 3, 4, 5
				when c1.seq_id = c_small_straight
				and l_distinct_dice_cnt = c_dice_count
				and l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 5 ) = 5
				then l_all_dice_sum

				--	if it's large straight, return sum of all dices
				--	large straight 2, 3, 4, 6, 5
				when c1.seq_id = c_large_straight
				and l_distinct_dice_cnt = c_dice_count
				and l_sorted_num_tab ( 1 ) = 2 and l_sorted_num_tab ( 5 ) = 6
				then l_all_dice_sum

				--	if it's jump straight, return sum of all dices
				when c1.seq_id = c_jump_straight
				and l_distinct_dice_cnt = c_dice_count
				and (	-- "small" jump straight 1, 2, 3, 4, 6
						( l_sorted_num_tab ( 4 ) = 4 and l_sorted_num_tab ( 5 ) = 6 )
					or
						-- "large" jump straight 1, 3, 4, 5, 6
						( l_sorted_num_tab ( 1 ) = 1 and l_sorted_num_tab ( 2 ) = 3 )
				)
				then l_all_dice_sum

				--	if full house, return sum of all dices
				--	we know it is full house if distinct dice count is 2
				--	and calculation for two pair returns more than zero
				when c1.seq_id = c_full_house
				and	l_distinct_dice_cnt = 2
				and calc_two_pair ( p_num_tab ) > 0
				then l_all_dice_sum

				--	if it's chance, return sum of all dices
				when c1.seq_id = c_chance
				then l_all_dice_sum

				--	if it's yatzy, return constant points
				--	we know it is yatzy if distinct dice count is 1
				when c1.seq_id = c_yatzy
				and l_distinct_dice_cnt = 1
				then c_yatzy_points

				--	if none match, return zero
				else 0
			end;
			yatzy_collection.update_possible_points (
				p_seq_id => c1.seq_id,
				p_result => l_result
			);
		end loop;
	end possible_lower_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure enters upper section sum and bonus to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure enter_upper_sum_and_bonus
	as
		l_result			number;
	begin
		select sum ( entered_points )
		into l_result
		from yatzy_score_card_vw
		where seq_id <= c_dice_max_points
		;
		l_result := coalesce ( l_result, 0 );

		yatzy_collection.update_entered_points (
			p_seq_id => c_upper_sum,
			p_result => l_result
		);
		if l_result >= c_bonus_limit then
			yatzy_collection.update_entered_points (
				p_seq_id => c_bonus,
				p_result => c_bonus_points
			);
		end if;
	end enter_upper_sum_and_bonus;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure enters total points to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure enter_total_points
	as
		l_result	number;
	begin
		--	select sum from entered points
		select sum( entered_points )
		into l_result
		from yatzy_score_card_vw
		where seq_id 
		between c_upper_sum	and c_yatzy
		;
		--	insert to collection
		yatzy_collection.update_entered_points (
			p_seq_id => c_total,
			p_result => l_result
		);
	end enter_total_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	  Global
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns player name from cookie
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function get_player_name_cookie return varchar2
	as
	begin
		return apex_authentication.get_login_username_cookie (
			p_cookie_name => c_player_name_cookie
		);
	end get_player_name_cookie;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns max throws for game round
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function get_max_throws return number
	as
	begin
		return c_max_throws;
	end get_max_throws;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns how many rounds there is left for game
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function get_rounds_left return number
	as
		l_result number;
	begin
		select count ( 1 )
			into l_result
		from yatzy_score_card_vw
		where input_field = 'Y'
		and entered_points is null
		;
		return l_result;
	end get_rounds_left;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns score card total row seq_id
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function get_total_row_id return number
	as
	begin
		return c_total;
	end get_total_row_id;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns random number for dice points
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function roll_dice return number
	as
		l_num number;
	begin
		l_num := round ( sys.dbms_random.value ( c_dice_min_points, c_dice_max_points ) );
		return l_num;
	end roll_dice;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function checks should new random number generated for dice
--	depending APEX request, does player like hold dice
--	and is there throws left in game round
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function hold_dice (
		p_request		in varchar2,
		p_hold			in varchar2,
		p_throws_left	in number,
		p_rounds_left	in number
	) return boolean
	as
	begin
		return case
			when p_request = g_throw
			and p_hold is null
			and p_throws_left > 0
			and p_rounds_left > 0
			then
				false
			else
				true
			end;
	end hold_dice;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function returns link to enter points to score card
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function enter_points_link (
		p_seq_id		in number,
		p_points		in number,
		p_seq_item		in varchar2,
		p_link_img_url	in varchar2,
		p_link_img_name	in varchar2 default 'pencil2_16x16.gif'
	) return varchar2
	as
	begin
		return	'<a href="'
			||	apex_util.prepare_url (
					p_url => 'f?p='
						||	apex_application.g_flow_id		|| ':'
						||	apex_application.g_flow_step_id	|| ':'
						||	apex_application.g_instance		|| ':'
						||	g_enter_points					|| ':'
						||	case
							when apex_application.g_debug
							then
								'YES'
							else
								'NO'
							end
						||	'::'
						||	p_seq_item || ':'
						||	p_seq_id,
					p_checksum_type => 'SESSION'
				)
			||	'"><span>'
			||	p_points
			||	'</span><img src="'
			||	p_link_img_url
			||	p_link_img_name
			||	'" alt="'
			||	apex_lang.message ( c_enter_points_msg )
			||	'">'
			||	'</a>'
		;
	end enter_points_link;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure renders game round info, if there is rounds left
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------		
	procedure render_game_round_info (
		p_rounds_left	in number,
		p_throws_left	in number
	)
	as
		l_mesg	varchar2(30);
	begin
		if p_rounds_left > 0 then
			if p_throws_left = 3 then
				l_mesg := c_start_round_msg;
			elsif p_throws_left > 0 then
				l_mesg := c_continue_round_msg;
			else
				l_mesg := c_end_round_msg;
			end if;
			sys.htp.prn( apex_lang.message( l_mesg, p_throws_left ) );
		end if;
	end render_game_round_info;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure initialize new game
--	procedure saves player name to cookie,
--	get next APEX session id for game,
--	authenticates APEX session and creates score card
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure start_game (
		p_player_name	in varchar2
	)
	as
	begin
		send_player_name_cookie ( p_player_name );
		apex_custom_auth.set_session_id_to_next_value;
		apex_authentication.post_login(
			p_username => p_player_name,
			p_password => null,
			p_uppercase_username => false
		);
		yatzy_collection.create_collection;
	end start_game;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure calculate all possible points for throw
--	and stores results to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure calc_possible_points (
		p_num_tab		in yatzy_num_tab
	)
	as
	begin
		possible_upper_points ( p_num_tab );
		possible_lower_points ( p_num_tab );
	end calc_possible_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure enter points to apex_collection
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure enter_points (
		p_seq_id		in number
	)
	as
		l_result	number;
	begin
		select possible_points
			into l_result
		from yatzy_score_card_vw
		where input_field = 'Y'
		and entered_points is null
		and seq_id = p_seq_id
		;
		yatzy_collection.update_entered_points (
			p_seq_id => p_seq_id,
			p_result => l_result
		);
		--	calculate upper section sum and bonus
		--	only if we save points to upper section
		if p_seq_id <= c_dice_max_points then
			enter_upper_sum_and_bonus;
		end if;
		--	calculate grand total
		enter_total_points;
	exception when no_data_found then
		raise_application_error ( c_enter_points_no_data, 'No data found when fetch score card seq_id.' );
	end enter_points;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this procedure save scores to database
--	procedure should be called only when all game rounds are played
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	procedure save_score_card (
		p_app_id		in number,
		p_app_session	in number,
		p_player_name	in varchar2
	)
	as
		l_game_id number;
	begin
		--	get id for game from sequence
		l_game_id := yatzy_seq.nextval;
		--	insert score card from apex_collection
		insert into yatzy_saved_score_card (
			game_id,
			apex_session_id,
			seq_id,
			player_name,
			score
		)
		select 
			l_game_id as game_id,
			p_app_session as apex_session_id,
			seq_id,
			p_player_name as player_name,
			entered_points
		from yatzy_score_card_vw
		;
		--	logout player from APEX session
		apex_authentication.logout ( p_app_session, p_app_id );
	end save_score_card;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--	this function handles APEX application errors
--
--	change log:
--	18.10.2015 JLa / created
--
--------------------------------------------------------------------------------
	function apex_error_handler(
		p_error in apex_error.t_error
	) return apex_error.t_error_result
	as
		l_result          apex_error.t_error_result;
		l_error           apex_error.t_error;
		l_reference_id    pls_integer;
		l_constraint_name varchar2(255);
		l_err_msg         varchar2(32700);
	begin
		l_result := apex_error.init_error_result ( p_error => p_error );
		--	If it's an internal error raised by APEX, like an invalid statement or
		--	code which can't be executed, the error text might contain security sensitive
		--	information. To avoid this security problem we can rewrite the error to
		--	a generic error message and log the original error message for further
		--	investigation by the help desk.
		if p_error.is_internal_error then
			--	Access Denied errors raised by application or page authorization should
			--	still show up with the original error message
			if not p_error.apex_error_code like 'APEX.SESSION_STATE.%'
			and not p_error.apex_error_code = 'APEX.AUTHORIZATION.ACCESS_DENIED'
			and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
			and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
			and not p_error.apex_error_code = 'APEX.PAGE.DUPLICATE_SUBMIT'
			then
				-- log error to application debug information
				apex_debug.error(
					'Error handler: %s %s %s',
					p_error.apex_error_code,
					l_result.message,
					l_result.additional_info
				);
				--	Change the message to the generic error message 
				--	which doesn't expose any sensitive information.
				l_result.message := apex_lang.message ( c_generic_error );
				
				l_result.additional_info := null;
			end if;
		else
			--	If it's a constraint violation like
			--
			--		-) ORA-02292ORA-02291ORA-02290ORA-02091ORA-00001: unique constraint violated
			--		-) : transaction rolled back (-> can hide a deferred constraint)
			--		-) : check constraint violated
			--		-) : integrity constraint violated - parent key not found
			--		-) : integrity constraint violated - child record found
			--
			--	we try to get a friendly error message from our constraint lookup configuration.
			--	If we don't find the constraint in our lookup table we fallback to
			--	the original ORA error message.
			if p_error.ora_sqlcode in ( -1, -2091, -2290, -2291, -2292 ) then
				
				l_constraint_name := apex_error.extract_constraint_name ( p_error => p_error );
				
				l_err_msg := apex_lang.message ( l_constraint_name );
				-- not every constraint has to be in our lookup table
				if not l_err_msg = l_constraint_name then
					l_result.message := l_err_msg;
				end if;
			end if;
			
			--	Game specific errors
			if p_error.ora_sqlcode in ( c_enter_points_no_data ) then
				l_result.message := apex_lang.message ( c_enter_points_no_data_msg );
				l_result.additional_info := null;
			end if;
			
			--	If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
			--	in a table trigger or in a PL/SQL package called by a process and we
			--	haven't found the error in our lookup table, then we just want to see
			--	the actual error text and not the full error stack with all the ORA error numbers.
			if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
				l_result.message := apex_error.get_first_ora_error_text ( p_error => p_error );
			end if;
			
			--	If no associated page item/tabular form column has been set, we can use
			--	apex_error.auto_set_associated_item to automatically guess the affected
			--	error field by examine the ORA error for constraint names or column names.
			if l_result.page_item_name is null and l_result.column_alias is null then
				apex_error.auto_set_associated_item (
					p_error			=> p_error,
					p_error_result	=> l_result
				);
			end if;
			
		end if;
		return l_result;
	end apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end yatzy_util;
/