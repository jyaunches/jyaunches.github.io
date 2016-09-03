---
layout: post
title: A play with Swift generics.
description: "Extending dictionary functionality"
modified: 2016-02-18
tags: [Swift]
image:
  feature: 
  credit: 
  creditlink: 
---


I've been learning Swift for a few months now and wrote my first function using generics today for a real world usecase.

Use case: merge two dictionaries, skipping duplicates. You've got to check for the same key types and value types.

{% highlight swift %}
extension Dictionary {
    func merge<K, V>(dict: [K: V]) -> [Key: Value]{
        var new: Dictionary<Key, Value> = [:]

        for (k, v) in self {
            new[k] = v
        }

        for (k, v) in dict {
            if let key = k as? Key {
                new[key] = v as? Value
            }
        }
        return new
    }
}
{% endhighlight %}