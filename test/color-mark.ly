%% color-mark.ly
%% Andrew Cashner, 2016/12/08
%%
%% Print textual \mark in specified color
%%
%% Usage: \ColorMark #red "Mark Text"

\version "2.19"

ColorMark =
#(define-scheme-function
  (MarkColor MarkText) (color? markup?)
  "Print textual \mark in a specified color"
  #{
  \once \override Score.RehearsalMark.color = $MarkColor
  \mark \markup $MarkText
  #})

