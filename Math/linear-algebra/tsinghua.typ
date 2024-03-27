
#import "../../template-mathnote.typ": *
#show: template
= 数理逻辑和证明方法
== 证明法
=== 直接证明法
用逻辑链条证明即可。
=== 间接证明法
==== 第一数学归纳法
$P(1) and (P(n) =>P(n+1)) => P(n) forall n in NN$
==== 第二数学归纳法
== 映射
#definition[映射][
  给定集合 $X,Y$ 若 $forall x in X exists! y in Y$ 与之对应，则称这个对应关系是 $f: X->Y$ 记做
  $ f: &X -> Y \ 
       &x |-> f(x)
  $
  - $X$: 定义域
  - $Y$: 陪域
  - ${f(x)|x in X}$ 或 $f(X)$: 值域（像集）
]

映射相等的条件：
+ 定义域相同
+ 陪域相同
+ 法则相同

定义：令 $f: X->Y$ 若 $exists g: Y -> X, id_X = g compose f, id_Y = f compose g$, 则称 $f$ *可逆*.


三种特殊情形:
+ 单射: $forall x_1,x_2 in X, f(x_1) != f(x_2)$
+ 满射: $forall y in Y, exists x in X => f(x)=y$ 即 $f(X) = Y$
+ 双射: 当且仅当可逆。或单射加满射，两种定义方式等价。

*Exercises:*

0.2.1: 用反证法证明以下命题

+ $p > 2 and p "is prime" => p = 2k+1$

  *Solution* 令 $p = 2k (k>=2)$ 则 $p$ 有因子 2 与题设矛盾 $qed$

+ 对 $n in ZZ^+$, $n^2 = 2k+1 => n = 2k+1$

  *Solution* Let $n = 2k$, hence $n^2 = 4k^2 != 2k+1 qed$

+ 不存在最小的正有理数.

  *Solution* Let $n = p/q$ be the minimun number in $QQ$. $p/()$

0.2.2: 由排中律，若$B=>A and not B =>A$则$A$为真。给定命题：存在两个无理数$a,b, a^b in QQ$.
  



