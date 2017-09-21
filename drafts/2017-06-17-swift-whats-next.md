---
layout: post
title: Swift - Child of LLVM
description: "Perhaps the most rapidly adopted programming language in history.. What's next?"
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature:
  credit: 
  creditlink: 
---

This post is the second in a series on the LLVM. The first post spoke about the compilation project at a high level, broadly outlining it's history and the reasons Apple adopted and developed.

With this one, I want to look more in depth at how the LLVM enabled Swift to advance beyond Objective-C and what benefits this has brought.

### Swift's Origins

Swift came about as direct result of Apple's adoption and advancement of the LLVM compiler. Understanding why Swift was started requires understanding how the LLVM came about.

It's a really fascinating story!

### LLVM project review

The LLVM compiler project was started by Chris Lattner at the University of Illinois. Apple became interested in it for both it's 'language-agnostic' design but also the potential to more easily compile to many target architectures. 

The benefits brought by the LLVM did allow Apple to progress Objective C and it's development toolset. However, in 2010 the LLVM reached a point where it could support more features than could be added to Objective C. This is when development of Swift started.

WHAT ARE THESE FEATURES?

### LLVM Advances & Obj-C

While Apple was adopting the LLVM/Clang and using it to move Obj-C forward we saw the following language improvements:

Modern Language Features
- support blocks, collection literals, and modules

ARC
- simplified memory management with Automatic Reference Counting

### Swift - Beyond Objective-C

Swift was invested in not only to piggy-back and continue the advancements of the LLVM toolchain Apple had developed. There were other great reasons to introduce a new more accessible language. New developer ramp-up for one.

But I do want to look at what language features we got in Swift that weren't necessarily possible in Obj-C/Clang/LLVM

#### SIL 

With Swift, the compilation team decided to introduce a new intermediary language to enable to language features. The flexibility of LLVM allowed them to do this and slot it right into the existing compilation flow

{% capture images %}
	/images/swift-llvm/SIL-in-compilation-flow.png
{% endcapture %}
{% include gallery images=images cols=1 %}

Example: ARC

ARC (automatic reference counting) is really a feature of the LLVM's Clang compiler. At the time ARC was introduced, Obj-C had to be modified to take advantage of it. Developers were still required to instruct the compiler on what type of memory management to apply to different variables. And crashes could (and did) occur if you got it wrong!

This is a great example of how the advancements of the LLVM laid the framework for Swift. Swift uses ARC, but was designed to drastically simplify the developers interaction with it.

### Big Wins with Swift


Swift - wider gap between source semantics & IR semantics

Writing more of the language in the language

Generic model - support dynamic dispatch & separate compilation instead of being dependent on template instantiation like Obj-C & C++


Safer

Uninitialize vars, unreachable code should be compiler errors


Swift has it's own intermediary language (SIL).

--> allows for compiler warnings on uninitialize vars, unreachable code should be compiler errors

SIL is still built off LLVM provided primitives.. creating boundary between SIL & LLVM responsibilties.

---------

1. Safer

- Optionals

2. New developer ramp up. Junior developer

 - Playgrounds
 - Syntax

3. Language perks. Generics. 





Swift 1.0 

Goals: 
- Integrating with iOS libraries. Ex. IBOutlets.
- Basic language
- Generics, optionals

Issues:



Source: https://github.com/ksm/SwiftInFlux/blob/52674b1ee87488159d6e0690fc9959579a8fe070/README.md



Swift 2.0 

Goals:

Issues:




Swift 3.0 

Goals:
- Definition API design guidelines
- Adoption of guidelines in key APIs

Swift 3 is the first release to enable broad scale adoption across multiple platforms, including significant functionality in the Swift core libraries (Foundation, libdispatch, XCTest, etc), portability to a number of platforms including Linux/x86, Raspberry Pi, and Android, and the Swift package manager to easily manage the distribution of Swift soure code.

Issues:
- No support for running both swift 2.0 & 2.3
- Created huge migration issues for many teams

https://github.com/apple/swift-evolution/blob/master/releases/swift-3_0.md


Swift 4.0 

Goals:
- Stabilizing the ABI

Resilience: resilience provides a way for public APIs to evolve over time, while maintaining a stable ABI. For example, resilience eliminates the fragile base class problem that occurs in some object-oriented languages (e.g., C++) by describing the types of API changes that can be made without breaking ABI (e.g., "a new stored property or method can be added to a class").

Defining a memory ownership model will fundamentally shape the ABI

Issues: