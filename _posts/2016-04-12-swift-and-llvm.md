---
layout: post
title: Understanding Swift - The LLVM
description: "First in the series of 'Understanding Swift'.. diving into it's origins which are based in the LLVM"
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature:
  credit: 
  creditlink: 
---

I've been learning Swift over the last year and as I gain understanding of it.. questions have been rising about what's next for this language.

You can review what's planned in [the upcoming releases](https://github.com/apple/swift-evolution/tree/master/releases). But, to gain the full picture, looking at the technologies that both triggered the languages development in the first place and influence it's ongoing progress is fascinating.

I'd like to make this the first in a series on the technologies around Swift and how they both drive the development of the language and are impacted by it.

This post will be on the [LLVM](https://llvm.org/) who, oddly, has very little to do with being a virtual machine.. but a great deal to do with the Swift programming language!

## What is the LLVM

{% capture images %}
	/images/llvm/LLVM_Logo.png
{% endcapture %}
{% include gallery images=images cols=2 caption="The LLVM Project - has kind of an indimidating logo?"%}

LLVM is actually an umbrella project for many subprojects. All of which result in a compiler infrastructure and tool chain used today largely by developers using C/C++ based languages.

### A Compilation Tool Chain

Any set of compilation tools (such as the LLVM and it's sub-projects) follow the same flow for compiling source code to machine code and then handing the result off to a process for linking and generating an executable. 

{% capture images %}
	/images/llvm/toolchain-compilation-flow.png
{% endcapture %}
{% include gallery images=images cols=1 %}

#### Within LLVM, what are the major pieces of this tool chain?

_Frontend_

* Clang - the frontend compiler for C/C++/Obj-C
* [Swift compiler](https://swift.org/compiler-stdlib/)

_Optimizations_

* One of the things that sets the LLVM compilation toolset apart. It's optimizations and the speed-ups they brought over gcc are one of the reasons Apple adopted it.


_Linking tools_

Won't go into these too much for LLVM. Just know that linking is one of the last stages of 'building'. It does happen post compilation and will usually raise errors if you've got duplicate definitions across multiple source code files.

_Development feedback tools_

LLDB is a great example here. These exist outside the compilation/linking flow.. but often build on the same tools used here. LLDB uses the source code analysis in clang to provide a great native debugger.

### Where does Swift come in?

Swift came about as a direct result of Apple's adoption and advancement of the LLVM compiler. Understanding why Swift was started requires understanding how the LLVM came about.

It's a really fascinating story!

#### The LLVM project begins

The LLVM compiler project was started at the University of Illinois by Chris Lattner and Vikram Adve. It was originally implemented to compile C & C++, but was created with a 'language-agnostic' design in mind... this caught the eye of Apple they Lattner to bring his project and it's development in-house. It was advanced and over time has became integral to Apple's development toolset. 

They originally used the gcc compiler.. but this is now totally (I believe) phased out.

The benefits brought by the LLVM allowed Apple to progress Objective C and it's development toolset.

In 2010 LLVM reached a point where it could support more features than could be added to Objective C. Lattner apparently began working on Swift at this point. The framework laid by the advancements to the LLVM, Obj-C and Apple toolset seem to have been foundational in the direction Swift would go.

"We simplified memory management with Automatic Reference Counting (ARC). Our framework stack, built on the solid base of Foundation and Cocoa, has been modernized and standardized throughout. Objective-C itself has evolved to support blocks, collection literals, and modules, enabling framework adoption of modern language technologies without disruption. Thanks to this groundwork, we can now introduce a new language for the future of Apple software development."
-- Chris Lattener

#### Beyond Objective-C

It does really seem like the advancements made in the last stages of Obj-C development were tightly coupled to advancements in the LLVM... but left things imperfect, bulky and awkward. 

Example: ARC

ARC (automatic reference counting) is really a feature of the LLVM's Clang compiler. At the time ARC was introduced, Obj-C had to be modified to take advantage of it. Developers were still required to instruct the compiler on what type of memory management to apply to different variables. And crashes could (and did) occur if you got it wrong!

This is a great example of how the advancements of the LLVM laid the framework for Swift. Swift uses ARC, but was designed to drastically simplify the developers interaction with it.













