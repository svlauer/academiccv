# `academiccv.cls`: A clean, simple academic CV

LaTeX has a number of class/style files for typesetting CVs and resumes. None
of them is aesthetically pleasing and suited to an academic CV, which should be
somber and clean, yet visually appealing, and suited for quick skimming. In 
addition, the available packages all require rather exotic source code syntax.

For years, I used to roll my own hacked-together style file, which did not make
for the most pretty source code, but gave a nice result. Things might have 
continued this way, had I not heard that friends of mine use *MS Word* for 
their  CVs (and live with the consequences), simply because the only way they 
could get lists with year numbers as labels (required for US-style academic 
CVs) was by using cumbersome `tabular` environments.

Friends don't let friends use *MS Word*, so here is my academic CV template. 
It does not do much: It is pretty much the standard `article` class, enhanced
with some niceties: a `dated` environment that allows for lists itemized by
date, plus some convenience commands for creating a nice header, and some 
adjustments for sectioning commands.

For an example of a pretty-ish CV produced using this package, see 
[example.pdf](example/main.pdf), which is actually my current CV. 
The source for this is in the [example](example/) directory.

## Installation

As usual, simply place `academiccv.cls` some place where TeX can find it
(the directory where your tex files live will work if all else fails).

Then you can load in the usual way, by starting the preamble
of your document with:
```latex
\documentclass{academiccv}
```

All package options (except for `enumitemize`) will behave as with the standard
`article` class, except for the font size options (`academiccv.cls` will always behave as if `12pt` is passed).

## Dependencies

- [`enumitem.sty`](https://ctan.org/pkg/enumitem?lang=en) (provides the list environments)
- [`titlesec.sty`](https://ctan.org/pkg/titlesec?lang=en) (for adjusting section titles)
- [`geometry.sty`](https://ctan.org/pkg/geometry?lang=en) (for adjusting margins)

All three of these should be provided with virtually all recent-ish LaTeX-installations.

## Usage

### The `dated` evironment

`academiccv.cls` is a conservative extension of LaTeX's `article` class. The 
main enhancement it offers is the `dated` evironment, which typesets list entries associated with dates, like this:

```latex
\begin{dated} 
    \item[2007--2013] 
        \textbf{Ph.D. in Linguistics}, Stanford University, 2013.\\
        Dissertation: \href{http://sven-lauer.net/output/Lauer-Dissertation-DynamicPragmatics.pdf}{\textbf{Towards a dynamic pragmatics}}\\
        Committee: Cleo Condoravdi, Christopher Potts (co-chairs), Paul Kiparsky.
    \item[2005--2007]
        Universiteit van Amsterdam\\
        Institute for Logic, Language and Computation (ILLC)\\
        M.Sc. student in Logic
    \item[2001--2005] 
        \textbf{B.Sc. in Cognitive Science} with distinction, {Universit\"at Osnabr\"uck}, 2005. 
    \item[2003-2004]
        University of Edinburgh\\
        School of Informatics\\
        Visiting undergraduate 
\end{dated}
```

This will be typeset as: 

![dated](http://www.sven-lauer.net/files/academiccv/years.png)

### Front matter

`academiccv.cls` redefines `\maketitle` to produce a header suitable for CVs.
Standardly, it will typeset the name provided via `\author`, followed by the 
`\date`, followed by a horizontal line. You can override the `\maketitle` 
command to change this, or simply leave it out and roll your own header.

Besides the usual `\date` and `\author` settings, `academiccv` provides the
commands `\contact` and `\moreinfo`. Their contents are typeset (next to each 
other, flush left and right, respectively) with the `\makeinfo` command.

### Setting lists without dates (the `undated` environment)

For some sections of a CV, dating items may no make sense (lists of 
references, languages spoken, skills, etc.). You can use the standard 
LaTeX list environments (like `itemize` and `enumerate`) for those, but this
may not always give the desired result.

If you want the list items to indented in the same way as the dated ones are, 
you can just use a `dated` list, but leave out the argument of `\item`. 
If you instead want the list items to be flush with the headings, you can
instead use the `undated` environment, like so:
```latex
%-----------------------------------------------------------------------------%
\section*{References}
%-----------------------------------------------------------------------------%
\begin{undated}
    \item
        \textbf{Cleo Condoravdi}\\
        \textit{Professor}\\
        Department of Linguistics\\
        Margaret Jacks Hall, Building 460\\
        Stanford University \\
        Stanford, CA 94305-2150\\
        USA\\
        \href{mailto:cleoc@stanford.edu}{\texttt{cleoc@stanford.edu}}
    \item 
        \textbf{Christopher Potts}\\
        \textit{Professor}\\
        Department of Linguistics\\
        Margaret Jacks Hall, Building 460\\
        Stanford University \\
        Stanford, CA 94305-2150\\
        USA\\
        \href{mailto:cgpotts@stanford.edu}{\texttt{cgpotts@stanford.edu}}
\end{undated}
```

which will be typeset as: 

![dated](http://www.sven-lauer.net/files/academiccv/references.png)

## Customization

`academiccv.cls` tries to stay out of your way as much as possible: It only 
enhances the `article` class with the `dated` and `undated` environments, and
adjusts the display of (sub)section headings.

### Package options

There is one package option that is particular to `academiccv.cls`, called
`enumitemize`. By default, `academiccv` loads the `enumitem` package with the
`loadonly` option, which means the enhancements are not applied to the standard
LaTeX list environments (`itemize`, `enumerate` and `description`). With
`enumitemize`, the standard lists get the enhancements, as well.

All other options are passed through to `article` unchanged. However, the 
**font size options will have no effect** (`academiccv` will always behave as
if the `12pt` option had been passed). If you really want to change the basic
font size, you will have to do it by other means.

(I do advise against font sizes smaller than 12pt for CVs, which are made to be skimmed. This becomes difficult on smaller font sizes. This is why I 
hardwired 12pt as the font size (I would have preferred to have 12pt as a
default that can be overriden, but this does not seem to be possible). For the
same reason, I advise strongly against smaller margins than the 1 inch 
default).

### (Sub)section titles

`academiccv` uses the `titlesec`  package to adjust the display of section 
titles. This means that the facilities of that package are available for 
changing these. 

For example, if you wanted to have `\subsubsection`s be displayed in italics, 
you could simply add the following to your preamble:

```latex
\titleformat{\subsubsection}{\normalsize\mdseries\it}{\thesubsubsection.}{.5em}{}
```

**Note:** `academiccv` does not suppress section numbers by default, even 
though it is not customary to number the sections in a CV. So you should 
generally use the `\section*`, `\subsection*` and `\subsubsection*` commands
to label your sections.

### List parameters

The `dated` and `undated` lists are provided by `enumitem`, which makes them
highly configurable.

If you want to adjust the parameters of a single list (say, to increase spacing
between the items), you can simply pass the parameters as an optional argument
to the list, like so:

```latex
\begin{dated}[itemsep=1em]
   ...
\end{dated}
```

If you instead want to change **all** lists in a document, you can use the 
`\setlist` command. However, this overrides all parameters of the lists. In order to change only selected settings, you can use the following:

```latex
\setlist[dated]{dateddefaults, itemsep=1em}
\setlist[undated]{undateddefaults, itemsep=1em}
```

