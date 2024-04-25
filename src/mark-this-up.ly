%% mark-this-up.ly
%% Andrew Cashner, 2016/12/07
%%
%% Apply markup without ^ command
%% (thus could be redefined as _ for lower voice)
%% Usage: note \MarkThisUp "markup"

\version "2.22"

MarkThisUp  =
#(define-event-function
  (markup) (markup?)
  #{ ^\markup $markup #})

MarkThisDown  =
#(define-event-function
  (markup) (markup?)
  #{ _\markup $markup #})
