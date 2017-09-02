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


Swift is turning 4 this month. I want to briefly tell it's story and take a look forward for what is likely coming in Swift 5.0.


Apple began creating the Swift programming language for many of these complaints. And others.

To name a few.


--- Before diving into the history, I want to first share the story of how Swift got started. ---

In 2010 LLVM reached a point where it could support more features than could be added to Objective C. Chris Lattner (behind LLBM & Swift) began working on Swift at this point.

Apple's free iBook on Swift also notes that "Swift has been years in the making," adding that "Apple laid the foundation for Swift by advancing our existing compiler, debugger, and framework infrastructure. 

"We simplified memory management with Automatic Reference Counting (ARC). Our framework stack, built on the solid base of Foundation and Cocoa, has been modernized and standardized throughout. Objective-C itself has evolved to support blocks, collection literals, and modules, enabling framework adoption of modern language technologies without disruption. Thanks to this groundwork, we can now introduce a new language for the future of Apple software development."

--- Let's imagine the new features that were desired for Obj-C but perhaps not possible.. and that thus were the promise made in creating Swift ---

1. Crashes.

- Optionals

2. New developer ramp up.

 - Playgrounds
 - Syntax

 "Playgrounds were heavily influenced by Bret Victor's ideas [which are cited as a inspiration for Khan Academy's online environment for learning to program], by Light Table [an open source IDE designed to provide realtime feedback about code and how programs work] and by many other interactive systems. ""

 - Chris Lattner

 Apple is committed to changing the game here. Playgrounds has come far is now available on iPad.

3. Language perks. Generics. Reflection.


Swift Development Challenges

1. Fitting into existing platform

The challenge is when you put the language into developers hands for use.. who are then using it in the current format. If you change syntax or API. Things break. (Anyone who experienced Swift 2 -> Swift 3 knows.)

2. Speed

Swift developed as a language that could take more advantage of the LLVM.

2. Ongoing theme: 



Swift Development Components
(What are the different parts of the language getting developed)

Foundation



Swift 1.0 

Goals: 
- Integrating with iOS libraries. Ex. IBOutlets.
- Basic language

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