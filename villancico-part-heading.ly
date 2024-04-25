%% villancico-part-heading.ly
%% Andrew Cashner, 2018/09/19
%%
%% Custom page heading for Cashner villancico edition, parts

\version "2.22"

% Thanks to Kieran MacMillan,
% http://lilypond-user.gnu.narkive.com/BOUcTiGD/problem-controlling-page-numbers-in-bookparts
#(define-markup-command 
   (bookpart-page-number layout props) () 
   (let ((first-page-number (ly:output-def-lookup layout 'first-page-number)) 
         (page-number (chain-assoc-get 'page:page-number props 0))) 
     (interpret-markup layout props 
                       (format #f "~a" (1+ (- page-number first-page-number))))))

\paper {

  print-page-number = ##t

  %% HEADERS STYLE & SPACING
  bookTitleMarkup = {}
  scoreTitleMarkup = \markup {
    \column {
      \line { 
        \fontsize #2 \fromproperty #'header:instrument 
      }
      \vspace #1
      \override #'(baseline-skip . 12)
      \column {
	\override #'(baseline-skip . 5 )
	\column {
	  \fill-line { 
	    \fontsize #8 \fromproperty #'header:title
	  }
	  \fill-line { 
	    \fontsize #3 \italic \fromproperty #'header:subtitle
	  }
	}
	\column {
	  \override #'(baseline-skip . 3 )
	  \fontsize #3
	  \column { 
	    \fill-line {
	      \fromproperty #'header:poet
	      \concat { \fromproperty #'header:composer " " \fromproperty #'header:dates }
	    }
	    \fill-line {
	      \column { \null }
	      \column { 
                \line { \fromproperty #'header:editor } 
	      }
	    }
	  }
	}
      }
    }
    \vspace #1
  }

  oddHeaderMarkup = \markup \null

  %% put copyright notice left-aligned on first page
  %% put page number centered bottom if print-page-number is true
  oddFooterMarkup = \markup { 
    \on-the-fly #part-first-page {
      \vspace #2
      \fontsize #1.5
      \column {
        \line { \fromproperty #'header:source }
        \line { \fromproperty #'header:copyright }
      }
    }
    \on-the-fly #print-page-number-check-first {
      \fill-line { \fontsize #4 \bookpart-page-number }
    }
  }

  evenHeaderMarkup = \oddHeaderMarkup
  evenFooterMarkup = \oddFooterMarkup

}
