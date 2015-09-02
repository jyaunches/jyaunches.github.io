---
layout: post
title: WWDC - CoreBluetooth Lab Findings
description: "Spoke with Apple CoreBluetooth engineer while at WWDC."
modified: 2015-06-14
tags: [CoreBluetooth, WWDC, WWDC Labs, iOS]
image:
  feature: apple-wwdc-20151.jpg
  credit: 
  creditlink: 
---

I've been working with CoreBluetooth over the last 12 months for my current client, goTenna. The goTenna is a small hardware device that pairs with your phone or BTLE enabled iOS or Android device and allows you to communicate with other goTenna users while off-grid. (The goTenna uses radio frequency to achieve this.)

While at WWDC last week, I was able to get many of our problems in front of a CoreBluetooth engineer and I thought it would be great to document what they said.

## Our Issues

### Write Errors

These are errors returned after writing a packet to your peripheral's write characteristic. This error comes in via the following callback

{% highlight objective-c %}
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{% endhighlight %}

The error happens intermittantly and when you get it, it has the awesomely descriptive text of 'Unknown Error'.

*Apple engineer comments:*

* This is the peripheral disconnecting during a write (thanks)
* This was apparently identified and addressed during WatchOS development and will be available in 8.2+. We should see it less and get a disconnection
* When you get it, you should now just the disconnect callback

### Unexpected disconnections

#### Happening randomly during a stable connection

*Apple engineer comments:*

* Behind the scenes in CoreBluetooth, there are constant handshakes going on between it and peripheral. What's likely happening here is CoreBluetooth is not getting a response from one of these handshakes.
* Recommendation is to do reconnect logic and attempt to rewrite your data (yay)
* Can also gather bluetooth logs and submit them here: https://developer.apple.com/bug-reporting/ios/bluetooth/
* Can also debug closer to the bluetooth chip on the peripheral.


#### Happening immediately following a connection being established
*Apple engineer comments:*

* Occassionally, bluetooth chips can say they are connected when they actually aren't (great)
* Recommendation is to do reconnect logic and an initial write to your peripheral to confirm the connection is established

#### Happening more often in a heavy bluetooth traffic area
*Apple engineer comments:*

* Yep, it's a pain, huh? That's bluetooth for you. (Lol)

### No connection can be established

This we observed rarely and a restarting of bluetooth on the iOS device fixes it.

*Apple engineer comments:*

* This was apparently identified and addressed during WatchOS development as well and will be available in 8.2+. 
* No clue how to troubleshoot this one.
