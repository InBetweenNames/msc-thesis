%
% A University of Windsor Themed Beamer Class
% Author: Paul Preney
% Date: September 11, 2014
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beamer-uwindsor}[2014/09/11 v1.0 University of Windsor beamer class]

\RequirePackage{import}
\RequirePackage{ifthen}
\PassOptionsToPackage{table}{xcolor}

%
% Process the subtitle option...
%
\newboolean{uwinsubtitle}
\DeclareOption{subtitle}{\setboolean{uwinsubtitle}{true}}

%
% Process the supertabular and xtab options...
%
% NOTE: If xtab is used, don't use supertabular.
%
\newboolean{uwinusessupertabulartables}
\DeclareOption{supertabular}{
  \setboolean{uwinusessupertabulartables}{true}
}

\newboolean{uwinusesxtabtables}
\DeclareOption{xtab}{
  \setboolean{uwinusesxtabtables}{true}
}

%
% Process the tabu, longtabu, and longtable options...
%
% NOTE: longtabu and longtable have issues with beamer.
%       Try to use supertabular or xtab instead but those
%       have column width issues. It is best to create
%       one table per frame w/o breaking.
%
\newboolean{uwinusestabutables}
\newboolean{uwinuseslongtabutables}
\newboolean{uwinuseslongtabletables}

\DeclareOption{tabu}{
  \setboolean{uwinusestabutables}{true}
  \setboolean{uwinuseslongtabletables}{true}
}

\DeclareOption{longtabu}{
  \setboolean{uwinuseslongtabutables}{true}
  \setboolean{uwinuseslongtabletables}{true}
}

\DeclareOption{longtable}{
  \setboolean{uwinuseslongtabletables}{true}
}

%
% Pass all other options to beamer...
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions \relax
\LoadClass{beamer}

%
% Allow \partwithoutpage to be used instead of \part to make it easy to
% omit a \frame{\partpage} in a particular part.
%
\newboolean{showpartpage}
\setboolean{showpartpage}{true}
\newcommand{\partwithoutpage}[1]{%
  \setboolean{showpartpage}{false}%
  \part{#1}%
  \setboolean{showpartpage}{true}%
}

%
% Allow \sectionwithouttoc to be used instead of \section to make it easy to
% omit a table of contents in a particular section.
%
\newboolean{showsectiontoc}
\setboolean{showsectiontoc}{true}
\newcommand{\sectionwithouttoc}[1]{%
  \setboolean{showsectiontoc}{false}%
  \section{#1}%
  \setboolean{showsectiontoc}{true}%
}

%
% Allow \subsectionwithouttoc to be used instead of \subsection to make it 
% easy to omit a table of contents in a particular subsection.
%
\newboolean{showsubsectiontoc}
\setboolean{showsubsectiontoc}{true}
\newcommand{\subsectionwithouttoc}[1]{%
  \setboolean{showsubsectiontoc}{false}%
  \subsection{#1}%
  \setboolean{showsubsectiontoc}{true}%
}

%
% Define the University of Windsor blue and gold colours...
%
\definecolor{UWindsorBlue}{rgb}{ 0.0, 0.33, 0.59 }
\definecolor{UWindsorGold}{rgb}{ 1.0, 0.81, 0.0  }

%
% The UWindsor colours are fine with the logo, but, for
% accessibility reasons the colours need to:
%
%  a) have a high degree of contrast,
%  b) must not have colour-blindness issues, and,
%  c) must be easily read and aesthetically pleasing with
%     text and slides.
%
% For these reasons the colours have been adjusted below.
% To avoid having UWindsor hard-coded, more generic colour
% names are also used.
%

\colorlet{CBasis}{UWindsorBlue!70!black}
\colorlet{CTitleBasis}{UWindsorGold!70!white}
\colorlet{CTextBasis}{black!80!white}
\colorlet{CBlockBasis}{CBasis!90!white}
%\colorlet{CBlockBasis}{cyan!90!black}
\colorlet{CAlertBasis}{red!70!black}
\colorlet{CExampleBasis}{green!40!black}

\colorlet{CTableOddRowBg}{UWindsorGold!20!white}
\colorlet{CTableEvenRowBg}{UWindsorBlue!20!white}

%
% Define UWindsor colour-themed beamer layout...
%
\mode<presentation>
  % Use boxes theme...
  \usetheme{boxes}
  \useinnertheme[shadow=true]{rounded}
  \useoutertheme{default}

  % Structure the colours around blue...
  \usecolortheme[named=CBasis]{structure}
  
  % Use the orchid and whale colour themes...
  \usecolortheme{orchid}
  \usecolortheme{whale}

  % Set text colours...
  \setbeamercolor{normal text}{fg=CTextBasis}
  \setbeamercolor{alerted text}{fg=CAlertBasis}
  \setbeamercolor{example text}{fg=CExampleBasis}
  \setbeamercolor{titlelike}{fg=CTitleBasis}

  % Set block colours...
  \setbeamercolor{block title}{fg=CTitleBasis!75!white}
  \setbeamercolor{block body}{fg=CBlockBasis!20!black}

  \setbeamercolor{block title alerted}%
    {fg=CTitleBasis!90!CAlertBasis!90!white,bg=CAlertBasis!80!black}
  \setbeamercolor{block body alerted}{fg=CAlertBasis!40!black}

  \setbeamercolor{block title example}%
    {fg=CTitleBasis!90!CExampleBasis!90!white,bg=CExampleBasis!80!black}
  \setbeamercolor{block body example}{fg=CExampleBasis!40!black}

  % Override palette colours to use gold instead of white...
  \setbeamercolor{palette primary}%
    {use=structure,fg=CTitleBasis,bg=structure.fg}
  \setbeamercolor{palette secondary}%
    {use=structure,fg=CTitleBasis!90!black,bg=structure.fg!80!black}
  \setbeamercolor{palette tertiary}%
    {use=structure,fg=CTitleBasis!80!black,bg=structure.fg!60!black}
  \setbeamercolor{palette quaternary}%
    {use=structure,fg=CTitleBasis!70!black,bg=structure.fg!40!black}

  % This layout has headers and footers, so set those colours too...
  \setbeamercolor{section in head/foot}{parent=palette secondary}
  \setbeamercolor{subsection in head/foot}{parent=palette tertiary}
  \setbeamercolor{subsubsection in head/foot}{parent=palette quaternary}

  \setbeamercolor{author in head/foot}{parent=section in head/foot}
  \setbeamercolor{title in head/foot}{parent=subsection in head/foot}
  \setbeamercolor{page in head/foot}{parent=subsubsection in head/foot}

  % Frame settings...
  \setbeamertemplate{frametitle continuation}[from second][(con't)]

  % Define footer...
  \setbeamertemplate{footline}{%
    \leavevmode%
    \begin{beamercolorbox}[wd=.90\paperwidth,ht=2.6ex,dp=1.125ex,left,leftskip=1em]{section in head/foot}%
      \begin{minipage}[b]{0.42\paperwidth}%
        \raggedright%
        \textbf{\insertshorttitle{}%
          \ifthenelse{\boolean{uwinsubtitle}}{: \insertshortsubtitle}{}%
        }%
      \end{minipage}%
      \hfill%
      \begin{minipage}[b]{0.42\paperwidth}%
        \raggedleft%
        \textbf{\insertshortauthor}%
      \end{minipage}%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.10\paperwidth,ht=2.6ex,dp=1.125ex,right,rightskip=1em]{subsection in head/foot}%
      \textbf{\insertframenumber{}}
    \end{beamercolorbox}%
  }
\mode
<all>

%
% Set the University of Windsor logo.
%
% NOTE: Add 0.25cm padding all around image BUT shift image down 0.25cm
%       so padding appears to be on the right-hand side only.
%
%%\logo{\vspace*{-0.25cm}\def\svgwidth{0.4\textwidth}\import{logos/}{uwin-logo-horz-3col.eps}}
\logo{%
  \vspace*{-0.25cm}%
  \setlength\fboxsep{0.25cm}%
  \setlength\fboxrule{0pt}%
  \fbox{\includegraphics[width=1.5cm]{logos/uwin-logo-horz-3col.eps}}%
}

%
% Beamer annoyingly shows icons instead of numbers for references.
% This fixes this.
%
\setbeamertemplate{bibliography item}[text]


%
% Ensure tables are output with alternating row colours...
%
% The xtab and supertabular work properly with the tabular
% settings. The tabu and longtable packages do not.
%
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\rowcolors{2}{CTableEvenRowBg}{CTableOddRowBg}\oldtabular}{\endoldtabular}

\ifthenelse{\boolean{uwinusessupertabulartables}}{
  \RequirePackage{supertabular}
}{}

\ifthenelse{\boolean{uwinusesxtabtables}}{
  \RequirePackage{xtab}
}{}

\ifthenelse{\boolean{uwinusestabutables}}{
  \RequirePackage{tabu}
  \let\oldtabu\tabu
  \let\endoldtabu\endtabu
  \renewenvironment{tabu}{\taburowcolors[2] 2{CTableOddRowBg .. CTableEvenRowBg}\oldtabu}{\endoldtabu}
}{}

\ifthenelse{\boolean{uwinuseslongtabletables}}{
  \RequirePackage{longtable}
  \let\oldlongtable\longtable
  \let\endoldlongtable\endlongtable
  \renewenvironment{longtable}{\rowcolors{2}{CTableEvenRowBg}{CTableOddRowBg}\oldlongtable}{\endoldlongtable}
}{}

\ifthenelse{\boolean{uwinusestabutables}}{
  \let\oldlongtabu\longtabu
  \let\endoldlongtabu\endlongtabu
  \renewenvironment{longtabu}{\taburowcolors[2] 2{CTableOddRowBg .. CTableEvenRowBg}\oldlongtabu}{\endoldlongtabu}
}{}

