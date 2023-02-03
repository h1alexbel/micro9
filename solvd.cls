\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solvd}[2021/11/11 0.13.2 Template for Solvd Documents]

\LoadClass[12pt]{article}

\makeatletter
\newif\ifhuawei@dark
\DeclareOption{dark}{\huawei@darktrue}
\newif\ifhuawei@slides
\DeclareOption{slides}{\huawei@slidestrue}
\newif\ifhuawei@nosecurity
\DeclareOption{nosecurity}{\huawei@nosecuritytrue}
\newif\ifhuawei@authordraft
\DeclareOption{authordraft}{\huawei@authordrafttrue}
\newif\ifhuawei@nobrand
\DeclareOption{nobrand}{\huawei@nobrandtrue}
\newif\ifhuawei@nodate
\DeclareOption{nodate}{\huawei@nodatetrue}
\newif\ifhuawei@nocover
\DeclareOption{nocover}{\huawei@nocovertrue}
\newif\ifhuawei@nopaging
\DeclareOption{nopaging}{\huawei@nopagingtrue}
\newif\ifhuawei@landscape
\DeclareOption{landscape}{\huawei@landscapetrue}
\newif\ifhuawei@anonymous
\DeclareOption{anonymous}{\huawei@anonymoustrue}
\ProcessOptions\relax
\makeatother

\RequirePackage{geometry}
\makeatletter\ifhuawei@landscape
\geometry{paperwidth=16in, paperheight=9in, left=4in, right=2in, top=1.5in, bottom=1.5in}
\else
\geometry{a4paper, left=1.5in, right=1in, top=1.2in, bottom=1.2in}
\fi\makeatother

\makeatletter\ifhuawei@slides
\usepackage[fontsize=24pt]{fontsize}
\fi\makeatother

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{CJKutf8}
\RequirePackage{tabularx}
\RequirePackage{anyfontsize}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{multicol}
\RequirePackage[mmddyyyy,iso]{datetime}
\newtimeformat{daytime}{\twodigit{\THEHOUR}:\twodigit{\THEMINUTE}}
\RequirePackage[tt=false,type1=true]{libertine}
\RequirePackage{paralist}
\RequirePackage{makecell}
\RequirePackage[para]{footmisc}
\setlength{\footnotemargin}{2pt}
\setlength{\footnotesep}{2pt}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage[hidelinks]{hyperref} % to enable \pageref* command
\RequirePackage[abspath]{currfile}
\RequirePackage{enumitem}
\setlist{nosep}
\RequirePackage{microtype}
\RequirePackage{wrapfig}
\RequirePackage{lastpage}
\RequirePackage{setspace}
\setstretch{1.08}
\RequirePackage[maxnames=1,minnames=1,natbib=true,citestyle=numeric,bibstyle=numeric,doi=false,url=false,isbn=false,isbn=false]{biblatex}
\RequirePackage[table]{xcolor}
\definecolor{red}{HTML}{CF0A2C}
\definecolor{black}{HTML}{232527}
\definecolor{gray}{HTML}{878C8F}
\definecolor{yellow}{HTML}{F2DC5D}
\definecolor{blue}{HTML}{2274A5}
\definecolor{green}{HTML}{499167}
\definecolor{orange}{HTML}{F06543}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{titling}
\RequirePackage{svg}
\RequirePackage[absolute]{textpos}
\TPGrid{16}{16}

\makeatletter\newcommand\huawei@header[1]{{%
    \ifhuawei@slides%
    \setstretch{0.8}%
    \fontsize{19pt}{24pt}\selectfont%
    \else%
    \setstretch{0.8}%
    \fontsize{11pt}{13pt}\selectfont%
    \fi%
    \sffamily\color{gray}#1\par%
}}\makeatother

\makeatletter\newcommand\huawei@bar{%
    \begin{textblock}{1}[0,0](0,0)%
        \tikz \node[fill=green,minimum width=\TPHorizModule,minimum height=16\TPVertModule] {};%
    \end{textblock}%
}\makeatother

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\makeatletter\fancyfoot[L]{
    \huawei@bar
    \ifhuawei@authordraft%
    \begin{textblock}{14}[0.5,0.5](8,8)%
        \tikz \node[minimum width=14\TPHorizModule] {%
            \fontsize{64}{64}\selectfont\sffamily\scshape\color{gray!20}\rotatebox{30}{it is a draft}
        };%
    \end{textblock}%
    \else\fi%
}\makeatother
\makeatletter\fancyhead[L]{
    \ifnum\value{page}=1\else%
    \ifhuawei@nobrand\else%
    \begin{textblock}{8}[0,0](1.2,0.2)%
        \huawei@logo%
    \end{textblock}%
    \fi%
    \fi%
}\makeatother
\makeatletter\fancyhead[R]{
    \begin{textblock}{8}[1,0](15.8,0.2)%
        \raggedleft\huawei@header{%
            \ifhuawei@nosecurity\else%
            \thesecurity
            \fi%
        }%
    \end{textblock}%
}\makeatother
\makeatletter\fancyfoot[R]{
    \begin{textblock}{8}[0,1](1.2,15.8)%
        \ifnum\value{page}=1\else%
        \huawei@header{\raggedright%
        \ifhuawei@anonymous\else%
        \theauthor%
        \ifhuawei@nosecurity\else%
        \ifx\theid\empty\else, \theid\fi
        \fi%
        \ifhuawei@nobrand\else%
        \newline
        \fi%
        \fi%
        \ifhuawei@nobrand\else%
        \thecompany{}
        \fi%
        }%
        \fi%
    \end{textblock}%
    \begin{textblock}{8}[1,1](15.8,15.8)%
        \raggedleft\huawei@header{%
            \ifnum\value{page}=1\else%
            \ifhuawei@nopaging\else%
            Page \#\thepage{} of \pageref*{LastPage}%
            \ifhuawei@nodate\else%
            \\
            \fi%
            \fi%
            \fi%
            \ifhuawei@nodate\else%
            \today{} \settimeformat{daytime}\currenttime{}%
            \fi%
        }%
    \end{textblock}%
}\makeatother

\RequirePackage{changepage}
\renewenvironment{abstract}
{\begin{adjustwidth}{0pt}{1in}{\scshape Abstract:}
     \newline\small}
     {
\end{adjustwidth}}

\makeatletter\renewcommand\maketitle{%
    \vspace*{18pt}
    {\bfseries{\Huge\thetitle}}
    \ifx\thesubtitle\empty\else%
    \\[6pt]
    {\color{gray!50!black}\large\thesubtitle}
    \fi
    \\[18pt]
    \ifhuawei@nobrand\else%
    \ifhuawei@anonymous\else%
    \ifx\thecompany\empty\else%
    \thecompany\newline
    \fi
    \fi
    \fi
    \ifx\theauthor\empty\else%
    {\scshape\ifhuawei@anonymous
    Anonymous Authors
    \else%
    \theauthor
    \fi}%
    \fi%
    \ifhuawei@anonymous\else%
    \ifx\theauthor\empty\else
    \ifhuawei@nobrand\else%
    \ifx\theid\empty\else
    $\;$/ {\theid}
    \fi
    \fi
    \fi
    \fi
    \vspace{2em}
}\makeatother

\newcommand\PrintCrumb[2]{%
    \begin{minipage}{\columnwidth}%
        \raggedright\textsc{#1}:\\#2%
    \end{minipage}\vspace{4pt}%
}

\makeatletter\ifhuawei@dark
\RequirePackage{pagecolor}
\pagecolor{black}
\color{white}
\fi

\AtBeginDocument{%
    \raggedbottom%
    \raggedcolumns%
    \setlength\headheight{32pt}%
    \setlength\footskip{32pt}%
    \setlength\topskip{0mm}%
    \setlength\parindent{0pt}%
    \setlength\parskip{6pt}%
    \setlength\columnsep{32pt}%
    \def\arraystretch{1.5}%
}

\newcommand*\thesecurity{Confidential}\renewcommand\title[1]{\renewcommand\thetitle{#1}}
\newcommand\thetitle{\textbackslash{}thetitle}
\newcommand*\thecompany{Solvd, Inc.}
\newcommand\thesubtitle{}
\renewcommand\author[1]{\renewcommand\theauthor{#1}}
\newcommand\theauthor{\textbackslash{}theauthor}
\newcommand*\thesecurity{Confidential}
\newcommand*\theid{}

\ifcsname nospell\endcsname\else\newcommand\nospell[1]{#1}\fi

\endinput