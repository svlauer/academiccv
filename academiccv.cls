%
\NeedsTeXFormat{LaTeX2e}
%
\ProvidesClass{academiccv}%
	[2018/04/04 A clean, simple academic cv v.0.9.0]
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% PACKAGE OPTIONS 															%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% This overrides the normal font size options. I'd prefer to specify 12pt as 
% a default that can be overridden, but this does not seem to be possible.
\PassOptionsToClass{12pt}{article}
%
% Package Option: enumitemize
% Standardly, academiccv does not apply enumitem's enhancements to the 
% standard lists (itemize, enumerate, description). This option changes 
% that.
\newif\if@AcaCV@loadonly\@AcaCV@loadonlytrue
\DeclareOption{enumitemize}{\@AcaCV@loadonlyfalse}
%
% We simply pass all other options through to the article class.
%
% Note that the font size options (10pt,11pt,12pt) do not take effect, 
% however. The package will always act as if it had been passed "12pt".
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%
% Act on options.
%
\if@AcaCV@loadonly
  \PassOptionsToPackage{loadonly}{enumitem}%
\fi
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% DEPENDENCIES	 															%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
\LoadClass{article}
%
\RequirePackage{enumitem}
%
\RequirePackage[compact]{titlesec}
%
\RequirePackage{geometry}
%
% Geometry defaults: 1 inch margins all around
%
\geometry{left=1in,right=1in,top=1in,bottom=1in} % 
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% enumitem configuration													%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% Creating the `dated` list environment.
%
\newlist{dated}{description}{1}
%
% Default options. Defined as a config-key in order to make it easier for
% users to overwrite individual options.
%
\SetEnumitemKey{dateddefaults}{%
  	font={\footnotesize\textnormal},
	leftmargin=.9in,
	style=nextline,
	itemsep=0.15em,
}
\setlist[dated]{dateddefaults}
%
% Creating the `undated` list environment.
%
\newlist{undated}{itemize}{1}
%
% Default options. Defined as a config-key in order to make it easier for
% users to overwrite individual options.
%
\SetEnumitemKey{undateddefaults}{%
	label={},
	leftmargin=0in,
	itemsep=1em,
}
\setlist[undated]{undateddefaults}
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% titlesec configuration													%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% Sections: \Large, in small caps and bold.
\titleformat{\section}{\Large\scshape\bfseries}{}{.5em}{}
%
% Subsections: \large, bold.
\titleformat{\subsection}{\large\bfseries}{{\bfseries\thesubsection.}}{.5em}{}
%
% Subsubsections: \normalsize, normal font.
\titleformat{\subsubsection}{\normalsize\mdseries\upshape}{\thesubsubsection.}{.5em}{}
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Convenience commands for front matter										%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% \contact{ ... } is intended for your contact information. Standardly, it
% is typeset (via \makeinfo) flush left under the title.
\newcommand*{\contact}[1]{\gdef\@AcaCV@info@left{#1}}
%
\contact{Your contact info. Add via \texttt{\textbackslash contact\{...\}}, or remove the \texttt{\textbackslash makeinfo} command to get rid of this notice.}
%
% \moreinfo{ ... } is intended for your additional information you want to include. 
% Standardly, it is typeset (via \makeinfo) flush right under the title (to the
% right of the contact information).
\newcommand*{\moreinfo}[1]{\gdef\@AcaCV@info@right{#1}}
%
\moreinfo{Your additional info here. Add via \texttt{\textbackslash moreinfo\{...\}}, or remove the \texttt{\textbackslash makeinfo} command
to get rid of this notice.}
%
% \maketitle behaves as usual. It typesets the title of the CV (the name of its \author), 
% the date and a horizontal line.
\renewcommand{\maketitle}{%
\begin{center}
	{\huge\@author}\\[0.5em]
	{\@date}\\
	\hrulefill\\[0.5em]
\end{center}
}
%
% \makeinfo typesets the information provided via \contact{...} and \moreinfo{...}.
\providecommand{\makeinfo}{%
	\begin{center}
	\parbox[t]{0.6\textwidth}{\raggedright\@AcaCV@info@left}\hfill\parbox[t]{0.39\textwidth}{\raggedleft\@AcaCV@info@right}\\[2em]
	\end{center}
}