# Zabumbando

Padrões rítmicos do forró nordestino — partitura LilyPond e playback MIDI no navegador.

**Site:** <https://yerkoescalona.github.io/zabumbando/>

---

## Testar localmente

### 1. Instalar Hugo Extended

O site usa Hugo **Extended** ≥ 0.153. Escolha um método:

**macOS (Homebrew)**
```bash
brew install hugo
```

**Linux (Debian/Ubuntu)**
```bash
HUGO_VERSION=0.161.1
wget -O /tmp/hugo.deb \
  https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
sudo dpkg -i /tmp/hugo.deb
```

**Windows (Scoop)**
```powershell
scoop install hugo-extended
```

Verifique a instalação:
```bash
hugo version
# hugo v0.161.1+extended ...
```

### 2. Clonar o repositório com o submodule

O tema Blowfish é um git submodule — use `--recurse-submodules`:

```bash
git clone --recurse-submodules https://github.com/yerkoescalona/zabumbando.git
cd zabumbando
```

Se já clonou sem o flag:
```bash
git submodule update --init --recursive
```

### 3. (Opcional) Compilar as partituras LilyPond

O site usa LilyPond para renderizar as partituras como SVG + MIDI. Se quiser recompilar localmente:

**macOS**
```bash
brew install lilypond
```

**Linux (Debian/Ubuntu)**
```bash
sudo apt install lilypond
```

Depois compile:
```bash
make scores
# Gera static/scores/*.cropped.svg e *.midi a partir de scores/*.ly
```

> Sem este passo, as partituras e o player MIDI usam os arquivos já commitados em `static/scores/`.

### 4. Iniciar o servidor de desenvolvimento

```bash
hugo server --buildDrafts --disableFastRender
```

Ou via Makefile:
```bash
make serve
```

Acesse **<http://localhost:1313/>** no navegador.

---

## Publicar no GitHub Pages

### Configuração única

1. Acesse o repositório no GitHub → **Settings → Pages**
2. Em **Source**, selecione **GitHub Actions**

O deploy acontece automaticamente a cada push na branch `main`.

---

## Estrutura do projeto

```
zabumbando/
├── scores/                       ← fontes LilyPond (.ly)
│   ├── baiao-basico.ly
│   ├── baiao-basico-repique.ly
│   ├── xote-basico.ly
│   ├── pandeiro-baiao.ly
│   └── pandeiro-xote.ly
├── static/scores/                ← SVGs + MIDIs gerados por `make scores`
├── content/posts/
│   ├── o-que-e-forro/            ← história e subgêneros do forró
│   ├── instrumentos-do-forro/    ← zabumba, sanfona, triângulo, pandeiro
│   ├── como-tocar-zabumba/       ← baião + xote com partitura e MIDI
│   ├── como-tocar-pandeiro/      ← baião + xote com partitura e MIDI
│   └── forro-sequencer/          ← apresentação do Forró Sequencer
├── layouts/
│   ├── shortcodes/
│   │   └── lily.html             ← SVG LilyPond + midi-player
│   └── partials/
│       ├── extend-head-uncached.html
│       └── extend-footer.html
├── config/_default/              ← configuração Hugo (PT-BR + EN)
├── assets/img/                   ← avatar e cover
├── themes/blowfish/              ← submodule
└── Makefile                      ← atalhos de build
```

---

## Adicionar um novo padrão

1. Escreva o arquivo LilyPond em `scores/nome-do-padrao.ly` (inclua `\midi { }`)
2. Compile com `make scores`
3. Use `{{</* lily "nome-do-padrao" */>}}` no conteúdo do post

O shortcode `lily` renderiza o SVG da partitura e um player MIDI com piano-roll visual.

---

## Comandos úteis

```bash
make serve          # servidor local com drafts
make scores         # compila .ly → SVG + MIDI via LilyPond
make clean          # remove SVGs e MIDIs gerados
hugo --gc --minify  # build de produção local
```
