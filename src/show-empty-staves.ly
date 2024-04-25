%% show-empty-staves.ly
%% Andrew Cashner, 2017/02/07
%%
%% Modified from Neil Puttock, 
%% http://lists.gnu.org/archive/html/lilypond-user/2007-08/msg00366.html
%% 
%% Override \RemoveEmptyStaves for a specific region 
%% when \RemoveEmptyStaves is being used already
%% Use in music, e.g., \ShowThisEmptyStaff R1 R1 \HideEmptyStaff

\version "2.22"

ShowThisEmptyStaff = { 
  \set Staff.keepAliveInterfaces = #'(
  rhythmic-grob-interface
  multi-measure-rest-interface
  lyric-interface
  stanza-number-interface
  percent-repeat-interface)
}
HideThisEmptyStaff = {
  \unset Staff.keepAliveInterfaces
}

ShowAllEmptyStaves = {
    \override VerticalAxisGroup.remove-empty = ##f
}


