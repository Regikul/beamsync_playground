%%%-------------------------------------------------------------------
%% @doc beamsync_playground public API
%% @end
%%%-------------------------------------------------------------------

-module(beamsync_playground_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    beamsync_playground_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
