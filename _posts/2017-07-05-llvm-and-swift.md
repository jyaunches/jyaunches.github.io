---
title: Swift - Child of the LLVM
subtitle: "Exploring what Swift achieves on LLVM that Obj-C could not."
date: 2017-07-05
tags: [LLVM, Series, Swift]
featured_image: '/images/swift-llvm/article-tile.png'
---

This post is the second in a series on the LLVM (Apple's compilation tool chain pioneered by Chris Lattner). The first post spoke about the compilation project at a high level, broadly outlining it's history and the reasons Apple adopted and developed it.

With this article, I want to look more in depth at how the LLVM enabled Swift to advance beyond Objective-C and what benefits this has brought.

Swift came about as direct result of Apple's adoption and advancement of the LLVM compiler. See the [first article](http://yaunch.io/llvm-introduction/) in this series for more details on this. We'll review briefly here for context!

## LLVM Project

The LLVM compiler project was started by Chris Lattner at the University of Illinois. Apple became interested in it for both it's 'language-agnostic' design but also the potential to more easily compile to many target architectures. 

The benefits brought by the LLVM did allow Apple to progress Objective C and it's development toolset. However, in 2010 the LLVM reached a point where it could support more features than could be added to Objective C. This is when development of Swift started.

## LLVM Advances & Obj-C

While Apple was adopting the LLVM/Clang and using it to move Obj-C forward we saw significant improvements. Notable were:

| Advancement          | Release       | Description      |
|----------------------|---------------|------------------|
| Support Blocks       | iOS4 / 2010   | Lanuage-level feature allowing creation of distint segments of code that can be passed around to methods or functions as it they were values |
| ARC                  | iOS4.3 / 2011 | Eliminated the need for programmers to manually manage retain counts. |
| Collection Literals  | iOS6 / 2012   | Allowed: NSArray *instruments = @[@"Flute"]        |
| Modules.             | iOS7 / 2013   | Improvement to code reuse / library importing. Modules are compiled as stand alone libraries, making multiple references to the same module easier and more efficient |

## LLVM Advances & Swift

A primary motivation for Swift was definitely to piggy-back and continue to utilize the advancements of the LLVM toolchain. It's notable that there also were other great reasons to introduce a new more accessible language. New developer ramp-up for one. Obj-C is not the easiest first progamming language to master. 

Probably feature objectives with Swift development:

| Objective            | Language Direction |
|----------------------|---------------|
| Increased accessibility to new developers | - Modern language syntax<br/>- Visibility into ARC completely removed |
| Advanced language features that won't slow runtime | SIL (Swift Intermediary Language) |
| Reduce Crashes | - Strongly Typed<br/>- Increased compiler error detection<br/>- Optionals |

### SIL 

With Swift, the compilation team decided to introduce a new intermediary language to enable both language features and improved compilation. The flexibility of LLVM allowed them to do this and slot it right into the existing compilation flow


<div class="gallery" data-columns="1">
	<img src="/images/swift-llvm/SIL-in-compilation-flow.png">
</div>

A huge source of info on this was a talk given at the 2015 LLVM Developers' Meeting. Check this out. It's fascinating.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ntj8ab-5cvE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### Benefits

As stated in the talk linked above, SIL enables a wider gap between source (Swift) semantics & IR semantics during compilation. This has a few notable benefits:

#### Language evolution
SIL allows Swift language writers to write more of the language in the language

#### Safety
SIL allows for compiler errors on things like uninitialize vars and unreachable code

#### Generics
A really interesting example of compilation strategy impacting language features

* SIL allows for a generics model that supports dynamic dispatch & separate compilation. This is instead of being dependent on _template instantiation_ like Obj-C & C++... which uses a runtime strategy that can slow execution down.
* In more simple languages, dynamic dispatch & separate compilation is a strategy that uses in-lining of concrete type function definition at compile time. This leaves the impact of generics at runtime basically non-existent. Check out [this page](https://swift.org/blog/whole-module-optimizations/) on how it's done.
* FYI this is called function _specialization_. 

## Summing it Up

It's super relevant as an engineer following the Swift language to understand how it's design was so hugely related to advancements made to the LLVM during the period Apple was championing this toolchain. It not only gives great context behind the language features we've seen rolled out so far.. but provides indication for what may lie ahead for this still young language!





