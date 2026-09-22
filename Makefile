SHELL := /bin/bash
TEX := xelatex -interaction=nonstopmode -halt-on-error
DOCS := javier_cv_es javier_cv_en javier_cv_ats_es javier_cv_ats_en
ICON_NAMES := linkedin github phone email
ICON_PDFS := $(ICON_NAMES:%=assets/%.pdf)

.PHONY: all clean

all: $(DOCS:%=%.pdf)

assets/%.pdf: assets/%.svg
	inkscape $< --export-type=pdf --export-filename=$@

%.pdf: %.tex cvcommon.sty assets/profile-square.jpg $(ICON_PDFS)
	$(TEX) $<
	# Segunda pasada necesaria para los elementos TikZ con remember picture/overlay.
	$(TEX) $<

clean:
	rm -f *.aux *.log *.out *.toc *.xdv $(DOCS:%=%.pdf)
