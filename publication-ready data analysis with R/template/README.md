Description
===========

This is a template for generating _publication-ready data analysis with R_ lecture,
for the Department of Psychology at University of Oslo. I am preparing this template to show:

- How to organize a computational project
- How to nest Rmarkdown files and run an entire data analysis within a single file called __MAIN.rmd__
- How to produce a Microsoft Word document that is ready to be included in a manuscript:
- The template demonstrates:
  + dynamic text paragraphs
  + dynamic figures and images
  + dynamic tables

Running the analysis
---------------------

The __MAIN.rmd__ includes all the instructions for executing the analysis, examining the reproducibility of
the project, and generating the analysis report in Microsoft Word and HTML formats. 


Dependencies
---------------------

The package dependencies and the required software are mentioned at the outset of the __MAIN.rmd__ file

Data set
---------------------

The data documentation is can be found in `./docs` directory 

Variables of interest
---------------------

I am running a confirmatory factory analysis on 9 variables. See the data documentation

Methodology
---------------------

Three latent variables are created from the 9 variables. We use the `cfa` function from the `lavaan` package to run the model. 

