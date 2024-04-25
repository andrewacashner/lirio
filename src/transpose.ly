%% transpose.ly
%% Andrew Cashner, 2017/10/02
%%
%% Make it easier to transpose

\version "2.22"

#(use-modules
   (srfi srfi-1))

%% Create a separate file in which you redefine your main music variables to
%% include transpositions, then include this file conditionally with
%% \IncludeIfTranposing; us '-dtranspose' on command line to include the file.

%% If lilypond is run with `-dtranspose`, then include the file specified as an
%% argument to this command (which should contain the transposition commands,
%% e.g., MusicSI = { \transpose d a, { \MusicSI } }

IncludeIfTransposing = 
#(define-void-function
   (filename) (string?)
   (if (and 
         (ly:get-option 'transpose) 
         (file-exists? filename)) 
     (ly:parser-include-string 
       (format #f "\\include \"~A\"\n" filename))))

%% This is a shorthand command to allow transposition to be changed with a few
%% commands at the top of the file, rather than in every music expression.
%% You must define the variables OldPitch, NewPitch, and NewKey,
%% for example:
%% #(define OldPitch #{ d #}) % cannot be blank
%% #(define NewPitch #{ a, #}) % cannot be blank
%% #(define NewKey #{ \key g\major #}) % could be left blank with '#{ #}'

MyTranspose = 
#(define-music-function
   (music) (ly:music?)
   #{ $NewKey { \transpose $OldPitch $NewPitch { $music } } #})

