---
title: 'Apple Intelligence - Examined'
subtitle: Article
date: 2024-06-26
description: Apple has the unique opportunity to put AI in front of millions of it's users for the first time.
featured_image: '/images/apple-intelligence/siri-apple-intelligence.png'

---

![](/images/apple-intelligence/siri-apple-intelligence.png)


WWDC 2024 was widely anticipated this year to learn what Apple's AI strategic plans would be. The pre-event announcement of a partnership with OpenAI fueled even more speculation. We learned their offering, Apple Intelligence, will bring new AI-driven experiences to all their operating systems across devices this fall. There's much to unpack and await. Follow through to the end for my predictions on the future of third-party apps, the primary way businesses reach users on Apple devices.


## Apple's Opportunity

In a world dominated by two smartphone platforms, the established advantage that both Google and Apple have in reaching their global and daily user bases is clear. Many AI startups founded in recent years are likely to be replaced by Apple or Google products before they ever reach the masses with their ideas. The unique position here is that many people globally will interact with a large language model (LLM) for the first time through their smartphones and the tools that Apple announced in June of this year.

This is great for Apple, frustrating for many AI startups, but also indicative of how we might expect AI experiences to reach so many people for the first time.

## What We Know About Their Strategy

Apple's strategy is pretty smart and in keeping with how they tend to approach product strategy.

1. Meet users where they are. Improve the things they are already doing in subtle ways.
2. Keep it internal to start. Right now, Apple Intelligence (and all the tech under this umbrella) will be tightly contained to the operating system and internal applications across their devices. 
3. Put privacy front and center as a PR stance but also from an architectural point of view.

## The 'Mom's Flight' example

A now commonly used example came from the WWDC keynote where Craig Federighi demoed asking Siri what time to leave to pick up his mom from the airport. 

_There’s an implicit triangulation of data here_:

1. First, look up the flight information. This could be in an email or text message.
2. Check the flight status for this flight.
3. Look up the route he would take to get there. Would he drive or take the train? Perhaps Siri would come back to confirm this.
4. Check traffic conditions or train delays.
5. Ultimately, recommend that he depart at a specific time to be there as she exits the airport.

Pretty cool, right? This takes a task many of us would spend 10 minutes performing ourselves and completes it within seconds. What if you could also say, "Notify me if anything changes"?

These are the small improvements to our daily lives that AI can bring. Ultimately, what will be happening under the hood here refers to the promise of the agentic future:
1. The series of steps to complete this recommendation are determined by an LLM.
2. AI-driven software knows where to go to complete each of these tasks.
3. The returned data is fed into an LLM to translate the results and determine what to tell the user or do next.

### Siri

Siri has been a part of the Apple ecosystem synce 2010. Critics might say it hasn't improved much over the years. It's gotten a rap for being pretty unhelpful. Requests for the weather and to set a timer are probably what it is most reliable for.. along with the ability to ask mundane trivia 'What was the first album by the Beatles?'. Context about the person asking or anything they'd asked before (even the very last thing requested!) were not taken into account. The airport pick-up example is far far from possible on the historic Siri.

In a Siri reboot, Siri becomes the gateway into Apple Intelligence and the agentic promises Apple have made.

### On-device vs Private Cloud Compute

On these topics, we take a glimpse into the architectural strategy for Apple Intelligence and how they plan to deliver on the promise of functionality and user data privacy.

Broadly speaking AI models that run on your personal device using local data only are inherently.. private. Everything is local. There's no chance for a bad actor to intersept data leaving your device or data being processed in a cloud server.

Apple has outlined a multi-tiered approach for processing AI requests within Apple Intelligence:

__On-device Processing__

Apple Intelligence is designed to process requests on the device whenever possible. This is the primary and preferred method, leveraging the Neural Engine in Apple's custom silicon chips (M-series for Macs and iPads, A17 Pro for iPhone 15 Pro). On-device processing also ensures fast execution of common AI tasks while maintaining user privacy.

__Private Cloud Compute__:

For more complex requests that require greater computational capacity or larger server-based models, Apple Intelligence can utilize Private Cloud Compute. PCC is a secure cloud computing environment that uses custom Apple silicon servers and runs a specialized OS rooted in "iOS foundations". Key features of PCC include:
* End-to-end encryption for data transmission
* No persistent storage of user data
* Cryptographic verification to ensure devices only communicate with verified PCC servers
* Independent expert inspection of PCC code for privacy verification

### The OpenAI partnership

It feels like just about everyone has announced a partnership with OpenAI this year. Apple's was announced just before WWDC and left everyone guessing where they'd be coming in on Apple technical and product strategy.

It turns out, they are the first of many planned 3rd party LLM integrations into Apple Intelligence. And the use of ChatGPT or any other LLM will be completely in the hands of each user. A strong underpinning of that privacy promise.

In the future user's will be able to integrate their favorite LLM, be it Claude, Gemini or ChatGPT.

## The Tech

Following WWDC, Apple's Machine Learning team put out a really great [blog post](https://machinelearning.apple.com/research/introducing-apple-foundation-models?utm_source=thetechoasis.beehiiv.com&utm_medium=referral&utm_campaign=the-platonic-representation-apple-intelligence) on the models they'd be incorporating into Apple Intelligence.

> Apple Intelligence is comprised of multiple highly-capable generative models that are specialized for our users’ everyday tasks, and can adapt on the fly for their current activity.

### Apple's LLMs 

The differentiator in Apple's LLM architecture are what they are calling as their LoRA adapters.

![](/images/apple-intelligence/language-model-architecture.png)

These adapters are fine-tuned for the different types of tasks that a user task on their phone:
* Summarization
* Proofreading
* Email responses
* Task urgency determination

![](/images/apple-intelligence/LoRA-adapters.png)

As an example of this approach mentioned in their blog post, the team elaborated on their summarization adapter. Since email and notification summaries have different requirements, they fine-tuned LoRA adapters on their model to meet each one's unique needs. Their training data came from high-quality synthetic summaries generated by larger server models and filtered through a rejection sampling strategy.

The fascinating aspect of this architecture is that these adapters can be used interchangeably on the same on-device LLM, allowing for optimized performance based on the specific hardware.

## Whats Ahead

In usual Apple style, a lot was promised but a lot was left unexplained. Apple Intelligence is launching for Siri and their internal apps, but how would it be made available to 3rd party app developers? There was no mention of this in the WWDC keynote. However, taking a look around, some predictions can be made!

> 'Headless Apps'

Across much of the AI buzz circuit, there have been mentions of how our existing mobile apps will morph into 'Headless Apps'. The idea here is that you will interact with the businesss or entities you now use mobile apps to do via integrations with this coming AI agent layer, Apple Intelligence.

### Apple App Intents

In the Apple ecosystem, it would make a ton of sense for Apple to lean into their App Intents API. This was only launched 2 years ago at WWDC 2022 and there hasn't been wide adoption. It's promise has always been to give apps access to Siri integration. However, a lot iOS/MacOS engineers complained it was clunky and not working really well.

In a rebooted Siri, it is most likely that we'll see access to Siri for 3rd party apps through App Intents.

### Implications

In a world where users interact with your product through an AI assistant on their iPhone, what are the implications for apps that build robust user experiences with sophisticated capabilities? App UI footprints are likely to shrink, with fewer user experiences supported in-app and more made available through the AI assistant.

## Conclusion

We are on the precipice of a whole new technological era. How we do the everyday tasks that support our lives are already changing with AI. In the coming years, we will see more of that transformation. As an ex-app developer, I find myself asking.. 'Will my grandchildren say: Oh, my grandmother wrote apps for mobile phones.. Isn't that crazy, before our AI assistants did everything for us.'













