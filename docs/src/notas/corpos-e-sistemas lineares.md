---
title: Corpos e sistemas lineares
lang: pt-BR
description: Aula 2
tags: ["corpos", "sistemas lineares", "aula"]
noGlobalSocialShare: true
---

# {{ $frontmatter.title }} $06/01/2021$

[[toc]]

<br>

<p align="center">
  <img
    src="https://upload.wikimedia.org/wikipedia/commons/7/7a/%C3%9Cbersicht_K%C3%B6rper.svg"
    width="95%"
  />
</p>

Um _corpo_ é um conjunto não vazio $\mathbb{F}$ munido de duas
operações: adição mais e multiplicação.

$$
		\begin{aligned}
			+\colon\mathbb{F}\times\mathbb{F} & \longrightarrow\mathbb{F} \\
			\left(x,y\right)                  & \longmapsto x+y
		\end{aligned}\qquad
		\begin{aligned}
			\cdot\colon\mathbb{F}\times\mathbb{F} & \longrightarrow\mathbb{F} \\
			\left(x,y\right)                      & \longmapsto x\cdot y
		\end{aligned}
$$

e tais que en $\left(\mathbb{F},+\right)$

1. (Asociatividade na adição)
   $\left(x+y\right)+z=x+\left(y+z\right)$,
   $\forall x,y,z\in\mathbb{F}$;
2. (Existênza de neutro aditivo)
   $\exists0\in\mathbb{F}$ tal que $x+0=0+x=x$,
   $\forall x\in\mathbb{F}$;
3. (Existênza de elemento oposto o inverso aditivo)
   Dado $x\in\mathbb{F}$, existe $-x\in\mathbb{F}$ tal que
   $x+\left(-x\right)=\left(-x\right)+x=0$;
4. (Conmutatividade na adição)
   $x+y=y+x$, $\forall x,y\in\mathbb{F}$;

e $\left(\mathbb{F}\setminus\left\{0\right\},\cdot\right)$

1. (Associatividade na multiplicação)
   $\left(x\cdot y\right)\cdot z=x\cdot\left(y\cdot z\right)$,
   $\forall x,y,z\in\mathbb{F}$;
2. (Existênza do elemento neutro na multiplicação)
   $\exists 1\in\mathbb{F}$ tal que $x\cdot 1=1\cdot x=x$, $\forall x\in\mathbb{F}$;
3. (Existênza inverso multiplicativo)
   Dado $x\in\mathbb{F}\setminus\left\{0\right\}$,
   existe $x^{-1}\in\mathbb{F}$ tal que
   $x\cdot x^{-1}=x^{-1}\cdot x=1$;
4. (Conmutatividade na multiplicação)
   $x\cdot y=y\cdot x$, $\forall x,y\in\mathbb{F}$;

- (Distributiva)
  $x\cdot\left(y+z\right)=x\cdot y+x\cdot z$,
  $\forall x,y,z\in\mathbb{F}$.

<video style="display: block; margin: 0 auto" width="70%" controls>
  <source src="/Algebra-linear-II/video/OpeningManim.mp4" type="video/mp4" />
</video>

## Resumo

<br>

<iframe
  src="/Algebra-linear-II/pdf/tutoria.pdf"
  width="100%"
  height="600"
></iframe>
