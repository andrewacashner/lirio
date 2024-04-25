%% package-test.ly
%% Andrew Cashner, 2016/12/07
%%
%% Test package system

\version "2.19"

\include "packaging.ly"

\UsePackage "color-mark"

{ f' g' a'2 \ColorMark #blue "Here!" f'1 }