%% section-headings.ly
%% Andrew Cashner, 2016/12/07
%%
%% Section headings, rehearsal marks, and repeat messages like D.C.

\version "2.22"

%%%%%%%%%% SECTION HEADINGS %%%%%%%%%%%%

Section =
#(define-scheme-function
  (SectionText) (markup?)
  "Print a section title"
  #{
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.padding = #6
  \once \override Score.RehearsalMark.outside-staff-priority = #2000
  \mark \markup \fontsize #1.5 $SectionText 
  #})

SectionPadded =
#(define-scheme-function
  (SectionText Padding) (markup? number?)
  "Print a section title and add padding"
  #{
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.padding = $Padding
  \once \override Score.RehearsalMark.outside-staff-priority = #2000
  \mark \markup \fontsize #1.5 $SectionText 
  #})


%%**********************
%% SIMULTANEOUS \marks
%%**********************

%% Puts an extra rehearsal mark at simultaneous moment to the one 
%% that follows. Must be followed by time signature declaration.

HideTimeSignature = { 
  \once \revert Staff.TimeSignature.stencil
  \once \omit Score.TimeSignature
}

HideCautionaryTimeSignature = {
  \once \override Staff.TimeSignature.break-visibility = ##(#f #t #t)
}

HiddenBar = {
  \cadenzaOn
  \HideTimeSignature
  \time 1/16
  s16
  \bar ""
  \cadenzaOff
}

DoubleMark =
#(define-scheme-function
  (mark1 mark2) (ly:music? ly:music?)
  #{
    \cadenzaOn
    \HideTimeSignature
    \time 1/16
    s32 $mark1
    s32 $mark2
    \bar ""
    \cadenzaOff
  #})


%% Must be followed by explicit time signature
%% If time signature is unchanged, do \hide \time etc.
SectionBreak = {
  \break
  \HideCautionaryTimeSignature 
  \HiddenBar
}

%%*******************
%% REPEAT MESSAGES
%%*******************

SegnoSign = \markup \musicglyph "scripts.segno"
Segno =  \mark \markup { \musicglyph "scripts.segno" }
Coda = \mark \markup { \musicglyph "scripts.coda" } 

RepeatMsg = 
#(define-scheme-function
   (msg) (markup?)
   "Print a repeat message like 'D.C. al Fine'"
   #{
   \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
   \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
   \once \override Score.RehearsalMark.padding = #5
   \mark \markup $msg 
   #})

Fine = \RepeatMsg "Fine"
FineEd = \RepeatMsg "[Fine]"

DS = \RepeatMsg "D.S."
DSEd = \RepeatMsg "[D.S.]"

DCalFine = \RepeatMsg "D.C. al Fine"
DCalFineEd = \RepeatMsg "[D.C. al Fine]"

DSalFine = \RepeatMsg "D.S. al Fine"
DSalFineEd = \RepeatMsg "[D.S. al Fine]"

#(define-markup-command
   (TwoLineMarkup layout props one two) (markup? markup?)
   (interpret-markup 
     layout props 
     #{ \markup { \column { 
                    \line { $one } 
                    \line { $two } } } #}))


DCalFineAfterLastCopla =
\RepeatMsg \markup \TwoLineMarkup 
"[D.C. al Fine" 
"  after last copla]"

DSalFineAfterLastCopla =
\RepeatMsg \markup \TwoLineMarkup 
"[D.S. al Fine" 
"  after last copla]" 

DCalFineAfterCoplasOnNextPage = 
\RepeatMsg \markup \TwoLineMarkup 
"[Remaining coplas on next page;"
"  D.C. al Fine after last copla]"

DSalFineAfterCoplasOnNextPage = 
\RepeatMsg \markup \TwoLineMarkup
"[Remaining coplas on next page;"
"  D.S. al Fine after last copla]"



%%*******************************
%% TRADITIONAL REHEARSAL MARKS
%%*******************************

RehearsalMark = { \mark \default }

% ***
% Use the following in version 2.23+
% BoxRehearsalNumbers = \set Score.rehearsalMarkFormatter = #format-mark-box-numbers 
% BoxRehearsalLetters = \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet

%***
% Use the following in version <= 2.22
BoxRehearsalNumbers = \layout { 
  \context {
    \Score 
    \override Score.markFormatter = #format-mark-box-numbers 
  }
}
BoxRehearsalLetters = \layout {
  \context {
    \Score
    \override Score.markFormatter = #format-mark-box-alphabet
  }
}
\BoxRehearsalNumbers % default setting
% *****


