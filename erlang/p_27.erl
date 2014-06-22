-module(p_27).
-export([my_group/2]).
-import(p_26, [combinations/2]).

my_group([], []) ->
    [[]];
my_group([N|Ns], Xs) ->
    [Y ++ Ys || Y <- combinations(N, Xs),
		Ys <- my_group(Ns, Xs -- Y)].

%% 121> length(p_27:my_group([2,3,4], [a,b,c,d,e,f,g,h,i])).
%% 1260
%% 122> length(p_27:my_group([2,2,5], [a,b,c,d,e,f,g,h,i])).
%% 756


