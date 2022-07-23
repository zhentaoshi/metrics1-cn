---
bibliography:
- 'ref\_teaching.bib'
---

\setcounter{chapter}{10}
Generalized Method of Moments
=============================

*Generalized method of moments* (GMM) [@hansen1982large] is an
estimation principle that extends *method of moments*. It seeks the
parameter value that minimizes a quadratic form of the moments. It is
particularly useful in estimating structural economic models in which
moment conditions can be derived from underlying economic theory. GMM
emerges as one of the most popular estimators in modern econometrics. It
includes conventional methods like the two-stage least squares (2SLS)
and the three-stage least square as special cases.

Instrumental Regression
-----------------------

We first discuss estimation in a linear single structural equation
$$y_{i}=x_{i}'\beta+\epsilon_{i}$$ with $K$ regressors. Identification
is a prerequisite for structural estimation. From now on we always
assume that the model is identified: there is an $L\times1$ vector of
instruments $z_{i}$ such that
$\mathbb{E}\left[z_{i}\epsilon_{i}\right]=0_{L}$ and
$\Sigma:=\mathbb{E}\left[z_{i}x_{i}'\right]$ is of full column rank.
Denote $\beta_{0}$ as the root of the equation
$E\left[z_{i}\left(y_{i}-x_{i}'\beta\right)\right]=0_{L}$, which is
uniquely identified.

### Just-identification

When $L=K$, the instrumental regression model is *just-identified*, or
*exactly identified*. The orthogonality condition implies
$$\Sigma\beta_{0}=\mathbb{E}\left[z_{i}y_{i}\right],$$ and we can solve
express $\beta_{0}$ as
$$\beta_{0}=\Sigma^{-1}\mathbb{E}\left[z_{i}y_{i}\right]\label{eq:just_beta}$$
in closed form.

The closed-form solution naturally motivates an estimator in which we
replace the population methods by the sample moments and this is a
method-of-moments estimator. Nevertheless, we postpone the discussion of
this estimator to the next section.

### Over-identification

When $L>K$, the model is *over-identified*. The orthogonality condition
still implies
$$\Sigma\beta_{0}=\mathbb{E}\left[z_{i}y_{i}\right],\label{eq:moment2}$$
but $\Sigma$ is not a square matrix so we cannot write $\beta_{0}$ as
that in ([\[eq:just\_beta\]](#eq:just_beta){reference-type="ref"
reference="eq:just_beta"}). In order to express $\beta_{0}$ explicitly,
we define a criterion function
$$Q\left(\beta\right)=\mathbb{E}\left[z_{i}\left(y_{i}-x_{i}\beta\right)\right]'W\mathbb{E}\left[z_{i}\left(y_{i}-x_{i}\beta\right)\right],$$
where $W$ is an $L\times L$ positive-definite non-random symmetric
matrix. (The choice of $W$ will be discussed soon.) Because of the
quadratic form, $Q\left(\beta\right)\geq0$ for all $\beta$.
Identification indicates that $Q\left(\beta\right)=0$ if and only if
$\beta=\beta_{0}$. Therefore we conclude
$$\beta_{0}=\arg\min_{\beta}Q\left(\beta\right)$$ is the unique
minimizer. Since $Q\left(\beta\right)$ is a smooth function of $\beta$,
the minimizer $\beta_{0}$ can be characterized by the first-order
condition
$$0_{K}=\frac{\partial}{\partial\beta}Q\left(\beta_{0}\right)=-2\Sigma'W\mathbb{E}\left[z_{i}\left(y_{i}-x_{i}\beta_{0}\right)\right]$$
Rearranging the above equation, we have
$$\Sigma'W\Sigma\beta_{0}=\Sigma'W\mathbb{E}\left[z_{i}y_{i}\right].$$
Under the rank condition $\Sigma'W\Sigma$ is invertible so that we can
solve
$$\beta_{0}=\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\mathbb{E}\left[z_{i}y_{i}\right].\label{eq:over_beta}$$
Because we have more moments ($L$) than the number of unknown parameters
($K$), we call it the *generalized* method of moments.

The above equation can be derived by pre-multiplying $\Sigma'W$ on the
both sides of ([\[eq:moment2\]](#eq:moment2){reference-type="ref"
reference="eq:moment2"}) without referring to the minimization problem.

Although we separate the discussion of the just-identified case and the
over-identified case, the latter
([\[eq:over\_beta\]](#eq:over_beta){reference-type="ref"
reference="eq:over_beta"}) actually takes
([\[eq:just\_beta\]](#eq:just_beta){reference-type="ref"
reference="eq:just_beta"}) as a special case. In this sense, GMM is
genuine generalization of the method of moments. to see this point,
notice that when $L=K$, given any $W$ we have $$\begin{aligned}
\beta_{0} & =\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\mathbb{E}\left[z_{i}y_{i}\right]=\Sigma^{-1}W^{-1}(\Sigma')^{-1}\Sigma'W\mathbb{E}\left[z_{i}y_{i}\right]\\
 & =\Sigma^{-1}W^{-1}W\mathbb{E}\left[z_{i}y_{i}\right]=\Sigma^{-1}\mathbb{E}\left[z_{i}y_{i}\right],\end{aligned}$$
as $\Sigma$ is a square matrix. That is to say, in the just-identified
case $W$ plays no role because any choices of $W$ lead to the same
explicit solution of $\beta_{0}$.

GMM Estimator
-------------

In practice, we use the sample moments to replace the corresponding
population moments. The GMM estimator mimics its population formula.
$$\begin{aligned}
\widehat{\beta} & = & \left(\frac{1}{n}\sum x_{i}z_{i}'W\frac{1}{n}\sum z_{i}x_{i}'\right)^{-1}\frac{1}{n}\sum x_{i}z_{i}'W\frac{1}{n}\sum z_{i}y_{i}\\
 & = & \left(\frac{X'Z}{n}W\frac{Z'X}{n}\right)^{-1}\frac{X'Z}{n}W\frac{Z'y}{n}\\
 & = & \left(X'ZWZ'X\right)^{-1}X'ZWZ'y.\end{aligned}$$ Under
just-identification, this expression includes the 2SLS estimator
$$\hat{\beta}=\left(\frac{Z'X}{n}\right)^{-1}\frac{Z'y}{n}=\left(Z'X\right)^{-1}Z'y$$
as a special case.

\medskip{}
The same GMM estimator $\hat{\beta}$ can be obtained by minimizing
$$Q_{n}\left(\beta\right)=\left[\frac{1}{n}\sum_{i=1}^{n}z_{i}\left(y_{i}-x_{i}\beta\right)\right]'W\left[\frac{1}{n}\sum_{i=1}^{n}z_{i}\left(y_{i}-x_{i}\beta\right)\right]=\frac{\left(y-X\beta\right)'Z}{n}W\frac{Z'\left(y-X\beta\right)}{n},$$
or more concisely
$\hat{\beta}=\arg\min_{\beta}\left(y-X\beta\right)'ZWZ'\left(y-X\beta\right).$

\medskip{}
Now we check the asymptotic properties of $\widehat{\beta}$. A few
assumptions are in order.

$Z'X/n\stackrel{\mathrm{p}}{\to}\Sigma$ and
$Z'\epsilon/n\stackrel{\mathrm{p}}{\to}0_{L}$.

A.1 assumes that we can apply a law of large numbers, so that that the
sample moments $Z'X/n$ and $Z'\epsilon/n$ converge in probability to
their population counterparts.

Under Assumption A.1, $\widehat{\beta}$ is consistent.

The step is similar to the consistency proof of OLS. $$\begin{aligned}
\widehat{\beta} & =\left(X'ZWZ'X\right)^{-1}X'ZWZ'\left(X'\beta_{0}+\epsilon\right)\\
 & =\beta_{0}+\left(\frac{X'Z}{n}W\frac{Z'X}{n}\right)^{-1}\frac{X'Z}{n}W\frac{Z'\epsilon}{n}\\
 & \stackrel{\mathrm{p}}{\to}\beta_{0}+\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W0=\beta_{0}.\qedhere\end{aligned}$$

To check asymptotic normality, we assume that a central limit theorem
can be applied.

$\frac{1}{\sqrt{n}}\sum_{i=1}^{n}z_{i}\epsilon_{i}\stackrel{d}{\to}N\left(0_{L},\Omega\right)$,
where $\Omega=\mathbb{E}\left[z_{i}z_{i}'\epsilon_{i}^{2}\right].$

Under Assumptions A.1 and A.2,
$$\sqrt{n}\left(\widehat{\beta}-\beta_{0}\right)\stackrel{d}{\to}N\left(0_{K},\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\Omega W\Sigma\left(\Sigma'W\Sigma\right)^{-1}\right).\label{eq:normality}$$

Multiply $\widehat{\beta}-\beta_{0}$ by the scaling factor $\sqrt{n}$,
$$\sqrt{n}\left(\widehat{\beta}-\beta_{0}\right)=\left(\frac{X'Z}{n}W\frac{Z'X}{n}\right)^{-1}\frac{X'Z}{n}W\frac{Z'\epsilon}{\sqrt{n}}=\left(\frac{X'Z}{n}W\frac{Z'X}{n}\right)^{-1}\frac{X'Z}{n}W\frac{1}{\sqrt{n}}\sum_{i=1}^{n}z_{i}'\epsilon_{i}.$$
The conclusion follows by the Slutsky's theorem as
$$\frac{X'Z}{n}W\frac{Z'X}{n}\stackrel{\mathrm{p}}{\to}\Sigma'W\Sigma$$
and
$$\frac{X'Z}{n}W\frac{1}{\sqrt{n}}\sum z_{i}'\epsilon_{i}\stackrel{d}{\to}\Sigma'W\times N\left(0,\Omega\right)\sim N\left(0,\Sigma'W\Omega W\Sigma\right).\qedhere$$

### Efficient GMM

It is clear from ([\[eq:normality\]](#eq:normality){reference-type="ref"
reference="eq:normality"}) that the GMM estimator's asymptotic variance
depends on the choice of $W$. Which $W$ makes the asymptotic variance as
small as possible? The answer is $W=\Omega^{-1}$, under which the
efficient asymptotic variance is
$$\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}\Sigma'\Omega^{-1}\Omega\Omega^{-1}\Sigma\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}=\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}.$$

For any positive definite symmetric matrix $W$, the difference
$$\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\Omega W\Sigma\left(\Sigma'W\Sigma\right)^{-1}-\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}$$
is positive semi-definite.

To simplify notation, denote
$A:=W\Sigma\left(\Sigma'W\Sigma\right)^{-1}$ and
$B:=\Omega^{-1}\Sigma\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}$ and
then the difference of the two matrices becomes $$\begin{aligned}
 &  & \left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\Omega W\Sigma\left(\Sigma'W\Sigma\right)^{-1}-\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}\\
 & = & A'\Omega A-B'\Omega B\\
 & = & \left(A-B+B\right)'\Omega\left(A-B+B\right)-B'\Omega B\\
 & = & \left(A-B\right)'\Omega\left(A-B\right)+\left(A-B\right)'\Omega B+B'\Omega\left(A-B\right).\end{aligned}$$
Notice that $$\begin{aligned}
B'\Omega A & =\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}\Sigma'\Omega^{-1}\Omega W\Sigma\left(\Sigma'W\Sigma\right)^{-1}\\
 & =\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}\Sigma'W\Sigma\left(\Sigma'W\Sigma\right)^{-1}=\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}=B'\Omega B,\end{aligned}$$
which implies $B'\Omega\left(A-B\right)=0$ and
$\left(A-B\right)'\Omega B=0$. We thus conclude that
$$\left(\Sigma'W\Sigma\right)^{-1}\Sigma'W\Omega W\Sigma\left(\Sigma'W\Sigma\right)^{-1}-\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}=\left(A-B\right)'\Omega\left(A-B\right)$$
is positive semi-definite.

### Two-Step GMM

The *two-step GMM* is one way to construct a feasible efficient GMM
estimator.

1.  Choose any valid $W$, say $W=I_{L}$, to get a consistent (but
    inefficient in general) estimator
    $\hat{\beta}^{\sharp}=\hat{\beta}^{\sharp}\left(W\right)$. Save the
    residual $\widehat{\epsilon}_{i}=y_{i}-x_{i}'\hat{\beta}^{\sharp}$
    and estimate the variance matrix
    $\widehat{\Omega}=\frac{1}{n}\sum z_{i}z_{i}'\widehat{\epsilon}_{i}^{2}.$
    Notice that this $\widehat{\Omega}$ is a consistent for $\Omega$.

2.  Set $W=\widehat{\Omega}^{-1}$ and obtain the second estimator
    $$\widehat{\beta}^{\natural}=\widehat{\beta}^{\natural}(\widehat{\Omega}^{-1})=\left(X'Z\widehat{\Omega}^{-1}Z'X\right)^{-1}X'Z\widehat{\Omega}^{-1}Z'y.$$
    This second estimator is asymptotic efficient.

Show that if $\widehat{\Omega}\stackrel{p}{\to}\Omega$, then
$\sqrt{n}\left(\widehat{\beta}^{\natural}(\widehat{\Omega}^{-1})-\widehat{\beta}\left(\Omega^{-1}\right)\right)\stackrel{p}{\to}0$.
In other words, the feasible estimator
$\widehat{\beta}^{\natural}(\widehat{\Omega}^{-1})$ is asymptotically
equivalent to the infeasible efficient estimator
$\widehat{\beta}\left(\Omega^{-1}\right)$.

### Two Stage Least Squares

If we further assume conditional homoskedasticity
$\mathbb{E}\left[\epsilon_{i}^{2}|z_{i}\right]=\sigma^{2}$, then
$$\Omega=\mathbb{E}\left[z_{i}z_{i}'\epsilon_{i}^{2}\right]=\mathbb{E}\left[z_{i}z_{i}'\mathbb{E}\left[\epsilon_{i}^{2}|z_{i}\right]\right]=\sigma^{2}\mathbb{E}\left[z_{i}z_{i}'\right].$$
In the first-step of the two-step GMM we can estimate the variance of
the error term by
$\widehat{\sigma}^{2}=\frac{1}{n}\sum_{i=1}^{n}\widehat{\epsilon}_{i}^{2}$
and the variance matrix by
$\widehat{\Omega}=\widehat{\sigma}^{2}\frac{1}{n}\sum_{i=1}^{n}z_{i}z_{i}'=\widehat{\sigma}^{2}Z'Z/n$.
When we plug this $W=\widehat{\Omega}^{-1}$ into the GMM estimator,
$$\begin{aligned}
\widehat{\beta} & = & \left(X'Z\left(\widehat{\sigma}^{2}\frac{Z'Z}{n}\right)^{-1}Z'X\right)^{-1}X'Z\left(\widehat{\sigma}^{2}\frac{Z'Z}{n}\right)^{-1}Z'y\\
 & = & \left(X'Z\left(Z'Z\right)^{-1}Z'X\right)^{-1}X'Z\left(Z'Z\right)^{-1}Z'y.\end{aligned}$$
This is exactly the same expression of 2SLS for $L>K$. Therefore, 2SLS
can be viewed as a special case of GMM with the weighting matrix
$\left(Z'Z/n\right)^{-1}$. Under conditional homoskedasticity, 2SLS is
the efficient estimator. 2SLS is inefficient in general cases of
heteroskedasticity, despite its popularity.

2SLS gets its name because it can be obtained using two steps: first
regress $X$ on all instruments $Z$, and then regress $y$ on the fitted
value along with the included exogenous variables. However, 2SLS can
actually be obtained by one step using the above equation. It is a
special case of GMM.

If an efficient estimator is not too difficult to implement, an
econometric theorist would prefer the efficient estimator to an
inefficient estimator. The benefits of using the efficient estimator is
not limited to more accurate coefficient estimation. Many specification
tests, for example the $J$-statistic we will introduce soon, count on
the efficient estimator to lead to a familiar $\chi^{2}$ distribution
under null hypotheses. Otherwise their null asymptotic distributions
will be non-standard and thereby critical values must be found by Monte
Carlo simulations.

GMM in Nonlinear Model
----------------------

The principle of GMM can be used in models where the parameter enters
the moment conditions nonlinearly. Let
$g_{i}\left(\beta\right)=g\left(w_{i},\beta\right)\mapsto\mathbb{R}^{L}$
be a function of the data $w_{i}$ and the parameter $\beta$. If economic
theory implies $\mathbb{E}\left[g_{i}\left(\beta\right)\right]=0$, which
the statisticians call the *estimating equations*, we can write the GMM
population criterion function as
$$Q\left(\beta\right)=\mathbb{E}\left[g_{i}\left(\beta\right)\right]'W\mathbb{E}\left[g_{i}\left(\beta\right)\right]$$

Nonlinear models nest the linear model as a special case. For the linear
IV model in the previous section, the data is
$w_{i}=\left(y_{i},x_{i},z_{i}\right)$, and the moment function is
$g\left(w_{i},\beta\right)=z_{i}'\left(y_{i}-x_{i}\beta\right)$.

In practice we use the sample moments to mimic the population moments in
the criterion function
$$Q_{n}\left(\beta\right)=\left(\frac{1}{n}\sum_{i=1}^{n}g_{i}\left(\beta\right)\right)'W\left(\frac{1}{n}\sum_{i=1}^{n}g_{i}\left(\beta\right)\right).$$
The GMM estimator is defined as
$$\hat{\beta}=\arg\min_{\beta}Q_{n}\left(\beta\right).$$ In these
nonlinear models, a closed-form solution is in general unavailable,
while the asymptotic properties can still be established. We state these
asymptotic properties without proofs.

\(a) If the model is identified, and
$$\mathbb{P}\left\{ \sup_{\beta\in\mathcal{B}}\big|\frac{1}{n}\sum_{i=1}^{n}g_{i}\left(\beta\right)-\mathbb{E}\left[g_{i}\left(\beta\right)\right]\big|>\varepsilon\right\} \to0$$
for any constant $\varepsilon>0$ where the parametric space
$\mathcal{B}$ is a closed set, then
$\hat{\beta}\stackrel{\mathrm{p}}{\to}\beta.$\
(b) If in addition
$\frac{1}{\sqrt{n}}\sum_{i=1}^{n}g_{i}\left(\beta_{0}\right)\stackrel{d}{\to}N\left(0,\Omega\right)$
and
$\Sigma=\mathbb{E}\left[\frac{\partial}{\partial\beta'}g_{i}\left(\beta_{0}\right)\right]$
is of full column rank, then
$$\sqrt{n}\left(\hat{\beta}-\beta_{0}\right)\stackrel{d}{\to}N\left(0,\left(\Sigma'W\Sigma\right)^{-1}\left(\Sigma'W\Omega W\Sigma\right)\left(\Sigma'W\Sigma\right)^{-1}\right)$$
where
$\Omega=\mathbb{E}\left[g_{i}\left(\beta_{0}\right)g_{i}\left(\beta_{0}\right)'\right]$.\
(c) If we choose $W=\Omega^{-1}$, then the GMM estimator is efficient,
and the asymptotic variance becomes
$\left(\Sigma'\Omega^{-1}\Sigma\right)^{-1}$.

The list of assumptions in the above statement is incomplete. We only
lay out the key conditions but neglect some technical details.

$Q_{n}\left(\beta\right)$ measures how close are the moments to zeros.
It can serve as a test statistic with proper scaling. Under the null
hypothesis $\mathbb{E}\left[g_{i}\left(\beta\right)\right]=0_{L}$, this
Sargan-Hansen $J$-test checks whether a moment condition is violated.
The test statistic is $$\begin{aligned}
J\left(\widehat{\beta}\right) & =nQ_{n}\left(\widehat{\beta}\right)=n\left(\frac{1}{n}\sum_{i=1}^{n}g_{i}\left(\widehat{\beta}\right)\right)'\widehat{\Omega}^{-1}\left(\frac{1}{n}\sum_{i=1}^{n}g_{i}\left(\widehat{\beta}\right)\right)\\
 & =\left(\frac{1}{\sqrt{n}}\sum_{i=1}^{n}g_{i}\left(\widehat{\beta}\right)\right)'\widehat{\Omega}^{-1}\left(\frac{1}{\sqrt{n}}\sum_{i=1}^{n}g_{i}\left(\widehat{\beta}\right)\right)\end{aligned}$$
where $\widehat{\Omega}$ is a consistent estimator of $\Omega$, and
$\widehat{\beta}$ is an efficient estimator, for example, the two-step
GMM estimator $\widehat{\beta}^{\natural}(\widehat{\Omega}^{-1})$. This
statistic converges in distribution to a $\chi^{2}$ random variable with
degree of freedom $L-K$. That is, under the null,
$$J\left(\widehat{\beta}\right)\stackrel{d}{\to}\chi^{2}\left(L-K\right).$$
If the null hypothesis is false, then the test statistic tends to be
large and it is more likely to reject the null.

Summary
-------

The popularity of GMM in econometrics comes from the fact that economic
theory is often not informative enough about the underlying parametric
relationship amongst the variables. Instead, many economic assumptions
suggest moment restrictions. From example, the *efficient market
hypothesis* postulates that the future price movement $\Delta p_{t+1}$
cannot be predicted by available past information set $\mathscr{I}_{t}$
so that $\mathbb{E}\left[\Delta p_{t+1}|\mathscr{I}_{t}\right]=0$. It
implies that any functions of the variables in the information set
$\mathscr{I}_{t}$ are orthogonal to $\Delta p_{t+1}$. A plethora of
moment conditions can be constructed in order to test the efficient
market hypothesis.

Conceptually simple though, GMM has many practical issues in reality.
There has been vast econometric literature about issues of GMM and their
remedies.

**Historical notes**: 2SLS was attributed to @theil1953repeated. In the
linear IV model, the $J$-statistic was proposed by
@sargan1958estimation, and @hansen1982large extended it to nonlinear
models.

**Further reading**: The quadratic form of GMM makes it difficult to
accommodate many moments in the big data problems. *Empirical
likelihood* is an alternative estimator to GMM to estimate models
defined by moment restrictions. @shi2016econometric solves the
estimation problem of high-dimensional moments under the framework of
empirical likelihood.

\bigskip
` Zhentao Shi. Dec 3, 2020.`

\bibliographystyle{chicagoa}
