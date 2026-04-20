#import "../styling/styling.typ": lib

#show: lib.f

#set text(lang: "en", region: "gb")

#set par(justify: true)

= #link("https://enclose.horse")[Enclsoing the horse] in singly-exponential time

Consider the #smallcaps[Steiner Tree] problem:

#lib.problem("Steiner Tree")[
  Input: a graph $G$, a set of terminals $T subset.eq V(G)$, and an integer $k$.

  Output: Does $G$ contain a *connected* subset of size $<= k$ that contains all of $T$?
]

Without the connectivity requirement, this problem can easily be solved by standard DP techniques (although it is also trivial: Just output `yes` if and only if $abs(T) <= k$). When trying to formulate a treewidth-based DP for the full problem, however, we run into an issue: A naive formulation might look as follows:

$ A(x, f) = "min. size of solution" S "in" V_x "such that" B_x inter S = f $

with $n thin 2^"tw"$ many states. This does not quite work, however: consider a grid graph like the following:

...

Here, $A("row" 5, {(5, 1), (5, 3)})$ tells us nothing about whether $(5, 1)$ and $(5, 3)$ are connected somewhere within $V_("row" 5)$ (ie. through $(6, 2)$) or outside (through $(4, 2)$). Subsequently we will not be able to ensure that $(5, 1)$ and $(5, 3)$ are connected at all!

The "simple" way to work around this is to represent which subsets of $B_x$ are connected in $V_x$ directly in the DP state itself, ie.

$ A : (x : "tree decomposition bag") times (f : 2^(B_x)) times "equiv. rel. on" f -> NN $

$
  A(x, f, c) = & "min. size of solution" S "in" V_x "such that" B_x inter S = f \
               & "and" (u, v) in c "iff. there is a path" u - v "in" V_x inter S
$

And while this works (and leads to a running time of the form $2^O("tw" log "tw") n$), the dependence on the treewidth is no longer singly exponential.

The Cut&Count technique is a recent (2013) technique invented to solve problems with "connectivity constraints" such as the above in singly-exponential time.

== Cut&Count

It will turn out that, instead of finding an exact answer, it will be sufficient to count the number of solutions (of a slightly modified problem) modulo 2. (proof of this comes later). As is usual whenever a DP gets too complicated, we will also take the solution size as a parameter $k$ instead of computing the optimum directly.

Let $R$ be the set of all "solutions" of the given size without the con-?nectivity constraint (we will call these "potential solutions"), and $S$ be the subset of potential solutions which are actually connected.

$
  R & = { X subset.eq V(G) | T subset.eq X, abs(X) = k } \
  S & = { X in R | X "is connected" }
$

We would like to compute $abs(S)$ mod 2, but this seems hard. Computing the parity of $abs(R)$ is easy (in fact computing the whole of $abs(R)$ is easy), but this will not be very useful as the parity of $abs(S)$ and $abs(R)$ may differ.#footnote[testing footnotes]

The main idea of the Cut&Count technique is to replace the "global" connectivity constraint with a local constraint about graph cuts. More specifically, consider some potential solution $X$. Let a "consistent cut" of $X$ be a cut $(X_l, X_r)$ such that no edge in $G[X]$ crosses the cut. Equi-?valently, a consistent cut consists of an assignment of a side ("left" or "right") to each connected component of $G[X]$, and thus the number of consistent cuts is exactly $2^"cc"(G[X])$, where $"cc"(H)$ is the number of con-?nected components in $H$.

This is almost what we want: if we somehow halved this number, we would get a number which is odd if $G[X]$ is connected and even otherwise. So let

$ C = {(X, (X_l, X_r)) | X in R, (X_l, X_r) "consistent cut of" X} $

Then $abs(C) equiv abs(S) mod 2$, since connected potential solutions#footnote[aka solutions] contribute by exactly $1$ to $abs(C)$ all other potential solutions contribute by $0 mod 2$.

To halve this number, we may simply pick a vertex $r$ we know is in the solution (ie. any vertex in $T$) and require that it be put on the left side of the cut.

To compute $abs(C)$ we may use standard DP techniques: Given a bag $t$, a subset $X subset B_t$ and an assignment $s : A -> {"L", "R"}$, let $c(t, A, s)$ be the number of pairs $(X, (X_l, X_r))$ in $C$ except restricted to $G[V_t]$ such that $X inter B_t = A$ and $s$ gives the side of each vertex in $A$ in the cut, requiring that $s(r) = "L"$. Computing $c$ in time $O^*(2^O(k))$ should then be relatively straightforward.

== The promised proof of why parity is enough

There is some theorem that implies that randomly weighting the vertices in the graph and then looking for solutions that sum up to a given weight is enough.

#lorem(50)

#bibliography(full: true, "horse_ref.yaml")
