# `academiccv.sty`: A clean, simple academic CV

LaTeX has a number of class/style files for typesetting CVs and resumes. None
of them is aesthetically pleasing and suited to an academic CV, which should be
somber and clean, yet visually appealing, and suited for quick browsing.

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

## The main facilities

### The `dated` evironment

`academiccv.cls` is a conservative extension of LaTeX's `article` class. The 
main enhancement it offers is the `dated` evironment, which typesets list entries associated with dates, like this:

```
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

![dated](http://www.sven-lauer.net/files/
files/academiccv/years.png)


