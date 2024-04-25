%% chords.ly
%% Andrew Cashner, 2017/04/03
%% Chord symbols

\version "2.22"

\layout { 
  \context { 
    \ChordNames
    %% hide repeated chords
    chordChanges = ##t

    %% use text for major seventh instead of triangle
    majorSevenSymbol = \markup "maj7"
  }
}

