%% barlines.ly
%% Andrew Cashner, 2016/12/07
%%
%% Semantic barline commands

\version "2.22"

%% BARLINES

MiddleBarSign         = { \bar "||" }
FinalBarSign          = { \bar "|." }
RepeatBarStartSign    = { \bar ".|:-||" }
RepeatBarEndSign      = { \bar ":|." }
RepeatBarEndStartSign = { \bar ":|.|:" }
				% end of one repeat, start of another
RepeatBarSign         = \RepeatBarEndSign

FinalBar          = \FinalBarSign
MiddleBar         = \MiddleBarSign
RepeatBar         = \RepeatBarSign
RepeatBarStart    = \RepeatBarStartSign
RepeatBarEnd      = \RepeatBarEndSign
RepeatBarEndStart = \RepeatBarEndStartSign
