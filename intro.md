# 前言

```{admonition} Imagine
You may say I'm a dreamer \
But I'm not the only one \
I hope someday you'll join us \
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
如今学科分工日见精细，我只能教授我理解的部分。



## 许可协议

本讲义采用
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](cc-by-nc-sa) (CC By-NC-SA 4.0) 许可协议. [[中文协议内容](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)]

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

---

## 内容

网上写作是不断更新的有生命力的过程。
目前，每个章节的完成程度不一。
前面的章节相对比较完整，后面的则较为简略。

```{tableofcontents}
```

![Hong Kong](saikung_HK.jpg)

## 导读

除了世界领先的几个经济学博士项目之外，做经济学微观和宏观理论学生数量并不多。现在经济学的领域和话题越分越细，同时数据越来越丰富，大部分博士的毕业论文以实证问题为主。研究生阶段的第一门高级计量经济学为实证工作打基础。这个基础课的基础是数学。

高级计量经济学其实涉及到的经济学内容并不多。相反，它是是本科数学的总结和深入。数学基础是从本科入学开始的历练过程。
线性代数是研究生计量多元回归的基础性。微积分和概率论也同样重要。比如，线性回归就是一个求解最小值的过程，需要用到微积分当中最优化的一阶条件来求解析解，二阶条件验证最小值。还有就是极限的概念，因为渐进理论全部依赖于样本量趋近于无穷大想象世界。概率论和数理统计的使用场景，更加是无处不在。比如说我们用它来导出在正态分布下，线性回归的有限样本性质。高级计量的理论部分是微积分、线性代数和概率统计的混合使用。


高级计量经济学涉及不少数学工具和定理证明。
如果你想要用好计量经济方法，了解背后的潜藏的逻辑和概念并不能让你马上多几件"趁手的武器"。就算你不会做证明，也依然可以成为一个优秀的经济学家或者应用经济学者。然而，如果你有志于在计量经济学理论中深耕研究，你将会不断地在未来的研究中常用这些工具，最终把它们变成肌肉记忆。

在这门课程中，我们试图保持着一个微妙的平衡。一方面，许多的计量经济学话题只需要比较初等的数学知识就能够很好地呈现。而且，计量经济学本就应该用浅显易懂的方式尽可能广地去拓宽自己的受众，而不是用故作高深的语言把人拒绝于千里之
外。但是从另一个角度说，介绍重要的概念和过程将会激发起大家对于后续理论的思考与讨论。


设计一门课，是个最优化问题。上课的时间有限。香港学期短，通常只有12-14周教学时间，必须权衡覆盖面广度和内容的深度。
这门课最关键的是线性回归。把最小二乘法(OLS)理解透彻之后，我们就发现其实线性的广义矩方法(GMM)就是它的一个拓展。而各种非线性回归的理论性质探讨，无非是在最优值点做线性展开，忽略更小的高阶项，让在局部返回线性状态。归根结底，线性问题在数学上容易处理。

课程安排大致有这么几块内容：

* OLS的矩阵操作。就是怎么解出OLS的显示解，什么是投影矩阵，幂等矩阵，Frisch-Waugh-Lovell定理。这部分是线性代数，跟概率、统计没关系。
* 在误差项正态假设下OLS估计量的有限样本分布。就是运用多元联合正态分布的性质，证明y有限样本分布。顺便，OLS其实是在正态分布误差项下的极大似然估计量(MLE)。
* 如果经典分布假设被违反，就需要用到大样本理论。大样本理论有两大支柱，大数定律和中心极限定理。通过一些转换工具，大数定律可以用来证明OLS的相合性，中心极限定理可以用来证明OLS的渐进正态性。
有了渐进正态性，就可以做统计推断。
* 接下来是OLS这套理论的应用。Diff-in-diff, 面板数据固定效应和随机效应模型，是OLS的直接使用。
* 用于解决内生性的两阶段最小二乘法(2SLS)就是把OLS的理论在新公式上面重新来一遍。

至于什么是因果？什么是概率？如何拒绝或接受假说？它们是哲学问题，没有标准答案。这门课提供一些角度去思考这些深层次问题。


## 引言

随着大数据时代的到来,
计算机科学家们不断提出新的算法来解释数据背后的规律。
**机器学习**和**人工智能**早已变成了家喻户晓的热词。
它们在当代的社会中扮演了各种功能，它们推动生产自动化，实现汽车的无人驾驶，精准识别人脸且在网上消费时为你提供个性化推荐。
事实上，许多项目的成功都应该归功于统计学理论,
统计学又是在概率论的基础上发展起来的。
因此，尽管概率和统计不是解读机器学习和人工智能唯一的视角，
它无疑为我们理解并创造新算法提供了可靠的范式。

从亚当斯密（1723-1790）开始，经济学就一直是实证主义的社会科学。他1776年发表的巨著《国富论》充满了各种的经济见闻和数字观测。计量经济学开创者 Ragnar
Frisch (1895--1973) 和 Jan Tinbergen (1903--1994)的贡献，早在1969年首次颁发经济学诺贝尔奖就得到认可。计量经济学为经济学数据和指标提供了定量的视角，在现实世界的实践中熠熠生辉。从微观的家庭和企业到全球治理，无处不见它的身影。时至今日，大数据的变革也为计量经济学方法的研究和探索提供了新的助力，因为计量经济学理论背后的数学逻辑也同样是基于概率和统计。

