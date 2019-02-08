---
title: Understanding The LLVM - Introduction
subtitle: "Diving into Swift's compilation tool chain"
date: 2017-06-18
tags: [LLVM, Series]
featured_image: '/images/llvm/LLVM-title-only.png'  
---

It's a common thing, as software engineers, to have a tendency to shy away from understanding compilation. At a high level, you know the compiler is turning your code into machine code the target computer (running your program) can execute. However, it's a powerful thing to understand compilation at a deeper level.

Specifically as a Swift developer, it's fascinating to know that without the earlier development of Swift's compiler, the LLVM.. the language itself wouldn't have been developed.

This article will look at what [the LLVM](https://llvm.org/) is and the history of it's development and adoption by Apple. 

## What is the LLVM

LLVM is an umbrella project for many subprojects. All of which result in a compiler infrastructure and tool chain used today largely by developers using C/C++ based languages and which is heavily integrated in Xcode and it's compilation process.

Of note, and this will be explored later on, the LLVM was developed to be an alternative to the most widely used compilation toolchain of the time, the GCC (GNU Compiler Collection). Comparison of these two options has been heavy over the years of LLVM's growth and development and they both remain viable options for certain languages in certain scenarios. We will talk here about what sets the LLVM apart and why it’s now the dedicated compiler toolchain strategy for Apple and subsequently iOS development.

## A Compilation Tool Chain

Any set of compilation tools (such as the LLVM and it's sub-projects) follow a similar flow for compiling source code to machine code and then handing the result off to a process for linking and generating an executable. 

<div class="gallery" data-columns="1">
	<img src="/images/llvm/toolchain-compilation-flow.png">
</div>

## The LLVM Pieces

### Frontend

A compiler's frontend converts source code to an intermediary language (IR) that can then be handed on to the next stages of compilation... or used by an IDE for warnings/errors or other types of feedback.

* In Obj-c, Clang was developed to be LLVM's go-to frontend compiler.. allowing the language to be be progressed beyond what was possible with GCC.
* In Swift, a custom [front-end compiler](https://swift.org/compiler-stdlib/) was developed.

### Optimizations

Optimizations are things the compiler does at runtime to speed up exection or in general increase performance in someway. Reduce footprint, inlining code, etc..

For the LLVM, it's optimizations have been something that has set it apart. Now, in many use cases, it surpasses GCC in speed and other benchmarks.

### Development feedback tools

LLDB is a great example here. This is native debugger that is fast and much more memory efficient than it's counterpart in GCC, the GDB. 

These type of tools exist outside the compilation flow.. but often build on the same tools. LLDB, for example, uses the source code analysis in Clang.

### Backend

After the front-end has converted the source language to an Intermediate Representation (IR), and this has gone through optimization, a compiler's backend generates the code that will actually be executable by the target machine's architecture and CPU.

The LLVM's capability here is likely a strong reason for Apple's support and adoption. It uses a target-independent code generation that is capable of creating output for several types of target CPUs — including X86, PowerPC, ARM, and SPARC. Useful for a company building software that will run on so many different hardware devices.

### Linking tools

Won't go into these too much for LLVM. Just know that linking is one of the last stages of 'building'. It does happen post compilation and will usually raise errors if you've got duplicate definitions across multiple source code files.

## Where the Power is

Most compilation toolchains, including GCC, break things into a front-end, middle section and back-end. This brings great flexibility. LLVM went further in terms of modularity and reuseablity.

- If you want support for a new language, you write a front-end lexer to convert you source language to LLVM IR code.
- If you need speed given a certain source code size, you could incorporate a new optimizer.
- If you need your code to run a specific target architecture not supported you could [write your 
own backend](https://llvm.org/docs/WritingAnLLVMBackend.html)
- Many of the LLVM projects can also be plugged into GCC.

## Apple & LLVM History

The LLVM compiler project was not started at Apple but University of Illinois by Chris Lattner (that guy) and a professor there, Vikram Adve. 

It was originally implemented to compile C & C++, but was created with a 'language-agnostic' design in mind... this caught the eye of Apple they brought Lattner, his project and it's development in-house in 2005. Though it appears it was not immediately invested in, Lattner spent his own time advancing the project until he was able to demonstrate it's value and convince Apple to invest a team in it. It was further advanced and over time became integral to Apple's development toolset... slowly replacing the previously used GCC compiler and many of the low-level tools Apple used across it's development.

The benefits brought by the LLVM allowed Apple to progress Objective C and Xcode and much of the performance and potential of their low-level tools.

In 2010, it seems the LLVM reached a point where it could support more features than could be added to Objective C. Lattner apparently began working on Swift at this point. The framework laid by the advancements to the LLVM, Obj-C and Apple toolset seem to have been foundational in the direction Swift would go.

"We simplified memory management with Automatic Reference Counting (ARC). Our framework stack, built on the solid base of Foundation and Cocoa, has been modernized and standardized throughout. Objective-C itself has evolved to support blocks, collection literals, and modules, enabling framework adoption of modern language technologies without disruption. Thanks to this groundwork, we can now introduce a new language for the future of Apple software development."
-- Chris Lattener

### Timeline of LLVM history at Apple

<div class="gallery" data-columns="1">
	<img src="/images/llvm/LLVM-apple-history.png">
</div>

## Conclusion

This article should have given a good idea of the LLVM specifically around:
* What the it is from a high level
* What it's most fundamental modular projects are
* Why, how and when Apple adopted it
* Where it's power lies

One interesting next step in learning about the LLVM and it's use would be to look at how the Swift front-end compiler was developed and how it fits into the LLVM toolchain. Fun!

