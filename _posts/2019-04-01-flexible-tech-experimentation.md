---
title: 'Flexible Tech & Experimentation'
subtitle: Article
date: 2019-04-01
description: It is critical that a business's tech provide flexibility for experimentation and scaling.
featured_image: '/images/flexibility/flexibility-ankles.jpg'

---

We are living though a moment of incredibly rapid change. Markets are being both created and disrupted at an incredible rate. Venture capital is pouring into these markets. Also visible are the strategy shifts that have led to faster experimentation and leaner exploration of how to grow a business. Having spent the last 6 years working as a technologist with NYC startups, it’s been a wild ride and I’ve learned something that I believe is crucial to navigating this landscape.

## Tech _must_ provide flexibility for experimentation.

Experimentation is at the core of what a start-up needs to do. They must be able to generate and trial new ideas quickly and often. Most of the time (although not always!) they need their technology platform to enable these experiments in at least a minimal way.

### What does it mean to have flexible tech?

Flexible technology means that codebases within the tech stack and the overall ecosystem have the capability to be changed. This change could include:
- Changing a data model
- Introducing a new component or service 
- Adding un-anticipated user features

The ideal situation is to have flexbility across your entire technical ecosystem. If this is not the current state of things (which it frequently isn't!), there can be a targeted analysis of where flexibility needs to be increased to drive more experimentation.

### Making decisions with flexbility in mind.

A tech stack and the codebases within one are an evolving landscape. The current state being a culmination of the technical choices that have come up to that point. Depending on those choices, flexibility has increased or decreased with each one. Let's look at a typical tech stack choice.

#### Example: Integrating an analytics stratgey.

The analtyics platform choice itself is not a potential flexibility limiting decision. In fact, the consideration for future flexbility should be in giving the business the option of pulling this dependency out sometime down the road. It's more the decisions made during the role out of the analytics implementation that will impact whether this can be easily done.

__Inflexible Implementation__


Potential How: Drop calls to anlytics API through code at points where events are understood to occur

Why Inflexible: One flexibility consideration with a decision like this is to give space to replace this service in the future if it's not serving the needs of the business. By dropping calls to it all over, the increased overhead of going back to each one when the service needs to be replaced could be prohibitive to making the change.

__Flexible Implementation__

How: Wrap all calls to the 3rd party anlytics API in a single analytics service class.


#### Example: Monolith database

A monolith database is not a typical thing to set out to achieve. Something like this typically comes about as a set of decisions made peicemeal over an extended period of time.  

Consider a database that stores:
- Generic content (unrelated to a user)
- User specific content or content relationships
- User settings
- State of processes going on (i.e. something is in a 'downloading' state)

These are all data groups unrelated to the others. There's no need to put them in the same datastore.. and by doing so, you become more reliant on that mechanism for storage. Say you had this all in a Postgres database and you want to get off Postgres... Or perhaps trial a new data store for a section of the data. You've left yourself inflexible to easily trying out that new option.

However, when that first piece of user settings data needed to get stored, the decision was made to put it in the database, perhaps even an existing table!

### Making decisions with flexbility in mind.

It may feel easy to blame the engineer behind each decision. This will likely not get your team closer to providing flexibility (as well as being unfair!). If a single engineer makes one of these single decisions and it adds just that granual of inflexibilty, the cumulative effect of many of these decisions adds up.. and becomes a systemic problem.

The answer is to set a shared team commitment to increasing flexibility for the business in every decision that gets made. There should be team discussions of: 'Does this increase our future flexiblity in this area?' And: 'How can we do this in a way where flexibility is increased?'

### Technical Go-tos

There are certain concepts that when used in your architecting strategy increase flexibilty. These are reverred by engineers as good practice already, but worth highlighting as flexibity increasers:

1. DRY - By minimizing duplication, you are leaving flexibility to only replace code in a single place when it needs to be replaced.
2. Single responsibility - A class with a single responsiblity again provides the flexiblity to replace it or the interals of it's API
3. Micro-services / modular design - a contained item with a limited, defined API also provides flexibilty to be replaced or re-implemented.

These represent tools in the toolbox of an engineering team. They've been around too. What I'm advocating is that when evaluating a decision, to look at the options through the lens of 'increasing flexibility'. Flexibility to back out of that solution. Flexibility to change the strategy in the future. When using this lens, you may dig back into the toolbox to say.. 'Ah, if we did it this way.. we'd be leaving ourselves an out down the road.'

### Conclusion - criticalness to startups

The world that we are experiencing is, again, one of incredibly rapid change. It's the businesses who are able to move nimbly that will survive and flourish. Those that are bogged down by their tech and unable to respond to new opportunities or experiment with new ideas will likely eventually fail. And while it absolutely takes more than flexiblity tech to move with efficiency and agility through a market & customer landscape, flexible technology is a huge part of doing this well. It's our job as technologists to ensure we are making technical decisions that enable a flexible future for the businesses we work with.






