%% ficta.ly
%% Andrew Cashner, 2016/12/07
%%
%% Commands for musica ficta, small accidentals above staff

\version "2.22"

\include "mark-this-up.ly"

%***************************
%% AUTOMATIC FICTA

ficta = { 
  \once \set suggestAccidentals = ##t 
  \once \override AccidentalSuggestion.avoid-slur = #'inside
}

%%***************************
%% MANUAL FICTA ACCIDENTALS

shMarkup = \markup { \teeny \sharp }
flMarkup = \markup { \teeny \flat }
naMarkup = \markup { \teeny  \natural }

shQMarkup = \markup { \teeny \sharp \raise #-0.5 "?" }
flQMarkup = \markup { \teeny \flat "?" }
naQMarkup = \markup { \teeny \natural \raise #-0.5 "?" }

shBMarkup = \markup { \teeny "[" \sharp "]" }
flBMarkup = \markup { \teeny "[" \flat "]" }
naBMarkup = \markup { \teeny "[" \natural "]" }

sh = \MarkThisUp \shMarkup
fl = \MarkThisUp \flMarkup
na = \MarkThisUp \naMarkup
shQ = \MarkThisUp \shQMarkup
flQ = \MarkThisUp \flQMarkup
naQ = \MarkThisUp \naQMarkup
shB = \MarkThisUp \shBMarkup
flB = \MarkThisUp \flBMarkup
naB = \MarkThisUp \naBMarkup

%% Keep accidentals closer to staff (e.g., not above coloration bracket spanner)
FictaAlign = { \once \override TextScript.outside-staff-priority = #100 }
