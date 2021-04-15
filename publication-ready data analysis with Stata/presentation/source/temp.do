
    
/***    


---

![](images/rmarkdown_mixed.png)


Supported Markup Languages
==========================

- `rmarkdown` supports several languages such as __Markdown__, __LaTeX__, and __HTML__

- In this lecture we will focus on Markdown, which is the simplest. The following links, from its developer's site, can provide a good background about Markdown:
	- <https://daringfireball.net/projects/markdown/>
	- <https://daringfireball.net/projects/markdown/syntax>
	- <https://daringfireball.net/projects/markdown/dingus>

- Markdown is: 
    + minimalistic and clean 
    + simple to read and write
    + helps to focus on the content
    + can be converted to many formats

---

![Markdown syntax](images/markdown.png)

Planning the analysis report
============================

- __R__ script files have an __`.r`__ extension, `rmarkdown` files have __`.rmd`__ extension
- Human language and computer languages are separated from one another
- You can nest the analysis into multiple Rmd files
- You have __full control__ about what to include or exclude in your document
    + dynamic text
    + R code
    + R output
    + graphs
    + tables
    + mathematical notations

---

![Rmarkdown example](images/rmarkdown_example.png)

--- 

![Rmarkdown nesting example](images/rmarkdown_main.png)



Dynamic tables
==============

- __markdown__ language offers syntax for creating tables, but it is tedious <https://pandoc.org/MANUAL.html#Tables>
- we can create tables by constructing a string matrix and converting it to a table
- consider the output document before designing your table:
    + for MS Word use __markdown__ only
    + for LaTeX and HTML you have plenty of option
- For general purpose, I recommend __`pander`__ 
    + for different _classess_, __`pander`__ offers automated table designs







***/

