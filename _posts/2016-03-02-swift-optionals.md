---
layout: post
title: Swift - Optionals Mindset
description: "Thinking shift with optionals"
modified: 2015-12-28
tags: [Swift, iOS]
image:
  feature: Swift_logo-hero.jpg
  credit: 
  creditlink: 
---

Optionals are one of Swifts most unique features. They are powerful.. but take some getting used to when starting out with swift development. I for one spent about half of my development time figuring out what should and should not be an optional and how and when to pass them around and unwrap them.

There are a lof of posts out there explaining what optionals are and how they work. I want to talk today about how you program with them. Specifically, how you think differently about property, variable and paramter definition as you design your classes and functions (among other contexts).


### Thinking Shift

In Objective-C (or other programming languages for that matter).. when working nils you can sort of just pass them around until you reach a case where operating on it with a nil value would cause a problem. At this point.. you check for whether or not it is nil.. and then you perform your operation if it isn't.

Consider the following class definitions.

{% highlight objective-c %}
@interface Book : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *author;
@property (nonatomic) NSString *description;
@end
{% endhighlight %}

Code that crashes:

{% highlight objective-c %}
Book *book = [[Book alloc] init];
book.author = nil

NSRange *rangeOfAuthor = NSMakeRange(0, self.author.length)
{% endhighlight %}

This happens because we are attempting to create the NSRange with a nil length. 

The safe thing to do is:

{% highlight objective-c %}
if(book.author != nil){
	NSRange *author = NSMakeRange(0, book.author.length)
}	
{% endhighlight %}

So basically, anywhere a nil causes a crash, you will have to check for the case of nil.

In Swift... I like to think about objects being allowed to be defined in two ways:

- Those that can exist as a nil
- Those that can not exist as a nil

When you define a property or variable.. you tell the compiler whether this thing is the first or the second. If the property or variable you're defining can (ever) exist as nil... then you must declare it as an optional. Ahhhh!!! Optionals. 

Ok, it is not so bad! Let's consider our book example. With a book, a name and author are probably items that we can say must always be there. i.e. The can never be nil. A book's description is something that might not be available, however.. meaning it could exist as a nil. 

One thing that's quite swifty is to represent Book as a struct. This will aid us in forcing that name and author be present in every definition of a book.

{% highlight swift %}
struct Book {
    var name: String
    var author: String
    var description: String? //This is indicating the description is a property that could be nil (an optional!)
}

var b = Book()
{% endhighlight %}

The above declaration of b gives you an error. Defining a book as struct means that everytime we instantiate one, we must provide the properties it contains. As follows:

{% highlight swift %}
var b = Book(name: "Jean", author:"Auel", description: nil)
{% endhighlight %}

Notice if you try to set author to nil, you get a compilation error.

{% highlight swift %}
var b = Book(name: "Jean", author:nil, description: nil)
{% endhighlight %}

So, this means everytime we access a books name or author, we can be sure it will never be nil. This is safer all around as we DO NOT have to remember to check for nil in the cases we might see a crash.

### Takeaway

Optionals allow:

- You to be explicit about whether a variable of property must be present at all times.
- To not have to explicitly check for nil in cases when it may cause a crash.
- In doing the above, minimize likelyhood of crashes in your app.

(BTW, also)
- Structs go a little further to enforce you create your object with the properties it is defined to have.





