\version "2.22"
%% Andrew Cashner, 2018/03/30

%%*******************
%% ANALYSIS BRACKETS
%%*******************

%% Nota Bene, in and out of bracketed segment
NotaBene = \startGroup
endNotaBene = \stopGroup
NB = \NotaBene
endNB = \endNotaBene

%% above staff
NBup = \once \override HorizontalBracket.direction = #UP

%%**************************

%% Label text
AnalysisLabel =
#(define-scheme-function 
   (str) (markup?)
     #{ \once \override HorizontalBracketText.text = \markup \italic $str #})

%%***************************

%% Bracket + label
%% Inner command
Annotation =
#(define-scheme-function
   (dir label) (ly:dir? markup?)
   #{ \once \override HorizontalBracket.direction = #dir
      \AnalysisLabel #label
    #})

%% User commands

%% USAGE
%% \Annotate "Nota bene" a'2\startGroup b'2\stopGroup 

%% Default will be above staff
Annotate =
#(define-scheme-function
   (label) (markup?)
   (Annotation UP label))

AnnotateBelow = 
#(define-scheme-function
   (label) (markup?)
   (Annotation DOWN label))


%%*****************************
%% ON SINGLE NOTE

%% Inner command
AnnotationOne =
#(define-music-function
   (dir label show-music hide-music) (ly:dir? markup? ly:music? ly:music?)
   #{ << \new Voice { \voiceTwo
              \Annotation #dir #label 
              \hideNotes 
              #hide-music
            }
            { #show-music }
       >>
   #})

%% User commands

%% USAGE
%% \AnnotateOne "Nota bene" { a'1 } { a'2\startGroup a'2\stopGroup }

%% Default is bracket above staff
AnnotateOne = 
#(define-music-function
   (label show-music hide-music) (markup? ly:music? ly:music?)
   (AnnotationOne UP label show-music hide-music))

AnnotateBelowOne =
#(define-music-function
   (label show-music hide-music) (markup? ly:music? ly:music?)
   (AnnotationOne DOWN label show-music hide-music))

%%%********************************

SetAnnotationsAbove = {
  \override HorizontalBracket.direction = #UP
}

\layout {
  \context {
    \Score
    \override HorizontalBracket.outside-staff-priority = #1500
  }
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
