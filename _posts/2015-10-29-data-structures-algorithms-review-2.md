---
layout: post
title: Algorithmic Problem Solving - Part 1
description: "Understanding the Problem"
modified: 2015-10-29
tags: [Algorithms, CS Review Series]
image:
  feature: 
  credit: 
  creditlink: 
---

Before diving into **how** to solve a problem, we've got to make sure we completely understand all aspects of the problem itself.

### Understand the Problem

* What data do we have to serve as our input? This can come from different sources/places. Identify all information that could serve as useful. Don't worry yet about how to organize it.
* How can that input data vary? Will certain aspects of it get very big? Can things be empty or nil? 
* What format is our expected result? How does that result differ under the varied input?
* Do we have any constraints to worry about? Memory? Processor? Network speed?

## Example

Let's take an example problem and walk through these steps.

### Problem Statement
You are writing a scheduling application for a large concert hall. Requests to book the venue come in and must either be approved or the application should suggest the next nearest date that could accommodate the event.

### Step 1 - Ask Questions

This problem is a little open-ended. When things are open ended.. Best to start asking questions.

* What information does a request contain?
* What allows us to approve a request?
* How do we determine the next nearest date to suggest?
* Are there any special cases where the answers to the above don't hold?

Let's assume we've talked to the organizers of this venue and we've gotten the following set of rules:

1. Assume a request contains: a date, a performer's name and other miscellanious data
2. Due to setup and teardown, no event can be scheduled within 5 days of another event.
3. When suggesting an alternative date, should suggest either an earlier or later date whichever is closest (and >= 5 days away). If both are available, suggest the earlier.
4. As a convienence offering, they want to allow people booking to identify one or more potential dates to request. Only make suggestions off the first choice date.

### Step 2 - Examine and Understand Input/Output data

**Data we need (Input Data)**

Calendar

* Information about existing bookings and allow us to determine if a requested date is available.
 
Booking Request

* Containing a collection of dates the requester is interested in. (Let's assume the collection is ordered in terms of preference.)

**Data we need to return (Output data)**

We can have two separate results.

1. That the booking was successful for one of the requested dates. We'd want to return the date that the booking was made on so the user knows if it was their 1st choice, 2nd choice, etc..
2. None of the requested dates are available.. We'd want to return a suggested date relative to their top choice requested date.

## Next

This represents a pretty good example of exploring a given problem, it's input and expected results, and some of it's related edgecases. Next in the problem solving process is thinking about how to represent the data we have in an appropriate data structure.








