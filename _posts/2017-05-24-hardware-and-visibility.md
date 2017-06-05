---
layout: post
title: Developing for Hardware & Visibility
description: "When you're app is your gateway..."
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature: grow-blog-header.png
  credit: 
  creditlink: 
---

Intro

I've been building iPhone apps for almost 6 years at this point. In the last few I've been primarily focusing on engineering ones that act as the primary user interface to custom build hardware device. You can think of a smart watch or maybe a smart thermostat as examples of smart devices... but even these usually have a small screen and buttons on board for user interaction with the hardware product.

The mobile app still serves as a gateway to the device in these circumstances, many times opening up the user to complete more complex functions.

I've been working, however, on devices that don't really offer much more than a single power button on the device itself. All user activity outside of powering it off/on (and perhaps an intially setup as with my current company, Grow) happens through the mobile app. And it happens directly over Bluetooth between the smart device and the user's phone.

This introduces really fascinating challenges.. largely around visibility into these interactions.


Context - Grow & goTenna

What are they.. what they do

What responsiblities fall to mobile (when mobile-first experience to low or no interaction hardware device.)

Allow the user to:
- Give the device instructions
- Receive feedback following sending instructions

(These are probably the more obvious responsibilities...)

What's not perhaps immediately obvious.

Lab Testing & Field Testing

- While engineering a platform for a new hardware product... all aspects of this platform are likely being engineered at the same time. This includes:

* Hardware - the boards, circuitry 
* Mechanical - the physical system the hardware is sitting it.. sometimes just as protection.. but other times integrating other physical components. As with Grow, our physical system holds our hardware.. but is also designed to hold soil and plants and hook up to a water line allowing us to control irrigation to these plants.
* Firmware - The software that runs on the hardware board.. handling communication between the components connected to it by mechanical. 
      * Usually written in C... 
      * When building a BT driven system, the firmware is receiving the commands from the app, and responding with information requested.. ususally displaying to the user or uploading to a server for analysis.
* Server infrastructure - Any off-device systems besides your app. APIs, storage, cloud intelligence, etc..
* The mobile app. Acts as the gateway between the physical product with it's custom hardware & firmware and and server infrastructure.

In this system, there's a very clear divide going on between the hardware/firmware and the app/server. The These can almost be looked at as two asyncronous/integrated systems... communicating with each other over a syncronous BT communication channel.

[Insert Pic of System]

Communication over BT as only means.. App is the Gateway (Pic subtitle)








Building a platform for this purpose brings in many new interesting UX paradigms.. the app in many ways carries much more responsiblity in ensuring quality of experience to the given business's product. As without a stable, strong user experience, the product will likely not be fully appreciated.



Standard vs. for Hardware iOS App Development