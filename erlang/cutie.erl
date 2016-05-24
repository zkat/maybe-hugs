-module(cutie).

-export([ new/2
        , hug/1
        , run_example/0
        ]).

-type maybehug() :: hugs | empathy.

-opaque cutie() :: #{ name => string()
                    , mood => maybehug()
                    }.

-export_type([cutie/0]).

-spec new(string(), maybehug() ) -> cutie().
new(Name, Mood) ->
  #{name => Name, mood => Mood}.

-spec hug(cutie()) -> ok.
hug(_Cutie = #{mood := hugs, name := Name}) ->
  io:format("Hugs for ~s ~n", [Name]);
hug(_Cutie = #{mood := empathy, name := Name}) ->
  io:format("Empathy for ~s ~n",[Name]).

run_example() ->
  CutieHugsReceiver = cutie:new("bear", hugs),
  ok = cutie:hug(CutieHugsReceiver),
  CutieEmpathyReceiver = cutie:new("dog", empathy),
  ok = cutie:hug(CutieEmpathyReceiver).
