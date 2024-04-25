%% ossia-staff.ly
%% Andrew Cashner, 2016/12/07
%%
%% Produce a small ossia staff above system

\version "2.22"

OssiaStaff =
#(define-scheme-function
  (alignWith music) (markup? ly:music?)
  #{
  \new Staff \with {
  \remove "Time_signature_engraver"
  alignAboveContext = $alignWith
  fontSize = -3
  \override StaffSymbol.staff-space = #(magstep -3)
  \override StaffSymbol.thickness = #(magstep -3)
  firstClef = ##f
  \override VerticalAxisGroup.staff-staff-spacing =
  #'((basic-distance . 5)
     (minimum-distance . 2)
     (padding . 3)
     (stretchability . 5)) }
  $music #})

