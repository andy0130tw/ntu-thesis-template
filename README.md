# ntu-thesis-template

This is a refined NTU thesis XeLaTeX template based on former works.

You can write your thesis in a supported markup language you are familar with, and Pandoc takes care of the rest.

## Former works

Organizing this template would not be possible without the following open-sourced efforts.

* [**Pandoc Template for NTU Thesis** by liao961120](https://github.com/liao961120/thesis).
* [**國立臺灣大學碩博士學位論文 LaTeX 模板** by hsins](https://github.com/Hsins/NTU-Thesis-LaTeX-Template).
* [**NTU thesis template for XeLaTeX** by tzhuan](https://github.com/tzhuan/ntu-thesis).

## Important files

**The default file**: The YAML file `pandoc.yaml` is called a [default file](https://pandoc.org/MANUAL.html#defaults-files) for Pandoc. Contains all options to pass to Pandoc except the output file name. Edit them to your like.

**Input & Output**: The start of `pandoc.yaml` is the sequence of documents that are going to be fed to Pandoc in order. Do include more files as you write. The path of output file, for coherence with LaTeX, is defined in the build script itself.

**Metadata**: The frontmatter file `src/00-frontmatter.md` contains the metadata for your thesis in YAML format. This file must appear first in your input files. Besides some feature switches, Pandoc interpolates these variables in templates.

**Citations**: Pandoc handles bibliography through its built-in citation processor citeproc. You maintain a list of references in BibTeX format stored in `src/references.bib`. A CSL (citation style language) source located at `deps/citation-style.csl` describes how to typeset these references. The one I use is found in [Zotero](https://www.zotero.org/styles) and modified to my personal taste.

**Scripts**: `scripts/` contains some useful shell scripts for common operations. Invoke `scripts/build-tex.sh` to start a compilation. The output will be written to `dist/thesis.pdf`.

**Deps**: Some assets and low-level control stuff. Unfortunately, it is very likely you need to fine-tune the detail and read the inner working in these files.

* `deps/ntuthesis.cls`: The base class file for the thesis. (btw, it extends the built-in "report" document class)
* `deps/template.tex`: The base template Pandoc uses to construct the LaTeX source.
* `deps/seal.pdf`: The high-quality watermark originally included in hsins' repository. I made a faint version in `deps/seal-semitrans.pdf` for direct inclusion.
* `deps/lua/*.lua`: Some Lua scripts for extending pandoc. I use them sparingly. They are referenced in the default file.

## Dependencies

1. [Pandoc](https://pandoc.org/). At least v3.1.2.
2. [pandoc-crossref](https://lierdakil.github.io/pandoc-crossref/). Pick a compatible release according to the version of your pandoc.
3. XeLaTeX. Usually the most frustrating one to make it work.
4. All LaTeX packages to typeset a LaTeX source. See below.
5. Additional font files. Place them in `fonts/` to be searched, and adjust the class file accordingly. NTU [suggests](https://web.lib.ntu.edu.tw/question//node/619) BiauKai and Times New Roman.
6. Optional. Some TeX log parser will greatly improve your experience with LaTeX, preferably a streaming one. I personally suggest [texlogsieve](https://gitlab.com/lago/texlogsieve). You can add it to PATH and pipe the log output to it.

### LaTeX packages

A full XeLaTeX installation often includes all packages (thus very huge). Otherwise, in TeX Live, use `tlmgr`. For the list of packages, consult [the manual of Pandoc](https://pandoc.org/MANUAL.html#creating-a-pdf).

With a little bit of patience, the most classic way to test this is to compile the project and see what it complains. Install the missing package. Rinse and repeat.

Additionally, the base class requires more. They are: `xecjk` `titlesec` `tocloft` `multirow` `diagbox` `pict2e` `datetime` `fmtcount` `paralist` `subfig`. Not comma-separated so you can copy and paste to compose an install command.

## Some neat features

The base template for Pandoc is modified from the [official one](https://github.com/jgm/pandoc-templates/blob/master/default.latex) for v3.1.2. `misc/` contains some files for prettyprinting and tweaking the base template. This allows easy diffing/updating the template for future pandoc versions. For example, one can examine all beamer-related parts by finding with some regex like `\$if\(beamer\)\$[\s\S]+?\$endif\$\s+\$-- %%% beamer` after annotating.

### "口試委員審定書"

If you drop a `included-certificate.pdf` at project root, it will be inserted to the thesis in place of the mocked page.

### Securing your PDF

NTU requires you to submit the owner-password-protected PDF copy. I experimented for a while and pinpointed the specific set of options with `qpdf` that met the requirements of the library. No need of proprietary software like Adobe Acrobat or FoxIt PDF Editor. Try it out with `scripts/secure-pdf.sh`.

## FAQs

### Why including a copy of `footmisc.sty`?

I cannot get the template compiled with the latest `footmisc`. So I preserve an old working copy. File an issue if you can solve this.

### Did you use the exact version of template to write your thesis?

No. This template is a derived revision released after NTU accepts the electronic version of my thesis.

### This README is not a good documentation.

Mostly because I am not going to maintain this template as soon as I finish my thesis. If you want to learn more, I highly recommend Pandoc's documentation, which is very solid. But you have to be clear on what you want to make out of this template, all on your own. If your issue is LaTeX-related, I do not think I can help, either.

### May I improve it?

Go ahead.
