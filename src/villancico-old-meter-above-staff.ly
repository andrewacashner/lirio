\version "2.22"

\include "villancico-meter-symbols.ly"

%%****************************************
%% ORIGINAL METERS ABOVE THE STAFF

%% symbol + tempo relationship

CwithTempo =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup {
   \smaller { \musicglyph #"timesig.C44" }
   \TempoCZtoCMarkup } #}))

CZwithTempo =
#(lambda (grob)
  (grob-interpret-markup grob 
   #{ \markup {
   \epsfile #Y #5 #"img/CZ.eps"
   \TempoCtoCZMarkup  } #}))

ZwithTempo =
#(lambda (grob)
  (grob-interpret-markup grob
   #{ \markup {
   \epsfile #Y #5 #"img/Z.eps"
   \TempoCtoCZMarkup  } #}))


MarkupMeterC = \markup { \smaller \musicglyph #"timesig.C44" }

MarkMeterC = \mark \MarkupMeterC

MarkMeterCZ = {
  \once \override Score.RehearsalMark.stencil = #CZ 
  \mark \default
}

MarkMeterZ = {
  \once \override Score.RehearsalMark.stencil = #Z 
  \mark \default
}

MeterAboveTimeSignature = {
  \once \override Score.RehearsalMark.break-align-symbols = #'(time-signature)
  \once \override Score.TimeSignature.break-align-anchor-alignment = #CENTER
}

MeterAboveC = {
  \MeterAboveTimeSignature
  \MarkMeterC
}

MeterAboveCZ = {
  \MeterAboveTimeSignature
  \MarkMeterCZ
}

MeterAboveZ = {
  \MeterAboveTimeSignature
  \MarkMeterZ
}


%%********************
%% TEMPO RELATIONSHIPS

TempoNotePerfectSemibreve = \markup \fontsize #-4 \note #"1." #1
TempoNoteMinim = \markup \fontsize #-4 \note #"2" #1

TempoSameMarkup = \markup "[=]"
TempoCZtoCMarkup = \markup
{ [ \TempoNotePerfectSemibreve = \TempoNoteMinim ] }

TempoCtoCZMarkup = \markup
{ [ \TempoNoteMinim = \TempoNotePerfectSemibreve ] }

TempoSame = \mark \TempoSameMarkup
TempoCZtoC = \mark \TempoCZtoCMarkup
TempoCtoCZ = \mark \TempoCtoCZMarkup

TempoAboveTimeSignature = {
  \once \override Score.RehearsalMark.break-align-symbols = #'(time-signature)
  \once \override Score.TimeSignature.break-align-anchor-alignment = #LEFT
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.padding = #2
}

MeterChangeCZtoC = {
  \TempoAboveTimeSignature
  \once \override Score.RehearsalMark.stencil = #CwithTempo
  \mark \default
}

MeterChangeCtoCZ = {
  \TempoAboveTimeSignature
  \once \override Score.RehearsalMark.stencil = #CZwithTempo
  \mark \default
}
MeterChangeCtoZ = {
  \TempoAboveTimeSignature
  \once \override Score.RehearsalMark.stencil = #ZwithTempo
  \mark \default
}

