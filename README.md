

# Style guideline

* Foreigners' names, unless household names like 高斯 or 欧拉, in general we don't need to translate.
* Because sometime "." also appear in math, let's unify all 句号 into "." in the text and math. It can be done with *find-and-replace* after we complete a chapter.
* Leave a space before and after a math symbol. 这样的 $\beta$ 比$\beta$好看。


## Decision to make

We need to decide whether we want to use `ipynb` [[Example](http://zhentaoshi.github.io/econ5170/intro.html)] or `rmd` [[Example](http://zhentaoshi.github.io/Econ5121A/)]. If we choose the former, we will need to learn from [Jupyterbook](https://jupyterbook.org/en/stable/intro.html) about the blocks (注3.1, 注3.2), cross references (say, equations) and citations. Moreover, we will need to follow Jupyterbook's display [math style](https://jupyterbook.org/en/stable/reference/cheatsheet.html).


## Jupyter-book

* To install Jupyter-book, run `pip install -U jupyter-book` [[link](https://jupyterbook.org/en/stable/start/overview.html)]
* To compile Jupyter-book, run in a terminal `jupyter-book build .` inside the folder of the ipynb book. The complied files can be find in an automatically generated folder `_build/html/`
