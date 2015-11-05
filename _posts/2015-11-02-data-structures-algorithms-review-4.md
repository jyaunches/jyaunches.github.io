---
layout: post
title: Algorithm Series - Problem to Data Structure Mapping
description: "How to map your problem to the best data structure."
modified: 2015-11-02
tags: [Algorithms, CS Review Series]
image:
  feature: 
  credit: 
  creditlink: 
---

This is the fourth post in a series of posts dedicated to algorithmic problem solving. The focus of this series is on organizing the approach taken to solving such problems and laying out the stages that one should move through. The posts prior to this one covers [understanding the problem](http://yaunch.io/data-structures-algorithms-review-2/) and [deciding on a data structure](http://yaunch.io/data-structures-algorithms-review-3/). This post continues with the data structure discussion and functions more as a cheatsheet for the various data structures you might choose from and what considerations might lead you to that choice. It also highlights implementation notes for each.

# Data Structures

## Linked List

Often linked list problems are given with the caveat that you're operating with a linked list. i.e. 'Given a linked list'... etc.. You're not often given a problem where the means of structuring your data is open-ended and you decide to go with a linked list.

#### Example problems:

* Given a linked list, determine it's midpoint with only one traversal through the list
* Write an algorithm to remove duplicates from a linked list.
* Find the kth element from the end of a linked list

#### Implementation Reminders

* If not specified, check whether the list is singly or double linked
* You can use multiple pointers
* Often, if you need to operate on a linked list given it's length, recursive approaches can be used to find the end and then operate on the return from each recursive call.
	* Example: Find the kth element from the end of a linked list

{% highlight ruby %}
def findKthFromEnd currentNode, targetDistance, currDistance
	if currentNode.next == nil
		currDistance = 0
		return currentNode
	end

	node = [self findKthNodeFromEnd:currentNode.next dist:targetDistance currCalc:currDistance];
	calc += 1;

	#pass back the currentNode as the matched distance from the end through 
	#the recursive method returns
	return currentNode if (targetDistance == currDistance)	
	node 
end
{% endhighlight %}

## Collections

### Set

Sets are *unordered*, *unique* collections of data. 

#### When to Use:

* You need a unique collection of items
* You're not worried about the order items are stored
* You need to sort the contents to extract what you need. (i.e All entries where name starts with A-D)

#### Example problems:

* Juke box admin: implement a function that allows juke box users to add new tracks to the juke box.
	* Duplicate tracks may confuse users, so if a user tries to add a song that already is in the juke box, don't add it again.

#### Implementation Reminders

* As sets unordered.. if you want a specific item within it, you need to already have a pointer to it or iterate through/sort the set to find the item(s) you want.
* Depending on specific languages, be mindful of mutability constraints.

### Array

Arrays make the most sense when you need to order the items within and you know you want to access items relative to their position in the collection. Unlike sets arrays allow duplicates as all contents are keyed by their index in the collection. i.e. Given an obj1, this ojbect can exist at multiple indexes within the array.

#### Example problems:

* Given a collection of numbers, find the equilibrium index where the sum for items behind that index equals the sum of the numbers ahead

#### Implementation Reminders
* Use when you need to allow for duplicates

### Stack

A stack expands on the an array.. as it keeps the items ordered. However, insertion and removal only happen from one end or the 'top'. Stacks allow you implement problems that require that sort of insertion or removal.

Stacks are a more nuanced structure like linked lists and many times you are given a problem where it's specified that you use a stack. i.e. 'Given a stack...'

#### Example problems:

* The Tower of Hanoi

{% highlight objective-c %}

@implementation HanoiTower

- (void)transferDisks:(int)numberOfDisks from:(Tower *)origin to:(Tower *)destination buffer:(Tower *)buffer {
    if (numberOfDisks > 1) {
        int nextDisks = numberOfDisks - 1;

        [self transferDisks:nextDisks from:origin to:buffer buffer:destination];
        [self transferDisks:1 from:origin to:destination buffer:buffer];
        [self transferDisks:nextDisks from:buffer to:destination buffer:origin];
    } else if (numberOfDisks == 1) {
        NSNumber *number = [origin pop];
        [destination push:number];
    }
}
@end

{% endhighlight %}

### Queue

In terms of insertions and removals, queues generally operate under FIFO (first-in, first-out) mechanism. More can be read [here](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)).

{% capture images %}
	/images/queue.png		
{% endcapture %}
{% include gallery images=images caption="Queue visualization" cols=3 %}

#### Example problems:
* Employees for a given company submit vacation requests. Only a certain number of employees can take vacation on a given day, so sometimes the request needs to be declined. Each day of each month allows a varied number of employees to be off, this number is set at the beginning of each month, so requests must wait to be approved or declined until this is known. Implement a function that accepts requests from employees and at the beginning of each month determines who can have their requested days off.

#### Implementation Reminders
* Some interesting implementation can exist around prioritized queues.
* Queue frequently come in handy in system operation problems.

## Graphs

Graphs make the most sense when items or nodes connect to one or more other nodes. Think about a social network of friends. Or a network of train lines. One way you know you'll probably be working with graph is if the problem domain talks about connections between nodes.

#### Example problems:
* Traveling Salesman Problem: Is a well known problem in the graph algorithm domain. Given a list of cities and the distances between each pair of cities, what is the shortest possible route that visits each city exactly once and returns to the origin city? 
* Given a family heirarchy, and two members of this family, find the next common ancestor between them.
* Given a list of university courses for a given major, where a student must take certain courses before others, determine a suitable order that a student can take their course load.

(All of these problems speak to nodes have direct relationships or dependencies on other nodes!)

#### Implementation Reminders

* Decide or consider whether you graph is directed or undirected
* Make use of sub structures like trees if you know that each node can have no more than 2 children.
* During traversal or building of graph, can use concepts such as "weight" to give certain nodes priorities over others.
* During traversal, if appropriate, use a visited flag to not visit the same node more than once.
* Always consider a breadth-first traversal vs. a depth-first traversal. More on this in a future post!
* If sorting a tree, consider a binary search tree. More on this later.


