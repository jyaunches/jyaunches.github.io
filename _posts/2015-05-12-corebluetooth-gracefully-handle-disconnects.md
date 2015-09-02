---
layout: post
title: CoreBluetooth - Gracefully Handling Disconnects
description: "Ideas for how to handle disconnections in your CoreBluetooth app"
modified: 2015-05-12
tags: [CoreBluetooth, Bluetooth Disconnections, iOS]
image:
  feature: why-no-connect.png
  credit: 
  creditlink: 
---

I've been working with CoreBluetooth over the last year while building an app for the goTenna (a BTLE enabled device). This has been my first time working with both BTLE and CoreBluetooth and it's been quite a ride!

After figuring out how to connect and communicate with goTenna effectively, we quickly started observing intermittent disconnections. These disconnections took form in the following ways:

* Immediately following a connection being established (no data writen or read yet)
* Immediately following writing data to our peripheral (so, given a set of packets, the first one that goes out would not reach the peripheral and the connection would drop before anymore could be sent)
* In the middle of an established connection when there was neither data coming from or being written to the peripheral (but had been successfully at earlier points in the session.)

Not knowing what was causing this. We started down a path of research and troubleshooting.

### The Suspects

*Usage of CoreBluetooth API*

Let's face it. As in life, when facing a problem, the first and easiest thing you can change is yourself. So it goes in coding.

Make sure you're using the CB library the way [the documentation](https://developer.apple.com/library/ios/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/AboutCoreBluetooth/Introduction.html) describes.

*Configuration on your Peripheral.*

Because so much of what's happening when your app connects to and communicates with your peripheral is happening within CoreBluetooth, it's important to understand what configurations CoreBluetooth is expecting your peripheral to conform to.

BTLE enabled hardware devices have all selected a BTLE chip to use in their system. These chips allow a varying degree of configuration for how the chip will behave. 

We found that CoreBluetooth's expectations are pretty standard and often the defaul of how the chip ships. Still it's good to be sure.

In terms of disconnection issues, it's good to look at your peripherals 'Connection Parameters' and ensure they conform to CB guidelines. https://developer.apple.com/hardwaredrivers/BluetoothDesignGuidelines.pdf

*Bluetooth as a Standard*

In doing our research we opened up dialogue with some other BTLE related hardware start-ups. One using the same BTLE chip as us.. the other not. However, they both told us that they faced the same issues with connection stability.

The opinion of many engineers working in this space is that Bluetooth as a standard is not great. Lots of different chip manufacturers have implemented the protocol and the software that sits on top of the chip. Chances are there are some incompatibilities. 

### Solutions (Hacks)

Following optimization/confirmation of the CoreBluetooth API usage and our peripheral's configurations, our connection issues did not go away. Most of these solutions came from the other BTLE hardware startup companies we opened dialogue with while troubleshooting this issue.

1. Reconnection logic following an non user initated disconnect.
2. Perform an initial write to your peripheral upon establishing a connection to ensure that it is actually there.
3. If possible, don't disconnect via CoreBluetooth. Send a command to your peripheral to disconnect itself. (This was a recommendation from another company's engineer.. we did not necessarily observe improved connection stability following this change... but made it non-the-less.)
4. Reconnect to a known peripheral if possible. 

Our initial implementation involved the following methods

{% highlight objective-c %}
- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options;
{% endhighlight %}

Upon having the peripheral returned in the following callback

{% highlight objective-c %}
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI;
{% endhighlight %}

Then calling connect with that peripheral

{% highlight objective-c %}
- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options;
{% endhighlight %}

Our connection stability improved after moving to storing the peripheral's UUID and then reconnecting to the known device using:

{% highlight objective-c %}
- (NSArray *)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers;
{% endhighlight %}

And then connecting to the found device:

{% highlight objective-c %}
- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options;
{% endhighlight %}

### Lessons Learned

Understand your use case.

BTLE app implementations can involve:
* Multiple peripherals at a time 
* A single peripheral connection at a time, but perhaps many different devices during usage a single user's app.
* Just one dedicated BTLE peripheral. 

Our use case ended up being the last one.. meaning we could implement an approach of scan once and then reconnect to the same peripheral over and over.

Keep your reconnect logic simple.

This type of hacking can spiral into a myriad of timeouts and callbacks. Our final (and simplest) solution involved actually no timeouts. 





