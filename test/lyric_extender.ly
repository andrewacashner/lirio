\version "2.19"
\include "../ly/villancico.ly"

MusicS = {
  \clef "treble"
  \time 4/4
  | d''4. c''8 bes'4. a'8
  | g'2 g'2
}

LyricsS = \lyricmode {
  los __ _ _ sen -- ti -- dos
}

\score {
  <<
    \new Staff
    <<
      \new Voice = "S" { \MusicS }
      \new Lyrics \lyricsto "S" { \LyricsS }
    >>
  >>
}

