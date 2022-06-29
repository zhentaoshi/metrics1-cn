# 前言

```{admonition} Imagine
You may say I'm a dreamer, \
But I'm not the only one. \
I hope someday you'll join us, \
And the world will live as one
```

本讲义根据我的香港和深圳2015--2020年教授的高级计量经济学1整理。
撰写讲义的最初目的，是帮助同学复习课堂知识。
为了方便我上传，同学下载，我把它放在github的开源仓库当中。
Git的命令行界面相对于大学提供的封闭内部教学系统，修改起来更为高效。

在和内地同行的交流中，我深切地感受到这些年我国计量经济学教学和研究上的巨大的进步。
这是我国经济学界前辈、同行共同努力的结果。
我愿意为计量经济学在中文世界的普及贡献绵薄之力。

在大学学习一门课程，必定是老师的讲解和学生的自学相结合。
课堂时间有限，所以课堂讲义只包含需要面授的精华部分。
讲义不是完整的教科书。
如果有关内容材料可以方便地在网上免费获得，则没有必要重新发明轮子，而只需提供相关链接即可。
我的课程时的主要参考书来自Bruce Hansen [[Book1](https://www.ssc.wisc.edu/~bhansen/probability/)] [[Book2](https://www.ssc.wisc.edu/~bhansen/econometrics/)]。
每讲结束，我会要求同学阅读教科书的相关章节并完成课后练习。

根据我在香港、深圳以及美国亚特兰大的教学实践，我认识到编程训练的缺失是经济教育在全世界的普遍现象，并非我国独有。
本讲义和其他的教学材料有以下几点不同。

* 采用 jupyter notebok格式，行文和代码相结合；
* 可以在云端环境运行代码，无需本地安装；
* 源代码公开，方便同学复制、学习，同行进一步修改、创作。[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

最后，本讲义讲授的是计量经济学**理论**。我们讨论如何使用样本对模型参数进行估计和推断，
是否能在概率总体中识别模型参数等一系列问题。
但是，我们不会涉及如何发掘有研究价值的经济学问题，
如何获得数据，如何开展实证分析。这些不是我的专长。



## 许可协议

本讲义采用
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa] (CC By-NC-SA 4.0) 许可协议. [[中文协议内容](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)]

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

---


```{tableofcontents}
```




![Hong Kong](saikung_HK.jpg)
