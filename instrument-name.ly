%% instrument-name.ly
%% Andrew Cashner, 2016/07/20
%%
%% Shortcuts for making instrument names

\version "2.22"

%% Declare instrument names 
%%  (inside Staff group << >>)
InstrumentName = 
#(define-music-function 
  (longname shortname) (markup? markup?)
  #{ 
  \set Staff.instrumentName = $longname 
  \set Staff.shortInstrumentName = $shortname
  #})

%% Create rotate ChoirStaff name
%%   (inside ChoirStaff group << >>)
ChoirStaffName = 
#(define-scheme-function
  (name) (markup?)
  #{
  \set ChoirStaff.instrumentName = 
  \markup \concat { \hspace #1 \rotate #90 $name }
  #})

%% Or if StaffGroup is used
StaffGroupName = 
#(define-scheme-function
  (name) (markup?)
  #{
  \set StaffGroup.instrumentName = 
  \markup \concat { \hspace #1 \rotate #90 $name }
  #})

%% Or if PianoStaff is used
PianoStaffName = 
#(define-scheme-function
   (longname shortname) (markup? markup?)
   #{
   \set PianoStaff.instrumentName = $longname
   \set PianoStaff.shortInstrumentName = $shortname
   #})

%% Allow for two-line instrument names
TwoLineName = 
#(define-scheme-function
  (first second) (markup? markup?)
  #{
  \markup { \center-column { 
  \line { $first } \line { $second } } }
  #})

%% Show StaffGroup bracket even if only one staff (as in accompaniment)
ShowChoirStaffBracket = {
    \override ChoirStaff.SystemStartBracket.collapse-height = #4
}



