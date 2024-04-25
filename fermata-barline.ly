%% fermata-barline.ly
%% Put a fermata over a barline
%% Andrew A. Cashner, 2018/01/21

FermataBarline = {
  \once \override Score.RehearsalMark.break-visibility =
  #begin-of-line-invisible
  \mark \markup { \musicglyph #"scripts.ufermata" }
}
