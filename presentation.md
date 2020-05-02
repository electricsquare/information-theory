---
title: Information Theory
author: Tom Read Cutting
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



## Bayes Theorem

---

### Product Rule

p(A, B) = p(A | B)p(B)

---

### Sum Rule 
