---
layout: post
title: Algorithm Series - Asymptotic Notation
description: "Analyzing the runtime of a given algorithm as input scales."
modified: 2015-11-02
tags: [Algorithms, CS Review Series]
image:
  feature: 
  credit: 
  creditlink: 
---

This is the fifth post in a series of posts dedicated to algorithmic problem solving. The focus of this series is on organizing the approach taken to solving such problems and laying out the stages that one should move through. 

The posts prior to this one cover:
* [understanding the problem](http://yaunch.io/data-structures-algorithms-review-2/) 
* [deciding on a data structure](http://yaunch.io/data-structures-algorithms-review-3/)
* [data structures examined](http://yaunch.io/data-structures-algorithms-review-4/)

This post will be more of a move into the algorithm design phase itself. The focus will be on understanding and idetifying the runtime of given algorithm, why it's important, and a review of the vocabulary and concepts used to convey and dicusss this information with others.

Before we begin, much of the information here I got from following the [Khan Academy lecture series](https://www.khanacademy.org/computing/computer-science/algorithms/asymptotic-notation) on this topic. It's execellent and I fully encourage people trying to understand Asymptotic Analysis to check it out!

## What is Asymptotic Notation?

In as few words as possible, it is a way of categorizing the runtimes of various functions as input size increases.

Where does the name come from? In mathematics, the term asymptotic refers to a line that approaches a curve but never touches. Unless your math skills are fresh, this may not immediately ring bells for you.

Check out the following graph showing input vs. time plotted on a graph, this is for a given set of some pretty typical function runtimes. You can see that the different ones show different curves on the graph.

<figure class="full">
	<a href="http://bigocheatsheet.com/"><img src="/images/asymptotic_graph.png" alt="bigocheatsheet.com"></a>
</figure>

Asymptotic notation refers to dropping the constant coefficient and less significant terms of a given function to identify the component where input size really grows.

Ex. a given function, f = 6n​^2​​+100n+300 

* The 6n​^2 becomes larger than the remaining terms once n becomes very large.  
* The 6 also becomes insignificant as n becomes large
* We can say the n^​2 is the portion of this function that really impacts it’s growth as n increases.

## Three forms

Different input can incur significantly different runtimes for a given algorithm. These can logically be discussed as best, average and worst case scenarios. three forms of asymptotic notation are available to describe these.

### Big-Θ (Theta)

* A way of saying the growth of a runtime is constant across best and worst case inputs
* Ex. Merge Sort:
	* runtime is always n log(n)
* So, you can say it has a runtime of Θ(n log(n))

### Big-O (Oh)

* A way of describing the worst case input
* Ex. Insertion sort:
	* best case, when input is nearly sorted, has runtime of n
	* worst case, when input is really unsorted, has runtime of n^2
* So, you can say it has a runtime of O(n^2) 

### Big-Ω (Omega)

* A way of describing the best case input.. and that an algorithm takes at least a certain runtime
* Ex. Insertion sort:
	* Best case here is again a runtim of n
* So, you can also say it has a runtime of Ω(n)

Generally, people use Big-O. This may be because our keyboards don't have easy accessible Θ or Ω keys. It may also be that describing the worst case runtime is sufficient for their needs. Either way, it's good to always consider best, average and worst case runtimes when analyzing your algorithms runtime.

One other useful thing I found for this topic was [this table](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CCEQygQwAGoVChMIx_eeidP5yAIVRk0mCh0K6Qwk&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBig_O_notation%23Orders_of_common_functions&usg=AFQjCNESApptQ2F9yleZLczFs3DS0RHcvA&sig2=GyPCOHTtrgcXrhK3W2l1Jg) of example runtimes on the wikipedia page for Big O notation. 




