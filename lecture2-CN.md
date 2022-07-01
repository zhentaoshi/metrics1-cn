# 投影

```{admonition} 涅槃经（卷三十二）
有王告大臣，汝牵一象来示盲者时，众盲各以手触。大王唤众盲问之：“汝见象类何物？触其牙者言：象形如萝菔根；触其耳者言如萁；触其脚者言如臼；触其脊者言如床；触其腹者言如瓮；触其尾者言如绳。
```

```{warning}
We need to format this file to be consistent with other chapters.
```

**数学符号**：在本讲义中, $y$为一元随机变量, $x=(x_1,...,x_K)^{\prime}$为$K\times1$的随机向量. 另外，在本课程中提到的向量均为**列向量**，即只有一列的矩阵.

## 条件期望

条件期望在数据预测理论中由重要的地位。
机器学习是一揽子处理数据的算法, 回归分析也包含于其中. 回归是一种**监督式学习** (*supervised leaning*). 监督式学习用$x$的函数$g(x)$来预测$y$, 但除非二者之间的关系是非随机的, 否则 $x$ 并不能完美地预测 $y$, 而期预测误差 $y-g(x)$ 依赖于函数 $g$ 的选择. 函数 $g$ 的可选范围实在太广了, 如何才能找到最优的 $g$ 来帮助我们做预测呢? 因为我们的目标是做预测，我们并不关心相应联合分布 $(y,x)$ 的数据生成过程 (*data generating process*, 简记 DGP). 不管 $(x,y)$ 随机变量是如何生成的, 我们期望有一种通用的规则来找到一个合适的函数 $g$, 在给定 $x$ 的情况下能够尽可能精确地预测 $y$.

我们来看决策理论如何处理这个问题。回答这一问题的关键在于, 我们需要给一个用于比较不同 $g$ 的标准, 这种标准被称为**损失函数**, 常记为$L(y,g(x))$. **平方损失** (*quadratic loss*) 

$$
L(y,g(x))=(y-g(x))^2.
$$

是一种常见的损失函数.
由于数据的随机性, 损失函数 $L(y,g(x))$ 也是随机的. 这里的"随机"意味着不确定性, 即使在同一分布下, 每次抽样也可能产生不同的结果. 为了摆脱这种随机性的影响, 我们根据联合分布 $(y,x)$ 对损失函数取数学期望,得到 $R(y,g(x))=E[L(y,g(x))]$, 我们将其称为**风险**. 
与损失函数不同, 风险是一个确定性的量. 与平方损失函数对应的风险是

$$
R(y,g(x))=E\left[(y-g(x))^2 \right],
$$

被称为**均方误差** (*mean square error*, 简记MSE). 均方误差是最常用的风险测度方法， 虽然文献中还有其他可替代的度量, 例如**平均绝对误差** (*mean absolute error*, 简记MAE) $E[|y-g(x)|]$ 等.

一个自然的问题是, 为什么MSE如此受欢迎? 它有什么优点? 实际上, 由于其良好的函数形式, 使用MSE往往能帮助我们较为方便地求出封闭式解析解. 反观其他的风险函数如MAE, 由于其不可微性, 会为求解析解带来一些不必要的困难. 在经济学中, 效用函数的选择也有着类似的考量. 我们通常只选择几种函数形式, 如CRRA效用函数, CARA效用函数等, 这些函数形式得以广泛使用也是由于它们往往能够使我们较为便捷地求得封闭式的解析解.

明确了比较的准则, 我们的问题便十分清晰了: 如果我们的目标是最小化均方误差MSE, 那么函数$g$的最优选择是什么?

**命题2.1.**  条件均值函数 (*conditional mean function*, 即CEF) $m(x)=E[y|x]=\int yf(y|x)dy$ 使得MSE最小化.

在证明上述命题之前, 我们先对条件均值函数的性质进行一些讨论. 显然, 我们有

$$
y=m(x)+(y-m(x))=m(x)+\varepsilon,
$$

其中$\varepsilon:=y-m(x)$称为**回归误差** (*regression error*). 只要条件期望$E[y|x]$存在, 无论$(y,x)$服从何种分布, 该等式都成立. 误差项$\varepsilon$具有以下性质：

- $E[y|x]=E[y-m(x)|x]=E[y|x]-m(x)=0$,

- $E[\varepsilon]=E[E[\varepsilon|x]]=E[0]=0$,

- 任给函数$h(x)$有


  $$
  E[h(x)\varepsilon]=E[E[h(x)\varepsilon|x]]=E[h(x)E[\varepsilon|x]]=0.\tag{2.1}
  $$

最后一个性质表明, $\varepsilon$与$x$的任何函数都不相关. 特别地, 当$h(x)=x$时有$E[x\varepsilon]=Cov(x,\varepsilon)$=0.

**命题2.1的证明.**  我们首先猜测CEF是最优解, 然后验证它确实是最优解: 对于每个取得的函数$g$验证CEF至少不比$g$差, 这一思路可以称为"guess-and-verify". 对任给的$g(x)$, 其MSE可以分解为三部分

$$
\begin{align}
&E\left[(y-g(x))^2\right]\\
=&E\left[(y-m(x)+m(x)-g(x))^2\right]\\
=&E\left[(y-m(x))^2\right]+2E\left[(y-m(x))(m(x)-g(x))\right]+E\left[(m(x)-g(x))^2\right].
\end{align}
$$

其中第一项为CEF的MSE, 显然与$g(x)$无关. 在 (2.1) 中取$h(x)=m(x)-g(x)$可得第二项满足

$$
2E\left[(y-m(x))(m(x)-g(x))\right]=2E\left[\varepsilon(m(x)-g(x))\right]=0.
$$

因此第二项也与$g(x)$无关. 第三项非负且在$g(x)=m(x)$是取得最小值. 证毕！

讨论至此, 可以发现我们的观点与大多数计量经济学教科书有一些区别. 传统的计量经济学教科书中大多假设因变量$y$是由一个未知的函数$g(\cdot)$和满足$E[\varepsilon|x]=0$的误差项$\varepsilon$, 通过$y=g(x)+\varepsilon$的形式生成的. 而我们采用了一种与DGP无关的观点: 在观察到$y$和$x$的情况下, 我们关心的仅仅是寻找到最优的预测函数$g(x)$, 使得它能够在均方误差准则下对$y$做出最好的预测.

## 线性投影

上一节中我们证明了条件均值函数$m(x)$能够最小化均方误差MSE, 但$m(x)=E[y|x]$依赖于$(y,x)$的联合分布, 而在实际中联合分布通常是未知的, 因此条件期望通常是一个比较复杂的函数, 使用起来比较复杂. 那么如何简化我们的预测函数呢? 一个自然的想法就是将我们的目标缩小为线性函数$h(x)=h(x;b)=x^{\prime}b, \ b\in\mathbb{R}^{K}$, 然后在所有线性函数中寻找一个使MSE最小的函数. 于是我们的问题简化为:

$$
\begin{align}
\min_{b\in\mathbb{R}^K}E\left[(y-x^{\prime}b)^2\right]. \tag{2.2}
\end{align}
$$

相应的一阶条件为

$$
\begin{align}
\frac{\partial}{\partial b}E\left[(y-x^{\prime}b)^2\right]
=E\left[\frac{\partial}{\partial b}(y-x^{\prime}b)^2\right]
=-2E\left[x(y-x^{\prime}b)\right].
\end{align}
$$

上式的第一步交换了期望符号与求导符号的顺序, 只要满足$E\left[(y-x^{\prime}b)^2\right]<\infty$即可. 第二步由链式法则与期望的线性性质保证. 令上式为0, 我们的目标是求出

$$
\beta=\arg\min_{b\in\mathbb{R}^{K}}E\left[(y-x^{\prime}b)^2\right].
$$

解一阶条件, 如果$E[xx^{\prime}]$可逆, 相应的封闭式解析解为

$$
\begin{align}
\beta=(E[xx^{\prime}])^{-1}E[xy].
\end{align}
$$

在这里$b$表示任一$K$维向量, 而$\beta$为最优解. 函数$x^{\prime}\beta$称为$y$对$x$的**最优线性投影** (*best linear projection*, 即BLP), 而$\beta$称为**线性投影系数** (*linear projection coefficient*).

*注2.1.*  线性函数的适用范围可能比我们直观想象的更广, 如果我们对$x$进行重新定义, 它也能够用于反映一些非线性的影响. 例如, 考虑
$$
y=x_1\beta_1+x_2\beta_2+x_1^2\beta_3+e,
$$
则$\frac{\partial}{\partial x_1}m(x_1,x_2)=\beta_1+2x_1\beta_3$, 该模型中$x_1$对$y$存在非线性的影响. 但我们如果将回归量重设为$(\tilde{x}_1,\tilde{x}_2,\tilde{x}_3)=(x_1,x_2,x^2_1)$, 那么在相应的参数$\beta=(\beta_1,\beta_2,\beta_3)$下该模型仍然是线性的.

*注2.2.*  如果$(y,x)$服从以下形式的联合正态分布

$$
\left(\begin{array}{r}
y\\
x
\end{array} \right)
\sim
N
\left(
\left(
\begin{array}{r}
\mu_y\\
\mu_x
\end{array}
\right),
\left(
\begin{array}{c}
\sigma^2_y & \rho\sigma_y\sigma_x\\
\rho\sigma_y\sigma_x & \sigma^2_x
\end{array}
\right)
\right),
$$

其中$\rho$为相关系数. 此时的条件期望是$x$的线性函数

$$
E[y|x]=\mu_y+\rho\frac{\sigma_y}{\sigma_x}(x-\mu_x)=\left(\mu_y-\rho\frac{\sigma_y}{\sigma_x}\mu_x\right)+\rho\frac{\sigma_y}{\sigma_x}x
$$

即CEF是线性的.

*注2.3.*  通常来说, 条件期望函数并非线性的, 即$m(x)\not=x^{\prime}\beta$, 但我们有
$$
\beta=\arg\min_{b\in\mathbb{R}^{K}}E\left[(m(x)-x^{\prime}b)^{2}\right]
$$
成立, 因此线性函数$x^{\prime}\beta$仍然是$m(x)$的一个有用的估计. 证明如下:

考虑一阶条件$\frac{\partial}{\partial b}E\left[(m(x)-x^{\prime}b)^{2}\right]=-2E\left[x(m(x)-x^{\prime}b)\right]=0$. 移项得到$E[x\cdot m(x)]=E[xx^{\prime}]b$. 若$E[xx^{\prime}]$

可逆, 则有
$$
(E[xx^{\prime}])^{-1}E[x\cdot m(x)]=(E[xx^{\prime}])^{-1}E[E[xy|x]]=(E[xx^{\prime}])^{-1}E[xy]=\beta.
$$
因此在均方误差准则下, $\beta$是$m(x)$的最优线性估计. 证毕！

将线性回归模型重写为如下形式
$$
\begin{align}
&y=x^{\prime}\beta+e\\
&E[xe]=0,
\end{align}
$$
也称为**线性投影模型** (*linear projection model*), 其中$e=y-x^{\prime}\beta$称为**线性投影误差** (*linear projection error*). 这里我们使用符号$e$以区别于$\varepsilon=y-m(x)$.

**练习2.1.**  证明: (a) $E[xe]=0$. (b) 若$x$中包含常数项, 则$E[e]=0$.

### 遗漏变量偏误

考虑如下的**长回归** (*long regression*)

$$
y=x^{\prime}_1\beta_1+x^{\prime}_2\beta_2+\beta_3+e_{\beta}.
$$

再考虑如下的**短回归** (*short regression*)

$$
y=x^{\prime}_1\gamma_1+\gamma_2+e_{\gamma}.
$$

其中$e_{\beta}$和$e_{\gamma}$分别为相应模型的投影误差. 如果$\beta_1$为长回归中我们感兴趣的参数, 遗漏变量$x_2$将会导致模型成为短回归模型, 产生**遗漏变量偏误** (*omitted variable bias*), 使得$\gamma_1\not=\beta_1$. 但这里也有例外, 如果$x_1$与$x_2$不相关, 此时仍然有$\gamma_1=\beta_1$.

为了便于讨论, 我们将两个回归模型中的变量进行零均值化, 这样就可以在回归模型中去掉常数项. 可以证明, 这样处理后结果与带常数项的回归结果是等价的. 此时长回归模型变为

$$
\tilde{y}=\tilde{x}^{\prime}_1\beta_1+\tilde{x}^{\prime}_2\beta_2+\tilde{e}_{\beta},
$$

而短回归模型变为

$$
\tilde{y}=\tilde{x}^{\prime}_1\gamma_1+\tilde{e}_{\gamma}.
$$

其中波浪上标表示零均值化的变量.

**练习.**  证明: $\tilde{e}_{\beta}=e_{\beta}, \ \tilde{e}_{\gamma}=e_{\gamma}$.

零均值化后, 两个交互项的期望等于相应的协方差, 于是短回归的系数为

$$
\begin{align}
\gamma_1&=(E[\tilde{x}_1\tilde{x}_1^{\prime}])^{-1}E[\tilde{x}_1\tilde{y}]\\
&=(E[\tilde{x}_1\tilde{x}_1^{\prime}])^{-1}E[\tilde{x}_1(\tilde{x}^{\prime}_1\beta_1+\tilde{x}^{\prime}_2\beta_2+\tilde{e}_{\beta})]\\
&=(E[\tilde{x}_1\tilde{x}_1^{\prime}])^{-1}E[\tilde{x}_1\tilde{x}_1^{\prime}]\beta_1+
(E[\tilde{x}_1\tilde{x}_1^{\prime}])^{-1}E[\tilde{x}_1\tilde{x}_2^{\prime}]\beta_2\\
&=\beta_1+
(E[\tilde{x}_1\tilde{x}_1^{\prime}])^{-1}E[\tilde{x}_1\tilde{x}_2^{\prime}]\beta_2,
\end{align}
$$

其中第三个等号成立是因为$E[\tilde{x}_1\tilde{e}_{\beta}]=0$. 因此, $\gamma_1=\beta_1$当且仅当$E[\tilde{x}_1\tilde{x}_2^{\prime}]\beta_2=0$, 即$E[\tilde{x}_1\tilde{x}_2^{\prime}]=0$或$\beta_2=0$.

**练习2.2.**  证明: $E\left[(y-x^{\prime}_1\beta_1-x^{\prime}_2\beta_2-\beta_3)^2\right]\leq E\left[(y-x^{\prime}_1\gamma_1-\gamma_2)^2\right]$.

显然, 如果可能的话, 我们更愿意使用长回归模型来得到相应的系数$\beta_1$, 因为相比于短回归模型, 长回归模型是一个更加广义的模型, 并且达到了最优的投影误差. 然而在实际中, $x_2$有时候无法观测, 这使得我们无法使用长回归模型, 这种类型的遗漏变量偏误在应用计量经济学中非常普遍. 当然, 最理想的情况下我们希望能够直接观测到需要的回归量, 但现实可能并不会如此完美, 我们也许并不能直接得到这些数据. 相应地, 当数据不够理想时, 我们应该对于潜在的后果有相应的认识.

由于种种限制, 有时长回归是无法实现的, 此时只能退而求其次使用短回归模型. 但在有些情况下, 我们能够识别出遗漏变量偏差的符号, 这就意味着此时我们能够基于已有的知识对$\gamma_1$和$\beta_1$的大小关系进行判断, 这对于我们的推断也是十分有用的.

## 因果关系

### 结构与识别

经济学被称为社会科学皇冠上的明珠, 常常被拿来与物理学这颗自然科学皇冠上的明珠进行对比. 在开始本节内容之前, 我们对经济学与物理学进行一些对比, 以明确我们引入本节问题的必要性. 回想一下那些耳熟能详的物理定律, 比如爱因斯坦的质能方程$E=mc^{2}$, 比如牛顿的万有引力公式$F=Gm_1 m_2/r^2$. 这些物理学定律非常简洁明确, 体现着事物的一般规律. 经济学中是否也有这样的规律呢? 遗憾的是, 与物理学定律不同, 经济现象很少能够像这样被简洁地描述.

在物理学中, 实验是验证物理定律的重要方式. 在进行实验时, 科学家们常常会通过一些精巧的设计来控制可能影响实验结果的其他因素, 将噪声控制在可以忽略不计的水平上, 使得实验的信噪比尽可能高. 与之相反, 经济学规律并不适合在实验室里进行实验. 最糟糕的是, 经济学研究的对象, 人类, 具有很强的异质性, 有许许多多难以控制的特征. 对于同样的事件, 来自不同文化和家庭背景的人可能会做出不同的反应, 研究者很难对人们进行同质化的处理. 总结来说, 由于实验设置的缺陷与研究主体的异质性, 经济学规律中的信噪比要显著低于物理学定律.

我们再来回顾经济学中的两个经典课题: 教育回报与供求系统. 要研究教育回报问题, 我们需要控制其他因素对个人收入的影响, 但一个人的收入由其学术与职业道路中无数的随机因素决定, 经济学院不可能完美地观察并控制这些变量. 在供求问题中, 我们观察到的价格与市场总量是均衡的结果, 因此需求和供给二者是互相影响的. 如何在复杂的经济学问题中识别出因果关系?

但在讨论这个问题之前, 有一个重要的问题: 何为因果关系? 实际上, 因果关系本身的定义, 也经过了许多代思想家的争论. 在经济学中, **结构因果关系** (*structural causality*) 是一种可接受的定义. 结构因果关系是一种思想实验, 假设观察到的数据是由某一DGP生成的. 如果我们能够用数据还原出DGP或者其某些特征, 那么我们就能得到因果关系或者对因果关系的暗示.

 在观察实现的样本之前, 还有一个重要的问题需要解决, 这就是**识别** (*identification*) 问题. 考察一个模型 (或者DGP)中我们关注的每一个参数, 如果参数的取值不同, 相应观测到数据特征也所有不同, 我们就称模型是**可识别的** (*identified*). 相反, 如果一个模型中, 不同的参数可能会产生具有相同特征的数据, 我们就称这个模型是**不可识别的** (*under-identified*). 换言之, 如果对于给定的数据, 我们无法得到模型中唯一的参数, 那么模型就是不可识别的.

当然, 模型正确设定是讨论一切识别问题的先决条件. 但实际上, "所有的模型都是错误的", 因此在讨论识别问题时, 我们实际上是在一个想象的世界中进行. 如果在这样一个思想实验中, 我们仍然不能唯一确定DGP中的参数, 那么识别就失败了, 无论我们有多么大的样本量, 我们都无法确定正确的模型.

### 处置效应

因果关系与识别问题是非常大的课题, 我们这里缩小我们的讨论范围, 将研究框架限定在$y$和$x$的关系上. **处置效应** (*treatment effect*) 是一个我们特别感兴趣的问题. 假设我们关心的变量是$d$, 在保持其他所有变量不变 (包括不可观测的变量)的条件下改变一单位的$d$, 相应的$y$产生的改变就是处置效应. 拉丁语中*ceteris paribus*意为"其他条件不变", 就是这个意思.

**例2.1.**  在2020年新冠肺炎疫情期间, 香港地区的失业率升至高位, 消费也经历了较大的衰退. 为了提振经济,  政府向一些香港居民发放了1万港元的现金津贴. 我们感兴趣的问题是: 1万港元的津贴能增加多少消费? 对于每个个体, 我们想象有两个平行世界, 其中一个世界里这个个体获得了现金津贴, 记相应的消费为$Y(1)$; 而另一个世界中没有获得现金津贴, 相应的消费为$Y(0)$, 二者的差值就是该个体的处置效应. 这样的思想实验称为**潜在结果框架** (*potential outcome framework*).

然而, 在现实中, 有且仅有一种情况发生, 正如古希腊哲学家Heraclitus (553 BC--475 BC)所说, "人不能两次踏入同一条河流". 每个个体身上有且仅有一种结果得到实现, 因此个体的处置效应不具有**可操作性** (*operational*), 即无法从总体水平的数据计算出来. 但我们有很多个体的数据, 于是我们可以定义**平均处置效应** (*average treatment effect*, 即ATE)

$$
ATE=E[Y(1)-Y(0)]=E[Y(1)]-E[Y(0)].
$$

但我们注意到, $E[Y(1)]$和$E[Y(0)]$仍然不具有可操作性, 因此我们需要引入一个伴随变量

$$
D=1\{\text{treatment received}\}.
$$

一旦每个个体的处置状态被观测到, $E[Y(1)|D=1]$和$E[Y(0)|D=0]$就可以由已有的数据进行估计.

如果两种潜在结果$(Y(1),Y(0))$与伴随变量$D$独立, 则有$E[Y(1)]=E[Y(1)|D=1]$和$E[Y(0)]=E[Y(0)|D=0]$成立, 于是利用观测到的数据可以对ATE进行估计

$$
ATE=E[Y(1)|D=1]-E[Y(0)|D=0].
$$

因此, 为了得到ATE的理想估计, 我们需要用类似于彩票的方式随机地决定哪些人进入处理组 (*treatment group*, 此时$D=1$), 哪些人进入控制组 (*control group*, 此时$D=0$).

如果我们还有其它的控制变量, 我们也可以进一步定义在条件$x$上的处置效应:

$$
ATE(x)=E[Y(1)|x]-E[Y(0)|x].
$$

直观来看, ATE就是保持其它所有因素$x$不变的情况下, 假设对每个个体施加处置时的总体平均影响. 如果在条件$x$下, 处置变量$D$与$(Y(1),Y(0))$独立, 则ATE可以被已有数据估计:

$$
ATE(x)=E[Y(1)|D=1,x]-E[Y(0)|D=0,x]
$$

注意, 该式成立需要满足一个重要的条件, 即$((Y(1),Y(0))\perp D)|x$, 这个条件也被称为**条件独立假设** (*conditional independence assumption*, 即CIA).

**例2.2.**  条件独立假设CIA比完全的独立性更易满足. 考虑$Y(1)=x+u(1),\ Y(0)=x+u(0)$以及$D=1\{x+u_d\geq 0\}$. 如果有$((u(0),u(1))\perp u_d)|x$成立, 则条件独立假设CIA成立. 然而, $x$同时出现在这几个随机变量中, 因此$(Y(1),Y(0))$和$D$在统计学上是独立的.

### ATE与CEF

在前面一节, 我们讨论了$D$为二值变量时的情况. 现在我们来考虑连续的处置变量$D$. 假设数据生成过程DGP (或结构式模型)为$Y=h(D,x,u)$, 其中$D$和$x$是可观测的, 而$u$不可观测. 自然地, 我们在连续的处置变量$D$下定义ATE (在Hansen书的Chapter2.30中将其称为**平均因果效应**, *average causal effect*)

$$
ATE(d,x)=E\left[\lim_{\Delta\to 0}\frac{h(d+\Delta,x,u)-h(d,x,u)}{\Delta}\right]=E\left[\frac{\partial}{\partial d}h(d,x,u)\right],
$$

其中隐含了$h(d,x,u)$在$d$处连续可微的假设. 与二值的情况不同, 这里$d$显式地出现在了定义式$ATE(d,x)$中, 因为处置效应在不同的$d$下是变化的. 直观来看, 连续情况下的ATE就是保持其它所有因素$x$不变的情况下, 假设对每个个体施加的处置发生极小的变动时产生的总体平均影响.

在前面的章节中, 我们讨论了条件期望函数CEF $m(d,x)$, 这里我们加入了$d$, 表示它是我们感兴趣的变量. 我们的目标并不是对标的的经济机制$h(D,x,u)$进行建模, 那样会使得我们的工作变得非常复杂. 考虑一个简化的思路: $ATE(d,x)$具有结构性的因果解释 (structural causal interpretation), 而$m(d,x)$关心的仅仅是最优的预测, 我们能否利用$m(d,x)$得到$ATE(d,x)$? 在条件独立假设CIA下, 即$(u\perp D)|x$成立时, 答案是肯定的.

$$
\begin{align}
\frac{\partial}{\partial d}m(d,x)
&=\frac{\partial}{\partial d} E[y|d,x]=\frac{\partial}{\partial d}E[h(d,x,u)|d,x]=\frac{\partial}{\partial d}\int h(d,x,u)f(u|d,x)du\\
&=\int \frac{\partial}{\partial d}[h(d,x,u)f(u|d,x)]du\\
&=\int \left[\frac{\partial}{\partial d}h(d,x,u)\right]f(u|d,x)du+\int h(d,x,u)\left[\frac{\partial}{\partial d}f(u|d,x)\right]du
\end{align}
$$

上面推理过程的第二行隐含了求导符号与积分符号的可交换性. 在条件独立假设CIA下我们有$\frac{\partial}{\partial d}f(u|d,x)=0$, 因此最终结果中的第二项为$0$, 于是有

$$
\frac{\partial}{\partial d}m(d,x)=\int \left[\frac{\partial}{\partial d}h(d,x,u)\right]f(u|d,x)du
=E\left[\frac{\partial}{\partial d}h(d,x,u)\right]=ATE(d,x).
$$

这是一个非常重要的结论. 该结论表明, 如果条件独立假设CIA成立, 那么在$x$的条件下, 我们就可以利用条件均值函数CEF的偏导数来得到$d$对$y$的因果效应. 考虑一个极为常用的特例, 假设条件均值函数CEF为线性的, 即有$m(d,x)=\beta_d d+\beta^{\prime}_{x}x$, 那么$d$对$y$的因果效应就是相应的系数$\beta_d$.

条件独立假设CIA是连接条件均值函数CEF与因果效应的关键条件. 需要强调的是, CIA并不是一个无害的条件, 并不能随意地假设其成立. 因此在应用中, 只有当我们能够验证条件独立假设CIA时, 得到的因果结论才是可信的.

**练习2.3.**  假设工厂的产出服从柯布-道格拉斯函数$Y=AK^{\alpha}L^{\beta}$, 其中资本水平$K$, 劳动投入$L$和产出$Y$是可观测的, 而技术水平$A$是无法直接观测的. 在等式两边取对数得到

$$
y=u+\alpha k+\beta l \tag{2.3}
$$

其中$y=\log Y,\ u=\log A,\ k=\log K,\ l=\log L$. 假设真实的DGP由下面的参数生成:

$$
\left(\begin{array}{r}
u\\
k\\
l
\end{array} \right)
\sim
N
\left(
\left(
\begin{array}{r}
1\\
1\\
1
\end{array}
\right),
\left(
\begin{array}{cc}
1 &0.5 &0\\
0.5 &1 &0\\
0 &0 &1
\end{array}
\right)
\right),
\alpha=\beta=1/2
$$

注意到这里的$u$和$k$是相关的, 因为大规模的工程能够负担起机器人的费用, 从而实现自动化生产.

1.  对于固定的劳动水平$l$, 当我们以$k$作为处置变量时, 求相应条件期望函数CEF的偏导数. (提示: 由于联合正态性, 条件期望函数CEF是线性的)
2.  它是否等于因果模型 (2.3) 中的系数$\alpha=1/2$? (提示: 不是, 因为CIA被打破了)

有时候, 应用工作者会简单粗暴地将DGP假设为$y=m(d,x)+u$, 其中$E[u|d,x]=0$. 其中$d$为我们感兴趣的变量, $x$为控制变量组成的向量. 在这些假设下, 我们有

$$
ATE(d,x)=E\left[\frac{\partial}{\partial d}(m(d,x)+u)|d,x\right]=\frac{\partial m(d,x)}{\partial d}+\frac{\partial}{\partial d}E[u|d,x]=\frac{\partial m(d,x)}{\partial d},
$$

其中第二个等式在$\frac{\partial}{\partial d}E[u|d,x]=E\left[\frac{\partial}{\partial d}u|d,x\right]$满足时成立. 乍一看, 这里只需要满足均值独立假设$E[u|d,x]=0$就能建立起$ATE(d,x)$和$\partial m(d,x)/\partial d$之间的等价关系, 并且这一条件弱于条件独立假设CIA, 似乎是一个非常好的结果. 然而, 我们为这个条件的轻微弱化付出了严重的代价: 我们假设$h(d,x,u)$服从$m(d,x)+u$这样一个可以用加法分离的形式, 而这是一个非常强的假设. 我们对DGP作出的这一假设并没有得到经济理论的支撑, 这至多算是**简约形式** (*reduced-form*) 下的最优选择.

这里我们作进一步的说明. **结构式方法** (*structural approach*) 由经济理论指导, 对经济机制建模. **简约式方法** (*reduced-form approach*) 则非常简便, 在无法便捷地建立合适的经济模型时可以用于一些典型事实. 这两种方法的优缺点, 是一个长久的论题, 参见 *Jorimal of Economic Perspectives* Vol. 24, No. 2 Spring 2010. 考虑一个经典的例子, 在宏观经济学中, 所谓的菲利普斯曲线由A.W. Phillips提出, 它揭示了通胀与失业之间的负相关关系, 是一个典型事实, 它就是通过简约式方法得到的. 卢卡斯批判 (Lucas, 1976) 揭示了它在微观基础方面的缺失, 提倡进行深度的建模, 对那些不随政策改变的参数进行建模, 这就是一种结构式方法. 但具有讽刺意味的是, 距离卢卡斯批判的提出已有40余年, 这类几乎没有微观基础的方程仍然在央行官员的分析工具中占据着主导地位. 那么, 看似精美但无法普及的深度建模就一定是更优点方法吗?

## 总结

在本章中, 我们讨论了条件均值函数与因果关系. 对于从联合分布中抽样的一对随机变量$(y,x)$, 条件期望函数CEF为最优预测. 进一步我们讨论了处置变量$d$与被解释变量$y$之间的结构因果关系, 证明了在条件独立条件CIA下ATE与CEF的偏导数之间的等价性. 当然, 我们目前的讨论都是总体下的结论, 还没有涉及到样本的结论.

**历史记录:** 回归与条件期望是统计学中的重要概念, 这两个概念很早就被引入了计量经济学中. Cowles委员会 (现Cowles经济学研究基金会) 的研究者们, 包括Jacob Marschak (1898-1977), Tjalling Koopmans (1910-1985, 获1975年诺贝尔经济学奖), Trygve Haavelmo (1977-1999, 获1989年诺贝尔经济学奖), 都是计量经济学中结构式方法的开拓者.

潜在结果框架 (potential outcome framework) 并非经济学独有的, 它同时也被广泛用于生物统计学和医药研究等领域. 它最初由Jerzy Neyman (1894-1981) 提出, 并且由清华大学统计学教授Donald B. Rubin (1943-) 进一步发展.

**进一步阅读:** Lewbel (2019) 给出了一份计量经济学中识别问题的全面总结. 会计学是一个重要的应用领域, 其中许多声明的因果推断都是由简单的回归得到. 很高兴听到Gow et al. (2016) 在他们的实践中反映因果关系.


## 参考文献

Gow, I. D., D. F. Larcker, and P.C. Reiss (2016). Causal inference in accounting research. *Journal of Accounting Research 54*(2), 477-523. 2.4

Lewbel, A. (2019). The identification zoo: Meanings of identification in econometrics. Journal of Economic Literature 57(4), 835-903. 2.4

Lucas, R. E. (1976). Econometric policy evaluation: A critique. In *Carnegie-Rochester conference series on public policy*, Volume 1, pp. 19-46. 2.3
