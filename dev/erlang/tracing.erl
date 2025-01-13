# Trace all calls to Module

Tracer = self().
Match = [{'_', [], [{return_trace}]}].
Module = '_'
Function '_'
erlang:trace_pattern({Module, Function, '_'}, Match, [local]).
erlang:trace(all, true, [call, timestamp, {tracer, Tracer}]).

PrettyPrintContent = fun(Ckey) ->
   {ok, ContentTerm} = loco_content:get(Ckey),
   ContentJSON = jsx:prettify(jsx:encode(ContentTerm)),
   io:format("~s", [ContentJSON])
end.
