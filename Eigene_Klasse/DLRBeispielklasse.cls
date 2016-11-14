\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DLRBeispielklasse}[2016/11/14 v0.2 Eine erste Beispielklasse]
\newif\ifgit
\newif\ifonline
\newif\ifprint
\DeclareOption{git}{\gittrue}
\DeclareOption{online}{\onlinetrue\printfalse}
\DeclareOption{print}{\onlinefalse\printtrue}
\DeclareOption*{\ClassWarning{DLRBeispielklasse}{Option \CurrentOption\space ist unbekannt!}}
\ExecuteOptions{print}
\ProcessOptions\relax

\PassOptionsToPackage{paper=b5,pagesize}{typearea}
\LoadClass[
    fontsize=11pt,%Schriftgröße
    headings=small,
    parskip=half-,
    listof=totoc,
    bibliography=totoc,
    cleardoublepage=empty,
]{scrbook}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
% Paket für Sprachen
\RequirePackage[english,ngerman]{babel}
\RequirePackage{libertine}
\RequirePackage[scaled=0.8]{beramono}
\RequirePackage{textcomp}
\RequirePackage{amsfonts}
\RequirePackage{microtype}

\RequirePackage{geometry}
\geometry{inner=2cm,outer=4cm,top=2cm,bottom=4cm}

\RequirePackage[onehalfspacing]{setspace}

%\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{blindtext}
\RequirePackage[newcommands]{ragged2e}
\RequirePackage{enumitem}
\newlist{exercise}{enumerate}{1}
\setlist[exercise]{label=(\alph*),font=\itshape,noitemsep}

\RequirePackage[headsepline]{scrlayer-scrpage}
\clearscrheadfoot
\ohead{\pagemark}
\ihead{\headmark}
%\cfoot[Version vom \today]{Version vom \today}
\pagestyle{scrheadings}

\RequirePackage[]{floatrow}
\floatplacement{figure}{htb}
\floatplacement{table}{htb}
\floatsetup[table]{style=plaintop}
\DeclareNewFloatType{diagram}{
    name=Diagramm,
    placement=htb,
    fileext=lod,
    within=chapter
    }

\RequirePackage[hyperref,table,rgb,dvipsnames]{xcolor}

\ifgit
   \RequirePackage[mark]{gitinfo2}
   \renewcommand{\gitMark}{%
       Branch: \gitBranch\,@\,\gitAbbrevHash{}\textbullet{}Release: \gitFirstTagDescribe{}
        (\gitAuthorDate)\\
       Head tags: \gitTags\\
       Autor: \gitCommitterName
   }
\fi   

\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage{subfig}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{tabularx}

\RequirePackage{siunitx}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\newtheoremstyle{break}%
{}{}%
{}{}%
{\bfseries}{}% % Note that final punctuation is omitted.
{\newline}{}

\theoremstyle{break}
\newtheorem{definition}{Definition}[chapter]
\theoremstyle{plain}
\newtheorem{satz}{Satz}[chapter]

\RequirePackage{mathtools}
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}

\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=authoryear,isbn=false,maxcitenames=1]{biblatex}
\addbibresource{LaTeX-Literatur.bib}
\RequirePackage{calc}
\RequirePackage[german]{varioref}
\RequirePackage{imakeidx}
\makeindex[title={Sachregister}]
\makeindex[name=personen,title={Personenregister},options={-g -s meinstil.ist}]
\RequirePackage[pdfpagelabels=false]{hyperref}
\ifprint
   \hypersetup{%
       colorlinks,allcolors=black,%
       bookmarksopen,bookmarksopenlevel=2,bookmarksnumbered,%
       pdfdisplaydoctitle,pdfpagelayout=TwoPageLeft,pdfstartview=FitH,%
       pdftitle={Ein erstes LaTeX-Dokument},pdfsubject={Vorlesungsdatei},pdfauthor={Martin Sievers und N.N.},pdfkeywords={123;453;324},
   }
\else% Online
   \hypersetup{%
      colorlinks,urlcolor=Maroon,citecolor=blue,%
      bookmarksopen,bookmarksopenlevel=2,bookmarksnumbered,%
      pdfdisplaydoctitle,pdfpagelayout=TwoPageLeft,pdfstartview=FitH,%
      pdftitle={Ein erstes LaTeX-Dokument},pdfsubject={Vorlesungsdatei},pdfauthor={Martin Sievers und N.N.},pdfkeywords={123;453;324},
   }
\fi%
\RequirePackage[german]{cleveref}

\setkomafont{disposition}{\normalfont\bfseries}
\setkomafont{pagehead}{\normalfont\upshape\small}
\setkomafont{pagenumber}{\normalfont\bfseries\normalsize}
\setkomafont{caption}{\normalfont\small\itshape}
\setkomafont{captionlabel}{\normalfont\small\upshape\bfseries}


\deffootnote[1.5em]{1.5em}{1.5em}{\makebox[1.5em][r]{\textsuperscript{\footnotemark}\ }}

\newcommand{\autor}[1]{\textit{#1}} %-> \autor{Name}

\newenvironment{zitat}% ->\begin{zitat}...\end{zitat}
    {\par\vspace{5mm}\begin{addmargin}{1cm}\itshape\small}%
    {\end{addmargin}\par\vspace{5mm}}%

\endinput

