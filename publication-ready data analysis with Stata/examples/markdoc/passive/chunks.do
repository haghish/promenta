
cd "/Users/haghish/Documents/GitHub/promenta/publication-ready data analysis with Stata/examples/markdoc/passive"

qui log using chunks, replace

/***

Text and code chunks
=====================

This dofile shows how we can *sequence text and code chunks* in a _single dofile_. 
For this purpose, I will do a hypothetical data analysis and go though it step
by step. I begin by loading the example data set. 

***/

sysuse auto, clear

/***

Descriptive Statistics
----------------------

In the next step I generate some descriptive statistics. I will list the data 
and describe and summarize a few variables. 

***/

list in 1/5
describe price
summarize price


/***

Regression Analysis
-------------------

I will fit a regression analysis for price and mpg, using [blue]price[#] as the
dependent variable and the [pink]mpg[#] as predictor. note that __Additional
Markup Codes__ can be used with Markdown codes in _Weaver_ and _Ketchup_ 
packages.

***/

regress price mpg


qui log c

mini chunks, replace export(docx) date author("E. F. Haghish") ///
				title("Sequences of text and codes") 
markdoc chunks, replace export(docx) date author("E. F. Haghish") ///
				title("Sequences of text and codes") 
