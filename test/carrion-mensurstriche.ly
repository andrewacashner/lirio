%% Carrion - test mensurstriche
%% 2016/10/25

\version "2.18.2"
\include "../villancico.ly"

\header {
  title = "Si los sentidos queja forman del Pan Divino"
  subtitle = "Villancico al Santísimo Sacramento. Solo."
  composer = "JERÓNIMO DE CARRIÓN"
  dates = "(1660–1721)"
  poet = "Attr. Vicente Sánchez"
  source = "Segovia, Cathedral Archive (E-SE: 28/25)"
}

Solo = {
  \Mensurstriche
  \clef "treble"
  \time 3/2

  a'2 b'2 c''2
  f'2\color e'1

  a'\breve gis'1\endcolor

  b'2 c''2 d''2

  cis''2. cis''4 d''1\color e''1\endcolor

  r1.
  r2 c''2 g'2
  a'2 f'2 g'2

  e'\breve\color d'1\endcolor

  r2 e'2 g'2
  fis'2. g'4 a'2

  a'2\color gis'1\endcolor
  r2 a'2 c''2
  b'2. c''4 d''2
  d''2\color cis''1\endcolor
  r1.
  r2 e''2 b'2
  c''2 a'2 b'2
  gis'1.
  e''2 c''2 d''4( c''4)
  b'2\color c''1\endcolor
  r1.
  r2 c''2 g'2
  a'2 f'2 g'2
  e'1 r2
  c''2 a'2 b'4( a'4)
  gis'2\color a'1\endcolor
  r1.
  r2 a'2 d''2
  cis''2 r2 r2
  r2 a'2 d''2
  cis''2 d''2 e''2
  f''1.
  
  e''2\color e''1.\endcolor d''2 d''1\color cis''1\endcolor

  r1.
  r2 e'2 a'2
  gis'2 r2 r2
  r2 e'2 a'2
  gis'2 a'2 b'2

  c''1. b'2\color b'1.\endcolor a'2 a'1( gis'1)

  a'1.
  \undo \hide Staff.BarLine
  \bar "|."
}

Acomp = {
  \Mensurstriche
  \clef "bass"
  \time 3/2

  a1.
  d'2\color c'1\endcolor
  f1. e1.
  gis1.
  
  a1\color d'1\endcolor c'2 g2

  a2 f2 g2
  e2 a2 e2
  f2 d2 e2
  c2 c'2 g2
  a2 f2 g2
  e1.
  d1.
  e1.
  a1.
  gis1.
  r2 a2 e2 
  f2 d2 e2
  c2\color e1
  a2 f1\endcolor
  e2 e'2 b2
  c'2 a2 b2
  gis2 a2 e2 
  f2 d2 e2
  c2\color e1 
  f2 d1\endcolor
  c2 c'2 g2
  a2 f2 g2
  e2 f2 c2
  d2 b,2 c2
  a,2\color d1\endcolor
  a,2 a2 d'2
  cis'2\color d'1\endcolor
  a2 b2 c'2
  f2 a,2 d2
  cis2 d2 e2
  f1. 
  g2\color a1\endcolor
  e'2 e2 a2
  gis2\color a1\endcolor
  e'2 e2 a2
  gis2\color a1\endcolor
  e2 f2 g2
  c2 e2 a2
  gis2 a2 b2
  c'1.
  d'2\color e'1\endcolor
  a1.
    \undo \hide Staff.BarLine
  \bar "|."

}

SoloLyrics = \lyricmode {
  Si los sen -- ti -- dos que -- ja for -- man del Pan Di -- vi -- no,
  por -- que lo que~e -- llos sien -- ten 
  no~es de Fe con -- sen -- ti -- do,
  \EdLyrics { no~es de Fe con -- sen -- ti -- do, }
  to -- dos hoy con la Fe se -- an o -- í -- dos,
  to -- dos hoy con la Fe se -- an o -- í -- dos.
  No se den, no se den por sen -- ti -- dos los sen -- ti -- dos,
  no se den, \EdLyrics { no se den } por sen -- ti -- dos los sen -- ti -- dos.
}


\score {
  <<
    \new StaffGroup
    <<
      \new Staff
      <<
	\new Voice = "Solo" { \Solo }
	\new Lyrics \lyricsto "Solo" { \SoloLyrics }
      >>
      \new Staff
      <<
	\new Voice = "Acomp" { \Acomp }
      >>
    >>
  >>
  
  \layout {
    indent = 1.5\in
    short-indent = 0\in
  }
}

  