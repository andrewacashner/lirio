%% font-baskerville.ly
%% Use Baskerville font

\version "2.22"

%% GLOBAL FONT
\paper { 
  #(define fonts
    (make-pango-font-tree 
      "Baskervaldx"
      "Baskervaldx"
      "Baskervaldx"
     (/ staff-height pt 20)))
  %% leave this at 20 regardless of staff size
}
