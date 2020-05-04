---
pagetitle: How Information Works
author-meta: Tom Read Cutting
css: css/style.css
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

---

### {#title data-background-image="img/Information_Slide.png" data-background-size=contain data-background-transition=none}

---

### {#title-video data-background-video="img/Information_Slide.webm" data-background-size=contain data-background-video-loop="loop"}

---

### What Is?

Understanding the movement and transformation of information through mathematical and physical laws, addressing and answering two fundamental questions:

. . .

  1. **How can much can you compress data? (The entropy of the data, H).**

. . .

  2. At which rate can you reliable communicate through a channel? (The channel capacity, C).

::: notes

What is information theory?

We will only cover the first question. Question two can be saved for further reading, or a later talk...

:::

---

### Why Do?

Widely Applicable! (Sneak Peak):

. . .

  - Compression (duh!)
  - Communications and Networking (duh!)
  - Data Oriented Design
  - Security
  - Machine Learning (huh?)
  - Computer Vision (huh?)
  - Computer Graphics (huh!?)
  - ^^ Almost Everything in Computer Science

::: notes

Information Theory has some pretty obvious applications, but hopefully some here will surprise you!

*click*

We will be delving into the more interesting links later, and go in depth on these.

Outside of Computer Science, relevant to subjects from linguistics, to physics and how the universe itself works!

TODO: https://www.youtube.com/watch?v=sMb00lz-IfE

:::

---

### What Contains?

  - Foundations: Intro, Bayes, Entropy, Shannon's Source Coding Theorem
  - Applications: Codes, Compression
  - Relations: DoD, Security, ML, Graphics

. . .

*Not* mathematically rigorous!
Arguments rely on intuition, *not* formal proof.
User-friendly, *not* technically precise.

::: notes

Very high level overview, will give you taste of what doors Information theory opens-up.

Applicable outside of Computer Science, is important to understanding reality itself! TODO: https://www.youtube.com/watch?v=yWO-cvGETRQ

*click*

Not maths accurate!

:::



## Foundations

---

### Data Is Not Information

**Intuition:** A new hard drive has 1,000,000,000,000 bits of data, but not 1,000,000,000,000.

Is there a difference between a 0-initialized hard drive, and a randomly-initialized hard drive in terms of information?

::: notes

This concept makes sense to use intuitively.

Answer to question, yes, if you care about the value of the bits on the randomly-initialized hard drive.

But this does hint an something interesting regarding information...

:::

---

### Probabilities Matter

The less probable an event is, the more information it contains when it happens.

::: notes

Intuition: I tell you my name is Tom, the fact that you were expecting that means that the particular piece of information that I go by that name now isn't very high.

However, if I were to tell you that my name is now Geoffrey, that would be more information.

:::

---

### 1 Bit ≠ 1 Bit

1 Bit of Data is not 1 Bit of Information.

. . .

We can say that 1 Bit of Data contains 1 Bit of Information if the probability of that Bit being 1 or 0 is 0.5.

::: notes

Clickbait title! 1 Bit is not 1 Bit?

*click*

We will expand on what that is later. But this is the core of things like compression algorithms, if the probabilities of any bit in a bit stream being a given value isn't 0.5 what does that mean?

You will understand this later.

:::

---

### Knowledge Affects Information

Intuitively, past events affect the probabilities by which we predict future events.

. . .

In othr wrds, yo cn rd ths sntnce evn wth mssng lttrs.

::: notes

Here's intuitively why probability is important

*click*

The reason why you can read this sentence is because there are probabilies associated with what the missing letters could be, and your brain automatically fills in the gaps with the most likely options.

I find it awesome that our brains can run super-hardcore bayesian inference like that without us even thinking about it.

:::




## Some Probability

::: notes

We are going to delve into some probility basics.

Bear with me as this is imporant to understand, I'm going to go over this thoroughly as it helps a lot. But if you do get lost, I will stick to intuitive explenations for the rest of the talk.

:::

---

### Basic Syntax - $p(A)$

For some event $A$, $p(A)$ says how likely that event is to occur.

. . .

In other words, $p(A)$ represents the probability that $A$ will happen.

. . .

$p(um)=1$

::: notes

Read Slide

*click*

Read Slide

*click*

If the event is that I will use say "umm" during this talk, then we can say that the probability of "umm", p(um), is 1.

:::

---

### Basic Syntax - $p(A,B)$

For events $A$ and $B$, $p(A,B)$ is how likely both events are to happen.

. . .

Hopefully $p(talk,swear)$ is low.

::: notes

*click*

Probability I will give this talk *and* swear, is low.

:::

---

### Basic Syntax - $p(A|B)$

For events $A$ and $B$, $p(A|B)$ is how likely $A$ is to happen, if $B$ has happened.

. . .

$p(swear|stub toe)$ is very high.

::: notes

*click*

Let's hope I don't stub my toe during this talk.

:::

---

### Product Rule

The probability that both *A* and *B* will happen:

$$p(A,B) = p(A|B)p(B) = p(B|A)p(A)$$

. . .

Example: The Probability that Alice will buy a hot dog *and* ketchup?

::: notes

*click*

If we know the probability of Alice buying ketchup given that she's bought a hot dog. *And* we know how likely she is to buy a hot dog. Then we know how likely *both* are to happen.#

TODO: https://www.youtube.com/watch?v=_PG-jJKB_do

:::

---

### Sum Rule

If the probability of A is affected by the outcome of a number of events *B*

$$p(A) = \sum\limits_{B} p(A,B) = \sum_{B} p(A|B)p(B)$$

. . .

Example: The Probability that Bob will beat Alice at chess.

::: notes

*click*

If we know the probability that Bob will beat Alice when starting with whites, and the probability that Bob will beat Alice when starting with blacks - then we know the probability that Bob will beat Alice if we know how likely he is to start with either of those colours.

:::

---

### Bayes' Theorem

The Product Rule:

$$p(A,B) = p(A|B)p(B) = p(B|A)p(A)$$

. . .

Gives us...

. . . 

$$p(B|A) = \frac{p(A|B)(p(B)}{p(A)}$$

::: notes

Refresh on product rule

*click*


*click*

This is very powerful, because it allows us to reverse the conditions of events.

:::

---

### Close to Home Example

Imagine a 90% accurate "virus immunity" test.

. . . 

Imagine 1% of population is *actually* immune to the virus.

. . . 

What is the probability you are immune, if the test is positive?

. . .

$$p(I|T)$$

::: notes

*click*

*click*

Write down your guess in the comments, your gut feeling.

:::

---

### Test Variables

- $p(I)=0.01$ - Chance you are immune.
- $p(\overline{I})=0.99$ - Chance you are at risk.
- $p(T|I)=p(\overline{T}|\overline{I})=0.9$ - Chance tests succeed.
- $p(\overline{T}|I)=p(T|\overline{I})=0.1$ - Chance tests fail.

::: notes

Stating chances we already know.

:::

### Applying Bayes'

$$p(I|T)=\frac{p(T|I)p(I)}{p(T)}$$

. . .

- $p(T)=...$
- $=p(T|I)p(I)+p(T|\overline{I})p(\overline{I})$ (sum rule)
- $=(0.9)(0.01)+(0.1)(0.99)$ 
- $=0.108$ 


::: notes

We need $p(T) then...

*click*

:::

---

### Are You Immune?

$$p(I|T)=\frac{p(T|I)p(I)}{p(T)}=\frac{(0.9)(0.01)}{0.108}=...$$

. . .

$$0.833$$

::: notes

Are you immune? Here's the math!

*click*

You have less than 10% chance of being immune. Even though your test was 90% accurate.

:::



---

### Relation to Information Theory

Bayes' Theorem can be applied recursively to let us use the latest posterior as a new *prior* so interpret the next set of data.

. . .

Information Theory is about quantitatively analysing the amount of information gained (via analysing reduced uncertainty) using Bayes' Theorem.

::: notes

Bayes' theorem let's us estimate the probalities of incoming bits of information

*click*

Information theory is all about quantiviely analysing that.

:::


## Entropy

---

### Event Information

The information $I$ contained within an event $E$ is:

. . .

$$I = \log_2(p(E))$$

Where $p(E)$ is the probability of that event occurring.

. . .

Entropy, $H = -I$ is the the amount of uncertainty.

::: notes

So, there is an equation for information, and this...

*click*

So, it seems pretty arbitrary to have this. And also it's negative. We also talk about Entropy though, which, intuitively, is anti-information so...

*click*

However, these numbers mean very real things. The next slide will explain why log is useful, but eventually the magic will be revealed...

:::

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

Bit, $b$ with $p_{b=1}=1-p_{b=0}$

. . .

```{.matplotlib
  caption="$$H(b)=-p_{b=1}\log_2(p_{b=1})-(1-p_{b=0})\log_2(1-p_{b=0})$$"
  height="330px"
  transparent=true
}

import matplotlib.pyplot as plt
import numpy as np
import math

entropy = lambda p: p * math.log(p, 2) * -1

p_values = list(np.arange(0.01, 1.00, 0.01))
hp_values = list(map(lambda p: entropy(p) + entropy(1 -p), p_values))
plt.figure()
plt.xlabel("p(b=1)")
plt.ylabel("H(b)")
plt.plot(p_values, hp_values)
```

When $p=0.5$, the Entropy maxes-out at 1.

::: notes

Excuse the inconsistent syntax, it's denser this way.

We are saying that we have a bit *of data* b, that can either be one or zero. And it can only have two values.

. . .

Bring that back to earlier when we said that 1 bit of data contains 1 bit of information if the probability of it being 1 or 0 was 0.5, this is why!

:::


### Further Entropy Reading

- Joint Entropy
- Conditional Entropy of Ensembles
- Chain Rule for Entropy
- Mutual Information
- Kullback-Leibler Distance and Fano's Inequality



## Source-Coding

::: notes

This section will explain why we all 1 bit of information, a 'bit'.

:::

---

### Codes

Stream of data can produce $A$, $B$, $C$ and $D$, with:

- $p(A)=\frac{1}{2}$
- $p(B)=\frac{1}{4}$
- $p(C)=\frac{1}{8}$
- $p(D)=\frac{1}{8}$

---

### Encoding as Binary

A naive code might look like this:

- $A = 00$
- $B = 01$
- $C = 10$
- $D = 11$

This has a fixed *code rate*, (the mean number of bits transmitted), $R=2$.

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

The efficiency $\mu$ of our coding is $\mu=\frac{H}{R}$:

$$\mu=1.75/2=0.875$$

::: notes

The implication is that a coding *should* exist that itself has a coding rate $R=H$, and if we can find-it, it will be optimal.

:::

---

### Variable-Length Coding

Now imagine:

- $A = 0$
- $B = 10$
- $C = 110$
- $D = 111$

. . .

$$R=p(A)+2p(B)+3p(C)+3p(D)=1.75$$

::: notes

Explain variable length coding, and useful properties (each symbol uniquely and instantaneously decodable).

<hit next>

Look, it's entropy matches R!

:::



---

### Shannon's Source-Coding Theorem

*You can compress a stream of data with entropy $H$ into a code whose rate $R$ approaches $H$ in the limit, but you can't have a code rate $R < H$ without loss of information.*

---

### On Fixed Probabilities

Probabilities in symbol streams rarely fixed

- Could be affected by previous symbol ($p(U|Q)$ is high!)
- Can be dependant on context, the *type* of data: photos vs cartoons.
- Can depend on recipient (encryption!)

::: notes

The goal of encryption is transmit data in such a way that it contains no information for anyone except the intended receiver.

This is unfortunately the limits we will get to with lossless compression, but you can see the foundations of a mathematical system for understanding this stuff.

Good compression systems are as much about trying to accurately *discern* the entropy of each symbol for the target recipient.
:::

---

### Further Coding Reading

- Huffman Codes & Huffman Trees
- Kraft-McMillan Inequality
- Markov Chains



## Compression

::: notes

Coding covers how different ways of coding the same data can make it more or less efficient, but how does this apply to general-purpose compression?

:::

---

### TODO Compression

TODO




## Relations

---


### Original List

  - Compression (duh!)
  - Communications and Networking (duh!)
  - Data Oriented Design
  - Security
  - Machine Learning (huh?)
  - Computer Vision (huh?)
  - Computer Graphics (huh!?)
  - ^^ Almost Everything in Computer Science

---

### TODO How these all relate




## The End

---

### Special Thanks

- Professor John Daugman for teaching this course at University.
- Alastair Toft & AJ Weeks for ideas bouncing and feedback.
- Huw Bowles for organising these talks and providing invaluable feedback.

---

### Social Media

Subscribe to our [YouTube Channel](https://www.youtube.com/channel/UCahevy2N_tj_ZOdsByl9L-A)!

More talks available! Chips! Git!

---

### References

::: {#refs}
:::


### Careers {data-background-color="#000"}

[careers@electricsquare.com](mailto:careers@electricsquare.com)


