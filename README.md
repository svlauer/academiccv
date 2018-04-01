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
[example.pdf](example/main.pdf). The source for this is in the [
example](example/) directory.
