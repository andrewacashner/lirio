%% square-breve.ly
%% Andrew Cashner, 2016/12/08
%%
%% Use older-style square breve

\version "2.22"

\layout {
  \context {
    \Score
    \override NoteHead.style = #'baroque
  }
}
