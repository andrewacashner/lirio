% conditional.ly -- Andrew Cashner, 2017/03/23
% Conditonal switches for variable Lilypond elements
% E.g., clefs that can be switched when score is transposed

\version "2.19"

\header {
  title     = "Quintet for Clarinet and Strings"
  composer  = "W. A. Mozart"
  tagline   = ##f
}


Loudness =
#(define-event-function
   (dynamic) (number?)
   (cond ((eq? dynamic 2) #{\f#})
         ((zero? dynamic) #{\p#})
         (else #{\mf#})))

Mood = 
#(define-scheme-function
   (tempo) (number?)
   (cond ((eq? tempo 1) #{\tempo "Allegro"#})
          (else #{\tempo "Largo"#})))

  

Transpose = 
#(define-scheme-function
   (music) (ly:music?)
   (if (eq? transpose? #f)
     #{ $music #}
     #{\transpose a g { $music } #}))


MusicVnI = {
  \key a\major
  \time 4/4
  \Mood #1
  | e''2( cis''2\Loudness #2
  | b'2 a'2)
  | b'4( cis''4 d''4 b'4)
  | gis'2( a'4) r4
  | fis'4( a'8) r8 e'4( a'8) r8
  | e'4( \afterGrace d'4.\startTrillSpan { cis'16[ d'16])\stopTrillSpan } cis'4 r4
}


#(define transpose? #t)
\score {
  <<
    \new Staff = "VnI" \with { 
      instrumentName = #"VIOLIN I"
      shortInstrumentName = #"Vn. I"
    }
    <<
      \new Voice = "VnI" { 
        \Transpose
        \MusicVnI
      }
    >>
  >>
}
