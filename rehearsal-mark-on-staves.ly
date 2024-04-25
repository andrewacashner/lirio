%% rehearsal-mark-on-staves.ly
%% Andrew Cashner, 2016/12/07
%%
%% NO LONGER NEEDED IN CURRENT LILYPOND VERSION

%% Allow rehearsal marks to be printed on individual staves,
%% not only on the top
%% (Move mark engraver from score to staff context)

\version "2.22"

\layout {
  \context {
    \Score
    \remove "Mark_engraver"
    \remove "Staff_collecting_engraver"
  }
  \context {
    \Staff
    \consists "Mark_engraver"
  }
}

    
    
