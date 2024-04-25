% long-half-tie.ly
% Draw better L.V. ties for notes tied to bar after excerpt

% Very begrudingly adapted from 
% http://lists.gnu.org/archive/html/lilypond-user/2012-10/msg00600.html
% 2019/05/15

HalfTie = \laissezVibrer

#(define ((alter-lv-tie-curve offsets) grob)
   (let ((coords (ly:semi-tie::calc-control-points grob)))
     (define (add-offsets coords offsets)
       (if (null? coords)
         '()
         (cons
           (cons (+ (caar coords) (car offsets))
           (+ (cdar coords) (cadr offsets)))
       (add-offsets (cdr coords) (cddr offsets)))))
     (add-offsets coords offsets)))

\layout { 
 \context {
   \Score
   \override LaissezVibrerTie.before-line-breaking = 
   #(lambda (grob)
   (set! (ly:grob-property grob 'control-points)
   ((alter-lv-tie-curve '(0 0 0.75 0.7 7 0.7 7 1)) grob)))
 }
}
