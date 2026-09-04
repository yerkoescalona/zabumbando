\version "2.24.0"

\header {
  tagline = ##f
}

noNH = \once \override NoteHead.transparent = ##t
xNH  = \once \override NoteHead.style = #'cross

legenda = {
  \override Staff.StaffSymbol.line-count = #1
  \override Stem.length = #7
  \clef percussion
  \time 4/4
  \stemUp
  \omit Score.TimeSignature
  \omit Score.BarLine
  \override TextScript.font-size = #-2

  % ── Símbolos ──
  b4_\markup { \center-column { \bold "tum" "aberto" } }
  \parenthesize b4_\markup { \center-column { \bold "tũ" "abafado" } }
  \xNH b4_\markup { \center-column { \bold "tapa" "estalado" } }
  \noNH b4_\markup { \center-column { \bold "xi" "platinelas" } }

  \bar "||"

  % ── Posição: na linha = mão desce, acima = mão sobe ──
  b8_\markup { \center-column { "↓" "desce" } }
  d'8^\markup { \center-column { "sobe" "↑" } }
  b8 d'8 b8 d'8 b8 d'8
}

\score {
  \new Staff \legenda
  \layout {
    indent = 0
    \context {
      \Staff
      \override StaffSymbol.staff-space = #1.5
    }
    \context {
      \Score
      \remove "Bar_number_engraver"
      \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
      \override SpacingSpanner.spacing-increment = #6
    }
  }
}
