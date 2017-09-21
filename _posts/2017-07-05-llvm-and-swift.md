---
layout: post
title: Swift - Child of the LLVM
description: "Exploring what Swift achieves on LLVM that Obj-C could not."
modified: 2017-07-05
tags: [LLVM, Series, Swift]
image:
  feature: swift-llvm/LLVM_Logo.png
  credit: 
  creditlink: 
---

This post is the second in a series on the LLVM (Apple's compilation tool chain pioneered by Chris Lattner). The first post spoke about the compilation project at a high level, broadly outlining it's history and the reasons Apple adopted and developed it.

With this article, I want to look more in depth at how the LLVM enabled Swift to advance beyond Objective-C and what benefits this has brought.

## Swift's Origins

Swift came about as direct result of Apple's adoption and advancement of the LLVM compiler. See the [first article](http://yaunch.io/llvm-introduction/) in this series for more details on this. We'll review briefly here for context!

### LLVM project review

The LLVM compiler project was started by Chris Lattner at the University of Illinois. Apple became interested in it for both it's 'language-agnostic' design but also the potential to more easily compile to many target architectures. 

The benefits brought by the LLVM did allow Apple to progress Objective C and it's development toolset. However, in 2010 the LLVM reached a point where it could support more features than could be added to Objective C. This is when development of Swift started.

## LLVM Advances & What Features it Enabled


## Obj-C

__Language Features__

While Apple was adopting the LLVM/Clang and using it to move Obj-C forward we saw significant language improvements. Notable were:
* support blocks
* collection literals
* modules

__ARC__

Also introduced because of LLVM/Clang advancements was simplified memory management with Automatic Reference Counting. Developers were still required to instruct the compiler on what type of memory management to apply to different variables. And crashes could (and did) occur if you got it wrong!

## Swift

Swift was invested in not only to piggy-back and continue the advancements of the LLVM toolchain Apple had developed. There were other great reasons to introduce a new more accessible language. New developer ramp-up for one. But let's look at the features Swift, with it's compilation toolchain work, brought beyond Obj-C.

Probably feature objectives with Swift development:

{% capture images %}
	/images/swift-llvm/Swift-language-objectives.png
{% endcapture %}
{% include gallery images=images cols=1 %}

### SIL 

With Swift, the compilation team decided to introduce a new intermediary language to enable to language features. The flexibility of LLVM allowed them to do this and slot it right into the existing compilation flow

{% capture images %}
	/images/swift-llvm/SIL-in-compilation-flow.png
{% endcapture %}
{% include gallery images=images cols=1 %}

A huge source of info on this was a talk given at the 2015 LLVM Developers' Meeting - [Swift's High-Level IR: A Case Study...](https://www.youtube.com/watch?v=Ntj8ab-5cvE). Check this out. It's fascinating.

### SIL Enabled

As stated in the talk linked above, SIL enables wider gap between source (Swift) semantics & IR semantics during compilation. THis has a few notable benefits:

* Enabling of Swift language writers to write more of the language in the language
* Safety - Allows for compiler errors on things like uninitialize vars and unreachable code
* Generics
	* SIL allows for a model that supports dynamic dispatch & separate compilation. This is instead of being dependent on _template instantiation_ like Obj-C & C++. 
	* In more simpler language.. this speeds up runtime through in-lining of concrete type function definition at compile time.. leaving the impact of generics at runtime basically non-existent. Check out (this page)[https://swift.org/blog/whole-module-optimizations/] on how it's done.
	* FYI this is called function _specialization_. 

## Summing it Up

It's super relevant as an engineer following the Swift language to understand how it's design was so hugely related to advancements made to the LLVM during the period Apple was championing this toolchain. It not only gives great context behind the language features we've seen rolled out so far.. but provides indication for what may lie ahead for this still young language!





