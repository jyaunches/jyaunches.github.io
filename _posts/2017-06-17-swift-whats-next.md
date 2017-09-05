---
layout: post
title: The Story of Swift
description: "Perhaps the most rapidly adopted programming language in history.. What's next?"
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature:
  credit: 
  creditlink: 
---

Swift is turning 4 this month. With each new release, the language changes and definitely becomes more enjoyable to program in. I first wanted to write a post examining what's new in Swift 4 and what to expect in the next version of this young language.

I had to stop myself while researching this topic and acknowledge that so much of the context for where we are with Swift is based on it's history to date. On Swift's 4th birthday, I'd like to look back at _both_ how the language came to be what it is today and what's in store for the latest version and beyond.

## Swift's Origins

### Child of the LLVM compiler

Swift came about as direct result of Apple's adoption and advancement of the LLVM compiler. Understanding why Swift was started requires understanding how the LLVM came about.

It's a really fascinating story!

#### LLVM project begins

The LLVM compiler project was started at the University of Illinois by Chris Lattner and Vikram Adve. It was originally implemented to compile C & C++, but was created with a 'language-agnostic' design in mind... this caught the eye of Apple they Lattner to bring his project and it's development in-house. It was advanced and over time became integral to Apple's development toolset. 

The benefits brought by the LLVM allowed Apple to progress Objective C and it's development toolset.

In 2010 LLVM reached a point where it could support more features than could be added to Objective C. Lattner apparently began working on Swift at this point. The framework laid by the advancements to the LLVM, Obj-C and Apple toolset seem to have been foundational in the direction Swift would go.

"We simplified memory management with Automatic Reference Counting (ARC). Our framework stack, built on the solid base of Foundation and Cocoa, has been modernized and standardized throughout. Objective-C itself has evolved to support blocks, collection literals, and modules, enabling framework adoption of modern language technologies without disruption. Thanks to this groundwork, we can now introduce a new language for the future of Apple software development."
-- Chris Lattener

#### Beyond Objective-C

It does really seem like the advancements made in the last stages of Obj-C development were tightly coupled to advancements in the LLVM... but left things imperfect, bulky and awkward. 

Example: ARC

ARC (automatic reference counting) is really a feature of the LLVM's Clang compiler. At the time ARC was introduced, Obj-C had to be modified to take advantage of it. Developers were still required to instruct the compiler on what type of memory management to apply to different variables. And crashes could (and did) occur if you got it wrong!

This is a great example of how the advancements of the LLVM laid the framework for Swift. Swift uses ARC, but was designed to drastically simplify the developers interaction with it.

### Big Wins with Swift

With the context of understanding Swift was designed to take full advantage of the latest LLVM advancements. Let's look at a few of the things we got

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