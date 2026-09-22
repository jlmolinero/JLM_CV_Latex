# CV de Javier López Molinero en LaTeX

El proyecto genera cuatro documentos A4:

- `javier_cv_es.pdf`: versión visual en español.
- `javier_cv_en.pdf`: versión visual en inglés.
- `javier_cv_ats_es.pdf`: versión ATS, una columna, en español.
- `javier_cv_ats_en.pdf`: versión ATS, una columna, en inglés.

## Compilación

Requiere XeLaTeX y una instalación estándar de TeX Live. Inkscape solo es
necesario si se modifican los iconos SVG; los PDF de los iconos ya están
incluidos en el proyecto.

```bash
make
```

El `Makefile` ejecuta XeLaTeX dos veces por documento. La segunda pasada es
necesaria para resolver correctamente la posición de las cabeceras y paneles
dibujados con TikZ mediante `remember picture` y `overlay`.

También se puede compilar un archivo concreto:

```bash
xelatex -interaction=nonstopmode -halt-on-error javier_cv_es.tex
```

Los enlaces de teléfono, correo, LinkedIn y GitHub son pulsables. La versión visual omite fecha de nacimiento y permiso de conducir para adecuarse a candidaturas internacionales. La versión ATS evita columnas, fotografía e iconos.

La maquetación visual reproduce las proporciones de la versión V9 aprobada: cabecera de 154 pt equivalentes, retrato circular de 104 pt centrado sobre la columna lateral, cuadrícula principal de 330/30/151 pt, paneles laterales alineados y línea temporal en la experiencia. Tanto la versión visual como la ATS se generan desde los archivos LaTeX del proyecto.

No se han inventado métricas: solo se incluye el dato verificado de más de 1.200 descargas de la aplicación de laisla.fm. En los archivos `.tex` hay comentarios `METRICA` que indican dónde añadir resultados cuantificables cuando estén disponibles.
