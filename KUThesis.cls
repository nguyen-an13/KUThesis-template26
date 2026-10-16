% -*- TeX:UTF-8 -*-
%%  고려대학교 석·박사 학위논문 LaTeX 템플릿
%%
%%         버전: 3.0
%%
%%         작성자: 이수현
%%               - email : d.constructuralism@gmail.com
%%               - homepage : http://tinyurl.com/suhyeonlee
%%               - git : https://github.com/hyeonleee/KUThesis2022
%%
%%         제작 일자 : 2022. 12. 25
%%         업데이트  : 2022. 12. 25
%%
%%         Lab Edition (English-only fork): Nguyen Van An
%%               - git : https://github.com/nguyen-an13/KUThesis-template26
%%               - forked & updated : 2026. 10
%%
%%
%%         참고자료: 1. KAIST Thesis Templete for LaTeX version 0.4 
%%                 2. KU Thesis Template for Latex version 2.11 (제작자: 장진희, https://github.com/KUNPL/KUThesis)
%%
%%               
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  여러분의 참여가 이 템플릿을 더욱 완벽하게 만들 수 있습니다. 
%%
%%          
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{KUThesis}

%% 옵션 선언을 위한 변수 선언
\newif\if@isDoctor
\newif\if@isFinal
\newif\if@isPdfdoc
\newif\if@isDebug
\newif\if@isTwosides
\newif\if@isLongDeptName
\newif\if@isTOCHeader
\newif\if@isContentHeader
\newif\if@isBibHeader
\newif\if@isKrabst
\newif\if@isAsym
\newif\if@isLibrary
\newif\if@isScience
\newif\if@isDedication
\newif\if@isPreface
\newif\if@isNomenclature
\newif\if@isChapterInline


%% 새 옵션 모음 - doctor|master, final|draft
\DeclareOption{doctor}       {\@isDoctortrue}
\DeclareOption{master}       {\@isDoctorfalse}
\DeclareOption{final}        {\@isFinaltrue}
\DeclareOption{pdfdoc}       {\@isPdfdoctrue}
\DeclareOption{debug}        {\@isDebugtrue}
\DeclareOption{twosides}     {\@isTwosidestrue}
\DeclareOption{oneside}      {\@isTwosidesfalse}
\DeclareOption{krabst}       {\@isKrabsttrue} % 국문초록 (규정상 영문논문도 필수)
\DeclareOption{asym}         {\@isAsymtrue}
\DeclareOption{library}      {\@isLibrarytrue}
\DeclareOption{science}      {\@isSciencetrue} % 석사 학위명을 Master of Science로 표기 (기본값)
\DeclareOption{arts}         {\@isSciencefalse} % 석사 학위명을 Master of Arts로 표기
\DeclareOption{chapterinline}  {\@isChapterInlinetrue}  % "Chapter N. 제목"을 한 줄로 표기 (기본값)
\DeclareOption{chapterstacked} {\@isChapterInlinefalse} % "Chapter N" / "제목"을 두 줄로 표기 (LaTeX 기본 스타일)


%% leqno,fleqn,openbib 옵션은 그대로 report 클래스에 전달
\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {report}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}

%% doctor,draft,twoside가 기본값
\@isDoctortrue
\@isFinalfalse
\@isTwosidestrue
\@isLongDeptNamefalse
\@isTOCHeaderfalse
\@isContentHeaderfalse
\@isBibHeaderfalse
\@isKrabstfalse
\@isAsymfalse
\@isLibraryfalse
\@isSciencetrue
\@isDedicationfalse
\@isPrefacefalse
\@isNomenclaturefalse
\@isChapterInlinetrue
\ProcessOptions

%% 11pt,onecolumn,oneside 옵션으로 report 클래스 불러오기
\if@isTwosides
  \LoadClass[11pt,onecolumn,twoside,openright]{report}
\else
  \LoadClass[11pt,onecolumn,oneside]{report}
\fi

%% \chapter 제목 스타일: "Chapter N. 제목"을 한 줄로(chapterinline, 기본값) 표기할지,
%% LaTeX 기본 스타일대로 "Chapter N" / "제목"을 두 줄로(chapterstacked) 표기할지 선택
\RequirePackage{titlesec}
\if@isChapterInline
  \titleformat{\chapter}[hang]{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter.}{20pt}{}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt}
\else
  \titleformat{\chapter}[display]{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\huge\bfseries}
  \titlespacing*{\chapter}{0pt}{50pt}{40pt}
\fi


%% 여백 체크용 디버그 옵션
\if@isDebug
  \usepackage[a4,frame,center]{crop}
\fi

%% Table of contents, List of figures, List of tables를 Table of Contents에 추가
\usepackage{tocbibind}

%% 편집용지 설정 (4x6 배판 - 190x260 mm2)
%% 규정: 초록부터 좌우 여백은 최소 2cm(20mm) 이상이어야 하므로,
%% 제본용 여백(asym)을 적용해도 바깥쪽(outer) 여백은 20mm 밑으로 내려가지 않게 한다.
\if@isAsym
  \usepackage[inner = 25mm ,       outer = 20mm,
                top = 30mm,       bottom = 30mm,
         paperwidth = 190mm, paperheight = 260mm]{geometry}
\else
  \usepackage[inner = 20mm ,       outer = 20mm,
                top = 30mm,       bottom = 30mm,
         paperwidth = 190mm, paperheight = 260mm]{geometry}
\fi

%% 들여쓰기
\usepackage{indentfirst}
\setlength\parindent{0em}

%% Figure와 Caption사이 거리 조정
\setlength{\abovecaptionskip}{10pt} % 캡션 위 거리
\setlength{\belowcaptionskip}{0pt}  % 캡션 아래 거리

%% bibliography
\usepackage[square,numbers]{natbib}
\bibliographystyle{ieeetr}

\RequirePackage{ifthen}       % 추가 패키지 설정
\RequirePackage{xparse}       % 선택적 인수(한글 이름/제목 등) 처리용
\RequirePackage[strict]{changepage}
\RequirePackage{emptypage}
\RequirePackage{graphicx} % xcolor
\RequirePackage[toc,page]{appendix}
\RequirePackage{amsmath,amssymb,textcomp,bm}
\RequirePackage[pagewise]{lineno}
\RequirePackage{fix-cm}
\RequirePackage[cjk]{kotex}
\RequirePackage[nomessages]{fp}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{multirow}



%% Caption의 줄간격 설정
\RequirePackage{caption,setspace}
\captionsetup[table]{font={stretch=\@captionLineSpacing}}
\captionsetup[figure]{font={stretch=\@captionLineSpacing}}

%% PDF 파일로 문서를 만들었을 때 링크 활성화
\if@isPdfdoc
  \RequirePackage[unicode,%
       pageanchor=false,%
           pdftex=true,%
        bookmarks=true,%
       colorlinks=true%
    ]{hyperref}
\else
\fi



\newcounter{dummy}
\RequirePackage{etoolbox}
\AfterEndPreamble{                       % \begin{document}와 함께 실행
  \checkparameters                         % 문서 변수가 올바른지 점검
  \if@isLibrary                        % 도서관 제출용에는 빈 페이지가 들어가면 안됨
    \let\cleardoublepage\clearpage
  \fi
  \newgeometry{       left = 40mm,
                     right = 30mm,
                       top = 30mm,
                    bottom = 30mm}        % 여백 다른 페이지용 여백
  \makefrontcover                          % 앞표지 생성
  \makeEngtitle                               % 속표지 생성
  \if@isFinal                              % final 옵션이 지정되어 있으면
    \newgeometry{       left = 40mm,
                       right = 30mm,
                         top = 40mm,
                      bottom = 30mm}        % 여백 다른 페이지용 여백
    \makeapproval                          % 제출승인서, 심사완료검인 생성
  \else
    \linenumbers
  \fi 
  \restoregeometry                         % 여백 되돌림
  \refstepcounter{dummy}
  \makeabstract                            % 초록 페이지 생성
  \if@isFinal
    \refstepcounter{dummy}
    \if@isKrabst
      \makekrabstract
    \fi
  \fi
  \if@isDedication                         % 감사의 글(Dedication page, 선택)
    \makededication
  \fi
  \if@isPreface                            % 서문(Preface, 필요시)
    \makepreface
  \fi
  \if@isFinal
    \makeacknowledgement                   % 사사(Acknowledgments)
  \fi
  %\pagenumbering{roman}                   % 2020년 2월 졸업논문 제출시 과학도서관 지적사항
  %\setcounter{page}{1}                    %
  \makecontents

  \if@isNomenclature                       % 기호설명(Nomenclature, 선택)
    \makenomenclature
  \fi

  \pagenumbering{arabic}
  \setcounter{page}{1}

  \renewcommand{\arraystretch}{1.3}
}

\AtEndDocument{                             % \end{document}와 함께 실행
  \bibliography{library.bib}
  \addevenpage
}


%\RequirePackage{xcolor}

%% 고려대학교 공식 영문명칭
\newcommand{\@koreauniv}{Korea University}

%% 목차 제목 변경 (규정에서 고정된 표현은 아니므로 자유롭게 수정 가능)
\renewcommand{\contentsname}{Table of Contents}

%% 소속 대학원 이름 표기 (기본값: 일반 대학원)
% #1 영문 학과명, #2 대학원 이름, #3(선택) 국문 학과명 - krabst(국문초록) 헤더에만 사용되며,
% 생략시 영문 학과명을 그대로 사용한다.
\NewDocumentCommand{\graduateSchool}{m m o} {
    \newcommand{\@departmentNameEng}{#1}
    \newcommand{\@graduateSchoolName}{#2}
    \IfValueTF{#3}{
      \newcommand{\@departmentNameKor}{#3}
    }{
      \newcommand{\@departmentNameKor}{#1}
    }
}
\@onlypreamble{\graduateSchool}

% @command title 논문 제목
% #1 제목 크기 설정값, #2 영문 제목, #3(선택) 국문 제목 - krabst(국문초록)에만 사용되며,
% 생략시 영문 제목을 그대로 사용한다.
\RenewDocumentCommand{\title}{m m o} {
  \ifnum#1=3
    \newcommand{\@titleSize}{19pt}
    \newcommand{\@univSize}{18pt}
  \else
    \ifnum#1=2
      \newcommand{\@titleSize}{21pt}
      \newcommand{\@univSize}{18pt}
    \else
      \ifnum#1=0
        \newcommand{\@titleSize}{30pt}
      \else
        \newcommand{\@titleSize}{28pt}
      \fi
      \newcommand{\@univSize}{20pt}
    \fi
  \fi
  \newcommand{\@titleEng}{#2}
  \IfValueTF{#3}{
    \newcommand{\@titleKor}{#3}
  }{
    \newcommand{\@titleKor}{#2}
  }
}
\@onlypreamble{\title}

% @command author 저자 이름
% #1 성(family name), #2 이름(given name), #3(선택) 국문 성명 - krabst(국문초록) 헤더에만
% 사용되며, 생략시 영문 이름을 그대로 사용한다.
\RenewDocumentCommand{\author}{m m o} {%
    \newcommand{\@authorEngFN}{#1}
    \newcommand{\@authorEngGN}{#2}
    \newcommand{\@authorEng}{#2\ #1}
    \IfValueTF{#3}{
      \newcommand{\@authorKorSpace}{#3}
    }{
      \newcommand{\@authorKorSpace}{\@authorEng}
    }
}
\@onlypreamble{\author}

% 현재는 주 지도교수만 지원
% @command advisor 지도교수 이름
% #1 영문 이름, #2(선택) 국문 이름 - krabst(국문초록) 헤더에만 사용되며,
% 생략시 영문 이름을 그대로 사용한다.
\NewDocumentCommand{\advisor}{m o}{%
  \newcommand{\@advisorMajorEng}{#1}
  \IfValueTF{#2}{
    \newcommand{\@advisorMajorKor}{#2}
  }{
    \newcommand{\@advisorMajorKor}{#1}
  }
}
\@onlypreamble{\advisor}

\if@isDoctor
  \newcommand{\@degreeEng}{Doctor}
  \newcommand{\@degreeFullName}{Doctor of Philosophy}
  \newcommand{\@paperKind}{Dissertation} % 미국계열과 영국계열에 따라 박사학위, 석사학위, 학사학위 논문을 Dissertation / Thesis 호칭이 달라지나 일반대학원 양식에 따라 박사는 Dissertation, 석사는 Thesis 로 한다
  \newcommand{\@paperKindLower}{dissertation}
\else
  \newcommand{\@degreeEng}{Master}
  \if@isScience
    \newcommand{\@degreeFullName}{Master of Science}
  \else
    \newcommand{\@degreeFullName}{Master of Arts}
  \fi
  \newcommand{\@paperKind}{Thesis} % 미국계열과 영국계열에 따라 박사학위, 석사학위, 학사학위 논문을 Dissertation / Thesis 호칭이 달라지나 일반대학원 양식에 따라 박사는 Dissertation, 석사는 Thesis 로 한다
  \newcommand{\@paperKindLower}{thesis}
\fi

% @command department (legacy shortcut; \graduateSchool의 1번째 인수로 대체 가능)
\newcommand{\department}[2] {%
    \ifthenelse{\equal{#1}{PH}}
        {\newcommand{\@deptNameEng}{Physics}} {}
    \ifthenelse{\equal{#1}{CRCE}}
        {\newcommand{\@deptNameEng}{Computer and Radio Communications Engineering}
         \@isLongDeptNametrue} {}
    \ifthenelse{\equal{#1}{CSE}}
        {\newcommand{\@deptNameEng}{Computer Science Engineering}} {}
    \ifthenelse{\equal{#1}{IS}}
        {\newcommand{\@deptNameEng}{Information Security}} {}
}
\@onlypreamble{\department}

% @command referee 심사위원 (석사과정 3인, 박사과정 5인)
\newcommand{\referee}[2][1] {%
    \ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChief} {#2}} {}%
    \ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecond}{#2}} {}%
    \ifthenelse{\equal{#1}{3}}{\newcommand{\@refereeThird} {#2}} {}%
    \ifthenelse{\equal{#1}{4}}{\newcommand{\@refereeFourth}{#2}} {}%
    \ifthenelse{\equal{#1}{5}}{\newcommand{\@refereeFifth} {#2}} {}%
}
\@onlypreamble{\referee}

% @command keywords 초록 하단 주요어(keywords) - 규정상 영문/국문 초록 모두 필수 항목
% #1 영문 주요어, #2(선택) 국문 주요어(주제어) - krabst(국문초록)에만 사용되며,
% 생략시 영문 주요어를 그대로 사용한다.
\NewDocumentCommand{\keywords}{m o}{
  \newcommand{\@keywordsEng}{#1}
  \IfValueTF{#2}{
    \newcommand{\@keywordsKor}{#2}
  }{
    \newcommand{\@keywordsKor}{#1}
  }
}
\@onlypreamble{\keywords}

% @command graduateDate 졸업년월
\newcommand{\graduateDate}[2]{
  \newcommand{\@graduateYear}{#1}
  \newcommand{\@graduateMonth}{#2}
}
\@onlypreamble{\graduateDate}

% @command submitDate 제출일자
\newcommand{\submitDate}[3]{
  \newcommand{\@submitYear}{#1}
  \newcommand{\@submitMonth}{#2}
  \newcommand{\@submitDay}{#3}
}
\@onlypreamble{\submitDate}

% @command approvalDate 인준일자
\newcommand{\approvalDate}[3]{
  \newcommand{\@approvalYear}{#1}
  \newcommand{\@approvalMonth}{#2}
  \ifthenelse{\equal{#2}{1}}
  {
    \newcommand{\@approvalMonthEng}{January}
  }{}
  \ifthenelse{\equal{#2}{2}}
  {
    \newcommand{\@approvalMonthEng}{February}
  }{}
  \ifthenelse{\equal{#2}{3}}
  {
    \newcommand{\@approvalMonthEng}{March}
  }{}
  \ifthenelse{\equal{#2}{4}}
  {
    \newcommand{\@approvalMonthEng}{April}
  }{}
  \ifthenelse{\equal{#2}{5}}
  {
    \newcommand{\@approvalMonthEng}{May}
  }{}
  \ifthenelse{\equal{#2}{6}}
  {
    \newcommand{\@approvalMonthEng}{June}
  }{}
  \ifthenelse{\equal{#2}{7}}
  {
    \newcommand{\@approvalMonthEng}{July}
  }{}
  \ifthenelse{\equal{#2}{8}}
  {
    \newcommand{\@approvalMonthEng}{August}
  }{}
  \ifthenelse{\equal{#2}{9}}
  {
    \newcommand{\@approvalMonthEng}{September}
  }{}
  \ifthenelse{\equal{#2}{10}}
  {
    \newcommand{\@approvalMonthEng}{October}
  }{}
  \ifthenelse{\equal{#2}{11}}
  {
    \newcommand{\@approvalMonthEng}{November}
  }{}
  \ifthenelse{\equal{#2}{12}}
  {
    \newcommand{\@approvalMonthEng}{December}
  }{}
  \newcommand{\@approvalDay}{#3}
}
\@onlypreamble{\approvalDate}

% @command abstractLineSpacing 초록 줄간격
\newcommand{\abstractLineSpacing}[1]{
  \FPeval{\@abstractLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\abstractLineSpacing}

% @command krAbstractLineSpacing 국문초록 줄간격
\newcommand{\krAbstractLineSpacing}[1]{
  \FPeval{\@krAbstractLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\krAbstractLineSpacing}

% @command TOCLineSpacing 목차 줄간격
\newcommand{\TOCLineSpacing}[1]{
  \FPeval{\@TOCLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\TOCLineSpacing}

% @command contentLineSpacing 본문 줄간격
\newcommand{\contentLineSpacing}[1]{
  \FPeval{\@lineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\contentLineSpacing}

% @command acknowledgementLineSpacing 감사의글 줄간격
\newcommand{\acknowledgementLineSpacing}[1]{
  \FPeval{\@acknowledgementLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\acknowledgementLineSpacing}

% @command captionLineSpacing 캡션 줄간격
\newcommand{\captionLineSpacing}[1]{
  \FPeval{\@captionLineSpacing}{#1/100.0/1.236} 
}
\@onlypreamble{\captionLineSpacing}

% @command addTOCHeader TOC, LOF, LIT에 헤더 추가
\newcommand{\addTOCHeader} {
  \@isTOCHeadertrue
}
\@onlypreamble{\addTOCHeader}

% @command addContentHeader 본문에 헤더 추가
\newcommand{\addContentHeader} {
  \@isContentHeadertrue
}
\@onlypreamble{\addContentHeader}

% @command addBibHeader 참고문헌에 헤더 추가
\newcommand{\addBibHeader} {
  \@isBibHeadertrue
}
\@onlypreamble{\addBibHeader}

% @command includeDedication 감사의 글(Dedication page, 선택) 추가 - dedication.tex 사용
\newcommand{\includeDedication} {
  \@isDedicationtrue
}
\@onlypreamble{\includeDedication}

% @command includePreface 서문(Preface, 필요시) 추가 - preface.tex 사용
\newcommand{\includePreface} {
  \@isPrefacetrue
}
\@onlypreamble{\includePreface}

% @command includeNomenclature 기호설명(Nomenclature, 선택) 추가 - nomenclature.tex 사용
\newcommand{\includeNomenclature} {
  \@isNomenclaturetrue
}
\@onlypreamble{\includeNomenclature}

% @command 본문 추가
\newcommand{\addContents}[1]{
  \setlength\parindent{5mm}
  \if@isContentHeader
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[LE]{\nouppercase\leftmark}
    \fancyhead[RO]{\nouppercase\rightmark}
    \fancyfoot[CE,CO]{\thepage}
  \fi
  \renewcommand{\baselinestretch}{\@lineRatio}
  \selectfont{\input{#1}}
  \setlength\parindent{0mm}
}

%%
%% 필요한 정보 중에 누락된 것이 없는지 점검
%%
\newcommand{\checkparameters}{%
    \@ifundefined{@titleEng}{%
        \ClassError{KUThesis}{The title is not found}{}}{}
    \@ifundefined{@authorEng}{%
        \ClassError{KUThesis}{The name of the author is not found}{}}{}
    \@ifundefined{@advisorMajorEng}{%
        \ClassError{KUThesis}{The name of the major advisor is not found}{}}{}
    \@ifundefined{@keywordsEng}{%
        \ClassWarning{KUThesis}{No \string\keywords\space defined - the regulation requires keywords at the bottom of the abstract}}{}
}

%%
%% 영문 날짜 표기
%%
\newcommand{\@dateUSenglish}[2]{%  % 미국식 날짜 표기
    \newcommand{\@year}{#1}%
    \newcommand{\@month}{#2}%
    \ifcase\@month \or
        January \or February \or March \or April \or May \or June \or
        July \or August \or September \or October \or November \or December \fi
    \@year
}

%%
%% 빈 페이지 생성
%%
\newcommand{\emptypage}{
  \newpage
  \thispagestyle{empty}
  \hbox{ }
  \newpage
}

%%
%% 양면 출력일 때 홀수 페이질 경우 빈 페이지 추가
%%
\newcommand{\addevenpage}{
    \if@isLibrary
%% 도서관 제출용에는 빈 페이지가 들어가면 안됨
    \else
        \if@isTwosides
            \checkoddpage
            \ifoddpage
            \emptypage
        \fi
        \else
            \newpage
        \fi
    \fi
}

%%
%% 앞표지 생성
%%
\newcommand{\makefrontcover}{%
    \newpage
    \renewcommand{\baselinestretch}{1.3}%
    \thispagestyle{empty}
    \begin{minipage}[t][12mm][t]{112mm}
        \begin{center}
            \if@isDoctor
              \fontsize{16pt}{16pt}\selectfont\bf{Doctoral Dissertation}
            \else
              \fontsize{16pt}{16pt}\selectfont\bf{Master's Thesis}
            \fi            
        \end{center}
    \end{minipage}\\[30mm]
    \hspace*{-15mm}\begin{minipage}[t][50mm][t]{142mm}
        \begin{center}
            \fontsize{\@titleSize}{\@titleSize}\selectfont{\bf \@titleEng}
        \end{center}
    \end{minipage}\vfill
    \begin{minipage}[b][85mm][b]{112mm}
        \begin{center}
            %\fontsize{16pt}{16pt}\selectfont{\bf by}
            %\\[5mm]
            \fontsize{16pt}{16pt}\selectfont{\bf \@authorEng}
            \\[5mm]
            \fontsize{16pt}{16pt}\selectfont{\bf Department of \@departmentNameEng}
            \if@isLongDeptName
              \\[8mm]
            \else
              \\[15mm]
            \fi
            \fontsize{18pt}{18pt}\selectfont{\bf \@graduateSchoolName} 
            \\[5mm]
            \fontsize{\@univSize}{\@univSize}\selectfont{\bf \@koreauniv}
            \\[10mm]
            \fontsize{14pt}{14pt}\selectfont{\bf
            \@dateUSenglish{\@graduateYear}{\@graduateMonth}}
        \end{center}
    \end{minipage}
    \addevenpage
}

% 영어 속표지 (규정상 속표지는 논문 작성 언어(영문)로 작성 가능하므로 국문 속표지는 생략)
\newcommand{\makeEngtitle}{%
    \newpage
    \renewcommand{\baselinestretch}{1.3}%
    \thispagestyle{empty}
    \if@isLibrary
        \hspace*{-7mm}
    \else
        \hspace*{-15mm}
    \fi
    \begin{minipage}[t][0pt][t]{142mm}
      \begin{center}
        \fontsize{21pt}{21pt}\selectfont\bf{\@titleEng}
        \\[30mm]
      \end{center}
    \end{minipage}\vfill
    \begin{center}
    \if@isLibrary
        \hspace*{7mm}
    \else
        \hspace*{-13mm}
    \fi
    \begin{minipage}[b][150mm][c]{112mm} %112
        \begin{center}
            \fontsize{16pt}{16pt}\selectfont{ by}
            \\[1mm]
            \fontsize{16pt}{16pt}\selectfont{ {\@authorEng}}
            \\[10mm]
            \fontsize{16pt}{16pt}\selectfont{\underline{\hspace{6cm}}}
            \\[7mm]
            \fontsize{16pt}{16pt}\selectfont{under the supervision of \\ Professor {\@advisorMajorEng}}
            \\[5mm]
            \fontsize{16pt}{16pt}\selectfont{A {\@paperKindLower} submitted in partial fulfillment of the requirements for the degree of \\ {\@degreeFullName}}
            \\[10mm]
            \fontsize{16pt}{16pt}\selectfont{\bf Department of \@departmentNameEng}
            \if@isLongDeptName
              \\[8mm]
            \else
              \\[15mm]
            \fi
            \fontsize{18pt}{18pt}\selectfont{\bf \@graduateSchoolName }
            \\[5mm]
            \fontsize{\@univSize}{\@univSize}\selectfont{\bf \@koreauniv}
            \\[10mm]
            \fontsize{14pt}{14pt}\selectfont{\bf
            \@dateUSenglish{\@submitYear}{\@submitMonth}}
        \end{center}
    \end{minipage}
    \end{center}
    \addevenpage
}

%%
%% 학위논문 심사완료 검인서 생성
%%
\newcommand{\approvalScan}[1]{%
  \newcommand{\@scanFile}{#1}
}

\newcommand{\makeapproval}{%
  \@ifundefined{@scanFile}
  {
    \newpage
    \thispagestyle{empty}
    \renewcommand{\baselinestretch}{1.2}
    \begin{minipage}[t][20mm][t]{112mm}
      \begin{center}
        \fontsize{16pt}{16pt}\selectfont{The {\@paperKindLower} of {\@authorEng} has been approved by the {\@paperKindLower} committee in partial fulfillment of the requirements for the degree of {\@degreeFullName}}
        \\[15mm]
        
        \fontsize{14pt}{14pt}\selectfont{ {\@approvalMonthEng}\ {\@approvalYear}}
        \\[20mm]
        % 위원 이름을 콜론(:) 기준으로 가지런히 정렬 (좌측 라벨 폭 고정)
        \underline{\hspace{8.5cm}}
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\makebox[8.5cm][l]{\makebox[3.6cm][r]{Committee Chair}: {\@refereeChief}}}
        \\[10mm]
        \underline{\hspace{8.5cm}}
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\makebox[8.5cm][l]{\makebox[3.6cm][r]{Committee Member}: {\@refereeSecond}}}
        \\[10mm]
        \underline{\hspace{8.5cm}}
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\makebox[8.5cm][l]{\makebox[3.6cm][r]{Committee Member}: {\@refereeThird}}}
        \\[10mm]

        \if@isDoctor
          \underline{\hspace{8.5cm}}
          \\[1.5mm]
          \fontsize{14pt}{14pt}\selectfont{\makebox[8.5cm][l]{\makebox[3.6cm][r]{Committee Member}: {\@refereeFourth}}}
          \\[10mm]
          \underline{\hspace{8.5cm}}
          \\[1.5mm]
          \fontsize{14pt}{14pt}\selectfont{\makebox[8.5cm][l]{\makebox[3.6cm][r]{Committee Member}: {\@refereeFifth}}}
        \else\fi
      \end{center}
    \end{minipage}
    \addevenpage
  }{
    \includepdf{\@scanFile}
    \if@isTwosides
      \emptypage
    \fi
  }
}

%%
%% 초록 페이지 생성
%%
\newcommand{\makeabstract}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{Abstract}
  \pagenumbering{roman}
  \vspace*{\fill}
  % 규정상 초록에는 논문제목, 성명, 학과, 지도교수를 기재해야 한다
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\@titleEng}
    \\[5mm]
    \fontsize{13pt}{13pt}\selectfont{by \@authorEng}
    \\[1mm]
    \fontsize{13pt}{13pt}\selectfont{Department of \@departmentNameEng}
    \\[1mm]
    \fontsize{13pt}{13pt}\selectfont{under the supervision of Professor \@advisorMajorEng}
    \\[8mm]
    \fontsize{16pt}{16pt}\selectfont{\bf Abstract}
  \end{center}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@abstractLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{abstract/abstract}\par}
  \setlength\parindent{0mm}
  \vspace{8mm}
  % 규정상 초록 하단에 주요어(keywords)를 표기해야 한다
  \@ifundefined{@keywordsEng}{}{
    \fontsize{11pt}{12pt}\selectfont{\noindent\textbf{Keywords}: \@keywordsEng}
  }
  \vspace*{\fill}
  \addevenpage
}

%%
%% 한국어 초록 페이지 생성
%%
\newcommand{\makekrabstract}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{}{chapter}{국문초록}
  %\pagenumbering{gobble}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\textbf{국 문 초 록} \\ \, \\ \@titleKor}
  \end{center}

  \fontsize{13pt}{13pt}\selectfont
  \begin{center}
  \@authorKorSpace \\
  \@departmentNameKor \\
  지도교수: {\@advisorMajorKor}
  \end{center}
  \vspace*{0.1cm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@krAbstractLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{abstract/abstract-kr}\par}
  \setlength\parindent{0mm}
  \vspace{8mm}
  % 규정상 국문초록 하단에도 주제어(keywords)를 표기해야 한다
  \@ifundefined{@keywordsKor}{}{
    \fontsize{11pt}{12pt}\selectfont{\noindent\textbf{주제어}: \@keywordsKor}
  }
  \vspace*{\fill}
  \addevenpage
}

%%
%% 목차 일괄 생성
%%
\newcommand{\makecontents}{%            % TOC, LOT, LOF 생성
  \if@isTOCHeader
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[LE]{\nouppercase\leftmark}
    \fancyhead[RO]{\nouppercase\leftmark}
    \fancyfoot[CE,CO]{\thepage}
  \fi
  \renewcommand{\baselinestretch}{\@TOCLineRatio}\selectfont
  \tableofcontents
  \addevenpage
  % 규정상 순서: 표 목차(List of Tables) -> 그림 목차(List of Figures)
  \listoftables
  \addevenpage
  \listoffigures
  \addevenpage
  \clearpage
}

%%
%% 감사의 글 (Dedication page) 생성 - 규정상 제목 없이 페이지 중앙에 배치, 목차에는 표시하지 않음
%%
\newcommand{\makededication}{%
  \newpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
    \setlength\parindent{5mm}
    \fontsize{11pt}{12pt}\selectfont{\input{frontmatter/dedication}}
    \setlength\parindent{0mm}
  \end{center}
  \vspace*{\fill}
  \addevenpage
}

%%
%% 서문 (Preface) 생성
%%
\newcommand{\makepreface}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{Preface}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\bf Preface}
  \end{center}
  \vspace{5mm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@acknowledgementLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{frontmatter/preface}}
  \setlength\parindent{0mm}
  \addevenpage
}

%%
%% 기호설명 (Nomenclature) 생성
%%
\newcommand{\makenomenclature}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{Nomenclature}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\bf Nomenclature}
  \end{center}
  \vspace{5mm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@acknowledgementLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{frontmatter/nomenclature}}
  \setlength\parindent{0mm}
  \addevenpage
}

%%
%% 감사의 글 페이지 생성
%%
\newcommand{\makeacknowledgement}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{Acknowledgement}
  %\pagenumbering{gobble}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\bf Acknowledgement}
  \end{center}
  \vspace{5mm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@acknowledgementLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{frontmatter/acknowledgement}}
  \setlength\parindent{0mm}
  \addevenpage
}



