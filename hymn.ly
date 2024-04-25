\version "2.22"
\include "standard-extensions.ly"
\include "font-venturis.ly"

LyricsItalic = \override Lyrics.LyricText.font-shape = #'italic

\header {
  tagline = ##f
}

#(set-global-staff-size 16)

\paper {
  #(set-paper-size "letter")

  #(define fonts
  (make-pango-font-tree "EB Garamond" "" "" 
  (/ staff-height pt 20)))

  system-system-spacing.padding = #2
}

\layout {
  line-width = 4.5\in
  
  \context {
    \Score
    \omit BarNumber
    \omit TimeSignature
  }
  \context { 
    \Lyrics
    \override StanzaNumber.font-series = #'medium
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1
  }
}

ShowTimeSignature = \undo \omit TimeSignature
