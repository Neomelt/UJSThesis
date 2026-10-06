%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ujsthesis -- Jiangsu University undergraduate thesis class
%
% This class is an independent implementation based on the Jiangsu University
% undergraduate design/thesis format template (2026 edition) supplied with
% this project.  It is not a copy of TongjiThesis or any other class.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ujsthesis}[2026/10/05 v0.1 Jiangsu University thesis class]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ujsthesis,prefix=ujsthesis@}
\DeclareStringOption[fandol]{fontset}
\DeclareBoolOption[false]{twoside}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*

\ifujsthesis@twoside
  \LoadClass[UTF8,a4paper,twoside,openright,zihao=-4,fontset=none]{ctexbook}
\else
  \LoadClass[UTF8,a4paper,oneside,openright,zihao=-4,fontset=none]{ctexbook}
\fi

% The supplied Word template names SimSun/SimHei and Times New Roman.  Fandol
% is the portable TeX Live substitute and is available on the target Fedora
% environment; TeX Gyre Termes is metrically close to Times New Roman.
\RequirePackage{fontspec}
\RequirePackage{etoolbox}
\setCJKmainfont[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
\setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\setCJKmonofont{FandolSong-Regular.otf}
\setCJKfamilyfont{song}[BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}
\setCJKfamilyfont{hei}[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
\setCJKfamilyfont{kai}{FandolKai-Regular.otf}
\setCJKfamilyfont{fang}{FandolFang-Regular.otf}
\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaishu}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{Latin Modern Mono}

\RequirePackage[a4paper,left=2.22cm,right=1.95cm,top=2.54cm,bottom=2.54cm,headheight=14pt,headsep=0.45cm,footskip=0.75cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}

\hypersetup{colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,bookmarksopen=true}
\urlstyle{same}

% -----------------------------------------------------------------------------
% Format constants
% -----------------------------------------------------------------------------
\newcommand{\ujsbodyfont}{\zihao{-4}\songti}
\newcommand{\ujschapterfont}{\zihao{-2}\heiti}
\newcommand{\ujssectionfont}{\zihao{4}\songti\bfseries}
\newcommand{\ujssubsectionfont}{\zihao{-4}\songti\bfseries}
\newcommand{\ujsfronttitlefont}{\zihao{-2}\heiti}
\newcommand{\ujsTOCchapterfont}{\zihao{4}\heiti}
\newcommand{\ujscaptionfont}{\zihao{-5}\songti}
\newcommand{\ujsheadfont}{\zihao{-5}\songti}
\newcommand{\ujspagenumfont}{\zihao{-5}\rmfamily}

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\linespread{1.625}\selectfont % close to Word's 1.5-line spacing at small-four
\setlist{nosep}

\titleformat{\chapter}[block]
  {\ujschapterfont\centering}
  {\thechapter\quad}{0pt}{}
\titlespacing*{\chapter}{0pt}{\baselineskip}{\baselineskip}
\titleformat{\section}[block]
  {\ujssectionfont\raggedright}
  {\thesection\quad}{0pt}{}
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titleformat{\subsection}[block]
  {\ujssubsectionfont\raggedright}
  {\thesubsection\quad}{0pt}{}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titleformat{\subsubsection}[block]
  {\ujssubsectionfont\raggedright}
  {\thesubsubsection\quad}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
% The Jiangsu contents sample uses Arabic chapter numbers (1, 2, ...),
% while ctexbook defaults to Chinese ordinal numbers in the TOC.
\ctexset{chapter/number=\arabic{chapter},appendix/number=\Alph{chapter}}
\renewcommand{\CTEXthechapter}{\thechapter}
\renewcommand{\contentsname}{目录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\DeclareCaptionFont{ujscaption}{\ujscaptionfont}
\captionsetup{font=ujscaption,labelsep=space,justification=centering}
\AtBeginBibliography{%
  \ujsbodyfont\linespread{1.5}\selectfont
  \setlength{\parindent}{0pt}
  \setlength{\bibhang}{0pt}
  \setlength{\bibitemsep}{0pt}
}
% The Word instructions keep wrapped bibliography lines at the same left edge
% as the entry text.  The gb7714 style's default list adds a hanging indent;
% keep the label in the margin while leaving the paragraph itself flush left.
\defbibenvironment{bibliography}
  {\list{\printtext[labelnumberwidth]{%
      \printfield{labelprefix}\printfield{labelnumber}}}%
    {\setlength{\labelwidth}{0pt}%
     \setlength{\labelsep}{0pt}%
     \setlength{\leftmargin}{0pt}%
     \setlength{\itemindent}{0pt}%
     \setlength{\listparindent}{0pt}%
     \setlength{\itemsep}{\bibitemsep}%
     \setlength{\parsep}{\bibparsep}%
     \renewcommand*{\makelabel}[1]{\llap{##1\hspace{1em}}}}}%
  {\endlist}
  {\item}

% Make chapter entries in the table of contents follow the supplied hierarchy.
\titlecontents{chapter}[0em]
  {\ujsTOCchapterfont\addvspace{0.35em}}
  {\contentslabel{2.2em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{section}[2em]
  {\ujsbodyfont}
  {\contentslabel{2.8em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}
\titlecontents{subsection}[4.8em]
  {\ujsbodyfont}
  {\contentslabel{3.4em}}{}
  {\titlerule*[0.5pc]{.}\contentspage}

% -----------------------------------------------------------------------------
% Configurable metadata
% -----------------------------------------------------------------------------
\newcommand{\ujs@university}{江苏大学}
\newcommand{\ujs@college}{学院名称}
\newcommand{\ujs@major}{专业班级}
\newcommand{\ujs@student}{学生姓名}
\newcommand{\ujs@studentid}{学生学号}
\newcommand{\ujs@advisor}{指导教师姓名}
\newcommand{\ujs@rank}{指导教师职称}
\newcommand{\ujs@title}{中文论文题目}
\newcommand{\ujs@titleen}{English Thesis Title}
\newcommand{\ujs@date}{\the\year 年 \the\month 月}
\newcommand{\ujs@keywords}{关键词 1；关键词 2；关键词 3}
\newcommand{\ujs@keywordsEN}{Keyword 1; Keyword 2; Keyword 3}
\newcommand{\ujs@abstract}{请在 main.tex 中填写中文摘要。中文摘要应不少于 400 字，并独立说明研究目的、方法、结果和结论。}
\newcommand{\ujs@abstractEN}{Please write an English abstract of at least 350 words. It should state the purpose, method, results, and conclusion of the work.}
\newcommand{\ujs@declarationdate}{年  月  日}
\newcommand{\ujs@declarationname}{}
% These two assets are extracted from the supplied Jiangsu University Word
% template.  They remain configurable so a later official replacement can be
% supplied without changing the class.
\newcommand{\ujs@emblem}{figures/jiangsu-university-emblem.png}
\newcommand{\ujs@calligraphy}{figures/jiangsu-university-calligraphy.png}

\newcommand{\ujstitle}[1]{\renewcommand{\ujs@title}{#1}}
\newcommand{\ujstitleen}[1]{\renewcommand{\ujs@titleen}{#1}}
\newcommand{\ujscollege}[1]{\renewcommand{\ujs@college}{#1}}
\newcommand{\ujsmajor}[1]{\renewcommand{\ujs@major}{#1}}
\newcommand{\ujsstudent}[1]{\renewcommand{\ujs@student}{#1}}
\newcommand{\ujsstudentid}[1]{\renewcommand{\ujs@studentid}{#1}}
\newcommand{\ujsadvisor}[1]{\renewcommand{\ujs@advisor}{#1}}
\newcommand{\ujsrank}[1]{\renewcommand{\ujs@rank}{#1}}
\newcommand{\ujsdate}[1]{\renewcommand{\ujs@date}{#1}}
\newcommand{\ujskeywords}[1]{\renewcommand{\ujs@keywords}{#1}}
\newcommand{\ujskeywordsEN}[1]{\renewcommand{\ujs@keywordsEN}{#1}}
\newcommand{\ujsabstract}[1]{\renewcommand{\ujs@abstract}{#1}}
\newcommand{\ujsabstractEN}[1]{\renewcommand{\ujs@abstractEN}{#1}}
\newcommand{\ujsdeclarationdate}[1]{\renewcommand{\ujs@declarationdate}{#1}}
\newcommand{\ujsemblem}[1]{\renewcommand{\ujs@emblem}{#1}}
\newcommand{\ujscalligraphy}[1]{\renewcommand{\ujs@calligraphy}{#1}}

\newcommand{\ujs@headerleft}{}
\newcommand{\ujsheader}[1]{\renewcommand{\ujs@headerleft}{#1}\pagestyle{ujsfront}}
\newcommand{\ujsbodyheaders}{\pagestyle{ujsbody}}
\newcommand{\ujs@headright}{\ujs@university 本科毕业设计（论文）}

\fancypagestyle{ujsfront}{%
  \fancyhf{}
  \fancyhead[L]{\ujsheadfont\ujs@headerleft}
  \fancyhead[R]{\ujsheadfont\ujs@headright}
  \fancyfoot[C]{\ujspagenumfont\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
}
\fancypagestyle{ujsbody}{%
  \fancyhf{}
  \fancyhead[R]{\ujsheadfont\ujs@headright}
  \fancyfoot[C]{\ujspagenumfont\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[R]{\ujsheadfont\ujs@headright}
  \fancyfoot[C]{\ujspagenumfont\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
}

% -----------------------------------------------------------------------------
% Cover and front matter
% -----------------------------------------------------------------------------
\newcommand{\MakeCover}{%
  \hypersetup{pageanchor=false}% cover has no page number or PDF page anchor
  \begin{titlepage}
    \thispagestyle{empty}
    \centering
    \vspace*{0.45cm}
    \noindent\makebox[\textwidth][c]{%
      \begin{minipage}[c][3.25cm][c]{3.15cm}
        \centering
        \IfFileExists{\ujs@emblem}{\includegraphics[width=2.75cm,height=2.85cm,keepaspectratio]{\ujs@emblem}}{}
      \end{minipage}%
      \hspace{0.12cm}%
      \begin{minipage}[c][3.25cm][c]{13.35cm}
        \centering
        \IfFileExists{\ujs@calligraphy}{\includegraphics[width=13.15cm,height=2.55cm,keepaspectratio]{\ujs@calligraphy}\par}{}
        \vspace{-0.05cm}
        {\bfseries\fontsize{16pt}{20pt}\selectfont
          \underline{\makebox[13.15cm][c]{J I A N G S U \quad U N I V E R S I T Y}}\par}
      \end{minipage}%
    }\par
    \vspace{0.35cm}
    {\heiti\bfseries\zihao{2} 本 科 \quad 毕 \quad 业 \quad 设 \quad 计（论 \quad 文）\par}
    \vspace{1.7cm}
    {\heiti\bfseries\zihao{2} \ujs@title\par}
    \vspace{0.55cm}
    {\bfseries\fontsize{16pt}{22pt}\selectfont \ujs@titleen\par}
    \vfill
    \begin{tabular}{@{}p{3.4cm}>{\centering\arraybackslash}p{8.0cm}@{}}
      \songti\zihao{4} 学院名称： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@college}}\\[0.35cm]
      \songti\zihao{4} 专业班级： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@major}}\\[0.35cm]
      \songti\zihao{4} 学生姓名： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@student}}\\[0.35cm]
      \songti\zihao{4} 学生学号： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@studentid}}\\[0.35cm]
      \songti\zihao{4} 指导教师姓名： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@advisor}}\\[0.35cm]
      \songti\zihao{4} 指导教师职称： & \songti\zihao{4} \underline{\makebox[8.0cm][c]{\ujs@rank}}
    \end{tabular}
    \vfill
    {\songti\zihao{-4} \ujs@date\par}
  \end{titlepage}%
  \hypersetup{pageanchor=true}%
}

\newcommand{\MakeDeclaration}{%
  \clearpage\ujsheader{原创性声明}\thispagestyle{ujsfront}
  \begin{center}\ujsfronttitlefont 毕业设计（论文）原创性声明\end{center}
  \vspace{0.2cm}
  {\songti\fontsize{14pt}{28pt}\selectfont
  \setlength{\parindent}{2em}
  本人郑重声明：所提交的毕业设计（论文），是本人在导师指导下，独立进行研究工作所取得的成果。\par
  \vspace{0.4cm}
  除文中已注明引用的内容外，本毕业设计（论文）不包含任何其他个人或集体已经发表或撰写过的作品成果。对本研究做出过重要贡献的个人和集体，均已在文中以明确方式标明并表示了谢意。\par
  }
  \vspace{3cm}
  \begin{flushright}\songti\fontsize{14pt}{28pt}\selectfont 论文作者签名：\hspace{3.5cm}\par\vspace{1cm}日期：\ujs@declarationdate\end{flushright}
  \clearpage
}

\newcommand{\ujs@frontmeta}{%
  \begin{center}\ujsbodyfont
  专业班级：\ujs@major\quad 学生姓名：\ujs@student\\
  指导教师：\ujs@advisor\quad 职称：\ujs@rank
  \end{center}
}

\newcommand{\MakeAbstract}{%
  \clearpage\ujsheader{摘要}\thispagestyle{ujsfront}
  \begin{center}{\bfseries\zihao{3}\heiti\ujs@title\par}\end{center}
  \vspace{0.2cm}\ujs@frontmeta\vspace{0.6cm}
  {\ujsbodyfont\setlength{\parindent}{2em}\heiti\zihao{4}\hspace*{2em}摘要：\hspace{0.5em}\songti\zihao{-4}\ujs@abstract\par}
  \vspace{0.6cm}
  {\ujsbodyfont\noindent\heiti\zihao{4} 关键词：\songti\zihao{-4}\ujs@keywords\par}
  \clearpage
  \ujsheader{ABSTRACT}\thispagestyle{ujsfront}
  \begin{center}{\bfseries\fontsize{14pt}{20pt}\selectfont \ujs@titleen\par}\end{center}
  \vspace{0.5cm}
  {\ujsbodyfont\setlength{\parindent}{1em}\bfseries\hspace*{1em}ABSTRACT\hspace{1em}\normalfont\ujs@abstractEN\par}
  \vspace{0.6cm}
  {\ujsbodyfont\noindent\bfseries KEY WORDS\quad \normalfont\ujs@keywordsEN\par}
  \clearpage
}

\newcommand{\MakeTOC}{%
  \ujsheader{目录}\thispagestyle{ujsfront}
  \begingroup
    \linespread{1.5}\selectfont
    \renewcommand{\contentsname}{\ujsfronttitlefont 目\hspace{1em}录}
    \tableofcontents
    \thispagestyle{ujsfront}
  \endgroup
  \clearpage
}

\newcommand{\UJSFrontMatter}{%
  % The cover is intentionally unnumbered, so the declaration page starts at
  % Roman I without reusing the cover's PDF page anchor.
  \hypersetup{pageanchor=false}\pagenumbering{Roman}\pagestyle{ujsfront}\setcounter{page}{1}\hypersetup{pageanchor=true}
}
\newcommand{\UJSMainMatter}{%
  % The body restarts at Arabic page 1.  Temporarily disable PDF page anchors
  % so hyperref does not report a duplicate destination after the Roman pages.
  \hypersetup{pageanchor=false}\clearpage\pagenumbering{arabic}\setcounter{page}{1}\hypersetup{pageanchor=true}\ujsbodyheaders
}

% Reference heading is a new chapter and appears in the TOC.
\newcommand{\UJSReferences}{%
  \clearpage\ujsbodyheaders
  \printbibliography[heading=bibintoc,title={参考文献}]
}
\newcommand{\UJSBackMatterHeading}[1]{%
  \clearpage\thispagestyle{plain}
  \vspace*{2\baselineskip}
  \begin{center}
    \ujschapterfont
    \ifstrequal{#1}{致谢}{致\hspace{1em}谢}{%
      \ifstrequal{#1}{附录}{附\hspace{1em}录}{#1}%
    }%
  \end{center}
  \vspace{\baselineskip}
  \addcontentsline{toc}{chapter}{#1}
}

% Code listing defaults; listings avoids a shell-escape dependency.
\definecolor{ujslistingbg}{RGB}{248,248,248}
\lstset{backgroundcolor=\color{ujslistingbg},basicstyle=\small\ttfamily,breaklines=true,frame=single,framerule=0.3pt,rulecolor=\color{gray!45},numbers=left,numberstyle=\tiny\color{gray},numbersep=7pt,showstringspaces=false,tabsize=4}
\renewcommand{\lstlistingname}{代码}

\endinput
