%% editorial-brackets.ly
%% Andrew Cashner, 2016/12/07
%%
%% Large brackets around editorial additions

\version "2.22"

%% Based on lsr.di.unimi.it/LSR/Snippet?id=377
#(define-markup-command (left-bracket layout props) ()
  "Draw left hand bracket"
  (let* ((th 0.2) 
	 (width (* 2.5 th)) 
	 (ext '(-2.8 . 2.8)))
   (ly:bracket Y ext th width)))

%% Editor Bracket Left
EdBracL = {
  \once \override BreathingSign.text = #(make-left-bracket-markup)
  \once \override BreathingSign.break-visibility = #end-of-line-invisible
  \once \override BreathingSign.Y-offset = ##f
  %% Trick to print it after barlines and signatures:
  %% \once \override BreathingSign.break-align-symbol= #'custos
  \breathe
}

#(define-markup-command (right-bracket layout props) ()
  "Draw right hand bracket"
  (let* ((th 0.2)
	 (width (* 2.5 th))
	 (ext '(-2.8 . 2.8)))
   (ly:bracket Y ext th (- width))))

%% Editor Bracket Right
EdBracR = {
  \once \override BreathingSign.text = #(make-right-bracket-markup)
  \once \override BreathingSign.Y-offset = ##f
  \breathe
}
