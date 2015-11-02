---
layout: post
title: Algorithm Series - Data Structure Decision
description: "Decide on data structures"
modified: 2015-11-01
tags: [Algorithms, CS Review Series]
image:
  feature: 
  credit: 
  creditlink: 
---

This is the third post in a series of posts around problem solving at the algorithmic level. This series outlines the steps to approaching such problems: questions that need to be to asked, architectural decisions, consideration of tradeoffs, etc..

The [post prior](http://yaunch.io/data-structures-algorithms-review-2/) to this discussed the first stage of the process which was around analyzing and understanding the problem thoroughly.

This post is around choosing *how to represent your data*. For me, this means both of the following:

* Deciding on the appropriate data structure to represent your data
* Organizing an object model that helps in representing this data

I don't want to dive too deeply into what the different data structures are. But to name a few, they are: [array](https://en.wikipedia.org/wiki/Array_data_type), [set](https://en.wikipedia.org/wiki/Set_(abstract_data_type)), [linked list](https://en.wikipedia.org/wiki/List_(abstract_data_type)), [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)), [queue](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)), and [graph](https://en.wikipedia.org/wiki/Graph_(abstract_data_type)). What this post will focus is on what you need to think about while deciding which to use.

I think the best way to do this is to walk through an example and discuss.

### Example

#### Representing a maze.

Suppose we have the problem of finding the solution for a given maze. Before figuring out how we'd go about that, let's get a picture of what a maze looks like and what information we need.

**Step 1** - Visualize the data

{% capture images %}
	/images/maze-grid-example.png	
{% endcapture %}
{% include gallery images=images caption="Simple maze with start, finish and interior." cols=1 %}

After visualizing and thinking about a maze, we can say that it consists of: 

* a start and finish position
* a number of interior positions
* every position is connected to neighbor positions that can be traveled to (Left, Right, Up and Down)
* there should be a path between the start and finish positions

**Step 2** - Generate Data Representation Options

With each option, we need to figure out if it assists in representing the data we need to represent.

1) Array of arrays: 

That maze visualization up there looks an awful lot like an array of arrays.

In psuedocode, would look something like:

{% highlight ruby %}

maze = 	[[start, p2, p3, p4],
	[p5, p6, p7, p8],
	[p9, p10, p11, p12],
	[p13, p14, p15, finish]]

{% endhighlight %}

*What this structure allows us:* 

* the ability to show that start, p5, p9 and p13 all exist on the maze's left boundary.

*What this structure doesn't allow us:* 

* A means of indicating a node's open neighbors.. the fact that p2 follows start can represent that it is it's right neighbor, however, how can we represent if that move is not available?
	* The node itself could hold this information, but we must acknowledge that the data structure is not providing this.

2) Graph of postion nodes

{% highlight ruby %}
start = Position.new
p5 = Position.new
p6 = Position.new

start.right = p2
start.left = p5

p5.up = start
p5.right = p6
{% endhighlight %}

*What this structure allows us:* 

* In a way, this expands on the above acknowlegement that the nodes would need to know which neighbors were available to move to. 
* This also gives the option of not necessarily representing the maze as a grid. In a grid, every position has an up, down, left and right, with a graph representation, a given position could potentially have 4+ open neighbors. They could all be represented as just neighbors on the Postion object.

{% highlight ruby %}
start = Position.new
p5 = Position.new
p6 = Position.new

start.neighbors = [p2, p5]
p5.neighbors = [start, p6]
{% endhighlight %}

*What this structure doesn't allow us:*

* we aren't able to easily identify the positions that exist on the boundaries of the maze (as in option 1).. but that may not actually be required or useful information.

**Step 3** - Circle back to Problem

Ok, so we have a few options. Which one is best? Let's revisit the problem we were presented with.

'Given a maze with a start and finish, find a solution path.'

So, we need to explore the maze (given the start position) tracking potential paths until we find one that leads to the finish. This sounds an awful lot like a graph traversal where we're looking for the path to a target node. 

However, lets examine our other options again. In the array of arrays option, we could have each node know if it's Left, Right, Top, Bottom neighbors were open.

{% highlight ruby %}

maze = 	[[start, p2, p3, p4],
	[p5, p6, p7, p8],
	[p9, p10, p11, p12],
	[p13, p14, p15, finish]]

start.top = false
start.bottom = true
start.left = false
start.right = true

{% endhighlight %}

But, then we'd have to calculate the position of the next node to visit. Whereas in the graph option, those nodes are directly associated as neighbors.

**Step 4** - Decision

It's fairly clear that graph data structure feels like the cleaner, more representative, less restrictive data struction for this problem. That's not to say that upon getting further into the solution and turning up new information that this can't be changed!



