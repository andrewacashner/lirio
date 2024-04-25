%% graphics.ly
%% Andrew Cashner, 2016/12/07
%%
%% Include EPS file as graphic
%% Designed for cropped output from latex+dvips 
%% (E.g., output of `latex file && dvips -E -o file.eps file.dvi` )
%%
%% Argument must be name of EPS file with extension (e.g., "file.eps")
%% Is included as \mark with vertical space below
%% Magnification size is just what happened to work with original example
%% Priority is set so that this appears above other marks or markup

\version "2.22"

IncludeGraphicsAbove =
#(define-scheme-function
  (filename) (string?)
  #{
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.outside-staff-priority=#4000
  \mark \markup { \column { 
  \line { \epsfile #X #80 $filename }
  \line { \vspace #5 } } }
  #})

