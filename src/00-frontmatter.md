---
# document class
degree       : "master"   # master | doctor
language     : "english"  # chinese | english
fontset      : "system"   # fontset = default | template | system | overleaf
insert-watermark: true    # watermark = true | false
insert-doi   : true       # doi = true | false
# variables
university   : "國立臺灣大學"
university-en: "National Taiwan University"
college      : "電機資訊學院"
college-en   : "College of Electrical Engineering and Computer Science"
institute    : "資訊工程學系"
institute-en : "Department of Computer Science and Information Engineering"
title        : "使用 Pandoc 驅動的臺大 XeLaTeX 論文模板"
title-en     : "NTU XeLaTeX template powered by Pandoc"
author       : "你的名字"
author-en    : "Your name"
ID           : "R55922055"
advisor      : "老師的名字"
advisor-en   : "Professer's Name"
date         : "2023-07-30"
oral-date    : "2023-06-13"
html-date    : "June 13, 2023"  # unused AFAIK
DOI          : "10.6342/NTUXXXXXXXXX"
keywords     : "關鍵字一、關鍵字二、關鍵字三"
keywords-en  : "foo, bar, baz"
# Acknowledgement
acknowledgement-in-en: true  # true for english
acknowledgement: | 
    Some Acknowledgements.
colophon: |
    This thesis is proudly processed with Pandoc, a sophisticated document converter made by \mbox{John MacFarlane}.
abstract: |
    一些摘要
abstract-en: |
    Some abstract

########## Cross-ref options ###########
linkReferences: true
cref: true
codeBlockCaptions: true
figureTitle: "Figure"           # 圖 | Figure
tableTitle: "Table"             # 表 | Table
listingTitle: "Listing"         # 程式碼 | Listing
figPrefix: "Figure"             # 圖 | Figure
eqnPrefix: "Equation"           # 公式 | Equation
tblPrefix: "Table"              # 表 | Table
lstPrefix: "Listing"            # 程式碼 | Listing
secPrefix: "Section"            # 章節 | Section
titleDelim: "."                 # ： | .
tableTemplate: "$$tableTitle$$ $$i$$$$titleDelim$$$$t$$"   # $$tableTitle$$ $$i$$$$titleDelim$$ $$t$$
figureTemplate: "$$figureTitle$$ $$i$$$$titleDelim$$$$t$$" # $$figureTitle$$ $$i$$$$titleDelim$$ $$t$$
eqnPrefixTemplate: "$$p$$&nbsp;($$i$$)"  # $$p$$&nbsp;($$i$$) | $$p$$&nbsp;$$i$$

# meta variables for the template
indent: true
mathspec: true
boxlinks: true
link-citations: true
csquotes: true
# this should be both here and in the defaults file
listings: true

header-includes: |
  \usepackage{tcolorbox}
  \newtcolorbox{myquote}{colback=blue!5!white, colframe=blue!30!black}
  \renewenvironment{quote}{\begin{myquote}}{\end{myquote}}
---
