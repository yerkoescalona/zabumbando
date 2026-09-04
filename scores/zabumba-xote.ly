\version "2.24.0"

\header {
  tagline = ##f
}

% xote — um pentagrama, duas vozes: bacalhau com hastes para cima,
% maceta com hastes para baixo, cada lado com as suas pausas.
%
%   posição:    1        2       3        4
%   maceta:     fechada  —       aberta   aberta
%   bacalhau:   —        toca    —        toca
%
% Cabeça em X marca a maceta fechada, como nas partituras de pandeiro.
% Alturas absolutas de propósito: o modo \relative já causou um salto
% de oitava neste arquivo.

xNH = \once \override NoteHead.style = #'cross

\score {
  \new Staff {
    \clef percussion
    \tempo 4 = 76
    \time 2/4
    <<
      \new Voice { \voiceOne  \repeat volta 2 { r8 d'8 r8 d'8 } }
      \new Voice { \voiceTwo  \repeat volta 2 { \xNH g8 r8 e8 e8 } }
    >>
  }
  \layout {
    indent = 0
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
  }
}
