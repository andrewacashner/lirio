%% packaging.ly
%% Andrew Cashner, 2016/12/08
%%
%% Attempt at LaTeX-style package system instead of using \input directly

\version "2.19"

UsePackage =
#(define-scheme-function
  (filename) (markup?)
  "Include a package file"
  #:include (string-append filename ".ly"))
