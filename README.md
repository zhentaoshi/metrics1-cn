# Style guideline

* When we emphasize some words, use **黑体**, instead of *斜体*. 后者不符合中文习惯。
* Foreigners' names, unless household names like 高斯 or 欧拉, in general we don't need to translate. (Done)
* 还是恢复使用中文标点吧，除非句号出现在数学公式当中。It can be done with *find-and-replace* after we complete a chapter.
* Leave a space before and after a math symbol. 这样的 $\beta$ 比$\beta$好看。 (Done)

## Format

We use `ipynb` [[Example](http://zhentaoshi.github.io/econ5170/intro.html)] with [Jupyterbook](https://jupyterbook.org/en/stable/intro.html).
We follows its blocks (注3.1, 注3.2), cross references (say, equations), citations,
and display [math style](https://jupyterbook.org/en/stable/reference/cheatsheet.html).



## Jupyter-book

* To install Jupyter-book, run `pip install -U jupyter-book` [[link](https://jupyterbook.org/en/stable/start/overview.html)]
* To compile Jupyter-book, run in a terminal `jupyter-book build .` inside the folder of the ipynb book. The complied files can be find in an automatically generated folder `_build/html/`

* To enable items such as proof, definition, example, exercise... style formatting, run
	- `pip install sphinx-proof`
	- `pip install sphinx-exercise`

* The equations are labeled by using the `{eq}` role [[link](https://jupyterbook.org/en/stable/content/math.html)]



## Progress

**Competed**
* Least squares: CX
* Basic asymptotics: CX

**Just after first round**
* Probability: HY
* Projection:
* OLS finite sample: HY
* OLS asym: HY
* Hypothesis testing: CX

**Assigned**

* Endogeneity: KY
* Panel: HY

**Untouched**
* GMM
* MLE asym.


---

QR code for the webpage

![QRcode](qrcode.png)
