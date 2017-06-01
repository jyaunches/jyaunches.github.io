---
layout: post
title: Back to Hardware
description: "Joining early-stage hardware start-up, Grow"
modified: 2016-05-10
tags: [Grow, iOS, Hardware]
image:
  feature: grow-blog-header.png
  credit: 
  creditlink: 
---

I recently joined early-stage hardware start-up Grow, heading up their software engineering. This is a super exciting opportunity and a chance to work on a technically, very interesting product. What does my role as Head of Software Engineering mean for a hardware start-up? It's probably going to be mean a lot of things. At a high level, I'll be the first engineer focusing on the user's digital experience with this product.

This means I'l focus more on off-device software that will serve as the primary means of user interaction with the device (when they aren't physically handling it). It's going to be a mobile-first experience.. so this means building the mobile apps the customer will use.. it also means building the back-end server related components that are needed to support these apps and give us the data we need to get a picture of what's going on. 

It also means I'll be hiring and building out the future team who will scale this as the company grows!

So, what is this device? Grow is building a outdoor-based automated growing system. What does this mean? The vision is a box that you can plant vegetables in and not have to stay on top of of complex schedule of caring for them. They are watered on a schedule designed for the species and current stage of life of the the plant. There's an app you use to monitor progress remotely... and let you know about tasks you do need to do such as pruning, harvesting, etc.

Here's are some pictures of our first prototype.

{% capture images %}
	/images/grow-prototype-1.jpg
	/images/grow-board-prototype.jpg
{% endcapture %}
{% include gallery images=images caption="Grow Prototype - Box & Board" cols=3 %}

Software wise, there a lot of really interesting problems to solve.

1. Data retrieval from the bed. If we're taking care of your plant, we need to pull relatively recent data from it giving us a picture of what's happening. Soil moisture levels, temperature, etc.. How do we get this data? (Bluetooth, Cellular, Wifi?)
2. Handling gardens with n number of beds.. i.e. scaling.
3. Dynamic watering programs. Customizing the behavior of each bed to what is planted in it and it's needs.
4. Data capture/analysis of what's getting grown successfully and funneling this learning back into product/software design.
5. Early stage validations of hardware components. (Lab testing)
6. Effective user testing. What do we put in front of users first? What do we need to capture when we do this.
