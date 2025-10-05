---
layout: page
title: "Research"
permalink: /research/
main_nav: true
---

**I use mechanistic mathematical models, genomic data (broadly defined!), and computational statistical tools to answer biological questions.** 

<div style="margin: 40px 0;">
  <img src="/assets/bear.JPG" style="width: 100%; max-width: none;">
</div>

<br>

One of the problems I am most interested in right now is the **evolution of recombination**. This is one of the oldest puzzles in evolutionary biology[^1] --- why do some cells undergo meiosis (including recombination) and subsequently fuse? --- and there is a rich theoretical literature on the subject.

- The observation that recombination varies dramatically along the genome (at fine and coarse scales) motivates a lot of the work that I have been doing. Particularly striking is how much the landscape (and rate) of recombination itself varies between gametes, individuals, sexes, populations, and species[^2]. A wealth of data (e.g., from single sperm sequencing) makes it an exciting time to think about variation in recombination at these scales.

- One reason it is difficult to understand the causes and consequences of variation in recombination on the genome is that the phenotype is effectively infinite-dimensional. The recombination landscape on the chromosome is best thought of as a function of genomic location, with co-variances at all pairs of locations that constrain how it can evolve. With Puneeth Deraje, I've been working on a mechanistic model that describes how this function evolves under neutrality (i.e., drift and cis modifier accumulation). We have shown that, in a finite population, the mean CDF of recombination follows a certain Gaussian process. We are currently using comparative data to make inferences (under this model) about the tempo and mode of landscape evolution, i.e., the manner in which modifiers accumulate.

<br>

My other main scientific interest is **virus evolution and emergence**. RNA viruses are so rapidly evolving that, by conventional metrics of the rate of molecular evolution, their genomes should turnover _neutrally_ in $\sim 10^3$ years. By some estimates, the rate of recombination (during co-infection of the same host) is even greater. Isn't that remarkable! I am interested in understanding how viral mutation and recombination shape the propensity of the pathogen to successfully spillover and sustain transmission (i.e., emerge) in humans[^3]. I am also very interested in how, as phenotype, mutation and recombination rate vary and evolve at within- and between-host scales.

- Although we know recombination and reassortment are common in RNA viruses and of concern for human health, the _evolution_ of these process is not particularly well-understood. An especially interesting alternative to the idea reassortment evolved to shuffle genetic material is that it is a necessary byproduct of the segmented nature of some viral genomes (i.e., that genes are encoded on different segments and this allows for finer control over gene expression in host cells). Weighing the shuffling and gene expression control hypotheses is a problem I am very interested in. If this interests you, please get in touch!

<br>

[^1]: A great introduction to the subject is [this paper](https://www.journals.uchicago.edu/doi/10.1086/599084) by Sally Otto. Also check out [this perspective](https://academic.oup.com/evolut/article-abstract/54/2/337/6757522?redirectedFrom=fulltext&login=false) by Burt and [this piece](https://royalsocietypublishing.org/doi/10.1098/rstb.2016.0001) by Lenormand _et al._.

[^2]: In fact, there is a remarkable experiment showing that the gene, PRDM9, that determines where recombination occurs on the genome (i.e., the set of recombination _hotspots_) in many vertebrates underlies the formation of different species to begin with 😱.

[^3]: And there happens to be a paper to this end [on bioRxiv](https://www.biorxiv.org/content/10.1101/2025.10.01.679867v1)!