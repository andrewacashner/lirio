%% lyric-hyphen.ly
%% Andrew Cashner, 2017/10/25
%%
%% Put lyric hyphen at beginning of line when word is broken across line break
%% Adapted from https://code.google.com/archive/p/lilypond/issues/1722 
%%
%% This functionality has been implemented (better) in Lilypond 2.22, so this
%% module is deprecated.
\version "2.22"

#(define lyric-hyphen-callback
   (lambda (hyphengrob) 
     "If a LyricHyphen is broken into more than one part (by a line break), 
     copy Lilypond's hyphen and add this in front of the next lyric
     text (which is the right bound of the hyphen grob)."

       (let*
       ;; Capture the original hyphen object before it was split
       ((orig (ly:grob-original hyphengrob))
        
       ;; Capture the parts the object was split into, if any
       (siblings 
         (if (ly:grob? orig) 
           (ly:spanner-broken-into orig) 
           '() )))

       (if (and 
             ;; Here we detect whether the hyphen has been split at a line
             ;; break. If the object was split into more than one part 
             ;; (siblings >= 2), and if the last of those parts is a hyphen,
             ;; then we are at a line break and should insert our fake hyphen.
             ;; Otherwise, do nothing.
             (>= (length siblings) 2)
             (eq? (car (last-pair siblings)) hyphengrob))
         (let* 

           ;; Copy the shape of Lilypond's hyphen
           ;; AAC: Adjusted length and height to match automatic hyphens,
           ;; 2020/06/24
           ;;       TODO: Is this font-specific or what? 
           ;;             Why does the height and length not match
           ;;             automatically?
           ((thick (ly:grob-property hyphengrob 'thickness)) 
            (lngth (* 0.75 (ly:grob-property hyphengrob 'length)))
            (hgth (* 1.15 (ly:grob-property hyphengrob 'height)))

            ;; Capture the next object after the hyphen, which is the next syllable
            ;; of lyrics
            (bound (ly:spanner-bound hyphengrob RIGHT))

            ;; Capture the stencil (what will be drawn) from that object: this is
            ;; normally the same as the text, but after it has been processed 
            ;; (e.g., lyric ties '~' in input have been converted into underties)
            (next-text (ly:grob-property bound 'stencil))

            ;; Make a line the same size and shape as Lilypond's hyphen,
            ;; using paramaters copied above
            (ln (markup 
                  #:translate `(0 .  ,hgth) 
                  #:override `(thickness .  ,thick) 
                  #:draw-line `(,lngth .  0)))

            ;; Create a stencil from the line markup
            (line-stencil (grob-interpret-markup bound (markup ln)))

            ;; Measure the stencil
            (add (* -1 (interval-length (ly:stencil-extent line-stencil X))))

            ;; Create the full line stencil with proper alignment and spacing
            (fake-hyphen-line (ly:stencil-translate-axis line-stencil add X))

            ;; Make the full object to replace the next lyric syllable:
            ;; this consists of the fake hyphen line plus the lyric text, separated
            ;; by padding (specified in the last argument);
            ;; '0' means align horizontally, '1' means put the second one to the
            ;; right of the first
            (fake-hyphen (ly:stencil-combine-at-edge 
                           fake-hyphen-line 0 1 next-text 0.5)))


           ;; Replace the original stencil for the next lyric syllable with our
           ;; fake-hyphen stencil
             (ly:grob-set-property! bound 'stencil fake-hyphen))))))

%% Some other options that can be used in a (begin ... ) block on the last line
%% of this function:
%%  - to hide Lilypond's hyphen on new line 
%%    (ly:grob-set-property! hyphengrob 'stencil '()) 
%%  - to debug 
%%    (ly:grob-set-property! bound 'color red)


\layout {
  \context {
    \Lyrics
    %% Increase spacing between hyphens to avoid collision with the fake hyphen
    \override LyricHyphen.minimum-distance = #2.25 % default 0.1
    \override LyricHyphen.dash-period = #16 % default 10

    %% Insert the function above into the layout routine for hyphens
    \override LyricHyphen.after-line-breaking = #lyric-hyphen-callback
  }
}

