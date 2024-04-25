\version "2.22"
\include "standard-extensions.ly"

#(set-global-staff-size 18)
%% GLOBAL FONT
\paper { 
  #(define fonts
    (make-pango-font-tree 
      "Baskervaldx"
      "Latin Modern Sans"
      "Latin Modern Mono"
     (/ staff-height pt 20)))
  %% leave this at 20 regardless of staff size
}

LyricsItalic = \override Lyrics.LyricText.font-shape = #'italic

\header {
  tagline = ##f
}


\paper {
  #(set-paper-size "letter")
  left-margin = 1\in
  right-margin = 1\in
  ragged-bottom = ##t

  markup-system-spacing.padding = #4
  system-system-spacing.padding = #4
}

\layout {
  \context { 
    \Lyrics
    \override StanzaNumber.font-series = #'medium
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2
  }
}

