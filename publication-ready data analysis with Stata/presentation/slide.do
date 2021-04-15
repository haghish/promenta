
/***
      
### Material are hosted on GitHub:

- repository: <https://github.com/haghish/promenta>
- an example of and __organized project__ for running a simple CFA analysis and producing a dynamic document 
- The current slides
- markdown template for producing PDF slides within Stata
- Rmarkdown template for creating PDF slides within RStudio
- __markdoc__ package <https://github.com/haghish/markdoc>
- __rcall__ package <https://github.com/haghish/rcall>
- PDF of journal articles relevant to this lecture

-----

![Relevant literature](images/books.png)


Overview
================================================================================

Part 1
------

- Reproducible Research
    + Challenges of reproducible researcher
    + Challenges of teaching statistics in all fields of science
    + How can we improve research reproducibility?

Part 2
------

- Automatize the process of data analysis
    + organizing a computational project
    + reproduce the _entire_ analysis
    + Integrating version control (PDF article is provided)
    + Automatize multiple statistical software
    + Interfacing R into Stata for data analysis
    + A brief introduction to __`rcall`__ package


Overview
================================================================================

Part 3
------

- Automatize the process of reporting 
    + producing a sensible analysis reports for a manuscript
    + dynamic tables, dynamic graphs, and dynamic text
    + discuss its necessity 
- markdoc software 
    + Installing markdoc from GitHub
    + workflow
    + Markdown notation
    + `markdoc` commands and its markup notations
- Using `markdoc` in classroom
    + presentation slides within Stata
- Using `markdoc` for software documentation
    + Stata help files
    + Package vignette or supplementary web material

Part 1: Reproducible Research
================================================================================


Statement of problem
====================

Garfield (1995) defines learning statistics as follows:

1. learning to communicate using statistical language
2. solving statistical problems
3. drawing conclusions
4. supporting conclusions with statistical reasoning

### statistical education requires:

- in-depth understanding of statistical concepts
- statistical reasoning
- computer programming skills


---

### Anxiety among graduate students
- Statistics generally causes inconvenience for researchers of different fields (Baloglu, 2003)
- 80% of graduate students suffer from statistics anxiety (Onwuegbuzie, 2004)
    + math anxiety
    + computer anxiety
    + programming anxiety

---

- Proper statistical education has been _avoided_
    + Teaching through GUI instead of programming
- The complexity of the methods is increasing annually
    + The journals' appetite for intricate statistics is growing 
- The gap between statistical education and statistical practice is increasing
- There is no statistical software that does __everything__
    + We might need to learn several statistics software
    + Particular analyses might be available in a special software

Problem?
========

We are lacking

- Basic coding education (no more mouse-and-click)
- Skills for planing and organizing data analysis
- Tracking our potential errors in different steps of research
- Communicating statistical decisions and reasons

Which results in lacking __reproduciblity__

---

![Why most published research findings are false](images/most_findings_are_false.png)

---

![Estimating the reproducibility pf psychological science](images/reproducibility_in_psychological.png)


Reproducibility vs. Replication
===============================

- The two terms have been used interchangeably (Loscalzo, 2012)
- They have different meanings in different fields of science
- Replication requires re-implementing experiments by other research groups (Baggerly & Berry, 2009)
  + using either the same methodology or alternatives 
- Problems with replication?
	
Reproducibility
===============

- Baggerly & Berry (2009):
  + reproducibility is replicating the computation by an independent researcher
    + using the same data, programmed code, procedure, and methodology
    + and without requiring any further assistance or information from the author (King, 1995)
  + the least standard for evaluating the quantitative results
  + reproducibility does not guarantee (Peng, 2011; Stodden, et. al., 2014):
    + quality or sound methodology
    + accurate data collection
    + validity of the findings
- reproducibility grants limited transparency (Gentleman & Lang, 2012)
    + validate the computational procedure
    + check or adapt the claims in the scientific publication


Sources of error in research
============================

- Errors can happen at any stage of research
    + study design
    + data collection
    + digitizing the data from questionnaires to a computer
    + cleaning the data
    + preparing the data for analysis
    + choice of methodology
    + adjustment options, analytical assumptions, algorithms, etc...
    + interpreting the results
    + reporting the results in the publication
    + copy-pasting from statistical software to MS Word 
    + any problem with that?
    + ... 
- Or afterwards, such as publication bias, etc...

Collaboration on computational research
=======================================

- The majority of statistical contributions do not appear in the manuscripts
    + no code, no data checking, no quality assurance, ... 
- Lacking reproducibility means no collaboration on statistical analyses
- Collaboration on statistical analysis is like collaboration on software:
    + well-structured
    + automatized
    + well-documented
    + dependencies are carefully planned, organized, documented

Costs
==========

- You need to learn new tricks and let go of old habits
- No one gives you credit for being transparent
- Transparency means your mistakes can be revealed by others
    + Shame or gratitude? 
    + What you cannot reproduce your own analysis?
    + How would you feel about sharing your code?
- Reproducibility is human problem, not computers


Part 2: Automated Data Analysis
================================================================================

Automated Data Analysis
================================================================================

- Automated data analysis means making data analysis reproducible
    + writing analysis code to track __the entire data analysis__
    + setup and organize your analytic project
    + Operating system and statistical software 
    + Add-on packages
    + Data management
    + Nesting analysis code (and why should you)
    + Communicating the analysis
  
---

![The procedure we are intending to automatize](images/analyticprocess.png)


Organizing the computation
==========================

- The rule is to be disciplined, __very disciplined__
    + Keep track of changes in code, data, and analysis results
- There is no template to be applicable to all projects
    + with different types of data, there will be different procedures and workflows
- Rule of thumb:
    + protect your raw data
    + keep track of all the code for preparing the data for analysis
    + keep track of all the analysis code
    + create seperate directories for storing raw data, code, analysis results/reports, documents, etc.

---

### Example 1: R package


![R Package Structure](./images/r_package_structure.png)

---

### Example 2: UiN Project


![Young in Norway Study](./images/uin_structure.png)


--- 

### Example 3: My personal preference


![My way of organizing a computational project](./images/my_structure.png)



--- 

### Example of a README file


![Writing a README file that is worth reading](./images/readme_structure.png)



Nesting script files
====================

- The idea is borrowed from computer science
    + For example, see how Linux kernel is compiled
    + see the __Makefile__ in <https://github.com/torvalds/linux>
    + the file provides all of the orders to compile Linux from the source code
- We apply the same discipline to approach reproducibility
    + There will be a single file that provides the instructions to rerun the entire data analysis
    + I name that file __MAIN__, you name it ...
    + the file will source all other script files used for preparing, analyzing, and reporting the analysis
- Nesting works best with reletive file paths (instead of absolute paths)
    + begin the __MAIN__ file by setting the working directory:
    + Use __`setwd()`__ in __R__, __`cd`__ in __Stata__ and __SPSS__ 

--- 


![Nesting analysis files](./images/nest.png)

Nesting script files
====================

### R

```
source('./code/preparation/prep_001.R')
```

### Stata

```
do './code/preparation/prep_001.do'
```

### SPSS

```
INSERT FILE='./code/preparation/prep_001.sps'. 
```


Notes: general suggestions
==========================

\scriptsize

1. The raw data is kept untouched
    + Store time-consuming operations in a different directory (e.g. _anadata_)
2. Organize your code under subdirectories (if you write many files?)
3. Save the results (analysis outputs) in seperate directories and name them properly within the code
4. Name and document your data file, especially if it is going to receive further updates in the future
5. Document the software dependencies (Operating system, R/Stata/etc. version, __ALL add-on packages'__ versions)
    + check for example __`lavaan`__ change history: <https://lavaan.ugent.be/history/>
6. Document the data set
    + use `datadoc` (Haghish, 2020) command for __Stata__ or `Rd documentation` from __RStudio__


Notes: data documentation
=========================

- CRAN recommends the following documentation section for a data set
  1. Title, the label of the dataset, and where it was published (package name)
  2. Description
  3. Format, including a table summarizing the variables’ types and labels
  4. Notes attached to the dataset or the variables (for Stata only)
  5. The source of the data; that is, where they are coming from
  6. References, if any
  7. Examples, if needed
  
--- 


![Data documentation in R](./images/rdoc_mixed.png)

--- 


![Data documentation in Stata](./images/datadoc.png)


Working with multiple statistical software 
================================================================================

- With the speed of statistical development, sometimes we 
might need to use a particular method that is not available 
in Stata 
- Typically, most graduate students implement statistical 
methods in R or Python 
- Stata allows interfacing Python for data analysis or programming 

> type `help python` for more information

- The __`rcall`__ package provide the same capabilities for interfacing 
R into Stata, and much more! 
- Using such a strategy allows you to automate your analysis entirely 
within Stata and keep it reproducible 

rcall
================================================================================

- __rcall__ is hosted on GitHub only, not SSC


~~~
net install github, from("https://haghish.github.io/github/")
github install haghish/rcall, stable
~~~

- rcall automatically finds R on your machine. If it failes to 
do so, specify the path to R:
    + `rcall setpath "path/to/R" ` will specify the path permanently
- rcall can automatically communicate dataset, variables, matrices, and 
scalars betwen R and Stata. 
- For example, you can call R to run an analysis on the data loaded 
in your Stata and return the matrices and results to Stata automatically

rcall example
=============

## Passing a matrix from R to Stata
\scriptsize
***/

//define a matrix
rcall: A = matrix(1:6, nrow=2, byrow = TRUE) 
mat list r(A)

/***

---

## Passing dataset from Stata to R
\scriptsize

***/

sysuse auto, clear
rcall: data <- st.data()
rcall: dim(data)

***/

/***
Part 3: Automated Analysis Reporting
================================================================================


Avoiding manual reporting
=========================

I noted that errors can happen in the process of reporting

### Sources of error in research

- Errors are everyday and can happen at any stage of research
    + ...
    + interpreting the results
    + reporting the results in the publication
    + copy-paste from statistical software to MS Word
    + updating the report after making a change in the data or analysis
    + ...


Avoiding manual reporting
=========================

- A solution is to do the data analysis and write the analysis report at the same time
- This is a paradigm borrowed from computer science, for solving software documentation problem
    + documentation is written within code files using special comment signs
    + next, a program extracts and renders the documentation and updates the documents (Knuth 1983)
- There are software for generating data analysis reports:
    + for __R__, use __`rmarkdown`__ (Yihui, et. al., 2018)
    + for __Stata__, use __`markdoc`__ (haghish, 2016)
    + both provide a restricted framework to examine the reproducibility of the code

Literate programming
====================

- The big problem of software documentation
- The literate programming solution
- Adaption of the literate programming in statistics
    + Should ideally supports real-time documentation
    + Should examine the analysis
    + Should provide a restricted framework to improve the code development

`markdoc` package
===================

Note about __markdoc__
----------------------

__MarkDoc__ was developed for Stata in 2012. It comes in two versions, 
full-version (required additional third-party software) and 
mini-version (completely written within Stata). 

> If you use __secure servers__ or __restricted machines__, use the 
mini-version 

> The mini-version can be executed by adding __`mini`__ option or 
by using the __mini__ command. 

`markdoc` package
===================

- `markdoc` is a general purpose literate programming software
- developed particularly for Stata
- `markdoc` is versatile:
    + generate publication-ready analysis report in various document formats (PDF, Docx, ODT, HTML, LaTeX, etc.)
	  + includes a syntax highlighter
    + generate dynamic presentation slides
    + generate dynamic Stata help files in STHLP format or create a package vignette
- Analysis documentation/interpretation is written within _do-files_, as usual
- It emphasizes code readability by keeping the documentation simple

MarkDoc features
================

- It works with the usual workflow of Stata do-files
    + It is easy to use
    + It underscores clean and readable documentation
- recognizes multiple markup languages
- has a built-in syntax highlighter
- supports several output documents
    + develops text documents
    + presentation slides
    + software documentation

---

![Supported document formats](images/diagram_supported_docs_small.png)

Dialog box
=========================

`markdoc` was designed to be a very user-friendly package. To further facilitate learning `markdoc`, a dialog box was programmed to visualize the main options and functionalities of the package.

- The dialog box includes three tabs, each specializes in a particular document format
    + dynamic document
    + presentation slide
    + package vignette

> To lunch the dialog box type:

~~~
db markdoc
~~~

---

![The dialog box](images/dialogbox_small.png)


Dialog box for __`markdoc`__ 5.0
===========================

Use the __`mini`__ dialog box, if third-party software are not installed. 

    . db mini
	
![The dialog box](images/mini.png)

Who can use `markdoc`?
======================

`markdoc` was designed having learners in mind. It offers a GUI, a syntax highlighter, and plenty of features to encourage beginners to use it.

1. Students - as early as introductory statistics courses - can use `markdoc` to actively take note inside Stata Do-file Editor

2. University lecturers who teach statistics using Stata, can use `markdoc` to generate PDF slides, educational materials

3. Statisticians can use `markdoc` for creating dynamic analysis reports

4. Finally, advanced users and Stata programmers can use `markdoc` to generate dynamic help files and package vignettes

--- 


![The presentation slides are based on a book](images/book.png)


`markdoc` Installation
=======================

- `markdoc` is hosted on GitHub only <https://github.com/haghish/markdoc>

- `markdoc` has package dependencies which are:
    + [`weaver`](https://github.com/haghish/weaver)
    + [`datadoc`](https://github.com/haghish/datadoc)
    + [`md2smcl`](https://github.com/haghish/markdown)
    + [`statax`](https://github.com/haghish/statax)

- The `github` command  can install `markdoc` and its dependencies. You can install the `github` command as follows:

~~~
. net install github, from("https://haghish.github.io/github/")
~~~

---

- Once the `github` command is installed, installing any Stata package from GitHub would be easy
- The installation only requires the authors' GitHub `username` and the `repository` name, separated by a slash
- For example, to install or update `markdoc` and its dependencies type the following command:

~~~~
. github install haghish/markdoc, stable
~~~~

---

Alternatively, you can use `github` command to search for `markdoc` package in GitHub by typing:

~~~
. github search markdoc
~~~

![`github search` output](images/search-output.png)



Third-party software installation (optional)
============================================

- Previous versions of `markdoc` required other software for generating Word and PDF documents. However, in the recent version of `markdoc`, __this is no longer a necessity__. The third-party software are particularly required for Stata version 14 and below. 
- Throughout this presentation, I will use the __`mini`__ engine that allows `markdoc` to run independent of any third-party software 
- Nevertheless, installing the third-party software can enhance `markdoc`'s capabilities and is generally recommended
- The third-party software are
    + [Pandoc](http://pandoc.org/) for converting Markdown to other file formats
    + [wkhtmltopdf](wkhtmltopdf.org) for creating PDF documents from source written with Markdown or HTML
    + users who wish to write with LaTeX will require a LaTeX distribution
- The packages hosted on GitHub only include the Ado and help files
- The third-party software should be downloaded and installed manually. However, `markdoc` provides optional automatic installation for Pandoc and wkhtmltopdf, which maybe more convenient for many users

---

## Manual installation of third-party software

- Pandoc software can be downloaded from [www.pandoc.org](www.pandoc.org) website
    + Once Pandoc is installed, the path to executable Pandoc on the operating system can be provided to markdoc using the `pandoc(str)` option
- wkhtmltopdf software can be downloaded from [www.wkhtmltopdf.org](www.wkhtmltopdf.org)
    + Next, the path to the executable wkhtmltopdf file should be provided to `markdoc` using the `printer(str)` option
- For compiling LaTeX to PDF, a proper LaTeX distribution based on the operating system should be downloaded from [www.latex-project.org](www.latex-project.org)
    + the path to executable pdfLaTeX compiler should be given to `printer(str)` option.
- The path to Pandoc, wkhtmltopdf, and pdfLaTeX can be permanently defined using the __`weave setup`__ command. This command opens a script file that memorizes the path to each software within a particular global macro.



---

     . weave setup
![defining the paths to required software permanently](images/weavesetup.png)

---

## Automatic installation of third-party software

The `markdoc` command includes the `install` option which downloads Pandoc and wkhtmltopdf software automatically, if they are not already installed or cannot be accessed by `markdoc`. As shown in the example below, adding the `install` option will avoid any error regarding the required software and installs them on the fly:

\scriptsize

~~~
qui log using example.smcl, replace
display "If necessary, install the required software on the fly"
qui log c

markdoc example.smcl, export(pdf) install
~~~

---

If the `install` option is not specified and `markdoc` does not detect the required software on your machine, a message will be returned on your machine to indicate that the required software was not found.

![Pandoc error message](images/pandocsetup.png)

---

Clicking on the `install pandoc automatically` will install Pandoc on your machine:

![installing Pandoc automatically](images/pandocsetup2.png)


---

A similar massage is displayed if you are exporting a PDF document and `markdoc` does not access wkhtmltopdf

~~~
markdoc example.smcl, export(pdf)
~~~

![Figure 2.5. wkhtmltopdf error massage](images/wkhtmltopdfsetup.png)


Workflow
======================

- `markdoc` has 2 separate modes
- Passive mode (allows real-time documentation)
    + Takes a log-file / script file (.ado, .mata, etc.)
    + It does __NOT__ evaluate the code nor reproduce the analysis
    + It produces a document very fast
- Active mode (for testing the whole code in a fresh environment)
    + Takes a do-file
    + Executes the analysis
    + Evaluates its reproducibility
    + It is much slower than the passive mode, because it repeats the analysis

---

![`markdoc` workflow](images/engine100.png)




Active documentation
====================

the do-file must be examined in a clean workspace, where no data is loaded in Stata. `markdoc` takes care of such a test, when executed actively. 

- using a single command to convert a smcl log-file to various document formats is convenient, but it does not ensure the reproducibility of the source code

- For example, users might have made changes to the data that are not included in the do-file, but are registered in the log. 

- There are markers for temporarily deactivating the log file...

- Active documentation is more strict, although time-consuming because every time `markdoc` is executed, the whole project is computed again. 

---

![The process of producing dynamic documents with `markdoc`](images/process2.png)

---

Let's assume that we have a do-file that only in displays the hello world text in a do-file named *example1.do*:

~~~
. display "Hello World"
~~~

Then the dynamic document can be produced by actively executing the do-file as shown below:

~~~
. markdoc example.do, mini export(docx) 
~~~

---


Let's have a closer look. We will load a data set in Stata. Then we execute the command related to the 
loaded data set with `markdoc`. We would expect an **error**, because in the workspace that `markdoc` is 
using to test the reproducibility of the code, there is no information about the loaded data set. 

- we load the *Auto* data set

    . sysuse auto, clear

- we create a do file that simply displays the first line of the data. we name the 
file *example2.do* and execute it in Stata:

---

\scriptsize

~~~
. do example2.do

. list in 1

     +------------------------------------------------------+
  1. | make        | price | mpg | rep78 | headroom | trunk |
     | AMC Concord | 4,099 |  22 |     3 |      2.5 |    11 |
     |------------------------------------------------------|
     | weight  | length  |  turn  |  displa~t  |  gear_r~o  |
     |  2,930  |    186  |    40  |       121  |      3.58  |
     |------------------------------------------------------|
     |                        foreign                       |
     |                       Domestic                       |
     +------------------------------------------------------+
~~~


---

But if we examine it with `markdoc`, we get the following error. `markdoc` says it can't find the data! 

\scriptsize

~~~
. markdoc example2.do, mini export(pdf) 

. list in 1
observation numbers out of range
r(198);

end of do-file
r(198);
~~~



Passive documentation
======================

- Is used for generating help files, package vignettes, or quick analysis documents from a log-file
- the SMCL log-file registers every entry in Stata including comments, commands, and text-based output, `markdoc` can produce a dynamic document passively from the SMCL log-file. 
- This workflow is indeed convenient, but not recommended for generating analysis documents
- the log-file – which is updated in real-time during the analysis session – can be used to generate the document in real-time too

---

![The process of producing dynamic documents with `markdoc`](images/process.png)

---

Example
========

Create a do file with this code and generate a PDF document with syntax highlighter. 
name the example *example3.do*. let's also use a few of the `markdoc` options to create the title of the document.

\scriptsize

~~~
. quietly log using example, replace smcl

. display "Hello World"
Hello World

. qui log c
. markdoc example.smcl, mini export(pdf) statax
~~~

Syntax
=========================

To produce a dynamic document, the _filename_ of the documentation source should be given to `markdoc`

- **PASSIVE MODE**: a smcl log file with `.smcl` file extension or a script file with `.ado` or `.mata` extension
- **ACTIVE MODE**: a do-file  with `.do` extension 

- If the file extension is not specified, **SMCL log file is assumed** 
	- Specifying the file extension is recommended to provide further clarity

Essential syntax
================

![`markdoc`'s essential syntax](images/markdocsyntax.png)

Markup Languages
================

- `markdoc` supports 
    + LaTeX (requires third-party software)
    + HTML
    + Markdown

- In this lecture we will focus on Markdown, which is the simplest. The following links, from its developer's site, can provide a good background about Markdown:
	- <https://daringfireball.net/projects/markdown/>
	- <https://daringfireball.net/projects/markdown/syntax>
	- <https://daringfireball.net/projects/markdown/dingus>

- Markdown is 
    + minimalistic and clean 
    + simple to read and write
    + helps to focus on the content
    + can be converted to many formats
    + it has become the standard documentation markup language on coding sites as well as statistical software

---

- in `markdoc` the documentation (Markdown, html, or LaTeX) are written
within a special comment signs. 

~~~
    /***

       ...

    ***/
~~~

- There is no limit in how many times you can place these signs in a do-file. 
- These signs can appear anywhere in the analysis document, but not inside loops
	- I will introduce the __`txt`__ command later on which can be included inside loops and programs

---

![Markdown syntax](images/markdown.png)


Additional Markup Notations
===========================

- Additional markers further organize documents prepared for `markdoc` software
- additional markers fall into two categories
    + Passive markers, used for writing static text and styling
    + Active markers, used for interpreting Stata macros in the document
- The Active markers only work if `markdoc` is executed in the active mode

Passive markers
===============

- annotate Stata "commands" and "outputs"
- they help to write a clean analysis report
- By default, MarkDoc includes all of the do-files and text outputs that appear in the Stata results windows. The additional notations allows you to be more selective about what to include:
    + Hiding Stata commands
    + Hiding Stata output
    + Hiding a part of a do-file
    + Importing external files

---

![](images/additional.notation.png)

Hiding Stata commands
=====================

\scriptsize

~~~~
// --------------- Beginning additional_hide.do ---------------

/***

Hiding Stata commands
---------------------

The command bellow will not appear in the dynamic document.
However, their output will be included.

***/

/**/ sysuse auto, clear
/**/ summarize

~~~~

----

Executing the `markdoc` command will results in the following output:

    . markdoc additional_hide.do, export(docx)

![](images/additional.hide.png)



Hiding Stata output
===================

\scriptsize

~~~~
// --------------- Beginning additional_hide2.do ---------------

/***

Hiding Stata output
---------------------


***/

/***/ sysuse auto, clear
/***/ summarize

~~~~

----

    . markdoc additional_hide2.do, export(docx)

![](images/additional.hide2.png)


Hiding a part of a do-file
==========================

- MarkDoc also allows hiding a section of the do-file, without influencing the code execution

\scriptsize

~~~~
// --------------- Beginning additional_hide3.do ---------------

/***

Hiding Stata commands and output
--------------------------------

***/

//OFF

sysuse auto, clear
summarize

//ON

~~~~


----

Importing external files
========================

- A convenient feature for producing sophisticated documents
	- Slides
	- Handouts
	- eBook! 
- It reads other files (tables, documents, etc) into the main document
- This is the feature you are most-likely looking for writing publication-ready documents

Example
===========

- create a text file and name it *Intro.txt*
- Import the text file passively into a do-file
- execute `markdoc` and create a PDF file

---------

\scriptsize

~~~~
Intro.txt
------------

As shown in this example, the text that is written in
__`intro.txt`__ will appear in the final document.
~~~~

The

~~~~
// -------------- additional_import2.do ---------------

//IMPORT intro.txt
~~~~

------

    . markdoc additional_import2.do, export(pdf)

![Preview of the output document](images/additional_import2.png)


`estout` package for exporting LaTeX tables
===========================================

- LaTeX also has a command for including external tex files.
- we will use the __`estout`__ package for generating a publication-ready better table

    . ssc install estout

- In the next example, first a LaTeX table is exported from Stata
- Then we write a simple LaTeX document and allow `markdoc` to complete the LaTeX layout automatically

---

\scriptsize

~~~~
// --------------- Beginning additional_import.do ---------------


//OFF

sysuse auto, clear
sysuse auto
eststo: quietly regress price weight mpg
eststo: quietly regress price weight mpg foreign
esttab using table.tex, replace
eststo clear

//ON

/***

\section{Including external file}

\input{table.tex}

***/
~~~~

---------

    . markdoc additional_import.do, markup(latex) export(pdf) master replace

![Preview of the PDF document](images/additional.input.png)




Active markers
===============

- used for writing dynamic text, which includes _scalars_ or _macros_ that should be automatically interpreted int he text
- only work in the Active mode
- can show the values of
    - scalars
    - variable observations
    - local macro
    - global macros
- values should be placed within __`<!*!>`__ marker


------


### ACTIVE MARKERS TABLE

![Preview of the PDF document](images/markerstable.png)



markersexample.png

Example
==============


\scriptsize

~~~{js}
local a = 1
scalar b = 2
matrix define A = (20,30\40,50)

/***
This is heading <!`a'!>
=======================

The values of a matrix can be displayed within the text. For example,
you can write <!A[1,1]!> which shows the scalar of the first row and
first column of the matrix in your documentation. This feature makes
writing dynamic text much more convenient compared to the previous procedure.

This is heading <!b!>
---------------------

REMEMBER, that this procedure only works if you execute a do-file with
markdoc, that is, using the `markdoc filename.do, export(format)` syntax.
***/
~~~

Additional commands
=======================

- these commands are borrowed from `weaver` package
	- they are installed automatically as a dependency
- They come very handy when the document is generated by a program dynamically or within a loop
- They allow more details for styling a document, compared to Markdown
	- Adding a figure Automatically
	- adding a dynamic table
	- adding dynamic text

Adding figures dynamically
==========================

- we previously used Markdown to include an image in the document
- The process was:
    1. saving a graph from Stata to the disk
    2. including the graph to the dynamic document
- This procedure can be further simplified, using the __`img`__ command
    1. Automatically capture the current graph from Stata and include it in the dynamic document
    2. Include a figure from the disk/internet in the dynamic document
    3. Resize the width and the height of the image in the dynamic document
    4. Align the image to the left (default) or center of the document
    5. Add a graph description

Syntax of `img` command
========================

Import graphical files in the dynamic document

    img [using filename] [, markup(str) title(str) width(int) height(int) left center ]

Automatically include the current graph from Stata in the dynamic document

    img [, markup(str) title(str) width(int) height(int) left center ]

------

Examples
============

- create a do-file and execute it with `markdoc` actively or passively

~~~
. sysuse auto
. histogram price
. img
~~~

In this example, __`img`__ has stored the current graph in a directory called __Weaver-figure__

Adding text dynamically
==========================

- the `txt` command is somehow like the `display` command, but it's used for writing text in the dynamic document
- it can be used to write text within loops or programs and interpret scalars, global, or local macros within
- try typing `txt 1+1` 

~~~
. sysuse auto
. summarize price
. txt "the mean of Price variable is " r(mean)
~~~


Syntax of the `txt` command
===========================

    txt [code] [display_directive [display_directive [...]]]

where the `display_directive` can be:

\scriptsize

~~~
"double-quoted string"
`"compound double-quoted string"'
[%fmt] [=]exp
_skip(#)
_column(#)
_newline[(#)]
_dup(#)
,
,,
~~~


Writing dynamic tables
=======================

- __`tbl`__ simplifies writing and styling dynamic tables
- The default markup language is Markdown, but it also support LaTeX and HTML
- It can align the content of each column to the left, center, or right
- It creates a table somehow similar to the way a matrix is defined in Stata


`tbl` Syntax
============

The syntax of the command is:

     tbl (*[,*...] [\ *[,*...] [\ [...]]]) ///
         [, markup(str) title(str) width(int) height(int) center left ]

where the __`*`__ represents a display directive, which is:

\scriptsize

~~~   
 "double-quoted string"
 `"compound double-quoted string"'
 [%fmt] [=]exp
 ,
 {l}
 {c}
 {r}
~~~

Examples
=============

\scriptsize

- creating a simple 2x3 table with string and numbers

~~~
tbl ("Column 1", "Column 2", "Column 3" \ 10, 100, 1000 )
~~~

- creating a table that includes scalars and aligns the columns to left, center, and right respectively



~~~
tbl ({l}"Left", {c}"Centered", {r}"Right" \ c(os),  c(machine_type), c(username))
~~~


Dynamic Presentation Slides
===========================

- `markdoc` supports generating presentation slides in HTML and PDF formats
- slides can be made from the same source used for generating analysis documents
- the main difference is that slides should be broken into small frames
- There are two possibilities for separating the frames:
    + using header 1 e.g. __`# Header 1`__
    + using horizontal line syntax __`- - -`__ 

type `db markdoc` and check out the **Presentation Slide** tab

-----

![Using `markdoc` GUI for generating slides](./images/dialogbox-slide.png)

------

~~~
quietly log using example, replace smcl

/***
Using `markdoc` for generating slides
=====================================

> Let's begin by using some Stata commands
***/

sysuse auto, clear
summarize price
histogram price

/***
---
***/

img

qui log c

markdoc example.smcl, export(slide) replace  ///
author("E. F. Haghish") date                 ///
title("Example of passive documentation")    ///
affiliation("University of Göttingen")
~~~


Stata help files
===========================

- Stata has it's own markup language
    + *Stata Markup and Control Language* (SMCL)
- All help files as well as default log files are written in this markup language
- Writing documentation with SMCL is not appealing:
    1. smcl is difficult
    2. somehow messy to write
    3. difficult to read, write, and comprehend
- literate programming with smcl is difficult and makes the script file too complex to read

-------

- `markdoc` can generate Stata help files from Ado and Mata files
- The software documentation can be written in Markdown, using the same procedure
- If the documentation can be exported to Stata help files or package vignette
- Type `db markdoc` and navigate to the **Package Vignette** tab:

---

![Using markdoc GUI for generating software documentation](./images/dialogbox-vignette.png)


Example
=============

- Let's make an Ado file, and use some simple Markdown syntax to write in it
- let's write a:
    + Header 1
    + Header 2
    + style some text
    + Indent text
    + add a line
    + add a link

----

\scriptsize

~~~
Title
======

__commandname__ - explain your command briefly. You can use simplified
syntax to make text _italic_, __bold__, ***emphasized***, or
add [hyperlink](http://www.haghish.com/markdoc)

Syntax
------

> __XXX__ _varlist_ [, _options_]

Example(s)
----------

    explain what it does
        . example command

    second explanation
        . example command
***/        
~~~

-------

- execute this example with `markdoc` GUI and generate:
    - a `sthlp` file
    - a `html` vignette
    - a `docx` vignette

- In the GUI, there is an option for appending documentation to an Ado file
- Apply the **Append help-file template** to see an example documentation template
- generate a sthlp and html file from the template

-------


![Example help file template](./images/sthlp.png)























References
========================================================

\scriptsize

- Garfield, J. (1995). How students learn statistics. International Statistical Review / Revue Internationale de Statistique, 63 (1), 25-34. Retrieved from http://www.jstor.org/stable/1403775

- Baloglu, M. (2003). Individual differences in statistics anxiety among college students. 
Personality and Individual Differences, 34 (5), 855-865.

- Onwuegbuzie, A. J. (2004). Academic procrastination and statistics anxiety. Assessment & Evaluation in Higher Education, 29 (1), 3-19.

- Loscalzo, J. (2012). Irreproducible experimental results: Causes, (mis)interpretations,
and consequences. Circulation, 125 (10), 1211-1214. Retrieved from
http://circ.ahajournals.org/content/125/10/1211.short doi: 10.1161/CIRCULATIONAHA.112.098244

- Baggerly, K. A., & Berry, D. A. (2009). Reproducible research.

- Peng, R. D. (2011). Reproducible research in computational science. Science (New
York, Ny), 334 (6060), 1226.

- Stodden, V., Leisch, F., & Peng, R. D. (2014). Implementing reproducible research. CRC Press.

- Gentleman, R., & Lang, D. T. (2012). Statistical analyses and reproducible research. Journal of Computational and Graphical Statistics.

---

\scriptsize

- Knuth, D. E. 1983. The WEB system of structured documentation. Technical Report
STAN-CS-83-980, Department of Computer Science, Stanford University. http: //
infolab.stanford.edu / pub / cstr / reports / cs / tr / 83 / 980 /CS-TR-83-980.pd

- Xie, Yihui, Joseph J. Allaire, and Garrett Grolemund (2018). R markdown: The definitive guide. CRC Press.

- Haghish E. F. (2016). Markdoc: Literate Programming in Stata. The Stata Journal, 16(4):964-988. doi:10.1177/1536867X1601600409

- Haghish, E. F. (2020). Software documentation with markdoc 5.0. The Stata Journal, 20(2), 336-362.

- Open Science Collaboration. (2015). Estimating the reproducibility of psychological science. Science, 349(6251).

- Iso-Ahola, S. E. (2017). Reproducibility in psychological science: When do psychological phenomena exist?. Frontiers in Psychology, 8, 879.



---

\scriptsize

- Ioannidis, J. P. (2005). Why most published research findings are false. PLoS medicine, 2(8), e124.

- Zunger, J. (2018). Computer science faces an ethics crisis. The Cambridge Analytica scandal proves it. Boston Globe, 22.

***/
    

    
    

