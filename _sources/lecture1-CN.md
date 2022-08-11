# 概率



## 概率论的公理

对于日常生活中的不确定性，人们总会不由自主地心生敬畏。在过去，古埃及人依靠祭司，希伯来人崇敬先知，而中国则会通过卜师来解读龟甲或者兽骨的裂纹。在今日的香港，算命先生还是个职业，受到人们的欢迎。

概率论就是一门关于不确定性的哲学。几百年来，全世界的数学家们都在苦心孤诣试图抓住随机背后的规律。随着测度理论在20世纪早期发展成熟，Andrey
Kolmogorov
(1903-1987) 在他1933年发表的专著是当代概率论的里程碑。当中使用的数学语言系统逻辑严谨、自洽，为未来该领域的进一步探索提供了起点。目前，这一套数学语言已经广泛地被学界所接受。

在这次的讲课中，我们将会简要介绍一下概率论的公理以及在本科阶段的*概率论与数理统计*中已经为我们所熟悉的理论。

### 概率空间

**样本空间** $\Omega$ 是所有可能结果的一个集合。**事件** $A$ 是$\Omega$
的一个子集。我们常用$\mathcal{F}$表示的$\sigma$-**域** ($\sigma$ field)
，它是满足如下条件的事件的集合：

1. $\emptyset\in\mathcal{F}$;
2. 如果事件 $A\in\mathcal{F}$，则也有 $A^{c}\in\mathcal{F}$;
3. 如果 $A_{i}\in\mathcal{F}$ for $i\in\mathbb{N}$，则
    $\bigcup_{i\in\mathbb{N}}A_{i}\in\mathcal{F}$。

这意味着: (a) 既然 $\Omega=\emptyset^{c}\in\mathcal{F}$，则有
$\Omega\in\mathcal{F}$。 (b) 如果对于 $i\in\mathbb{N}$ 有
$A_{i}\in\mathcal{F}$ ，则对任意
$i\in\mathbb{N}$ 都有 $A_{i}^{c}\in\mathcal{F}$。 因此，如果
$\bigcup_{i\in\mathbb{N}}A_{i}^{c}\in\mathcal{F}$ ，可以得出
$\bigcap_{i\in\mathbb{N}}A_{i}=(\bigcup_{i\in\mathbb{N}}A_{i}^{c})^{c}\in\mathcal{F}$.

```{admonition} Remark
从直觉来看，$\sigma$ 域允许由可数 (countable) 个集合。它是供这些集合进行并集、差集和交集操作的封闭域。以上这些都是集合的代数计算。所以 $\sigma$ 域也叫做 $\sigma$ 代数。
```

```{admonition} Example
令 $\Omega=\{1,2,3,4,5,6\}$ $\sigma$ **域**($\sigma$ field)
的一些例子包括：

-   $\mathcal{F}_{1}=\{\emptyset,\{1,2,3\},\{4,5,6\},\Omega\}$;

-   $\mathcal{F}_{2}=\{\emptyset,\{1,3\},\{2,4,5,6\},\Omega\}$；

-   Counterexample:
    $\mathcal{F}_{3}=\{\emptyset,\{1,2\},\{4,6\},\Omega\}$ 不是一个
    $\sigma$-*field* 因为 $\{1,2,4,6\}=\{1,2\}\bigcup\{4,6\}$ 并不属于
    $\mathcal{F}_{3}$。
```


$\sigma$ 域是在样本空间 $\Omega$ 上建立的严谨架构。两者放在一起，
$\left(\Omega,\mathcal{F}\right)$ 称为*可测空间* (measurable space)。

令 $\mathcal{G}=\{B_{1},B_{2},\ldots\}$ 为任意的一个集合。如果满足条件 $\mathcal{G}\subseteq\mathcal{F}$ ，而且对于任意的 $\mathcal{\tilde{F}}$ 来说，从而 $\mathcal{F}\subseteq\mathcal{\tilde{F}}$ ，我们称 $\mathcal{F}$ 为 $\mathcal{G}$ 产生的最小$\sigma$ 域。一个 **波莱尔** $\sigma$ 域是由实数 $\mathbb{R}$ 上的所有开集生成的最小 $\sigma$ 域。

``` {admonition} Example
令 $\Omega=\{1,2,3,4,5,6\}$， 令 $A=\{\{1\},\{1,3\}\}$。
由 $A$ 生成的 最小 $\sigma$-field 是

$$
\sigma(A)=\{\emptyset,\{1\},\{1,3\},\{3\},\{2,4,5,6\},\{2,3,4,5,6\},\{1,2,4,5,6\},\Omega\}.
$$
```

如果函数 $\mu:(\Omega,\mathcal{F})\mapsto\left[0,\infty\right]$
满足如下条件

1. (非负性) 对任意 $A\in\mathcal{F}$，都有 $\mu\left(A\right)\geq0$;

2. (可列可加性) 如果 $A_{i}\in\mathcal{F}$,
    $i\in\mathbb{N}$ 互不相交，则

    $$
    \mu\left(\bigcup_{i\in\mathbb{N}}A_{i}\right)=\sum_{i\in\mathbb{N}}\mu\left(A_{i}\right),
    $$

我们将该函数 $\mu$ 称为 **测度**

测度可以类比日常生活中的宽度或重量来理解。
通常情况下，如果满足 $\mu\left(\Omega\right)=1$，
我们就可以称 $\mu$ 为**概率测度**。 概率测度通常用符号 $P$ 来指代。
在可测空间之上赋予一个概率测度，这三者
$\left(\Omega,\mathcal{F},P\right)$ 称 **概率空间** (probability space)。

目前为止我们已经回答了问题:
"什么是一个数学意义上定义完备的概率?"，但我们还没有回答一个问题"怎么分配概率？"
在概率分配中有两个主流的学派，一个是**频率学派**，他们把概率视作大样本实验之后出现结果的平均频率；
一个是**贝叶斯学派**，他们把概率解释为对于事情发生的主观信念。
两个学派的理论基本上互不兼容，他们的主张也各有优劣。
有关这两个学派观点会在有关假设检验的章节涉及。

<!-- ZT revised up here 7/31/2022-->


### 随机变量

术语 **随机变量**
是一个历史遗留下来的称呼，实际上如果考虑到它定义中映射的确定性，这个术语会显得有一点"名不副实"。
它链接了两个测度空间，也就意味着置于值域中的任意事件都能追溯到定义域中的一个对应的事件。

理论上, 公式 $X:\Omega\mapsto\mathbb{R}$ ($\left(\Omega,\mathcal{F}\right)\backslash\left(\mathbb{R},\mathcal{R}\right)$)
**可测量的** 如果

$$
X^{-1}\left(B\right)=\left\{ \omega\in\Omega:X\left(\omega\right)\in B\right\} \in\mathcal{F}
$$

对于任何的 $B\in\mathcal{R}$ **随机变量**
是可测函数另一个带有浪漫气息的名字。由**随机变量** $X$ 生成的$\sigma$ 域被定义为
$\sigma\left(X\right)=\left\{ X^{-1}\left(B\right):B\in\mathcal{R}\right\}$.

如果$\left\{ X\left(\omega\right):\omega\in\Omega\right\}$是有限的或者可数的，
我们将这样的可测函数称为**离散性随机变量**。如果集合$\left\{ X\left(\omega\right):\omega\in\Omega\right\}$
是不可数的，我们称之为**连续型随机变量** 。

可测函数连接了两个测度空间。目前在它的定义中还没有涉及到任何概率相关的概念。但如果一个概率测度
$P$ 位于 $(\Omega,\mathcal{F})$ 中，可测函数 $X$ 将在
$(\mathbb{R},\mathcal{R})$上导出概率测度。不难证明，如果满足定义

$$
P_{X}\left(B\right)=P\left(X^{-1}\left(B\right)\right)
$$

那么$P_{X}:(\mathbb{R},\mathcal{R})\mapsto\left[0,1\right]$
也是一个概率测度。 $B\in\mathcal{R}$的条件下，这样的 $P_{X}$ 被称为函数
$X$ **诱导**概率测度。诱导概率测度 $P_{X}$ 是
 $P$ 通过函数 $X$ 所衍生推导出来的。

### 分布函数

我们回溯一下几个在本科概率论课程上曾经接触过的概念。一个**累积分布函数**
（cumulative distribution function） $F:\mathbb{R}\mapsto[0,1]$ 被定义为

$$
F\left(x\right)=P\left(X\leq x\right)=P\left(\{X\leq x\}\right)=P\left(\left\{ \omega\in\Omega:X\left(\omega\right)\leq x\right\} \right).
$$

它通常可以简写为 CDF，并且有如下性质：

1.  $\lim_{x\to-\infty}F\left(x\right)=0$,

2.  $\lim_{x\to\infty}F\left(x\right)=1$,

3.  单调不递减,

4.  右连续 $\lim_{y\to x^{+}}F\left(y\right)=F\left(x\right).$

```{admonition} Exercise
画出一个0-1分布的累积分布函数; $X=1$对应的概率为
$p\in\left(0,1\right)$ 而 $X=0$ 对应概率 $1-p$
```

对于连续型分布来说, 如果存在一个函数 $f$ 使得对于所有的 $x$ 满足

$$
F\left(x\right)=\int_{-\infty}^{x}f\left(y\right)\mathrm{d}y
$$

那么
$f$ 就是 $X$ 的**概率密度函数**（probability distribution
function），通常会缩写为PDF。容易看出它由以下性质： $f\left(x\right)\geq0$ 且
$\int_{a}^{b}f\left(x\right)dx=F\left(b\right)-F\left(a\right)$。

```{admonition} Example
我们已经学过了许多的参数分布，比如二元分布、泊松分布、均匀分布、指数分布和正态分布，
$\chi^{2}$, $t$,
$F$分布等等。这些都是参数分布，意味着较少的参数就能够完全表征出他们的CDF和PDF。
```

## 数学期望

### 积分

积分是数学分析中最基础的数学方法之一。我们已经在本科阶段学习过黎曼积分，黎曼积分是符合数学直觉的。但是勒贝格积分才是更加泛用的积分定义。勒贝格积分的建立依靠以下几个步骤。$X$ 被认为是一个在测度空间 $\left(\Omega,\mathcal{F}\right)$ 
中的**简单函数**。如果 $X=\sum_{i}a_{i}\cdot1\left\{ A_{i}\right\}$
而且它的加总是有限的。同时其中 $a_{i}\in\mathbb{R}$ 和 $\{A_{i}\in\mathcal{F}\}_{i\in\mathbb{N}}$ 是
$\Omega$的一部分。我们就可以认为一个简单函数是可测的。

1.  令 $\left(\Omega,\mathcal{F},\mu\right)$ 为一个测度空间。 简单函数
    $X$的积分 与 $\mu$ 有关，是

    $$
    \int X\mathrm{d}\mu=\sum_{i}a_{i}\mu\left(A_{i}\right).
    $$

    不同于黎曼积分，
    这种积分的定义不需要等额地分割定义域。相反，它沿着函数的值域作相应的计算。

2.  令 $X$ 作为一个非负的函数。$\mu$对于函数$X$的积分为：

    $$
    \int X\mathrm{d}\mu=\sup\left\{ \int Y\mathrm{d}\mu:0\leq Y\leq X,\text{ }Y\text{ is simple}\right\} .
    $$

3.  令 $X$ 为可测函数. 定义 $X^{+}=\max\left\{ X,0\right\}$ 和
    $X^{-}=-\min\left\{ X,0\right\}$. $X^{+}$ 与 $X^{-}$ 都是非负函数。
    $\mu$对于$X$的积分为：
    
    $$
    \int X\mathrm{d}\mu=\int X^{+}\mathrm{d}\mu-\int X^{-}\mathrm{d}\mu.
    $$

上述的第一步定义了简单函数的积分；第二步定义了用下方的阶梯函数测算非负函积分的方法；第三部把一个任意函数视为两个非负部分的差值。

```{admonition} Remark
-   
    勒贝格积分和黎曼积分之间在被积函数上的核心区别体现在单位区间 $1\left\{ x\in\mathbb{Q}\cap[0,1]\right\}$ 上的狄利克雷函数（Dirichelet
    function）。它是黎曼不可积分的，但是可以使用勒贝格积分计算。
    它有明确的定义且满足
    $\int1\left\{ x\in\mathbb{Q}\cap[0,1]\right\} dx=0$.
```

如果测度 $\mu$ 是一个概率测度 $P$, 那么积分 $\int X\mathrm{d}P$
就会变成为$X$的**数学期望**。 我们通常会使用符号 $E\left[X\right]$来代替
 $\int X\mathrm{d}P$ 使得整个数学语言更简洁方便。

尽管我们不能预测在给定情况下一个随机变量的实际值(不然一切对于不确定性的研究
都是徒劳了)，但是期望能够告诉我们随机变量的均值。在频率论者的视角里，期望等于我们进行了大样本的实验后得出结果的均值。

如果我们知道了一个离散型随机变量的概率质量函数,它的期望就是 $E\left[X\right]=\sum_{x}xP\left(X=x\right)$ ，也就是一个简单函数的积分。
如果一个连续型随机变量存在概率密度函数 $f(x)$ , 它的期望可以用
$E\left[X\right]=\int xf\left(x\right)\mathrm{d}x$ 计算。这两个表达式被勒贝格
积分统一为 $E[X]=\int X\mathrm{d}P$ 。

### 期望的性质

这里是一些数学期望的性质：

-   事件 $A$ 的概率是指示函数的期望：
    $E\left[1\left\{ A\right\} \right]=1\times P(A)+0\times P(A^{c})=P\left(A\right)$.

-   $E\left[X^{r}\right]$ 被称为$X$的 $r$阶矩。一个随机变量的**均值**
    是一阶矩，$\mu=E\left[X\right]$；而二阶**中心**矩叫做方差
    $\mathrm{var}\left[X\right]=E\left[\left(X-\mu\right)^{2}\right]$。
    三阶中心矩 $E\left[\left(X-\mu\right)^{3}\right]$ 称为**偏度**,
    用来衡量一个随机变量的对称性，四阶矩则是**峰度**
    $E\left[\left(X-\mu\right)^{4}\right]$，是用来体现尾部厚度的参数。

-   矩条件不一定存在。例如，柯西分布就不存在均值；$t(2)$ 分布不存在方差。

-   $E[\cdot]$ 是一个线性的计算。如果 $\phi(\cdot)$ 是一个线性的函数,
    那么有 $E[\phi(X)]=\phi(E[X])$

-   **詹森不等式**是一个重要的结论。一个函数 $\varphi(\cdot)$ 是凸函数
    如果对定义域内的所有$x_{1},x_{2}$和$a\in[0,1]$ 都使得
    $\varphi(ax_{1}+(1-a)x_{2})\leq a\varphi(x_{1})+(1-a)\varphi(x_{2})$。
    例如， $x^{2}$ 是一个凸函数。詹森不等式说明如果
    $\varphi\left(\cdot\right)$ 是一个凸函数，那么
    $\varphi\left(E\left[X\right]\right)\leq E\left[\varphi\left(X\right)\right]。$

-   *马尔克夫不等式* 是另一个简单但是重要的事实。如果
    $E\left[\left|X\right|^{r}\right]$ 存在，那么对于所有的$r\geq1$都有
    $P\left(\left|X\right|>\epsilon\right)\leq E\left[\left|X\right|^{r}\right]/\epsilon^{r}$。
    *切比雪夫不等式*
    $P\left(\left|X\right|>\epsilon\right)\leq E\left[X^{2}\right]/\epsilon^{2}$
    是马尔克夫不等式在 $r=2$的时候的一个特例。

-   一个随机变量的分布往往可以被它的CDF和PDF清楚地表示。而矩条件同样也是分布的一个函数。为了从矩中找出暗含着的分布情况，我们需要知道矩的生成函数（mgf） $M_{X}(t)=E[e^{tX}]$（$t\in\mathbb{R}$）。$r$ 阶矩可以基于mgf进行计算

    $$
    E[X^{r}]=\frac{\mathrm{d}^{r}M_{X}(t)}{\mathrm{d}t^{r}}\big\vert_{t=0}.
    $$
    
    值得注意的是，就像矩一样，mgf也并非一定存在。

## 多元随机变量

一个二元随机变量是一个可测函数
$X:\Omega\mapsto\mathbb{R}^{2}$，我们可以由此推广到多元的随机变量也是可测的。
$X:\Omega\mapsto\mathbb{R}^{n}$. 我们可以定义 *联合 CDF* 为
$F\left(x_{1},\ldots,x_{n}\right)=P\left(X_{1}\leq x_{1},\ldots,X_{n}\leq x_{n}\right)$.
联合PDF的定义与之类似。

我们有必要了解一下二元变量的联合分布、条件分布和边际分布，然后我们就可以将二元的情况推广到多元分布。假设有一对二元随机变量
$(X,Y)$ 有一个联合密度函数 $f(\cdot,\cdot)$。如果我们暂时忽略一下
$f(x)=0$ 的特殊情况，那么我们可以将它的**条件密度**简略地写成
$f\left(y|x\right)=f\left(x,y\right)/f\left(x\right)$
。二元变量中**边际密度** $f\left(y\right)=\int f\left(x,y\right)dx$
则是把我们不感兴趣的那一个变量通过积分使它不再成为函数中的一个变量。

### 条件概率和贝叶斯公式

在一个概率空间中 $(\Omega,\mathcal{F},P)$对于两个事件
$A_{1},A_{2}\in\mathcal{F}$ ，**条件概率**是

$$
P\left(A_{1}|A_{2}\right)=\frac{P\left(A_{1}A_{2}\right)}{P\left(A_{2}\right)}
$$

如果
$P(A_{2})>0$的话。 在条件概率的定义中, $A_{2}$
扮演了结果空间的角色，所以 $P(A_{1}A_{2})$ 被 $P(A_{2})$的值标准化了。
如果 $P(A_{2})=0$，
在部分的案例中，条件概率公式依然使用，但是在这种情况下，我们需要介绍两个测度之间的
**支配度**，我们在此不打算细谈。

既然 $A_{1}$ 和 $A_{2}$ 是对称的,我们还能得出
$P(A_{1}A_{2})=P(A_{2}|A_{1})P(A_{1})$。它表明了
$$P(A_{1}|A_{2})=\frac{P\left(A_{2}|A_{1}\right)P\left(A_{1}\right)}{P\left(A_{2}\right)}$$
这个公式就是贝叶斯公式 **Bayes' Theorem**

### 独立性

如果满足条件 $P(A_{1}A_{2})=P(A_{1})P(A_{2})$，我们就会认为 $A_{1}$ 和
$A_{2}$ 是*独立*的 . 如果 $P(A_{2})\neq0$ , 就相当于
 $P(A_{1}|A_{2})=P(A_{1})$ 。换言之 已知了 $A_{2}$ 将不会改变
$A_{1}$ 的概率。

关于两个随机变量的独立性，已知 $X$ and $Y$
是独立的，那么对于任意两个波莱尔集 $B_{1}$ and $B_{2}$，会有
$P\left(X\in B_{1},Y\in B_{2}\right)=P\left(X\in B_{1}\right)P\left(Y\in B_{2}\right)$

若 $X$ 和 $Y$ 独立， 那么二者的期望有公式
 $E[XY]=E[X]E[Y]$ 。即期望的积等于积的期望。

### 期望迭代法则

给定一个 $\left(\Omega,\mathcal{F},P\right)$ ， *sub* $\sigma$-algebra
$\mathcal{G}\subseteq\mathcal{F}$ 和一个 $\mathcal{F}$-测度函数
$Y$满足条件 $E\left|Y\right|<\infty$ ，**条件期望**
 $E\left[Y|\mathcal{G}\right]$ 被定义为
 $\mathcal{G}$-可测函数，使得对于所有的 $A\in\mathcal{G}$:

$$
\int_{A}Y\mathrm{d}P=\int_{A}E\left[Y|\mathcal{G}\right]\mathrm{d}P
$$

在这里
 $\mathcal{G}$ 是一个粗糙的 $\sigma$ 域， 而 $\mathcal{F}$
是一个平滑的 $\sigma$ 域。

使 $A=\Omega$，我们能够得到
$E\left[Y\right]=\int Y\mathrm{d}P=\int E\left[Y|\mathcal{G}\right]\mathrm{d}P=E\left[E\left[Y|\mathcal{G}\right]\right]$。

**期望迭代法则**

$$
E\left[Y\right]=E\left[E\left[Y|\mathcal{G}\right]\right]
$$

这个公式如果按照条件期望的定义来看也并不难理解。在二元变量的案例中，如果条件密度函数存在，那么条件期望可以
这样计算
$E\left[Y|X\right]=\int yf\left(y|X\right)\mathrm{d}y$，其中条件变量
$E\left[\cdot|X\right]=E\left[\cdot|\sigma\left(X\right)\right]$ 是 $X$
生成的最小$\sigma$ 域
的简化表达。期望迭代法则表明了：$E\left[E\left[Y|X\right]\right]=E\left[Y\right]$.

下方是条件期望的一些性质：

1.  $E\left[E\left[Y|X_{1},X_{2}\right]|X_{1}\right]=E\left[Y|X_{1}\right];$

2.  $E\left[E\left[Y|X_{1}\right]|X_{1},X_{2}\right]=E\left[Y|X_{1}\right];$

3.  $E\left[h\left(X\right)Y|X\right]=h\left(X\right)E\left[Y|X\right].$

## 总结



```{admonition} 历史趣闻
测度理论在20世纪的早期被一群富有才华的法国和德国学者建立。
其中代表人物有Émile Borel, Henri Lebesgue, Johann
Radon等等。几代俄罗斯学者如 Andrey Markov and Andrey Kolmogorov
为数学化和符号化"不确定性"和"随机性"这些似乎有点抽象的概念夯实了基础。这些贡献者们的名字在波莱尔集、勒贝格积分、马克洛夫链、柯尔莫哥洛夫零------一个法则和许多的术语中被牢牢铭记。

关于概率的各种各样的有趣的问题吸引了一批又一批学者，Francis Edgeworth
(1845--1926) 在概率和统计方面写出了许多的著作； John Maynard Keynes
(1883--1946)在1921年发表了 *概率论*
将概率和哲学融合到一起，尽管这本书的流传度不如他后来1936年革命性的著作
*就业、利息和货币通论*

如今，搜集和处理信息的效率和成本相较于一百年前已经发生了翻天覆地的变化。然而可惜的是，学习和发展数学的投入成本与百年前相差无多。只有一小部分有才华的人才能聆听和体会这些伟大的数学思想。
```

```{admonition} 拓展阅读
@doob1996development
总结了20世纪前半页概率论在公理上的发展。
```
