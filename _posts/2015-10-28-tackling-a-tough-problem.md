---
layout: post
title: Tackling a Tough Problem
description: "How to approach a challenging algorithmic problem"
modified: 2015-10-30
tags: [Algorithms, CS Review Series]
image:
  feature: 
  credit: 
  creditlink: 
---

What makes a problem tough? I think it's a combination of the following: 

1. Mapping the information you have to an appropriate data structure that enables the most efficient solution/algorithm.
2. Designing the most elegant/efficient algorithm

Often, developers move right towards thinking about the second item, but I think you've got start with thinking about the first. Usually, you can map the data your problem set deals with to a range of data structures, some make your life easier and your solution more elegant.

Let's use an example...

'Write a function to solve a maze.'

What do we want here? So, given a maze (however we decide to represent it) with a start, a finish, and some representation of it's interior, 'solving' the maze likely means return a correct path from start to finish. Let's go with that assumption for now.

Start with How to Represent a Maze

This is a totally open-ended problem. But before getting caught up what the function needs to do, let's think about the ways we can represent a maze.

{% capture images %}
	/images/maze-grid-example.png	
{% endcapture %}
{% include gallery images=images caption="Simple maze example" cols=1 %}

In providing our solution, let's think about what we may need to know.

* Given a position in the maze, the directions available to move. (i.e. Left Right Up Down)
* We need a means of representing a path through the maze (to provide the 'solution')

Right off the bat, I definitely see the need for the concept of a maze position. But that's an object and not indicative of how we'll organize our data structures to represent it.

Options for representing a maze:

1) Array of arrays: 

In psuedocode, would look something like:

{% highlight ruby %}

maze = 		[[start, p2, p3, p4],
	[p5, p6, p7, p8],
	[p9, p10, p11, p12],
	[p13, p14, p15, finish]]

{% endhighlight %}

2) Graph of postion nodes

p5 = Postion.new
start = Postion.new
start.right = p2
start.left = p5
p5.up = start
p5.right = 
