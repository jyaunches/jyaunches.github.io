---
layout: post
title: iOS 9 - Developer Overview
description: "Review of various changes in iOS 9 that would interest a developer"
modified: 2015-06-11
tags: [iOS9]
image:
  feature: ios-9-logo1.jpg
  credit: 
  creditlink: 
---

Following being at WWDC last week, and getting lots of introductions to whats new in iOS 9, I thought I'd jot down some of the main areas of interest to iOS developers. There's some pretty cool new stuff that I can't wait to dive into and check out.

#### Search API

Can register objects or even placeholders (like a specific view in a specific workflow) in your app as searchable by Spotlight. Saw some pretty cool examples in the media or retail space.

#### Stack Views

When Auto Layout was first released.. it was a total pain the in ass. Over the last few years, Apple have made improvements to make it easier to use. This is another of these.

It basically allows you to embed many views within one 'UIStackView'. Previously, you would have had to setup constraints on all the subviews individually as they related to each other and their super view. With stack views, you can tell them how to treat their children without having to set a bunch of constraints on each child.

Sounds great, but will require further investigation.

#### iPad Multitasking

Many phone or tablet users use these devices for work. Utilizing many apps at a time and switching back and forth.. often quickly and repetitively between the same apps. iOS 9 introduces split view for iPads where you can view two apps side by side. 

Also, apparently if your app uses Auto Layout and Adaptive Layout correctly, this is supposed to just work. Pretty cool, but I'd expect to have to do some layout tweaking to allow now both iPad screen sizes to look good. 

Definitely a good improvement for users though!

#### App Thinning

App sizes have grown over the years.. with @1x, @2x, and now @3x image assets, mulitple binaries that are based on the device hardware, ect.. With app thinning, only the resources required for the specific device downloading the app are included in the installation. 

https://developer.apple.com/library/prerelease/ios/documentation/FileManagement/Conceptual/On_Demand_Resources_Guide/

There's also a new 'On Demand' resource system that will allow you to pull resources only if required by the end user and at the time they need it.

#### Testing Improvements

Xcode is now including:

Code coverage - highlights what code is covered by unit tests.

UI test generation - records manual interactions with your app and automatically generates test code that you can capture and run as a part of you test suite.

#### The Kits

Upgrades and expansions have been made to HomeKit, HealthKit, MapKit and CloudKit.



