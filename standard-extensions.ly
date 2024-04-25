%% standard-extensions.ly
%% Andrew Cashner, 2016/12/08
%%
%% Extensions to Lilypond commands and interface
%% for standard notation

\version "2.22"

%% For more flexible markup commands
\include "mark-this-up.ly"

%% Simple interface for instrument names
\include "instrument-name.ly"

%% Barline commands
\include "barlines.ly"

%% Section headings and repeat messages (e.g., 'D.C.')
\include "section-headings.ly"

%% Ossia staff
\include "ossia.ly"

%% Include LaTeX eps file as graphic (for block lyrics)
% \include "graphics.ly"

%% Lyrics commands for multiple stanzas
\include "lyrics-stanzas.ly"

%% Show lyric hyphens at start of lines
\include "lyric-hyphens.ly"

%% Control display of empty staves
\include "show-empty-staves.ly"

%% Allow easy transposition
% \include "transpose.ly"

