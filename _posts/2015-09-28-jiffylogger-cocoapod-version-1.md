---
layout: post
title: JiffyLogger Released!
description: "Release of first major cocoapod."
modified: 2015-09-28
tags: [iOS, CocoaPods, JiffyLogger, CoreBluetooth, Logging]
image:
  feature: JiffyLoggerLogo.png
  credit: 
  creditlink: 
---

Wow! I'm very excited to release my first major CocoaPod.

## What is it?

JiffyLogger is a logging tool that allows you to capture custom events and look at them immediately inside your iOS application.

Logs are stored on the filesystem and writing to the log is buffered and happens on a background thread. Event logging is setup in standard way and is explained further in the 'Quick Start' section of [JiffyLogger's github page](https://github.com/jyaunches/JiffyLogger/wiki/Quick-Start-Guide).

Where JiffyLogger goes beyond your normal logging is it's in-app viewing and log exporting functionality.

{% capture images %}
	/images/logs-screen.png	
	/images/export-button.png
	/images/email-log-screen.png	
{% endcapture %}
{% include gallery images=images caption="Log viewing and exporting" cols=3 %}

## Why?

JiffyLogger is obviously not something that you'd release your app with. It's more a development/field testing tool. It was originally designed to assist with integration of a custom (also under development) bluetooth peripheral.

I developed JiffyLogger while working at [goTenna](http://www.gotenna.com/) actually. goTenna is custom BTLE hardware device that connects to your phone over BTLE but enables you to communicate with other goTenna users off traditional networks. goTennas setup their own network where communication happens over radio frequency.

<figure class="full">
	<a href="http://gotenna.com"><img src="/images/gotenna-product.png" alt=""></a>
</figure>

At goTenna, we found JiffyLogger useful in the following situation:

#### Firmware development

goTenna's firmware engineers used these logs to review BTLE packet and connection information while developing the device's firmware.

#### Hardware development

goTenna's hardware engineers used these logs to recover realtime information regarding various hardware metrics. Temperature, chip settings, etc...

#### iOS app/peripheral integration

While developing the mobile applications, these logs were integral to implementing the communication protocol agreed upon between the device and app.

#### Field testing

Super valuable. Field testing a BTLE device can reveal results quite different from lab testing. For a seemingly infinite number of reasons. We often used these logs to try to understand what was happening in the middle and after the conclusion of a field test.

## QuickStart

For more information and to get started using JiffyLogger, head on over to [it's Github page](https://github.com/jyaunches/JiffyLogger/wiki/Quick-Start-Guide)!
