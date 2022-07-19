---
bibliography:
- 'ref\_teaching.bib'
---

\setcounter{chapter}{5}
Asymptotic Properties of Least Squares
======================================

We have learned some basic asymptotic theory in the previous chapter. We
apply these results to study asymptotic properties of the OLS estimator
$\widehat{\beta}=\left(X'X\right)^{-1}X'Y$, which is of key interest in
our course. We will show (i) $\widehat{\beta}$ is a consistent estimator
of the linear projection coefficient $\beta$; (ii) $\widehat{\beta}$ is
asymptotically normal; (iii) the asymptotic normality allows asymptotic
inference of $\beta$; (iv) under what condition the variance components
in the test statistic can be consistently estimated so that the testing
procedure is make feasible.

Consistency
-----------

*Consistency* is the most basic requirement for estimators in large
sample. Intuitively, it says that when the sample size is arbitrarily
large, a desirable estimator should be arbitrarily close (in the sense
of convergence in probability) to the population quantity of interest.
Otherwise, if an estimator still deviates from the object of interest
under infinite sample size, it is hard to persuade other researchers to
use such an estimator unless compelling justification is provided.

For a generic estimator $\widehat{\theta}$, we say $\widehat{\theta}$ is
*consistent* for $\theta$ if $\widehat{\theta}\stackrel{p}{\to}\theta$,
where $\theta$ is some non-random object.

In OLS, we say $\widehat{\beta}$ is *consistent* if
$\widehat{\beta}\stackrel{p}{\to}\beta$ as $n\to\infty$, where $\beta$
is the linear projection coefficient of the population model
$y_{i}=x_{i}'\beta+e_{i}$ with $E\left[x_{i}e_{i}\right]=0$. To verify
consistency, we write
$$\widehat{\beta}-\beta=\left(X'X\right)^{-1}X'e=\left(\frac{1}{n}\sum_{i=1}^{n}x_{i}x_{i}'\right)^{-1}\frac{1}{n}\sum_{i=1}^{n}x_{i}e_{i}.\label{eq:ols_d}$$

For simplicity, in this chapter we discuss the iid setting only. The
first term, by LLN,
$$\widehat{Q}:=\frac{1}{n}\sum_{i=1}^{n}x_{i}x_{i}'\stackrel{p}{\to}Q:=E\left[x_{i}x_{i}'\right].$$
Here $\widehat{Q}$ is the sample mean of $x_{i}x_{i}'$ and $Q$ is the
population mean of $x_{i}x_{i}'$. The second term, again by LLN,
$$\frac{1}{n}\sum_{i=1}^{n}x_{i}e_{i}\stackrel{p}{\to}0.$$ The
continuous mapping theorem immediately implies
$$\widehat{\beta}-\beta\stackrel{p}{\to}Q^{-1}\times0=0.$$ The OLS
estimator $\widehat{\beta}$ is a consistent estimator of $\beta$.

No matter whether $\left(y_{i},x_{i}\right)_{i=1}^{n}$ is an iid, or
inid, or dependent sample, consistency holds as long as the convergence
in probability holds for the above two expressions and $Q$ is an
invertible matrix.

Asymptotic Distribution
-----------------------

In finite sample, $\widehat{\beta}$ is a random variable. We have shown
the distribution of $\widehat{\beta}$ under normality before. Without
the restrictive normality assumption, how can we characterize the
randomness of the OLS estimator?

We know from the previous section that
$\hat{\beta}-\beta\stackrel{p}{\to}0$ degenerates to a constant. To
study its distribution, we must scale it up by a proper multiplier so
that in the limit it neither degenerates nor explodes. The suitable
scaling factor is $\sqrt{n}$, as in a CLT.
$$\sqrt{n}\left(\widehat{\beta}-\beta\right)=\left(\frac{1}{n}\sum_{i=1}^{n}x_{i}x_{i}'\right)^{-1}\frac{1}{\sqrt{n}}\sum_{i=1}^{n}x_{i}e_{i}.$$
Since $E\left[x_{i}e_{i}\right]=0$, we apply a CLT to obtain
$$\frac{1}{\sqrt{n}}\sum_{i=1}^{n}x_{i}e_{i}\stackrel{d}{\to}N\left(0,\Sigma\right)$$
where $\Sigma=E\left[x_{i}x_{i}'e_{i}^{2}\right]$. By the continuous
mapping theorem,
$$\sqrt{n}\left(\widehat{\beta}-\beta\right)\stackrel{d}{\to}Q^{-1}\times N\left(0,\Sigma\right)\sim N\left(0,\Omega\right)\label{eq:asym_norm}$$
where $\Omega=Q^{-1}\Sigma Q^{-1}$ is called the *asymptotic variance*.
This result is the *asymptotic normality* of the OLS estimator.

The asymptotic variance $\Omega=Q^{-1}\Sigma Q^{-1}$ is called of the
*sandwich form*. It can be simplified under conditional homoskedasticity
$E\left[e_{i}^{2}|x_{i}\right]=\sigma^{2}$ for all $i$, which gives
$$\Sigma=E\left[x_{i}x_{i}'e_{i}^{2}\right]=E\left[x_{i}x_{i}'E\left[e_{i}^{2}|X\right]\right]=\sigma^{2}E\left[x_{i}x_{i}'\right]=\sigma^{2}Q.$$
In this case, $\Omega=Q^{-1}\Sigma Q^{-1}=\sigma^{2}Q^{-1}$, and thus
$$\sqrt{n}\left(\widehat{\beta}-\beta\right)\stackrel{d}{\to}N\left(0,\sigma^{2}Q^{-1}\right).\label{eq:asym_norm_homo}$$

If we are interested in the $k$-th parameter $\beta_{k}$, then the joint
distribution in
([\[eq:asym\_norm\]](#eq:asym_norm){reference-type="eqref"
reference="eq:asym_norm"}) implies $$\begin{aligned}
\sqrt{n}\left(\widehat{\beta}_{k}-\beta_{k}\right) & =\sqrt{n}\eta_{k}'\left(\widehat{\beta}-\beta\right)\nonumber \\
 & \stackrel{d}{\to}N\left(0,\sigma^{2}\eta_{k}'Q^{-1}\eta_{k}\right)\sim N\left(0,\sigma^{2}[Q^{-1}]_{kk}\right),\label{eq:asym_norm_homok}\end{aligned}$$
where $\eta_{k}=\left(0,\ldots,0,1,0\ldots,0\right)'$ is the selector of
the $k$-th element.

If $\Omega^{-1/2}$ is multiplied on both sides of
[\[eq:asym\_norm\]](#eq:asym_norm){reference-type="eqref"
reference="eq:asym_norm"}, we have
$$\Omega^{-1/2}\sqrt{n}\left(\widehat{\beta}-\beta\right)\stackrel{d}{\to}N\left(0,I_{K}\right).\label{eq:asym_norm-pivot}$$
We say the asymptotic distribution in
[\[eq:asym\_norm-pivot\]](#eq:asym_norm-pivot){reference-type="eqref"
reference="eq:asym_norm-pivot"}, $N\left(0,I_{K}\right)$, is *pivotal*
because it does not involve any unknown parameter. In contrast, the
asymptotic distribution in
[\[eq:asym\_norm\]](#eq:asym_norm){reference-type="eqref"
reference="eq:asym_norm"} is not pivotal because $\Omega$ is unknown in
$N\left(0,\Omega\right)$. If we are interested in the $k$-th parameter
$\beta_{k}$, we can write
[\[eq:asym\_norm-pivot\]](#eq:asym_norm-pivot){reference-type="eqref"
reference="eq:asym_norm-pivot"} into the pivotal form as
$$\frac{\sqrt{n}\left(\widehat{\beta}_{k}-\beta_{k}\right)}{\sqrt{\sigma^{2}[Q^{-1}]_{kk}}}\stackrel{d}{\to}N\left(0,1\right).\label{eq:asym_norm_homok_pivot}$$

Asymptotic Inference
--------------------

Up to now we have derived the asymptotic distribution of
$\widehat{\beta}$. However,
[\[eq:asym\_norm\]](#eq:asym_norm){reference-type="eqref"
reference="eq:asym_norm"} or
[\[eq:asym\_norm-pivot\]](#eq:asym_norm-pivot){reference-type="eqref"
reference="eq:asym_norm-pivot"} will be useful for statistical inference
only if $\Omega$ is known. In reality $\Omega$ is mostly unknown, and
therefore we will need to estimate it to make statistical inference
feasible. Suppose $\tilde{\Omega}$ is any consistent estimator for
$\Omega$ in that $\tilde{\Omega}\stackrel{p}{\to}\Omega$. When we
replace $\Omega$ in
[\[eq:asym\_norm-pivot\]](#eq:asym_norm-pivot){reference-type="eqref"
reference="eq:asym_norm-pivot"} with $\tilde{\Omega}$, we have
$$\begin{aligned}
\tilde{\Omega}^{-1/2}\sqrt{n}\left(\widehat{\beta}-\beta\right) & =\tilde{\Omega}^{-1/2}\Omega^{1/2}\times\Omega^{-1/2}\sqrt{n}\left(\widehat{\beta}-\beta\right).\end{aligned}$$
Because $\Omega$ is positive definite, we have the first factor
$\tilde{\Omega}^{-1/2}\Omega^{1/2}\stackrel{p}{\to}I_{K}$ by the
continuous mapping theorem. The second factor is asymptotic normal by
[\[eq:asym\_norm-pivot\]](#eq:asym_norm-pivot){reference-type="eqref"
reference="eq:asym_norm-pivot"}. Thus Slutsky's theorem implies
$$\tilde{\Omega}^{-1/2}\sqrt{n}\left(\widehat{\beta}-\beta\right)\stackrel{d}{\to}N\left(0,I_{K}\right)\label{eq:asym_norm_feasible}$$
and
[\[eq:asym\_norm\_feasible\]](#eq:asym_norm_feasible){reference-type="eqref"
reference="eq:asym_norm_feasible"} is a feasible statistic for
asymptotic inference.

The next question is how to consistently estimate
$\Omega=Q^{-1}\Sigma Q^{-1}$, or equivalent how to come up with an
$\tilde{\Omega}$. We have had $\widehat{Q}\stackrel{p}{\to}Q$. If we
have a consistent estimator $\tilde{\Sigma}$ for $\Sigma$, then we can
plug in these consistent estimators to form
$\tilde{\Omega}=\widehat{Q}^{-1}\tilde{\Sigma}\widehat{Q}^{-1}$. The
tricky question is how to consistently estimate
$\Sigma=E\left[x_{i}x_{i}'e_{i}^{2}\right]$. We cannot use the sample
mean of $x_{i}x_{i}'e_{i}^{2}$ to estimate $\Sigma$ because $e_{i}$ is
unobservable. Under homoskedasticity
$\Omega=Q^{-1}\Sigma Q^{-1}=\sigma^{2}Q^{-1}$, and similarly we cannot
use the sample mean of $e_{i}^{2}$ to estimate $\sigma^{2}$.

Heteroskedasticity is ubiquitous in econometrics. A regression example
that naturally generates conditional heteroskedasticity is the *linear
probability model* $y_{i}=x_{i}'\beta+e_{i}$, where
$y_{i}\in\left\{ 0,1\right\}$ is a binary dependent variable. Assume CEF
as $E\left[y_{i}|x_{i}\right]=x_{i}'\beta$, so we can use OLS to
consistently estimate $\beta$. The conditional variance
$$\mathrm{var}\left[e_{i}|x_{i}\right]=\mathrm{var}\left[y_{i}|x_{i}\right]=E\left[y_{i}|x_{i}\right]\left(1-E\left[y_{i}|x_{i}\right]\right)=x_{i}'\beta\left(1-x_{i}'\beta\right)$$
explicitly depends on $x_{i}$. In other words, the conditional variance
varies with $x_{i}$.

Naturally, one may attempt to use the OLS residual
$\widehat{e}_{i}=\widehat{y}_{i}-x_{i}'\widehat{\beta}$ to replace the
regression error $e_{i}$, so that we would have the plug-in estimators
$\widehat{\Omega}=\widehat{\sigma}^{2}\widehat{Q}^{-1}$ for
homoskedasticity, where
$\widehat{\sigma}^{2}=\widehat{e}'\widehat{e}/\left(n-K\right)$ or
$\widehat{\sigma}^{2}=\widehat{e}'\widehat{e}/n$, and
$\widehat{\Omega}=\widehat{Q}^{-1}\widehat{\Sigma}\widehat{Q}^{-1}$ for
heteroskedasticity, where
$\widehat{\Sigma}=n^{-1}\sum_{i}x_{i}x_{i}'\widehat{e}_{i}^{2}$.

\medskip{}
If we choose
$\widehat{\sigma}^{2}=\widehat{e}'\widehat{e}/\left(n-K\right)$ and
replace $\sigma^{2}$ in
[\[eq:asym\_norm\_homok\_pivot\]](#eq:asym_norm_homok_pivot){reference-type="eqref"
reference="eq:asym_norm_homok_pivot"}, then the resulting statistic
$T_{k}=\frac{\sqrt{n}\left(\widehat{\beta}_{k}-\beta_{k}\right)}{\sqrt{\widehat{\sigma}^{2}[\widehat{Q}^{-1}]_{kk}}}$
is exactly the $t$-statistic in the finite sample analysis. Recall that
under the classical normal-error assumption, the $t$-statistics follows
exact finite sample $t$-distribution with degrees of freedom $n-K$. In
asymptotic analysis, we allow $e_{i}$ to be any distribution if
$E\left[e_{i}^{2}|x_{i}\right]<\infty$ (We impose this assumption for
simplicity. It can be further relaxed in inid cases.) The asymptotic
normality allows us to conduct asymptotic statistical inference. For the
same $t$-statistic, we must draw the critical values from the normal
distribution, because
$$T_{k}=\frac{\sqrt{\sigma^{2}[Q^{-1}]_{kk}}}{\sqrt{\widehat{\sigma}^{2}[\widehat{Q}^{-1}]_{kk}}}\cdot\frac{\sqrt{n}\left(\widehat{\beta}_{k}-\beta_{k}\right)}{\sqrt{\sigma^{2}[Q^{-1}]_{kk}}}\stackrel{d}{\to}1\times N\left(0,1\right)\sim N\left(0,1\right)$$
by Slutsky's theorem if
$\widehat{\sigma}^{2}\stackrel{p}{\to}\sigma^{2}$.

\medskip{}
The next section will give sufficient conditions for
$\widehat{\sigma}^{2}\stackrel{p}{\to}\sigma^{2}$ and
$\widehat{\Sigma}\stackrel{p}{\to}\Sigma$.

Summary
-------

One of the most important techniques in asymptotic theory is
manipulating inequalities. These derivations of the variances look
complicated at first glance, but is often encountered in proofs of
theoretical results. After many years of torment, you will be accustomed
to these routine calculations.

**Historical notes**: @white1980heteroskedasticity drew attention of
economic contexts that violate the classical statistical assumptions in
linear regressions. It seeded econometricians' care, or obsession, in
variance estimation for statistical inference. The following decades has
witnessed a plethora of proposals of variance estimation that deal with
various deviation from the classical assumptions.

**Further reading**: In this chapter all vectors are of finite
dimensional. Some results can be extended to allow infinite $K$ when
$K\to\infty$ at a much slower speed than $n$. Such asymptotic
development will require multiple indices, and it goes beyond the
simplest case of $n\to\infty$ that we learned here. Big data is
accompanied by big model, in which the model itself is indexed by the
sample size and can grow more sophisticated as $n$ get bigger. In the
proofs of my latest paper @shi2020high, You will find loads of
inequality operations of similar flavor to this chapter.

Appendix
--------

We introduce the "big Op and small op" notation. They are the stochastic
counterparts of the "big O and small o" notation in deterministic cases.

-   Small op: $x_{n}=o_{p}\left(r_{n}\right)$ if
    $x_{n}/r_{n}\stackrel{p}{\to}0$.

-   Big Op: $x_{n}=O_{p}\left(r_{n}\right)$ if for any $\varepsilon>0$,
    there exists a $c>0$ such that
    $P\left(\left|x_{n}\right|/r_{n}>c\right)<\varepsilon$.

Some operations:

-   $o_{p}\left(1\right)+o_{p}\left(1\right)=o_{p}\left(1\right)$;

-   $o_{p}\left(1\right)+O_{p}\left(1\right)=O_{p}\left(1\right)$;

-   $o_{p}\left(1\right)O_{p}\left(1\right)=o_{p}\left(1\right)$.

The big Op and small op notation allows us to keep using equalities in
calculation while expressing the stochastic order of random objects.

\bigskip
` Zhentao Shi. Oct 21, 2020.`

\bibliographystyle{chicagoa}
