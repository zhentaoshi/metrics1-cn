FROM jupyter/r-notebook

RUN R --slave -e 'install.packages("languageserver", repos="https://cran.r-project.org/")'

RUN R --slave -e 'install.packages("jsonlite", repos="https://cran.r-project.org/")'

RUN R --slave -e 'install.packages("rlang", repos="https://cran.r-project.org/")'

Run R --slave -e 'install.packages("plm", repos="https://cran.r-project.org/")'

Run R --slave -e 'install.packages("magrittr", repos="https://cran.r-project.org/")'