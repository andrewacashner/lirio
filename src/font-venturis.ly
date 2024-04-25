%% font-pagella.ly
\version "2.22"

%% GLOBAL FONT
\paper { 
  #(define fonts
    (make-pango-font-tree 
      "Venturis ADF"
      "Venturis Sans ADF"
     "Source Code Pro"
     (/ staff-height pt 20)))
  %% leave this at 20 regardless of staff size
}


