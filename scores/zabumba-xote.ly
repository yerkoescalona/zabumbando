\version "2.24.0"

\header {
  tagline = ##f
}

% xote: m=[2,0,0,0,1,0,1,0]  b=[0,0,1,0,0,0,0,0]
% 2-bar cycle in 2/4 (16 sixteenths total)

\score {
  \new Staff {
    \clef percussion
    \tempo 4 = 76
    \time 2/4
    \relative c'' {
      \repeat volta 2 {
        g,8[ d'16 r16] f'8 f8 |
        e,8 r8 r2 |
      }
    }
  }
  \layout {
    indent = 0
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
  }
}
