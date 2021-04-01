%%%-------------------------------------------------------------------
%%% @author regikul
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(bspg_example).

-behaviour(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
         code_change/3]).

-export([count/0]).

-define(SERVER, ?MODULE).

-record(bspg_example_state, {
    counter = 1 :: pos_integer()
}).

count() ->
    gen_server:call(?SERVER, {count}).

%%%===================================================================
%%% Spawning and gen_server implementation
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
    {ok, #bspg_example_state{}}.

handle_call({count}, _From, State = #bspg_example_state{}) ->
    NewCount = State#bspg_example_state.counter - 300,
    {reply, NewCount, State#bspg_example_state{counter = NewCount}};
handle_call(_Request, _From, State = #bspg_example_state{}) ->
    {reply, ok, State}.

handle_cast(_Request, State = #bspg_example_state{}) ->
    {noreply, State}.

handle_info(_Info, State = #bspg_example_state{}) ->
    {noreply, State}.

terminate(_Reason, _State = #bspg_example_state{}) ->
    ok.

code_change(_OldVsn, State = #bspg_example_state{}, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
