---
title: Swift Collections & Sequences
date: 2016-09-05
tags: [Swift, Swift Collections]
featured_image: '/images/collection-and-sequence/collections.jpg'
---

Swift is widely known and loved by programmers for different things. One of these are it's Collections and the Sequence type that comes with it. Sequence is not just for Swift standard library collections, however. It can also, as a protocol, be applied to really any struct or class that wants to behave like a collection in Swift and implement the Sequence methods.

The most commonly used thing Sequence brings us is the abilty to use for-in loops.

This allows us to write things like:


```swift
let numbers = 1...3
for number in numbers {
    print(number)
}
// Prints "1"
// Prints "2"
// Prints "3"
```

Without Sequence, we'd end up writing something like this:

```swift
let numbers = [1, 2, 3]

let index = numbers.count
var i = 0;
while i < index {
    print(numbers[i])
    i += 1
}
```

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

```swift

func contains(e: Element) -> Bool {
  var elementFound = false
  for item in elements {
    if e == item {
      elementFound = true
    }
  }
  return elementFound
}
```

It pretty uncomplicated stuff right? So, if you wanted to create your own custom collection and get the power of Sequence and all these useful methods. How do you do it? It's fundamentally based in allowing the iteration of a for-in loop.

Let's look at doing this for a pretty basic data structure, the linked list. So, a linked list is a set of instances that each have a reference to the next element in the set.

<div class="gallery" data-columns="1">
  <img src="/images/collection-and-sequence/linked-list.png">
</div>

You know when you've reached the end because the reference to next is nil

Fundamentally, to implement a linked list, you're going to need a representation of a link and something to represent the list. If we want to add Sequence type functionality... we'll create both those classes as we would typically, but the list itself needs to implement both the Sequence and IteratorProtocol protocols. All we need to implement here is the next() function.

```swift
class Link<T> {
    let value: T
    let nextLink: Link<T>?
    
    init(_ value: T, next: Link<T>?){
        self.value = value
        self.nextLink = next
    }
}

class LinkedLink<T> : Sequence, IteratorProtocol {
    var currentNode : Link<T>?
    
    init(head: Link<T>) {
        currentNode = head
    }
    
    func next() -> T? {
        if let next = currentNode?.nextLink {
            currentNode = next
            return next.value
        }
        return nil
    }
}

let elementFour = Link(4, next: nil)
let elementThree = Link(3, next: elementFour)
let elementTwo = Link(2, next: elementThree)
let elementOne = Link(1, next: elementTwo)

let linkedList = LinkedLink(head: elementOne)

for item in linkedList {
    print(item)
}

// prints 2
// prints 3
// prints 4

linkedList.contains(2)  //true

```

Notably, with this linked list example.. we don't get the first element, or the head, printed. This is down to the fact that our implementation of next(), when called for the first time returns the second link.. which we then print. This could be solved by introducing a subclass of Link to represent the head and then to instantiate the LinkedList with this.

### Summing it Up

So, the Sequence protocol is pretty simple and easy to add to a custom collection object. It brings a suite of great functions for your use. What you're essentially setting up when you implement the Sequence and IteratorProtocol protocols is the instruction for  enumeration.. which is the functionality at the core of all functions provided by Sequence. Well done Swift writers!

