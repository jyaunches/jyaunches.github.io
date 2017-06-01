---
layout: post
title: Developing for Hardware & Visibility
description: "When you're app is your gateway..."
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature:
  credit: 
  creditlink: 
---

I've been building iPhone apps for almost 6 years. In the last few I've primarily focused on engineering ones that interface to custom-built hardware device. You can think of a smart watch or maybe a smart thermostat as examples of smart devices.

I want to talk about what changes when this is your paradigm. I will argue that you not only need to worry about the standard software development concerns:

* A delightful user experience
* Logical architecture 
* Solid/maintainable codebases

You also need to consider how your off-device software creates visibility into what's happening during not only development, but field testing and customer use. This creates a whole new dimension to non-functional requirements.

Also, let's also be clear.. most times we really need visility are when things are failing. 

## Example

Let's start with considering a real world example.

{% capture images %}
	/images/hardware_and_visibility/Planter_Toms.png	
{% endcapture %}
{% include gallery images=images caption="The Grow planter." cols=2 %}

I currently work at Grow and much of my understanding of visibility and hardware comes from my experience working on their planter and the software that supports it. Grow's purpose is to bring the joy of gardening to people who don't have experience in gardening or perhaps the time to always be checking in on it. Our smart planter has integrated sensors that not only drive an automated watering system.. but allow us to provide customized feedback about what's happening with the user's crops.

### What does this mean from a technical stand-point? 

{% capture images %}
	/images/hardware_and_visibility/planter-planting.jpg
{% endcapture %}
{% include gallery images=images caption="1. We need to know what plants the user has planted." cols=2 %}

{% capture images %}	
	/images/hardware_and_visibility/grow-planter-sensors.png		
{% endcapture %}
{% include gallery images=images caption="2. The planter's sensors are constantly taking readings. We need to get these off the device and onto our servers for analysis." cols=2 %}

{% capture images %}
	/images/hardware_and_visibility/planter-watering.png	
{% endcapture %}
{% include gallery images=images caption="3. We need to be able to instruct the planter about custom watering based on the sensor records and individual plant needs." cols=2 %}

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

{% capture images %}
	/images/hardware_and_visibility/grow-stack.png	
{% endcapture %}
{% include gallery images=images caption="The Grow stack." cols=2 %}

## How does Grow's software stack provide visibility?

We build visibility into systems largely for helping out when things go wrong. My argument is that when you engineer a software stack that supports a custom hardware device you have more failure points to consider. Essentially, as many potential failure points as possible on the hardware device itself need to be able to communicated off the device and tracked by your software.

At Grow, we tackle this in a few ways.

### Robust logging 

It's important that it can be used during lab and field testing and exported off the mobile device during user testing.

### Granular controls 

Often events that user may trigger through the consumer-facing interface are not granular enough. You may need to build controls that are used specifically for lab & field testing.




