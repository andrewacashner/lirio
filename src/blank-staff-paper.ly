\version "2.22"

%% Draw empty staff lines

#(set-global-staff-size 20)

\header {
  tagline = ##f
}

\score {
  { \repeat unfold 12 { s1 \break } }
  \layout {
    indent = 0\in
    \context {
      \Staff
      \remove "Time_signature_engraver"
      \remove "Clef_engraver"
      \remove "Bar_engraver"
    }
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
  }
}

\paper {
  #(set-paper-size "letter")
  ragged-last-bottom = ##f
  line-width = 7.5\in
  left-margin = 0.5\in
  bottom-margin = 0.5\in
  top-margin = 0.5\in
}

