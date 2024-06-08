\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zesis}[2023/06/05 ZJU Thesis Class]

\LoadClass[12pt,twoside,openright]{ctexbook}


% Package imports
\RequirePackage{geometry}
\RequirePackage[twoside]{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage{zhlipsum}
\RequirePackage{multirow}
\RequirePackage{titlesec}
\RequirePackage{natbib}
\RequirePackage{bibunits}
\RequirePackage{fontspec}
\RequirePackage{gbt7714}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{pdfpages}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage{ulem}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{ifplatform}
\RequirePackage{makecell}
\RequirePackage{dsfont}
\RequirePackage{amssymb}
\RequirePackage{derivative}
\RequirePackage{tikz}
\RequirePackage{etoc}
\RequirePackage{float}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{cleveref}
\RequirePackage[utf8]{inputenc}
\RequirePackage{zref-abspage}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{chngcntr}
\RequirePackage{booktabs}

% Setup key-value options
\SetupKeyvalOptions{
    family=zesis,
    prefix=
}

% Define class options
\DeclareBoolOption[false]{blind}
\DeclareBoolOption[true]{print}
\DeclareStringOption[pre]{phase}[pre,mid,final]
\DeclareStringOption[学生姓名]{student}
\DeclareStringOption[学号]{studentid}
\DeclareStringOption[所在学院]{college}
\DeclareStringOption[提交日期]{submitdate}
\DeclareStringOption[指导教师]{instructor}
\DeclareStringOption[年级]{grade}
\DeclareStringOption[专业]{major}
\DeclareStringOption[论文题目]{thtitle}

\ProcessKeyvalOptions*

\ifprint
    \PassOptionsToClass{12pt,twoside,openright}{ctexbook}
\else
    \PassOptionsToClass{12pt,openright}{ctexbook}
\fi

\ctexset{
    chapter/name = {第,部分},
}

% Private command for blinding
\newcommand{\private}[1]{%
    \ifblind
        \phantom{#1}% If blind mode is true, do nothing (return an empty string)
    \else
        #1% If blind mode is false, return the input string  
    \fi
}

% Renew author-related commands based on blinding option
\let\oldStudent\student
\let\oldStudentid\studentid
\let\oldCollege\college
\let\oldSubmitdate\submitdate
\let\oldSupervisor\instructor
\let\oldGrade\grade
\let\oldMajor\major

\renewcommand{\student}{\private{\oldStudent}}
\renewcommand{\studentid}{\private{\oldStudentid}}
\renewcommand{\college}{\private{\oldCollege}}
\renewcommand{\submitdate}{\private{\oldSubmitdate}}
\renewcommand{\instructor}{\private{\oldSupervisor}}
\renewcommand{\grade}{\private{\oldGrade}}
\renewcommand{\major}{\private{\oldMajor}}

% Geometry settings
\geometry{
    top=2.5cm,
    left=2.5cm,
    right=2.5cm,
    bottom=2.5cm,
    headheight=2.5cm,
    headsep=1cm,
}

% Font size commands
\newcommand{\yihao}{\fontsize{26bp}{26bp}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24bp}{24bp}\selectfont}
\newcommand{\erhao}{\fontsize{22bp}{22bp}\selectfont}
\newcommand{\xiaoer}{\fontsize{18bp}{18bp}\selectfont}
\newcommand{\sanhao}{\fontsize{16bp}{16bp}\selectfont}
\newcommand{\xiaosan}{\fontsize{15bp}{15bp}\selectfont}
\newcommand{\sihao}{\fontsize{14bp}{14bp}\selectfont}
\newcommand{\xiaosi}{\fontsize{12bp}{12bp}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5bp}{10.5bp}\selectfont}
\newcommand{\xiaowu}{\fontsize{9bp}{9bp}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5bp}{11.25}\selectfont}

% Font settings
\ifmacosx
    \let\xingkai\relax
    \let\fangsong\relax
    \newCJKfontfamily\xingkai{STXingkai}[AutoFakeBold={3}]
    \newCJKfontfamily\fangsong{STFangsong}[AutoFakeBold={3.5}]
\else
    \let\fangsong\relax
    \let\kaishu\relax
    \let\heiti\relax
    \let\songti\relax
    \let\xingkai\relax
    \newCJKfontfamily\heiti{SimHei}[AutoFakeBold={3}]
    \newCJKfontfamily\kaishu{KaiTi}[AutoFakeBold={3}]
    \newCJKfontfamily\xingkai{STXingkai}[AutoFakeBold={3}]
    \newCJKfontfamily\fangsong{FangSong}[AutoFakeBold={3}]
    \newCJKfontfamily\songti{SimSun}[AutoFakeBold={3}]
\fi
\setmainfont{Times New Roman}

% Chinese numbering
\etocsetlevel{subsubsubsection}{4}
\newcounter{subsubsubsection}[subsubsection]
\newcommand{\chineseSection}[1]{%
    \ifcase#1\or 一\or 二\or 三\or 四\or 五\or 六\or 七\or 八\or 九\or 十\fi、\hspace*{-1.5ex}}
\let\oldthesection\thesection

\newcommand{\FinalSecNumbering}{
    \renewcommand{\thesection}{\arabic{section}}
    \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
    \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
    \renewcommand{\thesubsubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{subsubsubsection}}
}


\newcommand{\ProposalSecNumbering}{
    \renewcommand{\thesection}{\chineseSection{\arabic{section}}}
    \renewcommand{\thesubsection}{\arabic{subsection}}
    \renewcommand{\thesubsubsection}{\arabic{subsection}.\arabic{subsubsection}}
    \renewcommand{\thesubsubsubsection}{\arabic{subsection}.\arabic{subsubsection}.\arabic{subsubsubsection}}
}

% Section formatting
\titleformat{\section}
{\centering\bfseries\fangsong\sanhao}
{\thesection}
{.5em}
{}

\titleformat{\subsection}
{\xiaosan\bfseries\fangsong\flushleft}
{\thesubsection}
{.5em}
{}

\titleformat{\subsubsection}
{\sihao\bfseries\fangsong\flushleft}
{\thesubsubsection}
{.5em}
{}

\titleformat{\subsubsubsection}
{\sihao\bfseries\fangsong\flushleft}
{\thesubsubsubsection}
{.5em}
{}

\titleformat{\chapter}[display]
{\heiti\fontsize{48}{72}\bfseries\centering}
{\vfill 第\zhnumber{\thechapter}部分}
{20pt}
{\fontsize{36}{48}\fangsong\bfseries}
[\vspace{280pt}\thispagestyle{empty}]


\titlespacing*{\chapter}{0pt}{0pt}{0pt}
\titlespacing*{\section}{0pt}{0pt}{0pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}
\titlespacing*{\subsubsubsection}{0pt}{0pt}{0pt}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% TOC settings
\titleclass{\subsubsubsection}{straight}[\subsubsection]
\def\l@subsubsubsection{\@dottedtocline{4}{3em}{3em}}
\def\toclevel@subsubsubsection{4}
\etocsetlevel{subsubsubsection}{4}
\newcommand \Dotfill {\leavevmode \cleaders \hb@xt@ .66em{\hss .\hss }\hfill \kern \z@}

\newcommand{\ProposalTocStyle}{

    \etocsetstyle{section}
    {\begingroup}
    {\noindent \fangsong \xiaosi \bfseries \hspace*{0em}}
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}


    \etocsetstyle{subsection}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries\hspace*{1em} }
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

    \etocsetstyle{subsubsection}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries\hspace*{2em} }
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

    \etocsetstyle{subsubsubsection}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries \hspace*{3em}}
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

}

\newcommand{\FinalTocStyle}{
    \etocsetstyle{chapter}
    {\begingroup}
    {\noindent \fangsong \sihao \bfseries \hspace*{0em}}
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \newline}
    {\endgroup}

    \etocsetstyle{section}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries \hspace*{1em}}
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}


    \etocsetstyle{subsection}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries \hspace*{2em}}
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

    \etocsetstyle{subsubsection}
    {\begingroup}
    {\leftskip0cm \noindent\fangsong \xiaosi \mdseries \hspace*{3em} }
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

    \etocsetstyle{subsubsubsection}
    {\begingroup}
    {\noindent \fangsong \xiaosi \mdseries\hspace*{4em} }
    {\etocifnumbered{\etocnumber{} ~ }{}\etocname{} \Dotfill \quad \etocpage \newline}
    {\endgroup}

}




% Page style settings  
\fancyhf{}
\pagestyle{empty}
\setlength{\parskip}{0.5\baselineskip}
\setlength{\fboxsep}{0pt}

\fancypagestyle{bodypage}{
    \fancyhead{}
    \fancyhead[RO]{\fontsize{9bp}{9bp}\selectfont\fangsong \thtitle}
    \fancyhead[LE]{\fontsize{9bp}{9bp}\selectfont\fangsong 浙江大学本科生毕业论文（设计）}
    \fancyfoot{}
    \fancyfoot[C]{\thepage}
}

% Bibliography settings
\defaultbibliographystyle{common/gbt7714-custom}
\defaultbibliography{common/references}

\setlength{\bibsep}{0pt}
\let\oldputbib\putbib
\renewcommand{\putbib}{
    \begingroup
    \oldputbib
    \endgroup
}
\renewcommand{\bibsection}{}
\citestyle{numbers}

% Include commands
\newcommand{\includethesis}{\input{lib/\phase/main.tex}}

\newcommand{\includepdfpage}[2]{%  
    \begin{center}
        \begin{minipage}{\textwidth}
            \centering
            \fbox{\includegraphics[page=#2,width=\dimexpr \linewidth - 2\fboxsep - 2\fboxrule \relax, 
            height=\dimexpr \textheight - \pagetotal - 2\fboxsep - 2\fboxrule \relax, 
            keepaspectratio]{#1}}
        \end{minipage}
    \end{center}
    \clearpage
}

% Other settings
\newcommand{\partitle}[1]{{\bfseries #1 \quad}}
\setlength{\intextsep}{6pt plus 2pt minus 2pt}

\crefname{figure}{图}{图}
\raggedbottom
\let\origdoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{
    \clearpage
    \ifprint
        \if@twoside
            \ifodd\c@abspage
                \null
                \thispagestyle{empty}%
                \addtocounter{page}{-1}
                \newpage
                \if@twocolumn
                    \hbox{}\newpage
                \fi
            \fi
        \fi
    \fi
}

\setlength{\textfloatsep}{10pt plus 1pt minus 2pt}
\setlength{\intextsep}{10pt plus 1pt minus 2pt}
\renewcommand{\arraystretch}{1.4}
\numberwithin{table}{section}
\numberwithin{figure}{section}
\numberwithin{equation}{section}
\setlistdepth{9}
\DeclareCaptionFormat{myformat}{\wuhao\songti\selectfont#1#2#3}
\captionsetup{format=myformat}

% \AtBeginEnvironment{tabular}{\wuhao \songti}
% \AtBeginEnvironment{tabularx}{\wuhao \songti}
% Define custom colors
\g@addto@macro\@floatboxreset\centering
\definecolor{commentcolor}{rgb}{0.25, 0.50, 0.35}
\definecolor{keywordcolor}{rgb}{0.00, 0.00, 0.63}
\definecolor{stringcolor}{rgb}{0.63, 0.00, 0.00}

% Scala listing style
\lstdefinestyle{scala}{
    language=Scala,
    aboveskip=3mm,
    belowskip=3mm,
    showstringspaces=false,
    columns=flexible,
    basicstyle={\linespread{1.0}\small\ttfamily},
    numbers=left,
    numberstyle=\tiny\color{gray},
    keywordstyle=\color{keywordcolor}\bfseries,
    commentstyle=\color{commentcolor}\itshape,
    stringstyle=\color{stringcolor},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=3,
    frame=single,
    morekeywords={abstract, case, catch, choose, class, def, do, else, enum, extends, false, final, finally, for, if, implicit, import, lazy, match, new, null, object, override, package, private, protected, requires, return, sealed, super, this, throw, trait, try, true, type, val, var, while, with, yield},
    morecomment=[l]{//},
    morecomment=[s]{/*}{*/},
    morestring=[b]",
    morestring=[b]',
    morestring=[b]"""
}
\renewcommand\lstlistingname{代码}
\renewcommand\lstlistlistingname{代码}
\newcommand\subsectiontoconly[1]
{
    \phantomsubsection
    \addcontentsline{toc}{subsection}{#1}
}
\newcommand\subsectionnonum[1]
{
    \phantomsubsection
    \addcontentsline{toc}{subsection}{#1}
    \subsection*{#1}
}
\newcommand\sectiontoconlynopage[1]
{
    \phantomsection
    \addtocontents{toc}{\protect\contentsline{section}{\protect\numberline{}#1}{}{section.\thesection}}
}
\newcommand{\sectionnopage}[1]
{
    \phantomsection
    \addtocontents{toc}{\protect\contentsline{section}{\protect\numberline{}#1}{}{section.\thesection}}
    % \addcontentsline{toc}{section}{#1}
    \section*{#1}
}
\newcommand{\sectionnonum}[1]
{
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \section*{#1}
}
\newcommand{\sectiontoconly}[1]
{
    \phantomsection
    \addcontentsline{toc}{section}{#1}
}

\setstretch{1.5}

\newcommand\scalemath[2]{\scalebox{#1}{\mbox{\ensuremath{\displaystyle #2}}}}

\newcommand\ProposalCounterStyle{
    \counterwithin{figure}{subsection}
    \counterwithin{table}{subsection}
    \counterwithin{equation}{subsection}
    \counterwithin{lstlisting}{subsection}
    \renewcommand{\thefigure}{\arabic{subsection}.\arabic{figure}}
    \renewcommand{\theequation}{\arabic{subsection}.\arabic{equation}}
    \renewcommand{\thetable}{\arabic{subsection}.\arabic{table}}
    \renewcommand{\thelstlisting}{\arabic{subsection}.\arabic{lstlisting}}
}

\newcommand\FinalCounterStyle{
    \counterwithin{figure}{section}
    \counterwithin{table}{section}
    \counterwithin{equation}{section}
    \counterwithin{lstlisting}{section}
    \renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
    \renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
    \renewcommand{\thetable}{\arabic{section}.\arabic{table}}
    \renewcommand{\thelstlisting}{\arabic{section}.\arabic{lstlisting}}
}
