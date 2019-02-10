---
title: 'Developing for Hardware & Visibility'
subtitle: "When you're app is your gateway..."
date: 2017-05-24
tags: [Grow, iOS, Hardware]
featured_image: '/images/hardware_and_visibility/grow-prototype-1.jpg' 
---

I've been building iPhone apps for 4 years. In the last few I've primarily focused on engineering ones that interface to custom-built hardware device. You can think of a smart watch or maybe a smart thermostat as examples of smart devices.

I want to talk about what changes when this is your paradigm. I will argue that you not only need to worry about the standard software development concerns:

* A delightful user experience
* Logical architecture 
* Solid/maintainable codebases

You also need to consider how your off-device software creates visibility into what's happening during not only development, but field testing and customer use. This creates a whole new dimension to non-functional requirements.

Also, let's also be clear.. most times we really need visility are when things are failing. 

## Example

Let's start with considering a real world example.

### The Grow planter

<div class="gallery" data-columns="1">
	<img src="/images/hardware_and_visibility/Planter_Toms.png">
</div>

I currently work at Grow and much of my understanding of visibility and hardware comes from my experience working on their planter and the software that supports it. Grow's purpose is to bring the joy of gardening to people who don't have experience in gardening or perhaps the time to always be checking in on it. Our smart planter has integrated sensors that not only drive an automated watering system.. but allow us to provide customized feedback about what's happening with the user's crops.

### What does this mean from a technical stand-point? 

#### 1. We need to know what plants the user has planted.

<div class="gallery" data-columns="1">
	<img src="/images/hardware_and_visibility/planter-planting.jpg">
</div>

#### 2. We need to be able to instruct the planter about custom watering based on the sensor records and individual plant needs.

<div class="gallery" data-columns="1">
	<img src="/images/hardware_and_visibility/grow-planter-sensors.png">
</div>

#### 3. The planter's sensors are constantly taking readings. We need to get these off the device and onto our servers for analysis.

<div class="gallery" data-columns="1">
	<img src="/images/hardware_and_visibility/planter-watering.png">
</div>

## What about Visibility?

Let's circle back to the argument that building software for hardware devices means you have to think more about different kinds of visiblity. 

### All components under development

While engineering a hardware product... all aspects are likely being engineered at the same time. This includes:

_Hardware_ - The boards, circuitry 

_Mechanical_ - the physical system the hardware is sitting it.. sometimes just as protection.. but other times integrating other physical components. As with Grow, our physical system holds our hardware.. but is also designed to hold soil and plants and hook up to a water line.

_Firmware_ - The software that runs on the hardware board.. handling communication between the components connected to it by mechanical. 

* Usually written in C... 
* When building a BT driven system, the firmware is receiving commands from the app, and either responding with information requested or initiated a received instruction.

Returning to the idea that visibility is required most when failures occur, given that a smart device being engineered has all of these components changing at any given time... we have a great many new points of failure.

### Our Stack

Every stack is different. However, the majority of smart devices connect to users and the outside world through a single gateway. Many (like Grow) use Bluetooth and rely on the user's smart phone to be this interface. At Grow, our mobile apps do act as our single communication gateway retrieving sensor records from the device and sending any instructions for operation. The phone acts as a conduit with all data ending up at and all instructions ultimately coming from our cloud servers.

#### The Grow stack.

<div class="gallery" data-columns="1">
	<img src="/images/hardware_and_visibility/grow-stack.png">
</div>

## How does Grow's software stack provide visibility?

We build visibility into systems largely for helping out when things go wrong. When you engineer a software stack that supports a custom hardware device you have an extra set of failure points to consider. Specifically, as many potential failure points as possible on the hardware device itself need to be able to communicated off the device and tracked by your software.

At Grow, we tackle this in a few ways.

### Robust logging 

It's important that it can be used during lab and field testing and exported off the mobile device during user testing.

What's useful here is to develop a sort of error communication protocol between the device and the connected app. We developed set of codes the device could send to the app. What logging creates is a place to log all communication from the device. If one of these codes comes through, the logs show when it happened relative to other data communicated over the bluetooth connection.

These logs also need to be accessible. We simple store them locally and back them up to an S3 bucket at intervals or when the app launches.

### Granular controls 

Often events that users may trigger through the consumer-facing interface are not granular enough. You may need to build controls that are used specifically for lab & field testing.

This is a UI that is generally only used by engineers or those field testing the device. It's cleaner if you can separate this out into a separate app as it keeps this UI code separate from that that is actually customer facing. If you take this route, it typically makes the most sense to bundle your lower level communications code together into a framework or cocoapod that can be shared between your field testing app and your customer-facing app.

A few screens from our field testing app at Grow...

<div class="gallery" data-columns="3">
	<img src="/images/hardware_and_visibility/bed-detail-screen.png">
	<img src="/images/hardware_and_visibility/sync-list-screen.png">
	<img src="/images/hardware_and_visibility/logs-screen.png">	
</div>

With the logs sceen, you can bundle the logging functionality and local storage into the shared framework and then if you need these logs visible for field testing, build the display of them only into the field testing app.

“It typically makes the most sense to bundle your lower level communications code together into a framework or cocoapod that can be shared between your field testing app and your customer-facing app.“

## Closing

Building apps for connected devices does require a new set of considerations that impact architecture and definitely expand the scope of what needs to be built. When engineering a connected device, your app also needs to be the window into what is happening when issues arise. Without visiblity, your team could find themselves scrambling to know what went wrong during that critical field test. Bake visibility into the architecture ahead of this.

### Quick take-away of recommendations

1. Log all communication with the device. Connection attempts, disconnections, all bytes transferred, and anything else that will help diagnos issues.
2. Backup logs off device for access during offsite field testing.
3. Separate out your lower level device communication code into a framework or cocoapod.
4. If you have a set of controls required for field testing build a separate app for this that utilizes the framework wrapping your comms code.


And remember.. it's about VISIBILITY. It will save you time down the road. Invest in it upfront!


