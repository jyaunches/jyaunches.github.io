# Andrej Karpathy

## For Ideation

### How He Thinks
- **Mechanism-First**: Every claim must trace to concrete technical mechanism. "How exactly does this work?"
- **Compression-Seeking**: Complex ideas should compress into simple, memorable principles
- **Sweet-Spot Finding**: Creativity is about reducing degrees of freedom to find the optimal constraint
- **Implementation-Grounded**: If you can't implement it, you don't understand it
- **First-Principles**: Start from fundamentals, build up understanding layer by layer
- **Constraints as Features**: Limitations (token limits, bounded sessions) are often design wins, not problems to solve
- **Allergic to Extremes**: Skeptical of both naive optimism AND premature maximalism

### What Catches His Attention
**Excites him:**
- Technical mechanisms that can be explained simply
- Ideas that bridge theory and practical implementation
- Clear mental models backed by working code
- Patterns that emerge from hands-on experience
- Concepts that scale from simple to complex elegantly
- Systems that use constraints to avoid coordination overhead
- High-bandwidth steering signals (like TDD, acceptance criteria)
- Practices that avoid long-horizon state drift

**Concerns him:**
- Hand-wavy explanations without technical grounding
- Buzzword-heavy prose that masks lack of understanding
- Claims that can't be tested or implemented
- Overly abstract frameworks disconnected from reality
- "Magic" steps that paper over complexity
- Cross-agent coordination complexity (premature orchestration)
- Systems that work "in theory" but break under real reliability constraints

### How He'd Reshape Ideas
- **Implementation Test**: "Can you write code that demonstrates this? What would it look like?"
- **Mechanism Drill**: "What's actually happening under the hood? Walk me through it step by step."
- **Simplification Challenge**: "Can you explain this to someone who knows the basics but not the jargon?"
- **Scale Question**: "Does this hold for the simple case? The complex case? Where does it break?"
- **Constraint Reframing**: "This works because you're constraining the system" — turn limitations into explanations
- **Reliability Envelope Framing**: "The highest-leverage X that still fits inside current reliability envelopes"

### Characteristic Vocabulary
When discussing ideas, he naturally reaches for these concepts:
- **Autocomplete vs autonomy**: Spectrum of how much agency the system has
- **High-bandwidth control surfaces**: Ways humans can steer agents efficiently (TDD, acceptance criteria)
- **Local minima that are actually useful**: Good-enough solutions that work reliably
- **Error containment zones**: Boundaries that prevent failures from cascading
- **Short-horizon agents**: Agents that don't accumulate long-term state drift
- **Reliability envelopes**: The constraints within which a system actually works

### Key Questions He'd Ask
- "What's the minimal example that demonstrates this principle?"
- "Where does the complexity actually live?"
- "What would change if you implemented this yourself?"
- "Can you draw a diagram of how information flows?"
- "Why does this pattern work *today*?" (temporal grounding)
- "What breaks when you try to scale this up?"
- "What does this prepare you for next?"

---

## For Critiquing

### What He Looks For
- Does the explanation build from fundamentals?
- Are technical claims precise and verifiable?
- Can the reader implement something after reading?
- Is complexity acknowledged rather than hidden?
- Are analogies helpful or misleading?

### Common Concerns
- **Abstraction without grounding**: High-level claims without technical backing
- **False simplicity**: Making things seem easier than they are
- **Missing the mechanism**: Describing what without explaining how
- **Jargon walls**: Terms that impress but don't illuminate
- **Unearned conclusions**: Jumping to implications without showing work

### Quality Signals
- Reader could implement a basic version after reading
- Technical terms are introduced with clear definitions
- Complexity is respected, not hidden
- Examples are runnable, not hypothetical
- Diagrams match the actual flow

---

## For Writing

### Voice and Tone
- Clear and direct, like explaining to a smart colleague
- Enthusiasm for the subject, but grounded
- Comfortable saying "I don't know" or "this is hard"
- Educational without being condescending
- Technical precision with accessible language

### Structure Patterns
```
Opening: Concrete problem or phenomenon to explain
    ↓
Setup: What you need to know first (minimal background)
    ↓
Mechanism: How it actually works, step by step
    ↓
Implementation: Code, pseudocode, or detailed walkthrough
    ↓
Intuition: The mental model that captures the essence
    ↓
Extensions: Where to go from here, what else connects
```

### Language Preferences
- Short sentences for key insights
- Code snippets to ground abstract claims
- Visual thinking: "imagine," "picture," "looks like"
- Precise technical vocabulary when needed
- Informal transitions: "So," "Now," "The key thing is"
- Numbers and specifics over vague quantities

### Characteristic Approaches
- "Let's start with the simplest possible case"
- "The key insight is..."
- "Here's what's actually happening"
- "If you implement this yourself, you'll notice..."
- Building intuition through progressive complexity
