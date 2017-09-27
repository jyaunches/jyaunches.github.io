---
layout: post
title: Swift Collections & Sequences
description: "Exploring what Swift achieves on LLVM that Obj-C could not."
modified: 2017-07-05
tags: [LLVM, Series, Swift]
image:
  feature: swift-llvm/Swift_and_LLVM.png
  credit: 
  creditlink: 
---

Swift is widely known and loved by programmers for different things. One of these are it's Collections and the Sequence type that comes with it. Sequence is not just for Swift standard library collections, however. It can also, as a protocol, be applied to really any struct or class that wants to behave like a collection in Swift and implement the Sequence methods.

The most commonly used thing Sequence brings us is the abilty to use for-in loops.

This allows us to write things like:

{% highlight swift %}
let numbers = 1...3
for number in numbers {
    print(number)
}
// Prints "1"
// Prints "2"
// Prints "3"

{% endhighlight %}

Without Sequence, we'd end up writing something like this:

{% highlight swift %}
let numbers = [1, 2, 3]

let index = numbers.count
var i = 0;
while i < index {
    print(numbers[i])
    i += 1
}
{% endhighlight %}

So Sequence brings us for-in loops. But it turns out these are really at the root of everything we get with the Sequence type. Here are some of it's more frequently used functions:

- func dropFirst(_:) 
- func dropLast(_:) 
- func filter(_:)
- func forEach(_:)
- func map(_:)
- func split(_:omittingEmptySubsequences:whereSeparator:)
- func contains(where:)
- func first(where:)
- func reduce(_:_:)
- func reversed()
- func sorted(by:)

Looking at these.. you can implement all of these using a for-in loop. Consider the implementation for contains(:).

{% highlight swift %}

func contains(e: Element) -> Bool {
  var elementFound = false
  for item in elements {
    if e == item {
      elementFound = true
    }
  }
  return elementFound
}

{% endhighlight %}

It pretty uncomplicated stuff right? So, if you wanted to create your own custom collection and get the power of Sequence and all these useful methods. How do you do it? It's fundamentally based in allowing the iteration of a for-in loop.

Let's look at doing this for a pretty basic data structure, the linked list. So, a linked list is fundamentally a set of instances that each have a reference to the next element in the set.

{% capture images %}
	/images/collection-and-sequence/linked-list.png
{% endcapture %}
{% include gallery images=images cols=1 caption="You know when you've reached the end because the reference to next is nil"%}

