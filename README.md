# KUThesis (Lab Edition)

**Lab Edition — forked and updated: October 2026**, based on [KUThesis2022](https://github.com/hyeonleee/KUThesis2022) by Suhyeon Lee.

An unofficial LaTeX template for a Korea University master's thesis / Ph.D. dissertation, based on the official Korea University Graduate School guidelines (the regulation document itself is dated October 2022, last revised December 2022, and was still the current standard as of this fork). This copy has been adapted into an **English-only** internal starting point: fill in your own details, replace the placeholder chapters, and you're off.

It makes it easy to switch between a master's or doctoral version, double- or single-sided printing, and a dedicated library-submission format, so you spend less time fighting formatting during writing, examination, and submission.

## Compiling

Tested with `pdflatex`, both on [Overleaf](https://www.overleaf.com) and with a local TeX Live / MacTeX installation (TeX Live 2013 or later).

- Unix-like systems: run `make` to compile, `make clean` to remove generated files.
- Windows: run `make.bat` to compile, `clean.bat` to remove generated files.

Keeping backups of your work is strongly recommended.

## Project Structure

| File | Purpose |
| --- | --- |
| `KUThesis.cls` | The document class: page layout, cover/title/signature pages, etc. |
| `thesis.tex` | Main file - your title, author, advisor, committee, and class options go here. |
| `abstract/abstract.tex` | English abstract. |
| `abstract/abstract-kr.tex` | Korean abstract (required by regulation, even for an English-language thesis). |
| `acknowledgement.tex` | Acknowledgments (사사). |
| `dedication.tex` | Dedication page (감사의 글, optional) - enable with `\includeDedication`. |
| `preface.tex` | Preface (서문, if necessary) - enable with `\includePreface`. |
| `nomenclature.tex` | List of symbols/abbreviations (기호설명, optional) - enable with `\includeNomenclature`. |
| `chapters/1.how-to-use.tex` | This template's own usage guide, written as a sample chapter - replace it with your real content. |
| `chapters/format-eng.tex` | A longer sample chapter demonstrating headings, tables, figures, equations, citations, etc. - also meant to be replaced. |
| `library.bib` | Your bibliography database (BibTeX). |
| `figures/` | Image assets used by the sample chapters. |

## Class Options

Pass these to `\documentclass[...]{KUThesis}`:

- `doctor` / `master`: Ph.D. dissertation or Master's thesis
- `final` / (omit for draft): final submission version or a work-in-progress draft
- `library`: formats the document for digital library submission (removes blank filler pages)
- `twosides` / `oneside`: double-sided or single-sided printing
- `krabst`: generates the Korean abstract page (required by regulation, even for an English-language thesis)
- `science` (default) / `arts`: (master's only) labels the degree "Master of Science" or "Master of Arts"
- `asym`: adjusts the binding-side margin for print shops that prefer an asymmetric gutter
- `chapterinline` (default) / `chapterstacked`: show "Chapter 1. Title" on one line, or "Chapter 1" / "Title" on two lines

Recommended examples:

```latex
\documentclass[doctor, final, twosides, krabst, library]{KUThesis}   % PhD, library submission copy
\documentclass[master, final, twosides, krabst]{KUThesis}            % Master's, final bound copy
```

## What You Need to Edit

- `thesis.tex`: `\title`, `\author`, `\advisor`, `\graduateSchool`, `\graduateDate`, `\submitDate`, `\approvalDate`, `\referee`, `\keywords`
- `abstract/abstract.tex` and `abstract/abstract-kr.tex`: your English and Korean abstracts
- `dedication.tex`, `preface.tex`, `nomenclature.tex`: only if you enable the matching `\include...` command
- Replace the placeholder chapters under `chapters/` with your actual content

If the automatic line breaks in `KUThesis.cls` look awkward for a particularly long name, title, or department, you may need to manually adjust line breaks (`\\`) or font sizes in the relevant macro.

## Credits

Adapted from [KUThesis2022](https://github.com/hyeonleee/KUThesis2022) by Suhyeon Lee.

Further references:
- [KU Nuclear Physics Lab's earlier LaTeX template](https://github.com/KUNPL/KUThesis)
- [Korea University Graduate School thesis format notice](https://graduate.korea.ac.kr/academic/dissertation.html)

## Disclaimer

This template is provided as a convenience, with no warranty of any kind. The maintainers are not responsible for any issues, rejected submissions, or formatting problems that result from using it. Thesis/dissertation formatting requirements can change, and submission policies may vary by department, program, advisor, or library staff.

**Always check the latest official guidelines with your own department/graduate school before relying on this template, and leave yourself enough time before your submission deadline.**
