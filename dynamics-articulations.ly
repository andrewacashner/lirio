%% dynamics-articulations.ly
%% Andrew Cashner, 2016/12/07
%%
%% Custom dynamic and articulation markings

\version "2.22"

\include "mark-this-up.ly"

Solo = \MarkThisUp \markup \italic "Solo"

Breath = {
  \override BreathingSign.Y-offset = #2.6
  \override BreathingSign.text = \markup { \musicglyph #"scripts.tickmark" }
  \breathe
}

% EDITORIAL NOTE: Point reader to critical notes
CN = \MarkThisUp \markup \fontsize #2 \raise #1 {
  \concat { "*" \super "CN" } }
