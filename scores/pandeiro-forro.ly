\version "2.24.0"

\header {
  tagline = ##f
}

% Preset: [2, 1, 1, 3, 1, 1, 1, 2]  @ 100 BPM
% 0=non  1=xi  2=tum  3=tũ  4=tapa

noNH = \once \override NoteHead.transparent = ##t
xNH  = \once \override NoteHead.style = #'cross

pandeiro = {
  \override Staff.StaffSymbol.line-count = #1
  \override Stem.length = #7
  \clef percussion
  \time 2/4
  \tempo 4 = 100
  \stemUp
  \repeat volta 2 {
    b16                     % 2 tum
    \noNH d'16              % 1 xi
    \noNH b16               % 1 xi
    \parenthesize d'16      % 3 tũ
    \noNH b16               % 1 xi
    \noNH d'16              % 1 xi
    \noNH b16               % 1 xi
    d'16                    % 2 tum
  }
}

\score {
  \new Staff \pandeiro
  \layout {
    indent = 0
    \context {
      \Staff
      \override StaffSymbol.staff-space = #1.5
    }
    \context {
      \Score
      \remove "Bar_number_engraver"
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
    }
  }
  \midi {}
}
