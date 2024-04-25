%% SI LOS SENTIDOS QUEJA FORMAN DEL PAN DIVINO
%% MIGUEL DE IRIZAR (E-SE: 5/32)
%% EDITED BY ANDREW CASHNER

%% 2017-02-20 -- Revised after peer review
%% 2016-04-07 -- Revised for published edition
%% 2015-02-19 -- Lilypond version 2.18.2 for dissertation
%% 2014-05-06 -- Lilypond version 2.14.2


\version "2.19"
\include "../ly/villancico.ly"
\include "../ly/parts.ly"

\include "music.ly"
\include "lyrics.ly"

\header {
  title 	= "Si los sentidos queja forman del Pan Divino"
  subtitle	= "Al Santísimo [Sacramento]. A 8."
  composer 	= "MIGUEL DE IRÍZAR"
  dates		= "(1635–1684)"
  poet          = "Attr. Vicente Sánchez"
  source 	= "Segovia, Cathedral Archive (E-SE: 5/32, 18/19), Corpus Christi 1674"
}

%% VOICING: SSAT, SATB, Ac
%% FORM: Estr. + 6 coplas

%%****************************************************************************
%% SCORE: ESTRIBILLO
%%****************************************************************************

\book {

  \score {
  <<
    \new ChoirStaff = "ChI"
    <<
      \ChoirStaffName "CHORUS I"

      %% SI-1
      \new Staff = "SIi" 
      <<
        \IncipitStaff "TIPLE I-1" "Ti. I-1" { \IncipitSIi }
        \new Voice = "SIi" {
          \MusicEstribilloSIi
          \MusicCoplasSIi
        }
        \new Lyrics \lyricsto "SIi" {
          \LyricsEstribilloSIi
          \LyricsCoplasSIi
        }
      >>

      %% SI-2
      \new Staff = "SIii" 
      <<
        \IncipitStaff "TIPLE I-2" "Ti. I-2" { \IncipitSIii }
        \new Voice = "SIii" {
          \MusicEstribilloSIii
          \MusicCoplasSIii
        }
        \new Lyrics \lyricsto "SIii" {
          \LyricsEstribilloSIii
          \LyricsCoplasSIii
        }
      >>

      %% AI
      \new Staff = "AI" 
      <<
        \IncipitStaff "ALTO I" "A. I" { \IncipitAI }
        \new Voice = "AI" {
          \MusicEstribilloAI
          \MusicCoplasAI
        }
        \new Lyrics \lyricsto "AI" {
          \LyricsEstribilloAI
          \LyricsCoplasAI
        }
      >>

       %% TI
       \new Staff = "TI" 
       <<
         \IncipitStaff "TENOR I" "T. I" { \IncipitTI }
         \new Voice = "TI" {
           \MusicEstribilloTI
           \MusicCoplasTI
         }
         \new Lyrics \lyricsto "TI" {
           \LyricsEstribilloTI
           \LyricsCoplasTI
         }
       >>
 
     >> %% end of Chorus I staves
 
     \new ChoirStaff = "ChII"
     <<
       \ChoirStaffName "CHORUS II"
 
       %% SII
       \new Staff = "SII" 
       <<
         \IncipitStaff "TIPLE II" "Ti. II" { \IncipitSII }
         \new Voice = "SII" {
           \MusicEstribilloSII
         }
         \new Lyrics \lyricsto "SII" {
           \LyricsEstribilloSII
         }
       >>
 
       %% AII
       \new Staff = "AII" 
       <<
         \IncipitStaff "ALTO II" "A. II" { \IncipitAII }
         \new Voice = "AII" {
           \MusicEstribilloAII
         }
         \new Lyrics \lyricsto "AII" {
           \LyricsEstribilloAII
         }
       >>
 
       %% TII
       \new Staff = "TII" 
       <<
         \IncipitStaff "TENOR II" "T. II" { \IncipitTII } 
         \new Voice = "TII" {
           \MusicEstribilloTII
         }
         \new Lyrics \lyricsto "TII" {
           \LyricsEstribilloTII
         }
       >>
 
       %% BII
       \new Staff = "BII" 
       <<
         \IncipitStaff
         \TwoLineName "BAJO II" "[inst.]"
         "B. II"
         { \IncipitBII }
         \new Voice = "BII" {
           \MusicEstribilloBII
         }
       >>
 
     >> %% end of Ch. II staves
 
     %% Gn
     \new Staff = "Gn" 
     <<
       \IncipitStaff "GENERAL" "Gn." { \IncipitAc }
       \new Voice = "EstribilloAc" {
         \MusicEstribilloAc
         << 
           \MusicCoplasAc
           \new FiguredBass { \FiguresCoplasAc }
         >>
       }
    >>
  >>

}
\pageBreak
\score {
  \header {
    instrument = \markup \fontsize #4 { 
      \column { 
        \line { "Chorus II, Instrumental Bass" }
        \line { "Bajón (bassoon), vihuela (violoncello), etc." }
        \vspace #2
      } 
    }
  }
  <<
    \new Staff = "BII" 
    <<
      \new Voice = "BII" {
        \compressMMRests { \combineMMRests { \MusicEstribilloBII } }
      }
    >>
  >>
  \layout {
    indent = 0.5\in
    short-indent = 0\in
  }
}
\pageBreak
\score {
  \header {
    instrument = \markup \fontsize #4 { 
      \column { 
        \line { "Basso Continuo" } 
        \line { "Organ, harp, bajón (bassoon), vihuela (violoncello), etc." }
        \vspace #2 
      } 
    }
  }
  <<
    \new Staff 
    <<
      \new Voice = "BII" { \MusicEstribilloAc }
    >>
  >>
  \layout {
    indent = 0.5\in
    short-indent = 0\in
  }
}
 
}


