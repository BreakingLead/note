#import "../../template-mathnote.typ": *

= Chebyshev Polynomials

Observe:
+ $cos x = x$
+ $cos (2x) = 2cos^2x+1$
+ $cos (3x) = 4cos^3x-3x$
+ $cos (4x) = 8cos^4x-8cos^2x+1$

#theorem[
  Recursive Expression
][
  Let $T_(n)(cos theta) := cos(n theta)$, there is $ T_(n)(x) = 2x T_(n-1) (x) - T_(n-2) (x) $
][
  _Proof:_

  $ 
    cos((n+1)x)
    &= cos(n x + x) \
    &= cos(n x)cos(x)-sin(n x)sin(x) \
    &= 2 cos(n x)cos(x) - [cos(n x)cos(x)+sin(n x )sin(x)] \
    &= 2 cos(n x)cos(x) - cos((n-1) x) \
    \
    T_(n+1)(cos x) &= 2T_n (cos x) - T_(n-1)(cos x) => \
    T_(n)(x) &= 2x T_(n-1) (x) - T_(n-2) (x)
  $
]

Properties of  chebyshev polynomials are listed here:
- 性质1: #h(1em) $T_n (x) = cos (n arccos x)$.
- 性质2: #h(1em) $T_n (x)$ 的最高幂次项 $x^n$ 系数是 $2^(n-1)$.

_Proof:_ 归纳法易证

- 性质3: #h(1em) $|T_n (x)| <= 1$
- 性质4: #h(1em) $T_n (x)$ 在 $[-1,1]$ 共有 $n$ 个零点，为 $x_k=cos(((2k-1)pi)/(2n)),k=1,2,3,...,n$

_Proof:_
$
  T_n (cos theta) = cos (n theta) \
  T_n (cos theta) = 0 <=> cos (n theta) = 0 => theta = ((2k-1) pi)/(2n) (k in ZZ) \
  T_n (x) = 0 => x = cos (((2k-1) pi)/(2n)) (k=1,2,3,...n)
$

- 性质5: #h(1em) $T_n (x)$ 在 $[-1,1]$ 共有 $n+1$ 个极值点，为 $x^*_k=cos(( k pi)/n),k=0,1,2,...,n$, 且这些极值点上的函数值是以 $+1,-1$ 这样的形式轮流出现的.

_Proof:_ 证明同上.

= Chebyshev Approximation
#theorem[1][
  设 $n$ 次最高项系数为 1 的多项式 $Q_n (x)$ 的 $n$ 个根在 $(-1,1)$ 之间, 为 $x_1,x_2,...,x_n$. 那么我们在 $0,x_1,x_2,...,x_n,1$ 之间取 $t_0,t_1,t_2,...,t_n$, 其中 $t$ 夹在两个根（暂时将0,1算入）的开区间内. 则对于任意最高项系数为 1 的多项式$R(x)$, 我们有

  $
    max_(x in [-1,1]) |R(x)| >= min_(i in ZZ and i in [0,n]) Q(t_i)
  $
][
  _Proof:_
  
  反证法: 设

  $
    exists R(x), max_(x in [-1,1]) |R(x)| < min_(i in ZZ and i in [0,n]) Q(t_i) = M \
    => |R(x)| < M (forall x in [-1,1]) \
  $

  令 $T(x) := R(x) - Q(x)$ 则 $T(t_0),T(t_1),...,T(t_n)$ 一定是正负交错的(画图容易看出).

  $=> T(x)$ 至少在 $[-1,1]$ 有 $n$ 个根, 所以它是 $n$ 次方程, 所以最高项 $x^n$ 的系数必定不为0 (代数学基本定理). 然而, $R(x) = x^n + ..., Q(x) = x^n+...$ 所以矛盾. 原命题得证. $qed$

]
