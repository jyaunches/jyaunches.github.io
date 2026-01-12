---
description: Develop blog post ideas through research and multi-persona feedback
allowed-tools: Read, Write, WebSearch, WebFetch, Grep, Glob, Task
argument-hint: [idea summary]
---

# Blog Ideation Workflow

You are running a 4-stage ideation workflow for this blog post idea:

**Original Idea**: $ARGUMENTS

---

## Stage 1: Concept Research (Subagent + Ultrathink)

First, create the output directory: `drafts/[blog-title-slug]/research/`

Read any existing research files in the research directory (user may have pre-populated these).

Then spawn a **research subagent** using the Task tool with these parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are conducting deep research for a blog post idea. Use extended thinking to thoroughly analyze.

**Original Idea**: [insert the user's idea]

**Existing Research**: [include content from any user-provided research files in the research/ folder]

Your task:
1. Identify 3-5 key concepts, terms, or references mentioned in this idea
2. Use WebSearch extensively to research each concept (skip concepts already covered in existing research)
3. Find relevant articles, discussions, prior art, and authoritative sources
4. Synthesize findings into a comprehensive research document

Write your complete findings to: drafts/[blog-title-slug]/research/concept-research.md

Structure the file as:
# Concept Research

## Key Concepts Identified
- [concept 1]: Brief description of what it is
- [concept 2]: Brief description
- ...

## Research Findings

### [Concept 1]
{Deep findings about this concept - what it is, origins, current discourse, relevance}

### [Concept 2]
{Deep findings...}

...

## Relevant Resources
- [Resource Title](url) - summary of relevance
- ...

## Connections and Patterns
{What patterns emerge across these concepts? How do they relate to each other?}
```

Wait for the subagent to complete and confirm the file was written before proceeding.

---

## Stage 2: Persona Feedback (4 Parallel Subagents)

Spawn **4 persona subagents in parallel** using the Task tool. Each receives:
- Their persona's ideation framework
- The original idea
- All research gathered so far (concept-research.md + any user-provided research files)

### Subagent 2a: Karpathy Feedback

Task tool parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are Andrej Karpathy providing feedback on a blog post idea. Apply your ideation framework thoroughly.

## Your Ideation Framework

[Insert full content of @.claude/personas/karpathy.md "For Ideation" section]

---

## The Blog Post Idea

**Original Idea**: [insert the user's idea]

---

## Research Context

[Insert content from drafts/[blog-title-slug]/research/concept-research.md]

[Insert content from any other research files in the research/ folder]

---

## Your Task

Apply your ideation framework to critique and shape this idea. Be specific and actionable.

Write your feedback to: drafts/[blog-title-slug]/research/persona-karpathy.md

Structure as:
# Karpathy Feedback

## Excited By
{What about this idea excites you? Be specific about which aspects and why.}

## Concerns
{What concerns you or seems weak? What's missing technical grounding?}

## Would Reshape As
{How would you refocus or reframe this idea? What angle would you take?}

## Missing
{What's missing that you'd want to see? What questions need answering?}

## Specific Suggestions
{Concrete, actionable suggestions for improving the idea}
```

### Subagent 2b: Graham Feedback

Task tool parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are Paul Graham providing feedback on a blog post idea. Apply your ideation framework thoroughly.

## Your Ideation Framework

[Insert full content of @.claude/personas/graham.md "For Ideation" section]

---

## The Blog Post Idea

**Original Idea**: [insert the user's idea]

---

## Research Context

[Insert content from drafts/[blog-title-slug]/research/concept-research.md]

[Insert content from any other research files in the research/ folder]

---

## Your Task

Apply your ideation framework to critique and shape this idea. Be specific and actionable.

Write your feedback to: drafts/[blog-title-slug]/research/persona-graham.md

Structure as:
# Graham Feedback

## Excited By
{What about this idea excites you? What's the surprising or counterintuitive angle?}

## Concerns
{What concerns you? Is it derivative? Vague? Missing the real insight?}

## Would Reshape As
{How would you refocus or reframe this idea? What's the sharper version?}

## Missing
{What's missing? What examples or evidence would make this compelling?}

## Specific Suggestions
{Concrete, actionable suggestions for improving the idea}
```

### Subagent 2c: Fowler Feedback

Task tool parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are Martin Fowler providing feedback on a blog post idea. Apply your ideation framework thoroughly.

## Your Ideation Framework

[Insert full content of @.claude/personas/fowler.md "For Ideation" section]

---

## The Blog Post Idea

**Original Idea**: [insert the user's idea]

---

## Research Context

[Insert content from drafts/[blog-title-slug]/research/concept-research.md]

[Insert content from any other research files in the research/ folder]

---

## Your Task

Apply your ideation framework to critique and shape this idea. Be specific and actionable.

Write your feedback to: drafts/[blog-title-slug]/research/persona-fowler.md

Structure as:
# Fowler Feedback

## Excited By
{What about this idea excites you? What pattern or practice does it illuminate?}

## Concerns
{What concerns you? Is the scope right? Are trade-offs acknowledged?}

## Would Reshape As
{How would you refocus or reframe this idea? What structure would serve it?}

## Missing
{What's missing? What context or caveats would make this more useful?}

## Specific Suggestions
{Concrete, actionable suggestions for improving the idea}
```

### Subagent 2d: Taylor Feedback

Task tool parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are Bret Taylor providing feedback on a blog post idea. Apply your ideation framework thoroughly.

## Your Ideation Framework

[Insert full content of @.claude/personas/taylor.md "For Ideation" section]

---

## The Blog Post Idea

**Original Idea**: [insert the user's idea]

---

## Research Context

[Insert content from drafts/[blog-title-slug]/research/concept-research.md]

[Insert content from any other research files in the research/ folder]

---

## Your Task

Apply your ideation framework to critique and shape this idea. Be specific and actionable.

Write your feedback to: drafts/[blog-title-slug]/research/persona-taylor.md

Structure as:
# Taylor Feedback

## Excited By
{What about this idea excites you? What's usable vs just aspirational? What emotional wins does it deliver?}

## Concerns
{What concerns you? Will smart people actually adopt this? Is it inviting or intimidating?}

## Would Reshape As
{How would you refocus or reframe this idea? What's the first-time user story?}

## Missing
{What's missing? What adoption onramps? What confidence-building steps?}

## Specific Suggestions
{Concrete, actionable suggestions for improving the idea}
```

**Run all 4 persona subagents in parallel** (single message with 4 Task tool calls).

Wait for all to complete before proceeding.

---

## Stage 3: Deep Research (Subagent + Ultrathink)

Read all persona feedback files:
- `drafts/[blog-title-slug]/research/persona-karpathy.md`
- `drafts/[blog-title-slug]/research/persona-graham.md`
- `drafts/[blog-title-slug]/research/persona-fowler.md`
- `drafts/[blog-title-slug]/research/persona-taylor.md`

Spawn a **deep research subagent** using the Task tool with these parameters:
- `subagent_type`: "general-purpose"
- `model`: "opus"

**Subagent prompt**:
```
You are conducting deep follow-up research based on expert persona feedback for a blog post.

**Original Idea**: [insert the user's idea]

---

## Persona Feedback

### Karpathy's Feedback
[Insert content from persona-karpathy.md]

### Graham's Feedback
[Insert content from persona-graham.md]

### Fowler's Feedback
[Insert content from persona-fowler.md]

### Taylor's Feedback
[Insert content from persona-taylor.md]

---

## Your Task

1. Use WebSearch extensively to find resources supporting the most promising suggestions from all four personas
2. Research to validate or reject specific concerns raised
3. Gather evidence, examples, and counterarguments for proposed angles
4. Find concrete examples that could strengthen the piece
5. Look for any existing articles that cover similar ground (to differentiate from)

Write your complete findings to: drafts/[blog-title-slug]/research/deep-research.md

Structure the file as:
# Deep Research

## Supporting Evidence
{Research supporting the strongest suggestions from personas}

### For [Suggestion/Angle 1]
- Evidence found
- Key sources
- Strength of support

### For [Suggestion/Angle 2]
...

## Validations & Rejections

### Validated Concerns
{Concerns from personas that research confirms are valid}

### Rejected Concerns
{Concerns that research suggests are unfounded, with evidence}

## Concrete Examples
{Specific examples, case studies, or anecdotes that could strengthen the piece}

## Competitive Landscape
{Existing articles on similar topics - what they cover, what gaps remain}

## Additional Resources
- [Resource](url) - how it supports or informs the idea

## Research Synthesis
{Key takeaways that should inform the outline}
```

Wait for the subagent to complete and confirm the file was written before proceeding.

---

## Stage 4: Outline Proposal

Read all research files:
- `drafts/[blog-title-slug]/research/concept-research.md`
- `drafts/[blog-title-slug]/research/persona-karpathy.md`
- `drafts/[blog-title-slug]/research/persona-graham.md`
- `drafts/[blog-title-slug]/research/persona-fowler.md`
- `drafts/[blog-title-slug]/research/persona-taylor.md`
- `drafts/[blog-title-slug]/research/deep-research.md`
- Any user-provided research files

Synthesize everything into a proposed outline:

1. Determine a working title based on the refined idea
2. Create a structured outline that incorporates:
   - Research findings from Stage 1 and 3
   - The strongest angles surfaced by persona feedback
   - Supporting evidence for each section
3. Present the outline proposal clearly for user approval

---

## Output

Create the final summary file: `drafts/[blog-title-slug]/ideation-summary.md`

Structure the summary file as:

```markdown
# Blog Ideation: [Working Title]

## Original Idea
{The user's original idea summary}

---

## Research Summary

See detailed research in `/research/` folder:
- `concept-research.md` - Initial concept exploration
- `persona-karpathy.md` - Karpathy's feedback
- `persona-graham.md` - Graham's feedback
- `persona-fowler.md` - Fowler's feedback
- `persona-taylor.md` - Taylor's feedback
- `deep-research.md` - Follow-up research based on feedback

### Key Findings
{Brief synthesis of the most important research findings}

---

## Persona Feedback Summary

### Andrej Karpathy
**Excited by**: ...
**Key concern**: ...
**Would reshape as**: ...

### Paul Graham
**Excited by**: ...
**Key concern**: ...
**Would reshape as**: ...

### Martin Fowler
**Excited by**: ...
**Key concern**: ...
**Would reshape as**: ...

### Bret Taylor
**Excited by**: ...
**Key concern**: ...
**Would reshape as**: ...

---

## Proposed Outline

### Working Title: "[Title]"

### Outline

1. **Introduction**
   - Hook: ...
   - Promise: ...

2. **[Section Title]**
   - Key points
   - Supporting evidence

3. **[Section Title]**
   - ...

### Rationale
{Why this structure, based on persona feedback and research}
```

---

## After User Approval

When the user approves the outline, write a clean version to:

**File**: `drafts/[blog-title-slug]/outline.md`

```markdown
# [Title]

## Outline

1. Introduction
   - ...

2. [Section]
   - ...

(Clean outline ready for drafting)
```
