%% example.ly
%% Andrew Cashner, 2016/12/07, rev. 2018/02/16
%%
%% Altered geometry & settings for in-text example
%% for musicology scholarship

\version "2.22"

%%****************************************
%% LAYOUT FOR EXAMPLE
%%****************************************

#(set-global-staff-size 13)
\include "villancico-font.ly"

\layout {
  indent = 0.5\in
  short-indent= 0\in
  line-width = 5.5\in
  top-margin = 1\in
  bottom-margin = 2\in
}

\paper{
  ragged-right = ##f
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
  system-system-spacing.basic-distance = #12 % these are defaults
  system-system-spacing.minimum-distance = #8
  system-system-spacing.padding = #1
  system-system-spacing.stretchability = #60
}

ShowFirstBarNumber = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \bar ""
}

%%***********************
%% INCOMPLETE TIE 
%% (as in example clips)
%%***********************

HalfTie = \laissezVibrer

%% Coloration brackets under the staff
ColorBracketsUnder = \layout {
  \context { 
    \Staff \DrawColorBracketsUnder 
  }
}


