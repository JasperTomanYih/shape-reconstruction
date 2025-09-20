%%
%% BOF uconnthesis.cls
%%
%% by Marc Corluy, Summer 2007            
%%
%% Inspired by
%% 'The LaTeX Companion 2nd Edition' by Frank Mittelbach, Michel Goossens et all. (2004)
%% 'ociamthesis.cls' by Keith Gillow (1997, 2006)
%% Additions to the previous 'uconntheis.cls' by Marijan Kostrun (2001)
%%


%%
%% GENERAL DECLARATIONS
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uconnthesis}
\RequirePackage{ifthen,setspace,fancyhdr,amsthm}                


%%
%% REQUIRED COMMANDS
%%

\newcommand\@ptsize{}           % pointsize            
\newcommand{\thepage}{\c@page}  % page counter           
\newcommand{\thethmcounter}{\c@thmcounter}  % thm counter from amsthm.sty

%%
%% OPTIONS
%%

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

\DeclareOption{letterpaper}{\setlength\paperheight{11in}\setlength\paperwidth{8.5in}}
\DeclareOption{a4paper}{\setlength\paperheight{297mm}\setlength\paperwidth{210mm}}

\ExecuteOptions{12pt,letterpaper}
\ProcessOptions*

\input{bk1\@ptsize.clo}       % pointsize Class Option File [NEEDED after ProcessOptions]


%%
%% GLOBAL VARIABLES :: USER INPUT
%%

\def\myThesisTitle#1{\gdef\@myThesisTitle{#1}}
\def\myName#1{\gdef\@myName{#1}}
\def\myNewDegreeShort#1{\gdef\@myNewDegreeShort{#1}}
\def\myNewDegreeLong#1{\gdef\@myNewDegreeLong{#1}}
\def\myPreviousDegreeShort#1{\gdef\@myPreviousDegreeShort{#1}}
\def\myPreviousDegreeLong#1{\gdef\@myPreviousDegreeLong{#1}}
\def\myMajorAdvisor#1{\gdef\@myMajorAdvisor{#1}}
\def\myAssociateAdvisorA#1{\gdef\@myAssociateAdvisorA{#1}}
\def\myAssociateAdvisorB#1{\gdef\@myAssociateAdvisorB{#1}}
\def\myAssociateAdvisorC#1{\gdef\@myAssociateAdvisorC{#1}}
\def\myAssociateAdvisorD#1{\gdef\@myAssociateAdvisorD{#1}}

\def\myTOCDepth#1{\gdef\@myTOCDepth{#1}}


%%
%% GLOBAL VARIABLES :: CLASS DEFINED
%%

% Counters needed for \starttoc (readroutine of the toc files that creates the table of contents)

\newcommand{\@pnumwidth}{2.5ex}
\newcommand{\@tocrmarg} {2.55em}
\newcommand{\@dotsep}{2.1}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\bfseries #1}%
      \nobreak\leaders\hbox{%
         $\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}
      \hfill\nobreak\hbox to\@pnumwidth{\hfil\textrm{#2}}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*{\l@section}    {\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*{\l@subsection} {\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*{\l@figure}     {\@dottedtocline{1}{1.0em}{2.8em}}
\newcommand*{\l@table}      {\l@figure}

% numbering of a chapter : 1, 2, 3
\newcounter{chapter}
\renewcommand\thechapter{\arabic{chapter}}

% numbering of a section : 1.1, 1.2, 1.3
\newcounter{section}[chapter]
\renewcommand\thesection{\thechapter.\arabic{section}}

% numbering of a subsection : 1.1.1, 1.1.2, 1.1.3
\newcounter{subsection}[section]
\renewcommand\thesubsection{\thesection.\arabic{subsection}}

% numbering of the introchapter : 0
\newcounter{introchapter}
\renewcommand\theintrochapter{\arabic{introchapter}}

% numbering of an introsection : 0.1, 0.2, 0.3                     
\newcounter{introsection}[introchapter]         
\renewcommand\theintrosection{\theintrochapter.\arabic{introsection}}

% numbering of an introsubsection : 0.1.1, 0.1.2, 0.1.3
\newcounter{introsubsection}[introsection]
\renewcommand\theintrosubsection{\theintrosection.\arabic{introsubsection}}

% numbering of an appendix - A, B, C
\newcounter{appendix}
\renewcommand\theappendix{\Alph{appendix}}

% numbering of an appendixsection - A.1, A.2, A.3
\newcounter{appendixsection}[appendix]
\renewcommand\theappendixsection{\theappendix.\arabic{appendixsection}}

% numbering of an appendixsubsection - A.1.1, A.1.2, A.1.3
\newcounter{appendixsubsection}[appendixsection]
\renewcommand\theappendixsubsection{\theappendixsection.\arabic{appendixsubsection}}

% chaptertype 1=Introduction, 2=Chapter, 3=Appendix
\newcounter{chaptertype}
\setcounter{chaptertype}{0}

% Figure Counter
\newcounter{figure}

% Table Counter
\newcounter{table}


% theorem counter and equation counter; have to be reset at every call of a chapter, section, and subsection
\@addtoreset{theorem}{introchapter}
\@addtoreset{theorem}{chapter}
\@addtoreset{theorem}{appendix}
\@addtoreset{theorem}{introsection}
\@addtoreset{theorem}{section}
\@addtoreset{theorem}{appendixsection}
\@addtoreset{theorem}{subsection}
\@addtoreset{equation}{introchapter}
\@addtoreset{equation}{chapter}
\@addtoreset{equation}{appendix}
\@addtoreset{equation}{introsection}
\@addtoreset{equation}{section}
\@addtoreset{equation}{appendixsection}
\@addtoreset{equation}{subsection}
\@addtoreset{figure}{chapter}
\@addtoreset{figure}{section}

% Line spacing counter
\newcounter{myLineSpacing}
\setcounter{myLineSpacing}{1}


%%
%% TITLE DEFINITIONS
%%

%% Font Declaration for 'Abstract', 'Acknowledgements', 'List of Figures' etc.
\newcommand{\FrontMatterTitle}[1] 
  { 
    {\fontshape{sc}\selectfont \large \bfseries {#1}} 
  }

%% Font Declaration for the Title of the Thesis                                     
\newcommand{\ThesisTitle}[1] 
  { 
    \begin{spacing}{1.7}
    {\LARGE \bfseries {#1}} 
    \end{spacing}           
  }

%% Font Declaration for the Header of a Chapter / Appendix / Introduction           
\newcommand{\MainMatterHeader}[2] 
  { 
    \newpage
    \ \vskip -5mm
    \hrule
    \vskip 4mm
    \begin{flushright}
       {\LARGE \bfseries {#1}}
       \vskip 4mm
       \ifthenelse{\equal{#2}{}}
         {{\Large \phantom{Phantom Title} }}
         {{\Large \begin{spacing}{1} \bfseries {#2} \end{spacing} }}
    \end{flushright}
    \vskip 14mm
  }


%%
%% FRONT MATTER ENVIRONMENTS
%%

%% Abstract Page
\newenvironment{abstractpage}
  {
    % Begin Abstract Page         
    \setcounter{page}{1}
    \chead{\@myName \ \ - \ \ University of Connecticut \ \ - \ \ \number\year} 
    \rhead{} \lhead{} \lfoot{} \cfoot{} \rfoot{}
    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0pt}
    \pagestyle{fancy}
    \thispagestyle{empty}
    \begin{center}
      \ThesisTitle{\@myThesisTitle}
      \vskip 20mm      
      \@myName, \@myNewDegreeShort \\
      University of Connecticut, \number\year \\
      \vskip 20mm 
      \FrontMatterTitle{ABSTRACT} \\
      \ \\
    \end{center}
    \begin{spacing}{2}
  }
  { 
    % End Abstract Page         
    \end{spacing}             
    \vfill \newpage
  }

%% Title Page
\newenvironment{titlepage}
  {
    % Begin Title Page         
    \pagestyle{empty}
    \begin{center}
      \ThesisTitle{\@myThesisTitle}
      \vskip 20mm      
      \@myName \\                    
      \ \\
      \vskip 20mm 
      \@myPreviousDegreeLong \\
      \ \\
      \vskip 55 mm
       A Dissertation\\
       Submitted in Partial Fulfillment of the\\
       Requirements for the Degree of\\
       Doctor of Philosophy\\
       at the\\
       University of Connecticut\\  
       \ \\
       \number\year
    \end{center}
  }
  { 
    % End Title Page         
    \vfill \newpage
  }

%% Copyright Page
\newenvironment{copyrightpage}
  {
    \begin{center}
      \ \\
      \vskip 20 mm
      Copyright by \\
      \vskip 20 mm
      \@myName
      \vskip 123 mm
      \number\year
    \end{center}
  }
  { 
    % End Copyright Page         
    \vfill \newpage
  }

%% Approval Page
\newenvironment{approvalpage}
  {
    \begin{center}
      \FrontMatterTitle{APPROVAL PAGE}
      \vfill          
      \@myNewDegreeLong \ Dissertation \\
      \vfill          
      \ThesisTitle{\@myThesisTitle}
      \vfill          
      Presented by \\
      \@myName, \@myPreviousDegreeShort \\                   
      \vfill\vfill 
      \begin{tabular}{l c c}
             Major Advisor     & \hspace{7mm} & \underline{\hspace{77mm}} \\
                               &              & \@myMajorAdvisor          \\
         \ifthenelse{\isundefined{\@myAssociateAdvisorA}}{}%
           { 
             & & \\
             & & \\
             Associate Advisor & & \underline{\hspace{77mm}} \\
                               & & \@myAssociateAdvisorA     \\
           }
         \ifthenelse{\isundefined{\@myAssociateAdvisorB}}{}
           { 
             & & \\
             & & \\
             Associate Advisor & & \underline{\hspace{77mm}} \\
                               & & \@myAssociateAdvisorB     \\
           }
         \ifthenelse{\isundefined{\@myAssociateAdvisorC}}{}
           { 
             & & \\
             & & \\
             Associate Advisor & & \underline{\hspace{77mm}} \\
                               & & \@myAssociateAdvisorC     \\
           }
         \ifthenelse{\isundefined{\@myAssociateAdvisorD}{}}{}
           { 
             & & \\
             & & \\
             Associate Advisor & & \underline{\hspace{77mm}} \\
                               & & \@myAssociateAdvisorD     \\
           }
      \end{tabular}
      \vfill\vfill      
      University of Connecticut\\  
      \number\year
    \end{center}
  }
  {
    % End Approval Page         
    \vfill \newpage
  }

%% Dedication Page
\newenvironment{dedicationpage}
  {
    % Begin Dedication Page
    \begin{center}
    \ \\
    \vfill
      \begin{minipage}[t]{100mm}
        \normalfont\itshape            
  }
  { 
    % End Dedication Page
      \end{minipage}
    \end{center}
    \vfill\vfill \newpage
  }

%% Acknowledgements Page
\newenvironment{acknowledgementpage}
  {
    % Begin Acknowledgements Page
    \begin{center}
      \FrontMatterTitle{ACKNOWLEDGEMENTS}
    \end{center}
    \vskip 20mm      
  }
  { 
    % End Acknowledgements Page
    \vfill \newpage
  }

%% Table of Contents          
\newenvironment{contentpage}
  {
    % Begin Table of Contents Page
    \begin{center}
      \FrontMatterTitle{TABLE OF CONTENTS}                 
    \end{center}
  } 
  {
    % End Table of Contents Page
    \newpage
  }
\newcommand{\tableofcontents}
  {
    \ifthenelse{\isundefined{\@myTOCDepth}}    
       {\setcounter{tocdepth}{2}}
       {\setcounter{tocdepth}{\@myTOCDepth}}
    \@starttoc{toc}
  }

%% List of Figures                 
\newenvironment{figurepage}
  {
    % Begin List of Figures Page
    \begin{center}
      \FrontMatterTitle{LIST OF FIGURES}                 
    \end{center}
  }
  {
    % End List of Figures Page
    \newpage
  }
\newcommand{\listoffigures}{\@starttoc{lof}}

%% List of Tables                  
\newenvironment{tablepage}
  {
    % Begin List of Tables Page
    \begin{center}
      \FrontMatterTitle{LIST OF TABLES}                 
    \end{center}
  }
  {
    % End List of Tables Page
    \newpage
  }
\newcommand{\listoftables}{\@starttoc{lot}}

%% Notation Page                      
\newenvironment{notationpage}
  {
    \renewcommand{\thepage}{\roman{page}}
    \pagestyle{plain}
    % Begin Notation Page            
    \begin{center}
      \FrontMatterTitle{NOTATION}                 
    \end{center}
  }
  {
    % End Notation Page            
    \newpage
  }

%% Pages with lowercase Roman numerals
\newenvironment{romanpages}
  {
    % Begin of Roman Pages
    \cleardoublepage
    \setcounter{page}{1}
    \renewcommand{\thepage}{\roman{page}}
    \pagestyle{plain}
  }
  {
    % End of Roman Pages
    \cleardoublepage
  }


%%
%% MAIN MATTER ENVIRONMENTS
%%

%% Introduction
\newcommand{\introchapter}[2]
  {
    \setcounter{introchapter}{0}
    % print the header
    \MainMatterHeader{Introduction}{#1}
    % Add the Introduction to TOC, LOF, LOT
    \ifthenelse{\equal{#1}{}}
      {
        \addcontentsline{toc}{chapter}{Introduction}
      }
      {
        \ifthenelse{\equal{#2}{}}
          {
            \addcontentsline{toc}{chapter}{Introduction : {#1}}
          }
          {
            \addcontentsline{toc}{chapter}{Introduction : {#2}}
          }
      }
    \addtocontents{lof}{\protect\addvspace{10pt}}
    \addtocontents{lot}{\protect\addvspace{10pt}}
    \setcounter{chaptertype}{1}
  }

%% Chapter
\newcommand{\chapter}[2]
  {
    % print the header
    \refstepcounter{chapter}
    \MainMatterHeader{Chapter \thechapter}{#1}
    % Add the Chapter to TOC, LOF, LOT
    \ifthenelse{\equal{#2}{}}
      {
        \addcontentsline{toc}{chapter}{Ch. \protect\numberline{\thechapter}\hskip -3mm : {#1}}
      }
      {
        \addcontentsline{toc}{chapter}{Ch. \protect\numberline{\thechapter}\hskip -3mm : {#2}}
      }
    \addtocontents{lof}{\protect\addvspace{10pt}}
    \addtocontents{lot}{\protect\addvspace{10pt}}
    \setcounter{chaptertype}{2}
  }

%% Appendix
\newcommand{\appendix}[2]
  {
    % print the header
    \refstepcounter{appendix}
    \renewcommand{\thechapter}{\Alph{appendix}}
    \MainMatterHeader{Appendix \theappendix}{#1}
    % Add the Appendix to TOC, LOF, LOT
    \ifthenelse{\equal{#2}{}}
      {
        \addcontentsline{toc}{chapter}{App. \protect\numberline{\theappendix}\hskip -2mm : {#1}}
      }
      {
        \addcontentsline{toc}{chapter}{App. \protect\numberline{\theappendix}\hskip -2mm : {#2}}
      }
    \addtocontents{lof}{\protect\addvspace{10pt}}
    \addtocontents{lot}{\protect\addvspace{10pt}}
    \setcounter{chaptertype}{3}
  }

%% Section
\newcommand{\section}[1]
  {
    \vskip 6mm
    \ifthenelse{\value{chaptertype}=1}
      {
        \refstepcounter{introsection}
        \setcounter{section}{\value{introsection}}
        {\large \bfseries \theintrosection \ #1} 
        \addcontentsline{toc}{section}{\protect\numberline{\theintrosection.}{#1}}
      } {}                                 
    \ifthenelse{\value{chaptertype}=2}
      {
        \refstepcounter{section}
        {\large \bfseries \thesection \ {#1}} 
        \addcontentsline{toc}{section}{\protect\numberline{\thesection.}{#1}}
      } {}                                 
    \ifthenelse{\value{chaptertype}=3}
      {
        \refstepcounter{appendixsection}
        \setcounter{section}{\value{appendixsection}}
        {\large \bfseries \theappendixsection \ #1} 
        \addcontentsline{toc}{section}{\protect\numberline{\theappendixsection.}{#1}}
      } {}                                    
    \vskip 2mm
  }

%% Subsection
\newcommand{\subsection}[1]
  {
    \ifthenelse{\value{chaptertype}=1}
      {
        \refstepcounter{introsubsection}
        {\bfseries \theintrosubsection \ #1} 
        \addcontentsline{toc}{subsection}{\protect\numberline{\theintrosubsection.}#1}
      } {}                                 
    \ifthenelse{\value{chaptertype}=2}
      {
        \refstepcounter{subsection}
        {\bfseries \thesubsection \ #1} 
        \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection.}#1}
      } {}                                 
    \ifthenelse{\value{chaptertype}=3}
      {
        \refstepcounter{appendixsubsection}
        {\bfseries \theappendixsubsection \ #1} 
        \addcontentsline{toc}{subsection}{\protect\numberline{\theappendixsubsection.}#1}
      } {}                                    
    \vskip 2mm
  }

%% The Thesis Core
\newenvironment{thethesiscore}
  {
    % Begin Thesis Core
    \begin{spacing}{\themyLineSpacing}
    \setcounter{page}{1}
    \renewcommand{\thepage}{\arabic{page}}
    \pagestyle{plain}
    \setlength{\abovedisplayskip}{3mm}
    \setlength{\belowdisplayskip}{3mm}
    \setlength{\abovedisplayshortskip}{3mm}
    \setlength{\belowdisplayshortskip}{3mm}
  }
  {
    % End Thesis Core
    \end{spacing}
    \renewcommand{\baselinestretch}{1} 
  }

%% Baseline Dependent NewPage Command
\newcommand{\mynewpage}[1]
  { 
    \ifthenelse{\equal{#1}{}} 
      {
        \newpage                             
      }
      {
        \ifthenelse{\equal{#1}{\baselinestretch}} { \newpage } {}
      }
  }

%%
%% FIGURES
%%

\renewcommand{\thefigure}{\thesection.\@arabic\c@figure} 
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

%%
%% TABLES
%%

\renewcommand{\thetable}{\thesection.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%%
%% CAPTIONS
%%

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%%
%% THE BIBLIOGRAPHY
%%

\newenvironment{thebibliography}[1]
  {
    \MainMatterHeader{Bibliography}{}
    \addcontentsline{toc}{chapter}{Bibliography}
    \list{\@biblabel{\arabic{enumiv}} \ }
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\arabic{enumiv}}}%
    \sfcode`\.=\@m
  }
  {
    \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}
    \endlist
  }


%%
%% EOF uconnthesis.cls 
%%
