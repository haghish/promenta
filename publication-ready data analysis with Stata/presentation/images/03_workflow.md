<!---------------------------------------------
WORKFLOW
---------------------------------------------->

3 workflow
======================

`markdoc` can produce a dynamic document by executing a do-file actively or by converting a SMCL log file to a dynamic document passively. In this chapter I review both procedures and discuss the advantages and disadvantages of each procedure. I will also describe the syntax of `markdoc` command for producing a dynamic document and provide several examples to demonstrate its features and options.  

3.1 Producing the dynamic document passively
--------------------------------------------

Because the SMCL log file registers every entry in Stata including comments, commands, and text-based output, `markdoc` can produce a dynamic document passively from the SMCL log file. In other words, `markdoc` interprets the log-file – which is updated in real-time during the analysis session – and typesets the dynamic analysis document based on the content of the log-file. Therefore, as soon as the user opens a Stata smcl log-file and begins the data analysis, `markdoc` can quickly compile a dynamic document interactively as shown below. In this workflow, however, the do-file should begin by openning a log-file and ends by closing the log:

{width=80%}
![The process of producing dynamic documents with `markdoc`](images/process.png)


Once a SMCL log-file is created, `markdoc` can convert it to several document formats without requiring the code re-execution. Moreover, this workflow allows producing the dynamic document interactively, while developing the analysis because the SMCL log file is updated any time you execute a command in Stata. In the example below, `markdoc` takes the smcl log-file as input and generates a PDF document. Opening the log quietly avoids including the log description in the document and the `qui log c` which is the abbreviation of `quietly log close` is automatically removed by `markdoc` to keep the document clean. Here is a "Hello World" example that produces a pdf document that merely includes the Stata `display` command and its output:

~~~
. quietly log using example, replace smcl

. display "Hello World"
Hello World

. qui log c
. markdoc example.smcl, export(pdf)
~~~



3.2 Producing the dynamic document actively
--------------------------------------------

Although using a single command to convert a smcl log-file to various document formats is convenient, it does not ensure the reproducibility of the source code, even if the do-file begins with opening a log and ends by closing the log. For example, users might have made changes to the data that are not included in the do-file. Therefore, the do-file must be examined in a clean workspace, where no data is loaded in Stata. `markdoc` can take a do-file as an input and actively execute it in a new workspace - where no data is loaded in that workspace - to examine its reproducibility and generate a dynamic document from the source code. 


{width=80%}
![The process of producing dynamic documents with `markdoc`](images/process.png)


Let's assume that we have a do-file that only in displays the hello world text in a do-file named `example.do`:

~~~
. display "Hello World"
~~~

Then the dynamic document can be produced by actively executing the do-file as shown below:

~~~
. markdoc example.do, export(html)
~~~

Executing a do-file for producing the dynamic document is more conservative when it comes to reproducibility because it ensures that the results are reproducible in a new workspace. Nevertheless, this procedure is not interactive and it cannot produce multiple document formats without rerunning the code. 





3.3 Syntax
--------------------------------------------

To produce a dynamic document, the _filename_ of the documentation source, whether SMCL log file with `.smcl` file extension or do-file  with `.do` extension should be given to `markdoc`. If the file extension is not specified, SMCL log file is assumed. However, specifying the file extension is recommended to provide further clarity that what file was given to `markdoc` as an input. The syntax of `markdoc` is very simple and can be summarized as follows:

__`markdoc`__ _filename_ , [options]


and the options are as follows:

|Option             |   Description     |
|-------------------|-------------------|
|`export(`_name_`)` | specifies the format of the exported document. The supported document formats are `docx`, `pdf`, `html`, `tex`, `odt`, `epub`,  and `md`. If this option and the `markup(`_name_)` option are not specified, then `markdoc` exports a Markdown (that is `export(md)`) file by default.|
|                   |                   |
|`pandoc(`_str_`)`  |specifies the path to the executable Pandoc on your machine. This option is only required if Pandoc is installed manually and the path is not permanently defined using the `weave setup` command.|
|                   |                   |
|`printer(`_str_`)` |specifies the path to the executable wkhtmltopdf or pdfLaTeX software on your machine. wkhtmltopdf generates a PDF document from the Markdown and HTML markup languages, and pdfLaTeX typesets LaTeX to a PDF document. If wkhtmltopdf is installed automatically, this option is not required for generating PDF documents from Markdown or HTML markup languages.|
|`master` |__NOT DESCRIBED YET__.|
|                   |                   |
|`install` |downloads the required third-party software automatically if they are not already installed or accessible.|
|                   |                   |
|`replace`|rewrites the exported document if it already exists.|
|                   |                   |
|`markup(`_name_`)`|specifies the markup language used to annotate the document. _name_ can be `markdown` (the default), `html`, or `latex`, which are the supported markup languages.|
|                   |                   |
|`numbered`|turns on numbering of the commands in the dynamic document.|
|                   |                   |
|`style(`_name_`)`|specifies the layout of the HTML, LaTeX, Microsoft Word, and PDF documents. _name_ can be `simple`, `stata`, or `formal`. The `style(stata)` can be used to export LaTeX documents in _Stata journal_ style, even if the document is written with Markdown, which is a handy feature for writing a draft for Stata journal for those who are not familiar with LaTeX markup language.|
|                   |                   |
|`toc`|automatically creates a table of contents in the PDF, LaTeX, and Microsoft Word dynamic documents.|
|                   |                   |
|`date`|displays the current date to the title page.|
|                   |                   |
|`title(`_str_`)`|displays the title of the dynamic document on the title page.|
|                   |                   |
|`author(`_str_`)`|displays the author's name on the title page.|
|                   |                   |
|`affiliation(`_str_`)`|displays the authors' affiliation (or any preferred relevant information) on the title page.|
|                   |                   |
|`address(`_str_`)`|displays the authors' contact information (or any preferred relevant information) on the title page. For example, it can be used to add a telephone number, e-mail, or mailing address.|
|                   |                   |
|`summary(`_str_`)`|displays a summary or abstract on the title page.|
|                   |                   |
|`test`|runs an example do-file and generates HTML and PDF dynamic documents to ensure that the required software is running properly.|


3.4 Examples
--------------------------------------------

In chapter 2 I already discussed three important `markdoc` options which were `install`, `pandoc()`, `printer()`, and `test` options. Also, in the next chapter you will be extensively applying the `markup()` option. The `template()` option is used for customising `markdoc` and is discussed in advanced topics in chapter ???. The remaining options are explained in this section. 

> __Technical Note__  
Throughout the book, whenever I produce a dynamic document actively, I assume that is saved in a do-file named `example.do`. 

### 3.4.1 export

The `export()` option is the most powerful option of `markdoc`, allowing you to export a dynamic document to a variety of formats, if it is written with Markdown documentation. 

{width=80%}
![The process of producing dynamic documents with `markdoc`](images/diagram.png)

If the dynamic document is produced passively, `markdoc` can use the SMCL log-file to compile several dynamic documents in different formats, using the same SMCL log-file, without requiring you to re-execute the analysis: 

~~~
. quietly log using example, replace smcl

. display "Testing the export option"

. qui log c
. markdoc example.smcl, export(pdf)
. markdoc example.smcl, export(docx)
. markdoc example.smcl, export(odt)
. markdoc example.smcl, export(html) master
. markdoc example.smcl, export(tex) master
~~~

If the dynamic document is produced actively, `markdoc` requires you to re-execute the code anytime you wish to reproduce a new dynamic document. However, all of the document formats are producible. 

~~~
------------------ example.do ----------------

. display "Testing the export option"

----------------------------------------------

. markdoc example.do, export(pdf)
. markdoc example.do, export(docx)
. markdoc example.do, export(odt)
. markdoc example.do, export(html) master
. markdoc example.do, export(tex) master
~~~





