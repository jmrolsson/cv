%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
% Modified for personal use by Joakim Olsson in 2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[dvipsnames]{xcolor}
\usepackage{booktabs}
\usepackage{fontspec}

\defaultfontfeatures{Extension = .otf}% adds .otf to end of path when font loaded without ext parameter e.g. \newfontfamily{\FA}{FontAwesome} > \newfontfamily{\FA}{FontAwesome.otf}
\usepackage{fontawesome} % Relevant path loaded (TeX Live 2015 expansion): /usr/local/texlive/2015/texmf-dist/fonts/opentype/FontAwesome causing missing font

\pagestyle{empty} % Suppress page numbers

\usepackage[colorlinks = true,
linkcolor = MidnightBlue,
urlcolor  = MidnightBlue,
citecolor = MidnightBlue,
anchorcolor = MidnightBlue]{hyperref}

\makeatletter
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color
}

\AtBeginDocument{\globalcolor{darkgray}}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \subtitle#1{\def\@subtitle{#1}} % Defines the \subtitle command to set subtitle
\def \@subtitle {} % Sets \@subtitle to empty by default

\def \addressSep {$|$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@addressfour \relax
\let \@addressfive \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addressone}{\def \@addressone {#1}}
  {
    \@ifundefined{@addresstwo}{\def \@addresstwo {#1}}
    {
      \@ifundefined{@addressthree}{\def \@addressthree {#1}}
      {
        \@ifundefined{@addressfour}{\def \@addressfour {#1}}
        {
          \@ifundefined{@addressfive}{\def \@addressfive {#1}}
        }
      }
    }
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}
\def \printaddresslast #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
  \vspace{-1em}
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
  \hfil{\color{MidnightBlue}\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% \printsubtitle is used to print the subtitle as a page header
\def \printsubtitle {
  \begingroup
  \hfil{\color{darkgray}\subtitlesize\bf \@subtitle}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
    \vspace{-1.5em}
  \printname % Print the name specified with \name
  % \@ifundefined{@subtitle}{}{ % Print the first address if specified
  %   \vspace{0.1em}
  %   \printsubtitle}
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
  \@ifundefined{@addressfour}{}{ % Print the fourth address if specified
    \printaddress{\@addressfour}}
  \@ifundefined{@addressfive}{}{ % Print the fourth address if specified
    \printaddresslast{\@addressfive}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rsection environment for the large sections within the CV
\newenvironment{rsection}[1]{ % 1 input argument - section name
  \sectionskip
  {\color{darkgray}\MakeUppercase{\bf #1}} % Section title
  \sectionlineskip
  {\color{lightgray}\hrule height 2pt} % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rlist}{%
  \smallskip
  \begin{list}{$\bullet$}{\leftmargin=1em} %{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rsubsection}[4]{ % 4 input arguments - company name, location, job title, year(s) employed
 {\bf #1} % Bold company name and location on the right
 \ifthenelse{\equal{#3}{}}{\hfill {\em #2}}{ % If the third argument is not specified, print the second argument in italic (e.g. date) 
   \hfill {#2}
   \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\bullet$}{\leftmargin=1em} %{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rsubsubsection}[2]{ % 2 input arguments - job title, year(s) employed
  {{\em #1} \hfill {\em #2} % Italic job title and location
  }\smallskip
  \begin{list}{$\bullet$}{\leftmargin=1em} %{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newcommand{\rsubsectiontitle}[4]{ % 4 input arguments - company name, location, job title, year(s) employed
 {\bf #1} % Bold company name and location on the right
 \ifthenelse{\equal{#3}{}}{\hfill {\em #2}}{ % If the third argument is not specified, print the second argument in italic (e.g. date) 
   \hfill {#2}
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }
  \vspace{-0.2em}
}

\newcommand{\rsubsubsectiontitle}[2]{ % 2 input arguments
  {{\em #1} \hfill {\em #2}} % Italic job title and location
}\smallskip

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\subtitlesize{\LARGE} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
