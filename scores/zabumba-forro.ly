\version "2.24.0"

\header {
  tagline = ##f
}

\score {
  \new Staff {
    \clef percussion
    \tempo 4 = 100
    \time 2/4
    \relative c' {
      \repeat volta 2 {
        e,16[ d'16 d16 g,16] f'8[ f16 e,16]
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
