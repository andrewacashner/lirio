%% automatic-ties.ly
%% Andrew Cashner, 2016/12/07
%%
%% Split and tie notes automatically at barlines
\version "2.22"

\layout {
  \context {
    \Voice
    \remove   "Note_heads_engraver"
    \consists "Completion_heads_engraver"
    \remove   "Rest_engraver"
    \consists "Completion_rest_engraver"
  }
}
