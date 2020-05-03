---
title: Information Theory
author: Tom Read Cutting
references:
  - id: DaugmanJohn2016
    author:
      - family: Daugman
        given: John
    title: 'Information Theory'
    issued:
      date-parts:
      - - 2016
    URL: https://www.cl.cam.ac.uk/teaching/1617/InfoTheory/materials.html
nocite: |
  @DaugmanJohn2016
---

### What Is?

Understanding the movement and transformation of information through mathematical and physical laws, addressing and answering two fundamental questions:

  1. How can much can you compress data? (The entropy of the data, H).

  2. At which rate can you reliable communicate through a channel? (The channel capacity, C).

---

### Why Do?

Widely Applicable! (Sneak Peak):

  - Compression (duh!)
  - Communications and Networking (duh!)
  - Data Oriented Design
  - Security
  - Machine Learning (huh?)
  - Compute Vision (huh?)
  - Computer Graphics (huh!?)
  - ^^ Almost Everything in Computer Science

::: notes

Information Theory has some pretty obvious applications, but hopefully some here will surprise you!

We will be delving into the more interesting links later

:::

---

### What Contains?

  - Foundations: Intro, Bayes, Entropy, Shannon's Theorems
  - Applications: Codes, Sampling, Compression
  - Relations: DoD, Security, ML, Graphics

*Not* a mathematically rigorous presentation!
Arguments rely on intuition, *not* formal proof.
User-friendly *not* technically precise.



## Foundations

---

### Data Is Not Information

Intuition: A new hard drive has 1,000,000,000,000 bits of data, but not 1,000,000,000,000.

Is there a difference between a 0-initialized hard drive, and a randomly-initialized hard drive in terms of information?

---

### Probabilities Matter

The less probable an event is, the more information it contains when it happens.

---

### 1 Bit of Data vs 1 Bit of Information

We can say that 1 Bit of Data contains 1 Bit of Information if the probability of that Bit being 1 or 0 is 0.5.

---

### Knowledge Affects Information

Intuitively, past events affect the probabilities by which we predict future events.

In othr wrds, yo cn rd ths sntnce evn wth mssng lttrs.



## Some Probability

---

### Product Rule

The probability that both *A* and *B* will happen:

$$p(A,B) = p(A|B)p(B) = p(B|A)p(A)$$

Example: The Probability that Alice will buy a hot dog *and* ketchup?

::: notes

If we know the probability of Alice buying ketchup given that she's bought a hot dog. *And* we know how likely she is to buy a hot dog. Then we know how likely *both* are to happen.

:::

---

### Sum Rule

If the probability of A is affected by the outcome of a number of events *B*

$$p(A) = \sum\limits_{B} p(A,B) = \sum_{B} p(A|B)p(B)$$

Example: The Probability that Bob will beat Alice at chess.

::: notes

If we know the probability that Bob will beat Alice when starting with whites, and the probability that Bob will beat Alice when starting with blacks - then we know the probability that Bob will beat Alice if we know how likely he is to start with either of those colours.

:::

---

### Bayes' Theorem

Super-duper important, we aren't going to derive it, but have a look at this majestic thing:

$$p(B|A) = \frac{p(A|B)(p(B)}{p(A)}$$

::: notes

Derived from the product and sum rules.

:::

---

### Relation to Information Theory

Bayes' Theorem can be applied recursively to let us use the latest posterior as a new *prior* so interpret the next set of data.

Information Theory is about quantitatively analysing the amount of information gained (via analysing reduced uncertainty) using Bayes' Theorem.




## Entropy

---

### Event Information

The information $I$ contained within an event is:

$$I = \log_2(p)$$

Where $p$ is the probability of that event occurring.

Entropy, $H = -I$ is the the amount of uncertainty.

---

### Adding Information

For independent $a$ and $b$:

$$I_{ab} = \log_2(p_a p_b) = \log_2(p_a) + \log_2(p_b) = I_a + I_b$$

::: notes

By defining information in terms of the logarithms of the underlying probabilities involved, we can "add" information together to get the total information gain of two events.

:::

### Entropy of Ensembles

If you have non-uniform ensemble of probabilities such that:

$$\sum\limits_i p_i = 1 $$

Then:

$$H = - \sum\limits_i p_i \log_2(p_i)$$


::: notes

TODO: Intuition

:::

### Intuition

Bit, $b=1$ with probability $p$ (and $0$ otherwise):

```{.matplotlib
  caption="$$H(p)=-p\log_2(p)-(1-p)\log_2(1-p)$$"
  height="200px"
  transparent=true
}

import matplotlib.pyplot as plt
import numpy as np
import math

entropy = lambda p: p * math.log(p, 2) * -1

p_values = list(np.arange(0.01, 1.00, 0.01))
hp_values = list(map(lambda p: entropy(p) + entropy(1 -p), p_values))
plt.figure()
plt.plot(p_values, hp_values) 
```

When $p=0.5$, the Entropy maxes-out at 1. 

::: notes

Bring that back to earlier when we said that 1 bit of data contains 1 bit of information if the probability of it being 1 or 0 was 0.5, this is why!

:::


### More

- Joint Entropy
- Conditional Entropy of Ensembles
- Chain Rule for Entropy
- Mutual Information
- Kullback-Leibler Distance and Fano's Inequality



## Source-Coding

---

### Codes

Stream of data can produce $A$, $B$, $C$ and $D$, with:

- $p(A)=\frac{1}{2}$
- $p(B)=\frac{1}{4}$
- $p(C)=\frac{1}{8}$
- $p(D)=\frac{1}{8}$

---

### Encoding as Binary

A naive fixed-length code might look like this:

- $A = 00$
- $B = 01$
- $C = 10$
- $D = 11$

This has a fixed *code rate*, $R=2$
::: notes

TODO: Convert this to a tables=
:::

---

### Entropy of the system

- $H=...$
- $=H(A)+H(B)+H(C)+H(D)$
- $=-\frac{1}{2}-\frac{1}{4}2-\frac{1}{8}3-\frac{1}{8}3$
- $=-\frac{1}{2}-\frac{1}{2}-\frac{3}{8}-\frac{3}{8}$
- $=-1.75$

---

### Coding Efficiency

The efficiency $\mu$ of coding is $\mu=\frac{H}{R}$:

$$\mu=1.75/2=0.875$$

---

### Shannon's Source-Coding Theorem

*You can compress a stream of data with entropy $H$ into a code whose rate $R$ approaches $H$ in the limit, but you can't have a code rate $R < H$ without loss of information.*

---

### Markov Process

We can model a stream of symbols as a "Markov Process". 





## The End

---

### Special Thanks

- Professor John Daugman for teaching this course at University.
- Alastair Toft & AJ Weeks for ideas bouncing and feedback.
- Huw Bowles for organising these talks and providing invaluable feedback.

---

### References

::: {#refs}
:::
