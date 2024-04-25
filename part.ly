\version "2.22"

% USER COMMANDS
% Change `\new Voice { \Music }` to `\new Voice { \MakePart { \Music } }`
MakePart = 
#(define-scheme-function
   (music) (ly:music?)
   #{ \compressMMRests { $music } #})

% Add `\layout = { \PartLayout }`
PartLayout = \layout { 
  indent = 0.5\in
  short-indent = 0\in

  \context { 
    \Score
    \override MultiMeasureRest.expand-limit = #1
  }
}
