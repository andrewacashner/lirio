\version "2.22"

%% Not needed in later lilypond versions

%% Put a repeat message on a lower staff (due to Lilypond bug this is normally impossible. We do this as a markup rather than a mark, using \MarkThisUp, so it must be entered after a note.
%% Example: { a1 \RepeatMsgLowerStaff "[D.C. al Fine]" \FinalBar }

RepeatMsgLowerStaff =
#(define-event-function
  (msg) (markup?)
  "Print a repeat message like 'D.C. al Fine' on a staff other than the top staff."
  #{  \MarkThisUp \markup \raise #4 \fontsize #2 $msg  #})


%% Place fermata on last note so that markup can be placed above it
%% Necessary for \RepeatMsgLowerStaff to work
ArticulationSubmit = \once \override Script.outside-staff-priority = #100

