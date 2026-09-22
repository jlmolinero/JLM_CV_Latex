# Javier López Molinero CV in LaTeX

This repository contains the LaTeX source used to generate Javier López Molinero's CV as PDF files.

It builds four A4 documents:

- `javier_cv_es.pdf`: visual version in Spanish.
- `javier_cv_en.pdf`: visual version in English.
- `javier_cv_ats_es.pdf`: ATS-friendly single-column version in Spanish.
- `javier_cv_ats_en.pdf`: ATS-friendly single-column version in English.

## Requirements

The project is designed to be compiled with **XeLaTeX**. XeLaTeX is required because the shared package (`cvcommon.sty`) uses `fontspec` and configures `DejaVu Sans`.

You need:

- A LaTeX distribution with XeLaTeX:
  - Linux: TeX Live.
  - macOS: MacTeX or BasicTeX with the required packages.
  - Windows: MiKTeX or TeX Live.
- `make`, optional but recommended.
- `DejaVu Sans` installed. Most Linux distributions include it or package it separately; on macOS/Windows, install it if XeLaTeX cannot find the font.
- Inkscape only if you modify the SVG icons in `assets/`. The generated PDF icons are already included in the repository.

## Build all PDFs

On Linux/macOS, or on Windows with WSL/Git Bash/MSYS2:

```bash
make
```

The `Makefile` runs XeLaTeX twice for each document. The second pass is needed so TikZ can correctly resolve headers and panels drawn with `remember picture` and `overlay`.

## Build a single PDF

```bash
xelatex -interaction=nonstopmode -halt-on-error javier_cv_es.tex
```

Replace the filename with the document you want to build:

```bash
xelatex -interaction=nonstopmode -halt-on-error javier_cv_en.tex
xelatex -interaction=nonstopmode -halt-on-error javier_cv_ats_es.tex
xelatex -interaction=nonstopmode -halt-on-error javier_cv_ats_en.tex
```

If you are not using `make`, run the same command twice so TikZ and page references are fully resolved.

## Platform setup

### Linux

#### Arch Linux / CachyOS / Manjaro

```bash
sudo pacman -S make texlive-bin texlive-binextra texlive-xetex texlive-latex texlive-latexrecommended texlive-latexextra texlive-pictures texlive-fontsrecommended texlive-fontsextra ttf-dejavu
make
```

#### Debian / Ubuntu

```bash
sudo apt update
sudo apt install make texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra fonts-dejavu-core
make
```

#### Fedora

```bash
sudo dnf install make texlive-xetex texlive-collection-latex texlive-collection-latexextra texlive-collection-fontsrecommended dejavu-sans-fonts
make
```

### macOS

With MacTeX:

```bash
brew install --cask mactex
make
```

If you prefer BasicTeX to save disk space, install missing packages with `tlmgr` when XeLaTeX reports them:

```bash
brew install --cask basictex
sudo tlmgr update --self
sudo tlmgr install latexmk fontspec geometry xcolor graphics tikz pgf paracol tabularx enumitem tcolorbox hyperref titlesec
make
```

If you get a `DejaVu Sans` font error, install the font:

```bash
brew install --cask font-dejavu-sans
```

### Windows

Recommended option: install **MiKTeX** and compile from PowerShell or your LaTeX editor.

1. Install MiKTeX from https://miktex.org/download
2. Enable automatic package installation when MiKTeX prompts for it.
3. From PowerShell, inside the project directory:

```powershell
xelatex -interaction=nonstopmode -halt-on-error javier_cv_es.tex
xelatex -interaction=nonstopmode -halt-on-error javier_cv_es.tex
```

To build all four PDFs on Windows without `make`, run:

```powershell
$docs = "javier_cv_es", "javier_cv_en", "javier_cv_ats_es", "javier_cv_ats_en"
foreach ($doc in $docs) {
  xelatex -interaction=nonstopmode -halt-on-error "$doc.tex"
  xelatex -interaction=nonstopmode -halt-on-error "$doc.tex"
}
```

You can also use WSL and follow the Linux instructions.

### Overleaf

1. Create a new Overleaf project.
2. Upload all repository files, including the `assets/` directory.
3. In **Menu → Compiler**, select **XeLaTeX**.
4. Choose one of these main files:
   - `javier_cv_es.tex`
   - `javier_cv_en.tex`
   - `javier_cv_ats_es.tex`
   - `javier_cv_ats_en.tex`
5. Recompile.

### Docker

If you do not want to install LaTeX locally, use a TeX Live Docker image:

```bash
docker run --rm -v "$PWD":/work -w /work texlive/texlive:latest make
```

On Windows PowerShell:

```powershell
docker run --rm -v "${PWD}:/work" -w /work texlive/texlive:latest make
```

## Cleaning generated files

To remove generated PDFs and auxiliary LaTeX files:

```bash
make clean
```

## Project structure

```text
.
├── Makefile
├── README.md
├── cvcommon.sty
├── javier_cv_es.tex
├── javier_cv_en.tex
├── javier_cv_ats_es.tex
├── javier_cv_ats_en.tex
└── assets/
    ├── profile-square.jpg
    ├── *.svg
    └── *.pdf
```

## Content notes

Phone, email, LinkedIn, and GitHub links are clickable. The visual version omits date of birth and driving license information to better fit international applications. The ATS version avoids columns, photos, and icons to improve parsing by applicant tracking systems.

The visual layout reproduces the proportions of the approved V9 version: a 154 pt-equivalent header, a 104 pt circular portrait centered over the side column, a 330/30/151 pt main grid, aligned side panels, and a timeline-style experience section. Both the visual and ATS versions are generated from the LaTeX files in this repository.

No metrics have been invented: the only quantified achievement included is the verified figure of more than 1,200 downloads for the laisla.fm app. The `.tex` files include `METRICA` comments marking where quantified results can be added when available.

## License and usage

This repository contains both reusable LaTeX template code and personal CV content.

- The LaTeX code, `Makefile`, and template structure are released under the MIT License; see `LICENSE`.
- Javier López Molinero's personal CV content, photograph, contact details, employment history, and identifying information are not licensed for reuse as your own CV or for impersonation.

If you reuse the template, replace the personal content, photograph, and contact details with your own.
