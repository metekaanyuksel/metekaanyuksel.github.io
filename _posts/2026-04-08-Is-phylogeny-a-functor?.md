---
layout: post
title:  "Is phylogeny a functor?"
date:   2026-04-08
author: Mete Yuksel
categories: musings
cover:  "/assets/posts/Is-phylogeny-a-functor%3F.jpeg"
---


A longer post…hopefully this analogy isn’t too woo woo.

<img src="/assets/posts/blurry-little-guy.jpeg" alt="Blurry little guy" width="100%" height="600px">

For whatever reason, I’ve become really interested in [category
theory](https://en.wikipedia.org/wiki/Category_theory) the last couple
of weeks. This is the branch of math that studies objects called
categories, collections of objects which are related via maps
(morphisms, arrows), and the connections between them. Category theory
is sometimes called “abstract nonsense”, but it provides a powerful way
to reason about connections between distinct branches of math that
otherwise are studied in isolation.

## An example

It is common to learn about categories when being introduced to the
so-called [*fundemental
group*](https://en.wikipedia.org/wiki/Fundamental_group) $\pi(X,x_0)$ of
a topological space $X$ with base point $x_0$. The fundamental group is
a [group](https://en.wikipedia.org/wiki/Group_(mathematics)) (i.e., a
collection of symmetries) associated to a topological space and point in
that space, which is constructed by considering all of the ways that
“loops” in the space can be deformed. Formally, the fundamental group is
defined as

1.  an equivalence class of loops (i.e., continuous functions
    $f \colon [0,1] \to X$ on a topological space $X$ which start and
    end at the same point: $f(0) = f(1) = x_0$) and
2.  an operation $\circ$ on the loop classes which satisfies group
    properties.

The first condition just means that, if one loop can be continuously
deformed into another, then the loops are considered the same. This is
common: in various branches of math, things are considered the same if
there is enough shared that it becomes convenient to view them in that
way. (A contrived example: the functions $x^2$ and $x^3$ are both
polynomials and are thus equivalent *mod* having super-linear growth,
but $x$ and $x^2$ are not.) In some topological spaces, all loops can be
deformed into all other loops. In other spaces, which have holes, this
is not the case: a loop that contains a hole cannot be continuously
moved, e.g., stretched and pulled like a rubber band, until it has the
shape of a loop that does *not* contain the hole. So in this way the
loop classes count the number of holes in a topological space.

The second condition says that we have a reasonable way of combining or
“adding” loops that cannot be deformed into each other (the equivalence
class of loops up to continuous deformation or *homotopy*). The view of
loops as functions helps define a meaningful sense in which they can be
added: given two loops $f_1$ and $f_2$, move on the topological space
according to $f_1$ at twice the usual speed, and then do the same thing
but according to $f_2$. This defines a new loop
$f_3 = f_2 \circ f_1 \colon [0,1] \to X$ which starts at $f_1(0) = x_0$,
returns to this point (that is, $f_1(1/2) = f_2(1/2) = x_0$, and ends at
$f_2(1) = x_0$. One can show that $\circ$ defines a group operation on
the space of loop classes. In particular, $\circ$ is associative, the
“identity” loop ($f(t) = x_0$ for all $t$) is such that
$f_1 \circ f = f_1$ for all $f_1$, and for any loop class $f_1$ there is
an “inverse” loop $f_1^{-1} = f_1(1-t)$ defined by running $f_1$ in
reverse.

### What’s the point?

This is all fine and good but the reason we care about the fundamental
group $(\pi(X,x_0),\circ)$ is that it provides a bridge between topology
and group theory. Topology is all about characterizing how close things
are to each other, and group theory is about characterizing symmetries.
It turns out that, through the fundamental group, knowledge of what
topological spaces are equivalent can be translated into what group
structures are equivalent and vice versa. A coffee cop with a handle is
not, topologically speaking, the same as a coffee cup with a handle: the
number of holes and, thus, notions of “closeness” of points on the two
cups differ. We would not consider the two cups the “same”
topologically. The fundamental groups of the cups reflect this lack of
equivalence: symmetries of loops on these cups also differ.

It is in this sense that the fundamental group is a
[*functor*](https://en.wikipedia.org/wiki/Functor): a map between
categories (topology and group theory) which translates salient
information about one into the other. The concept that a functor (a word
which I believe was originally borrowed from linguistics) tries to
capture is one of many (duality, competition) which can be understood in
a categorical sense.

## Phylogeny is functorial?

Why have I been thinking about this? Well, for one, I think it’s cool!
Two, **I think that the category concept has helped clarify my thinking
about how evolution happens and about how we study it.** Biology is
obviously much fuzzier than topology or group theory, and no analogy is
without its drawbacks, but I find the categorical perspective to be
compelling.

Categories let us talk about collections of things which, for whatever
reason, make sense to group. They share a set of properties which all
other things do not. Functors let us talk about the relationships
between the collections of things sharing properties in a way that
relates the meaning of “sharing” in one collection to the meaning of
“sharing” in another. Functors are arguably *the* reason category theory
is useful: knowledge about one thing can be turned into knowledge about
another. Connections can be made. Principled analogizing can happen.

Now…for some not-so-principled analogizing…

Species are collections of individuals which share phenotypes that
reflect reproductive cohesion. In this sense, **every species can be
thought of a a category.** The structure within species can be described
by the full history of inheritance of the molecules (DNA, RNA,
epigenetic marks, chaperones) which make up individuals. In this sense,
**the genealogy of individuals can be thought of as the set of arrows
relating things (individuals) in the category (species).** Those
structures are, in the same way species boundaries are fuzzy, latent: we
cannot see the inheritance of the molecules which then, through
development, make organisms who they are. Sometimes, if we are lucky, we
see patterns of variation at the present day that let us infer how
processes on that scaffold must have operated. To what extent those
molecules even capture the irreducible essence of individuals is
another, thornier matter.

So, if species are categories and genealogies are arrows, **what are the
functors which relate the categories in a structure-preserving way? An
obvious answer is the phylogeny, the full history of descent giving rise
to present-day lineages.** It is arguably through this object that most
inference of evolutionary processes is made. Comparative methods let us
estimate parameters of interest, e.g., rates of evolution, by
super-imposing a stochastic model of evolution (e.g., Brownian motion)
on the branches of the tree(s) relating contemporary species. It can be
argued that the functorality of the phylogeny is what makes comparative
methods work (i.e., the reason we can estimate evolutionary parameters
of interest). Similarly, one can recast phylogenetic reconstruction as a
functor inference problem: the goal of tree reconstruction is to learn
the mapping between information in species X and Y that comparative
methods use in the first place.

Is phylogeny reconstruction functor inference? (For that matter, what
*isn’t* functor inference?) Is the Kingman coalescent, a widely used
model for genealogies of individuals evolving neutrally, a depiction of
the arrows relating individuals in a category? Is its universality a
reflection of its robustness across categories? It is not difficult to
see how some of the theorizing breaks down, analogizing devolves into
abstract nonsense, and mathematical models and biology become conflated.
But I do think the categorical perspective provides interesting food for
thought.
