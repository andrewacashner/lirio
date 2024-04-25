%% coloration-brackets.ly
%% Andrew Cashner, 2016/12/07
%%
%% Brackets to indicate transcription of mensural coloration

\version "2.22"

\include "mark-this-up.ly"

%% BRACKETS FOR MENSURAL COLORATION

ColorBracketLeft =
\markup { \combine
	  \draw-line #'(0 . -1)
	  \draw-line #'(1.5 . 0)
	}

ColorBracketRight =
\markup { \combine
	  \draw-line #'(0 . -1)
	  \draw-line #'(-1.5 . 0)
	}

ColorBracketLeftRight = 
\markup {
  \halign #-0.5 \raise #1.4
  \concat { \ColorBracketLeft " " \ColorBracketRight }
}

%% put this in \layout { \context \Score 
DrawColorBrackets = {
  \override TextSpanner.dash-period = #0
  \override TextSpanner.bound-details.left.text = \ColorBracketLeft
  \override TextSpanner.bound-details.right.text = \ColorBracketRight
  \override TextSpanner.bound-details.left.attach-dir = #-1
  \override TextSpanner.bound-details.right.attach-dir = #1
  \override TextSpanner.staff-padding = #2
  \override TextSpanner.bound-details.left-broken.text = ##f
  \override TextSpanner.bound-details.right-broken.text = ##f
}

color = \startTextSpan
endcolor = \stopTextSpan
colorOne  = \MarkThisUp \ColorBracketLeftRight

%% Color brackets under staff in short scores, divisi parts, examples
%% Bracket faces upward
%% Overriding only some of the overrides in \ColorBrackets
ColorBracketLeftUnder = 
\markup { \combine 
    \draw-line #'(0 . 1) 
    \draw-line #'(1.5 . 0) 
  }
ColorBracketRightUnder = 
\markup { \combine 
    \draw-line #'(0 . 1) 
    \draw-line #'(-1.5 . 0) 
  }
ColorBracketLeftRightUnder = 
\markup {
  \halign #-0.5 
  \concat { \ColorBracketLeftUnder " " \ColorBracketRightUnder }
}
colorOneUnder = \MarkThisDown \ColorBracketLeftRightUnder

DrawColorBracketsUnder = {
	\override TextSpanner.bound-details.left.text = \ColorBracketLeftUnder
	\override TextSpanner.bound-details.right.text = \ColorBracketRightUnder
	\override TextSpanner.direction = #DOWN
}

LowerVoice = {
  \DrawColorBracketsUnder
  \voiceTwo
}

%% Usage: a2\colorOne b1 c'2\color c'2 c'2\endcolor b1.

\layout {
  \context {
    \Score
    \DrawColorBrackets
  }
}

