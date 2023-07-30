# The first chapter {#sec:chapter-1}

Pandoc (https://pandoc.org/) 讓你可以用各種你熟悉的語法書寫，像是 Markdown [@dominici2014overview]，然後輸出成專業的 `\LaTeX`{=latex} 格式。

## A section {#sec:section-1-1}

這是第一章。其實還有**第二章**。

## Another section

I will repeat [@sec:section-1-1] but in English. This is the **first** chapter. In fact, there is *another* chapter: [@sec:chapter-2].

\begin{figure}%
  \centering
  \subfloat[][faint version]{\includegraphics[page=1,width=.25\textwidth]{deps/seal-semitrans.pdf}}%
  \qquad
  \subfloat[][original]{\includegraphics[page=1,width=.25\textwidth]{deps/seal.pdf}}
  \caption{The "seal"}%
  \label{fig:seal}%
\end{figure}
