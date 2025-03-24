% -*- coding:utf-8 -*-
% vi:encoding=utf-8:
% !TEX encoding = UTF-8 Unicode
%
% This file should be utf8 encoded so that these characters render as
% umlauts: ÄÖÜäöüß
%
%
% FBR_Bericht_2025.cls
%
% Fachbeiratsbericht 2025
% 

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{FBR_Bericht_2025}[2025/01/29 v0.25 MPP Annual Report]

\LoadClass[11pt,twoside,twocolumn]{report}

\usepackage[a4paper,total={170mm,257mm},left=20mm,top=20mm]{geometry} % A4: 210 x297 mm

\usepackage[utf8]{inputenc}  % using "utf8" since "utf8x" is incompatible with bibtex
\usepackage{graphicx}
\usepackage{color}
\usepackage{amsmath,amssymb,amsfonts}
\usepackage{import}
\usepackage{datetime}
\usepackage[tight]{units}
\usepackage{textcomp}
\usepackage{array}
\usepackage{subfigure}
\usepackage{bm}
\usepackage{scalefnt}
\usepackage{enumitem}
\usepackage[parfill]{parskip}

\usepackage{tikz}
\usetikzlibrary{calc}

\usepackage[margin=1em,font={small,sl}]{caption} 

\usepackage[hidelinks]{hyperref}
\hypersetup{
	bookmarks                     = true,
	bookmarksopen            = true,
	bookmarksnumbered   = true,
    pdftitle                            = {Fachbeirats-Bericht 2025},
    pdfauthor                       = {Max-Planck-Institut f{\"u}r Physik},
    pdfsubject                      = {},
    pdfkeywords                  = {}
  }


%\ProcessOptions

%----------------------------------------------------------------------
% page style and headings
%
\pagestyle{headings}
%
%----------------------------------------------------------------------
% float placement parameters
%
\setcounter{topnumber}{8}
\def\topfraction{1.0}
\setcounter{bottomnumber}{0}
\def\bottomfraction{.0}
\setcounter{totalnumber}{8}
\def\textfraction{.0}
\def\floatpagefraction{.9}
\def\dbltopfraction{1.0}
\def\dblfloatpagefraction{.9}
%
%----------------------------------------------------------------------
%----------------------------------------------------------------------
%
\raggedbottom
\def\ragright{\rightskip 0pt plus 1fil\linepenalty=1000}
%
\def\uline#1{\underline{\vphantom{g}#1}}
\def\testpage#1{\dimen@\pagetotal \advance\dimen@#1\relax
   \ifdim\dimen@>\textheight \vskip-1cm \newpage \fi}
%
%----------------------------------------------------------------------
%
\newenvironment{JBlist}[1]%
  {\def\@name{\uline{#1}: }\let\@@name\@name
   \let\@jb@mkpar\@jblist@par
   \vskip\lineskip \@jb@nextpar}%
  {\egroup \vskip2mm\relax\testpage{1cm}}
%
\newenvironment{JBtalk}[1]%
  {\def\@name{\uline{#1} }\let\@@name\@name
   \let\@jb@mkpar\@jblist@par
   \vskip\lineskip \@jb@nextpar}%
  {\egroup \vskip2mm\relax\testpage{1cm}}
%
%----------------------------------------------------------------------
%
\def\@jblist@par#1\par{\@jb@mkbox{\@@name}{#1}%
   \let\@@name\relax
   \@jb@nextpar}
%
\def\@jb@nextpar{\par\setbox\z@\vbox\bgroup
   \everypar{\egroup \@jb@mkpar}}
%
\def\@jb@mkbox#1#2{%
   \setbox\z@\vbox{\@jb@boxindent{\authorstyle#1\/}#2\unskip\nobreak\strut}%
   \dimen@\pagetotal \advance\dimen@\parskip
   \advance\dimen@\ht\z@ \advance\dimen@\dp\z@
   \ifdim\dimen@>\vsize \vskip-1cm \newpage
      \ifodd\c@page \else \if@firstcolumn \ifx\@@name\relax
         \setbox\z@\vbox{\@jb@boxindent{\authorstyle\@name (cont.)\/}
            #2\unskip\nobreak\strut}%
      \fi \fi \fi
   \else \vskip\parskip \vskip-\lineskip \fi
   \box\z@ \nobreak \vskip1mm}
\def\@jb@boxindent{\advance\leftskip0mm\noindent\hskip-0mm\strut}
%
\def\authorstyle{\sl}
% 
% Namen
%
\newenvironment{Namen}
   {\par\noindent\bgroup\sloppy\ragright\em(\ignorespaces}%
   {\unskip)\par\egroup\bigskip\@afterheading}
%
\newcommand\refname{References}
\newenvironment{Biblio}
     {\subsection*{\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{99}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \footnotesize\frenchspacing
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `Biblio' environment}}%
      \endlist}
%
%----------------------------------------------------------------------
%----------------------------------------------------------------------
%
\def\LMU{Lud\-wig-Maxi\-mi\-lians-Uni\-ver\-si\-t\"at M\"un\-chen}
\def\TUM{Tech\-ni\-sche Uni\-ver\-si\-t\"at M\"un\-chen}
\def\FHM{Fach\-hoch\-schu\-le M\"un\-chen}
\def\WUE{Uni\-ver\-si\-t\"at W\"urz\-burg}
%
%----------------------------------------------------------------------
%
\newcommand{\micron}{\ensuremath{\mu\mathrm{m}}}
\newcommand{\microsec}{\ensuremath{\mu\mathrm{s}}}
\newcommand{\rd}{\mathrm{d}}
\newcommand{\ri}{\mathrm{i}}
\newcommand{\re}{\mathrm{e}}
\newcommand{\rT}{\mathrm{T}}
\newcommand{\rL}{\mathrm{L}}
\newcommand{\eg}{e.g.\ }
\newcommand{\ie}{i.e.\ }
\newcommand{\TeV}{\,\text{TeV}}
\newcommand{\GeV}{\,\text{GeV}}
\newcommand{\eV}{\,\text{eV}}
\newcommand{\pb}{\,\text{pb}}
\newcommand{\fb}{\,\text{fb}}
\newcommand{\cm}{\,\text{cm}}
\newcommand{\mm}{\,\text{mm}}
\newcommand{\tot}{{\text{tot}}}
\newcommand{\lab}{{\text{lab}}}
\newcommand{\cut}{{\text{cut}}}
\newcommand{\jet}{{\text{jet}}}
\newcommand{\jets}{{\text{jets}}}
\newcommand{\stat}{{\text{stat.}}}
\newcommand{\sys}{{\text{syst.}}}
\newcommand{\E[1]}{\ensuremath{\cdot 10^{#1}}}
\newcommand{\dd}{\mathrm{d}}
%
%----------------------------------------------------------------------
%
\endinput
%
% End
%
