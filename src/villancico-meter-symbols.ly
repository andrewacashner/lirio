%% villancico-meter-symbols.ly
%% Andrew Cashner, 2016/12/07
%%
%% Meter symbols for Cashner villancico edition

\version "2.22"

\include "barlines.ly"

%% METERS for villancico editions

%%****************************************
%% GRAPHIC METERS 

%% the symbol itself 

Cmeter =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup \musicglyph #"timesig.C44" #}))

CutCmeter =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup \musicglyph #"timesig.C22" #}))


CZ =
#(lambda (grob)
  (grob-interpret-markup grob 
   #{ \markup { \epsfile #Y #5 #"img/CZ.eps" } #}))

Z =
#(lambda (grob)
  (grob-interpret-markup grob 
   #{ \markup { \epsfile #Y #5 #"img/Z.eps" } #}))

%% on staff (slightly larger)
CZstaff =
#(lambda (grob)
  (grob-interpret-markup grob 
   (markup
    (#:general-align 1 0.3
     #:epsfile 1 6 "img/CZ.eps"))))

Zstaff =
#(lambda (grob)
  (grob-interpret-markup grob 
   (markup
    (#:general-align 1 0.3
     #:epsfile 1 6 "img/Z.eps"))))

Cthree =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup \concat {
   \musicglyph #"timesig.C44" \hspace #0.25
   \vcenter { \musicglyph #"three" } }
   #}))

Ometer =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup \musicglyph #"timesig.mensural32" #}))

%% command to put symbol on the incipit staff
MeterO      = \override Staff.TimeSignature.stencil = #Ometer
MeterC      = \override Staff.TimeSignature.stencil = #Cmeter
MeterCutC   = \override Staff.TimeSignature.stencil = #CutCmeter
MeterCZ     = \override Staff.TimeSignature.stencil = #CZstaff
MeterZ      = \override Staff.TimeSignature.stencil = #Zstaff 
MeterCthree = \override Staff.TimeSignature.stencil = #Cthree

%% C3 and C meters on the staff
MeterDuple = {
  \MeterC
  \time 2/2
}
MeterTriple = {
  \MeterCthree
  \time 3/2
}

MeterChangeDuple = {
  \MiddleBar
  \MeterDuple
}
MeterChangeTriple = {
  \MiddleBar
  \MeterTriple
}
