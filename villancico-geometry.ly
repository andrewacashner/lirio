%% villancico-geometry.ly
%% Andrew Cashner, 2016/12/07
%%
%% Custom geometry for Cashner villancico edition

\version "2.22"

#(set-global-staff-size 16)
#(set-default-paper-size "letter")

\paper {

  %% DIMENSIONS
  line-width    = 6\in    % i.e., 1-inch L & R margins
  left-margin   = 1\in
  top-margin    = 1.25\in   % to allow for headers
  bottom-margin = 1.25\in
  two-sided     = ##f       % single-sided
  ragged-bottom = ##t       % don't add extra vertical space between systems
  ragged-last-bottom = ##t  % even if it's the last page
  print-page-number = ##f   % no page nos. (added by LaTeX)

  %% SPACING
  % distance between two systems on one page
  system-system-spacing.basic-distance = #20 % default 12
  system-system-spacing.minimum-distance = #18 % default 8
  system-system-spacing.padding = #8 % default 1
  system-system-spacing.stretchability = #10 % default 60

  % distance between top-level markup (like title) and system
  markup-system-spacing.padding = #2 % default 0.5
  
}

\layout {
  indent       = 1.75\in
  short-indent = 0.5\in

   \context { 
     \Score
     %% Increase overall spacing
     \override SpacingSpanner.base-shortest-duration =
     #(ly:make-moment 1/9)
   }

  \context {
    \Staff
    \RemoveEmptyStaves

  % spacing defaults in [LILYPONDHOME]/scm/define-grobs.scm
   \override VerticalAxisGroup.default-staff-staff-spacing =
     #'((basic-distance . 12)
    (minimum-distance . 10)
    (padding . 1)) % defaults 9, 8, 1

  }

  % Use the settings for StaffGrouper, since anything inside
  % a ChoirStaff or StaffGroup overrides the default settings
  % for VerticalAxisGroup
  \context {
    \ChoirStaff

    % Space between staves inside ChoirStaff
    \override StaffGrouper.staff-staff-spacing = 
    #'((basic-distance . 12)
    (minimum-distance . 10)
    (padding . 1)
    (stretchability . 5)) % defaults 9, 7, 1, 5

    % Space between one ChoirStaff and the next staff or group
    \override StaffGrouper.staffgroup-staff-spacing = 
    #'((basic-distance . 14) 
    (minimum-distance . 12) 
    (padding . 1)
    (stretchability . 9)) % defaults 10.5, 8, 1, 9

    \override StaffGrouper.nonstaff-unrelatedstaff-spacing.padding = #2
    % default 1.5
  }
  % If using StaffGroup, duplicate all this for \context { \StaffGroup ... }

}

