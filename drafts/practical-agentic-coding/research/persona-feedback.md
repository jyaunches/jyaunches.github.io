# Persona Feedback

## Andrej Karpathy

### Excited By

- **The TDD mechanism is concrete and implementable** - There's a clear technical loop: write tests → run agent → validate against tests → iterate. This isn't handwavy; anyone could build this workflow tomorrow.

- **Token limits as a design constraint, not a bug** - Working within Claude Max limits rather than fighting them is intellectually honest. The constraint forces discipline.

- **Files as state, not prompts** - The insight that progress lives in the codebase and git history, not in context windows, is mechanistically correct. This is how Ralph works, and it's how your approach implicitly works too.

- **Parallelization through isolation** - Each session has its own context window, works on its own feature branch - this is straightforward concurrency without the synchronization nightmares of shared mutable state.

### Concerns

- **"Simplicity" and "consistent architecture" are undefined** - These are the exact kind of words that mask complexity. What *specifically* makes an architecture consistent? What patterns are you enforcing? Can you write these down as rules an agent could follow?

- **The validation loop needs more technical detail** - "Doesn't stop coding until things are working" - what's the actual mechanism? Is this a hook? A wrapper script? A CLAUDE.md instruction? Show the implementation.

- **Missing: How does context actually flow?** - You mention pushing against token limits but not exceeding them. What happens when you hit 180K tokens? Do you start fresh? Summarize? What's the actual procedure?

- **Acceptance criteria quality is glossed over** - TDD only works if tests actually capture intent. How do you write acceptance criteria that are specific enough for programmatic validation but general enough to allow agent creativity?

### Would Reshape As

"Let's start with the simplest possible case. You have one feature to build, one test suite to pass, one context window to fill. Here's exactly what happens at each step..."

I'd want to see a diagram of the actual information flow - prompt → agent → code → tests → feedback → loop or exit. Where does the human intervene? Where are the automated gates?

The piece should include runnable examples. Show a real CLAUDE.md snippet. Show a real acceptance criterion. Show what the agent actually produces. Let the reader implement your workflow after reading.

### Missing

- A minimal reproducible example
- The exact mechanism for "validation loop that doesn't stop"
- How you handle when tests pass but code is garbage
- Token management strategy when approaching limits
- Failure modes - when does this approach break?

---

## Paul Graham

### Excited By

- **"I'm not sure I'm ready to run a gas town" - this is the hook** - Counterintuitive honesty. Everyone's writing about scaling up, you're writing about *appropriate* scale. That's the surprising angle.

- **The inversion of the usual narrative** - Standard story: simple → complex → industrial. Your story: "Actually, Stage 5-6 is where most productive work happens, and that's okay." Do things that *don't* scale (for now).

- **There's a real observation here** - You've noticed something: coordination between agents creates chaos, but parallel independence works. Armin Ronacher noticed it too. That's pattern recognition from practice, not theory.

- **The gap is genuinely underserved** - Most writing is either "AI is magic, just vibe code" or "here's my 20-agent factory." The craftsman's workshop is underdescribed.

### Concerns

- **The title/framing is backwards** - "A middle ground between X and Y" is boring. What's the *surprising* version? Maybe: "Why simpler agent setups outperform complex ones" or "The case against agent coordination."

- **Too much deference to Gas Town** - "This is likely the future" and "prepares them to run a gas town" assumes Gas Town is the goal. What if it's not? What if independence at scale beats orchestration?

- **Vague precision problem** - "Simplicity, consistent architecture, TDD" - correct because meaningless. Every engineer claims these values. What specifically are you doing differently?

- **Missing the contrarian flip** - Everyone assumes more agents + more coordination = better. You could argue the opposite: *"The best results come from fewer agents with stricter constraints."*

### Would Reshape As

Start with an anomaly: "I kept noticing that my 3-session parallel workflow outperformed colleagues running 15+ coordinated agents. Here's what I think is happening..."

Then the exploration: why does coordination fail? What makes independence work? Is there something about the nature of LLM context that makes isolation superior?

The insight: maybe Gas Town isn't the future for most work. Maybe the craftsman's workshop scales differently than the factory.

The implication: you don't need to *become* Stage 7. There might be a different path entirely.

### Missing

- The strongest version of your argument (currently hedged)
- Specific examples of coordination failure vs. independence success
- Historical context - has coordination vs. independence played out before in software? (microservices vs. monolith, maybe?)
- Why shouldn't everyone aim for Gas Town?

---

## Martin Fowler

### Excited By

- **This could become a named pattern** - "TDD-Gated Parallel Sessions" or "Isolated Agent Parallelism" - there's a recurring structure here that deserves vocabulary.

- **Trade-off awareness** - You're implicitly acknowledging that Gas Town trades simplicity for capability, and you're choosing differently. That's pattern-aware thinking.

- **Practical applicability** - This is grounded in actual practice, not theoretical frameworks. "Here's what I do" beats "here's what you should do."

- **Team context consideration** - "Meets engineers where they are now" acknowledges the human/organizational reality that most teams aren't Stage 7.

### Concerns

- **Terms need definition** - "Simplicity" in code? In workflow? In mental model? "Consistent architecture" - consistent with what? Across sessions? Across the codebase? Be precise.

- **Context boundaries are fuzzy** - When does this approach apply? When doesn't it? Is this for greenfield features? Bug fixes? Refactors? What about cross-cutting concerns that touch multiple sessions?

- **Missing: the failure modes** - When is this the *wrong* approach? What signals tell you to move to Gas Town? What tells you to simplify to Ralph?

- **The "parallel sessions" pattern needs structure** - How do you avoid merge conflicts? How do you ensure sessions don't duplicate work? What's the review process?

### Would Reshape As

I'd structure this as a pattern description:

**Pattern: TDD-Gated Parallel Sessions**

- **Context**: You need to develop multiple features simultaneously using AI coding agents, but you're not ready for full orchestration.
- **Problem**: Single-session approaches bottleneck on human attention; full orchestration requires Stage 7+ expertise and introduces coordination complexity.
- **Solution**: Run independent sessions in parallel, each working on isolated features, with TDD providing the validation gate.
- **When to Use**: Greenfield features with clear boundaries, refactors with testable outcomes, any work where acceptance criteria can be expressed as passing tests.
- **When NOT to Use**: Cross-cutting changes, features with implicit dependencies, situations requiring shared understanding between sessions.
- **Trade-offs**: You gain simplicity and reduced coordination overhead; you lose the ability to handle cross-session dependencies and may miss optimization opportunities that require holistic view.

### Missing

- Explicit context for when this applies
- Explicit context for when this fails
- How to handle the edges (conflicts, overlapping concerns)
- Migration path - how do you know when to "graduate" to more coordination?
- Vocabulary - name this pattern so people can reference it

---

## Synthesis: Cross-Persona Patterns

### Agreement

All three personas would agree:

1. **Technical specificity is essential** - Show the mechanism, not just the philosophy
2. **The observation is valid** - Independence outperforming coordination is real and underexplored
3. **The positioning is honest** - Admitting "not ready for Gas Town" is authentic

### Disagreement

- **Karpathy** wants implementation detail and reproducibility
- **Graham** wants a stronger contrarian thesis and less deference to complexity
- **Fowler** wants pattern formalization and explicit scope boundaries

### The Key Question

All three would ask, in different ways: *"What's the minimum viable description of this approach that lets someone else adopt it?"*

- Karpathy: Can they implement it?
- Graham: Can they be surprised by it?
- Fowler: Can they know when to use it?

### Strongest Angle (Cross-Persona)

The most promising direction combines:

1. **A surprising claim** (Graham): "Why I stopped trying to scale to Gas Town"
2. **Technical mechanism** (Karpathy): Here's exactly how TDD-gated parallel sessions work
3. **Pattern formalization** (Fowler): When to use this, when not to, and why

The honest "not ready yet" admission could become the *thesis* rather than an aside: *"Most of us aren't ready for Gas Town - and maybe that's fine."*
