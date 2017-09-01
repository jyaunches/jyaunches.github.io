---
layout: post
title: Functional programming - currying
description: "What it is"
modified: 2016-07-29
tags: [Swift, Functional]
image:
  feature: 
  credit: 
  creditlink: 
---

This is a continuation in the series around functional programming concepts.

Today: Currying

As much as it sounds like a trip to London's Brick Lane (curry capital of the western world?)... this is not about vindaloo!

Currying is essentially when you break down a function taking multiple arguments into a series of functions. Each of these then taking 1 or more of the arguments. 

Consider the following function for adding two values.

{% highlight swift %}

func add(a: Int, b: Int) -> Int {
    return a + b
}

add(a: 3, b: 4) //returns 7

{% endhighlight %}

You would turn this into a currying function as follows.

{% highlight swift %}

func add(a: Int) -> ((_ b: Int) -> Int) {
    return { (b: Int) -> Int in
        return a + b
    }
}

let v = add(a: 3)(6)  //returns 9

var add3 = add(a: 3)

add3(4) //returns 7

{% endhighlight %}

The value is in being able to provide the first value.. store the function holding it and it's subsequent behavior.. and then call it later with the remaining values. 

There is some potential danger in readability and could be confusion with what the state of the existing values are. But there it is.