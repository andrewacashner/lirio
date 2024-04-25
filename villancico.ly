%% villancico.ly
%% Andrew Cashner, 2016/12/08

%% Master stylesheet for Cashner villancico edition

\version "2.22"

%% PAGE LAYOUT, FONTS, TITLES

%% Custom geometry and spacing
\include "villancico-geometry.ly"

%% Custom font and size commands
\include "villancico-font.ly"

%% Custom page headings
%% Adjust editor's name and copyright date here
\include "villancico-heading.ly"

%% MARKS, DYNAMICS, ARTICULATIONS

%% Extended & improved commands for standard notation
\include "standard-extensions.ly"

%% Custom dynamic and articulation commands
\include "dynamics-articulations.ly"

%% SPECIAL NOTATION FOR EARLY MUSIC

%% Ficta, coloration brackets, incipit staves, etc.
\include "early-music.ly"

%% Original meters for incipits, time signatures
\include "villancico-meter-symbols.ly"

%% Analysis brackets
\include "analysis-brackets.ly"
