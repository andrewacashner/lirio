%% font-ikarius.ly

\version "2.22"

%% GLOBAL FONT
\paper { 
  #(define fonts
    (make-pango-font-tree 
     "Ikarius ADF Std"
     "Ikarius ADF Std"
     "Ikarius ADF Std"
     (/ staff-height pt 20)))
  %% leave this at 20 regardless of staff size
}


