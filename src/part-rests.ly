% part-rests.ly
% combine multimeasure rests in parts

% Taken from improved version from
% http://lilypond.1069038.n5.nabble.com/new-snippet-combine-multimeasure-rests-td144688.html
% Improved by Urs Liska to also merge over empty music expressions


#(define (add-durations dur1 dur2)
   (let* ((len1 (ly:duration-length dur1))
          (len2 (ly:duration-length dur2))
          (mult (ly:moment-div (ly:moment-add len1 len2)
                               len1)))
     (ly:make-duration (ly:duration-log dur1)
                       (ly:duration-dot-count dur1)
                       (* (ly:duration-scale dur1)
                          (ly:moment-main mult)))))

#(define (combinable-rest? rest)
   (and (ly:music? rest)
        (or (eq? 'MultiMeasureRestMusic (ly:music-property rest 'name))
            (eq? 'SkipEvent (ly:music-property rest 'name)))
        (null? (ly:music-property rest 'articulations))))

#(define (combine-rests rest1 rest2)
   ;; create one rest/skip with the sum of both lengths
   (make-music (ly:music-property rest1 'name)
               'duration (add-durations 
                           (ly:music-property rest1 'duration)
                           (ly:music-property rest2 'duration))
               'articulations '()))

#(define (consolidator curr rest)
   ;; determine ir we have consecutive MultimeasureRests or skips
   (if (and (combinable-rest? curr)
            (not (null? rest)))
     ;; -> we have a combinable rest left and 'something' right
     (if (and (combinable-rest? (car rest))
              (eq? (ly:music-property curr 'name)
                   (ly:music-property (car rest) 'name)))
       ;; -> we also have a combinable rest right and both are the same type,
       ;; recurse by first merging rests and then looking for the next item
       (consolidator
         (combine-rests curr (car rest))
         (cdr rest))
       ;; -> right is either no combinable rest or one of different type.
       (if (or
             (eq? 'BarCheck (ly:music-property (car rest) 'name))
             (eq? 'Music (ly:music-property (car rest) 'name)))
         ;; -> right is one of the 'skippable' types, 
         ;; so recurse using left and the next one to the right
         (consolidator curr (cdr rest))
         ;; just return left followed by right
         (cons curr rest)))
     ;; -> no combinable rest to the left
     ; But what happens when rest *is* null?
     (cons curr rest)))

#(define (accumulate-result output input)
   ;; recurse over the elements of 'music', appending consolidated
   ;; items (i.e. the item or a merged rest) to 'output'
   (if (null? input)
     output
     (let ((done output)
           (curr (car input))
           (rest (cdr input)))
       (if (null? rest)
         (append done (list curr))
         (let ((prev (consolidator curr rest)))
           (accumulate-result
             (append done (list (car prev)))
             (cdr prev)))))))

#(define (condense music)
   ;; recurse over the music list and condense consecutive rests
   (let* ((output music)
          (elts (ly:music-property output 'elements))
          (elt (ly:music-property output 'element)))
     (if (pair? elts)
       (ly:music-set-property! output 'elements 
                               (map condense (accumulate-result '() elts))))
     (if (ly:music? elt)
       (ly:music-set-property! output 'element
                               (condense elt)))
     output))

combineMMRests =
#(define-music-function (parser location music) (ly:music?)
                        ;; process the 'music' argument and merge consecutive
                        MultimeasureRests
                        (condense music))

% USER COMMAND
% combine multimeasure rests R1 R1 without having to write R1*2
% NB: causes many things to go wrong
MakePartAutoRests = 
#(define-scheme-function
(music) (ly:music?)
#{ \compressMMRests { \combineMMRests { $music }} #})



