%% geometry.ly
%% Andrew A. Cashner 2017/04/02
%% Standard page layout settings

\version "2.22"

#(set-global-staff-size 16)
#(set-default-paper-size "letter")

\paper {

  %% DIMENSIONS
  line-width    = 6.5\in    % i.e., 1-inch L & R margins
  left-margin   = 1\in
  top-margin    = 1\in      % to allow for headers
  bottom-margin = 1\in
  two-sided     = ##f       % single-sided
 
  markup-system-spacing =
  #'((padding . 4))
  system-system-spacing = 
  #'((padding . 4))
}

