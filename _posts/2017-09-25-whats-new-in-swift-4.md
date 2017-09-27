---
layout: post
title: Swift 4 Cheatsheet
description: "Use this new stuff!!!"
modified: 2017-09-26
tags: [Swift, iOS]
image:
  feature: 
  credit: 
  creditlink: 
---

### Index

[One-sided Ranges](#one-sided-ranges)

[Strings](#strings)

Multiple Type Definition

https://digitalleaves.com/blog/2017/06/whats-new-in-swift-4/

### Strings ###

####

####

#### String is a Collection again (of new type Substring)

For a while we had string.characters.. which was clunky.

{% highlight swift %}
let greeting = "Hello, 😜!"

greeting.count
for char in greeting {
    print(char)
}

let comma = greeting.index(of: ",")!

let substring = greeting[..<comma]			
print("\(type(of: substring))")				//"Substring\n"
print(substring.uppercased())				//"HELLO\n"


{% endhighlight %}

### One-sided Ranges ###

Allows you to specify a range without an upper or lower boundary. Examples:


#### Collection Subscripts

{% highlight swift %}

let nums = [1, 2, 3, 4, 5, 6, 7, 8]	
let fourAndAbove = nums[3...]			//[4, 5, 6, 7, 8]

{% endhighlight %}

#### Pattern Matching

{% highlight swift %}
let values = [-1, 0, 3]
for value in values {
    switch value {
    case 1...:
        print("over zero")
    case 0:
        print("zero")
    case ..<0:
        print("under zero")
    default:
        fatalError("this is not possible")
    }
}
{% endhighlight %}






