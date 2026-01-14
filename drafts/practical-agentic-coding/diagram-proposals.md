# Diagram Proposals for Article

Based on the cc_workflow_tools research, here are proposed updated diagrams that match the actual implementation.

---

## 1. Full Pipeline Overview

Simplified bird's-eye view showing the complete flow from planning to feature completion.

```mermaid
flowchart LR
    subgraph Planning["Planning"]
        P["Talk to Agent /<br/>Get Plan in Context Window"]
    end

    subgraph Spec["/spec"]
        S["Turn plan into phases<br/><br/>Design validation phase<br/><br/>(Produce spec file)"]
    end

    subgraph ExecuteWF["/execute-wf"]
        direction LR
        R["Review Phase<br/><br/>Simplify, apply best practices<br/>& produce test spec"]
        I["Implementation<br/><br/>Loop over phases:<br/>TDD + Validation"]
        R --> I
    end

    Planning --> Spec --> ExecuteWF

    style Planning fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style Spec fill:#0C5DF2,color:#ffffff,stroke:#0945b5
    style ExecuteWF fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style R fill:#e8ecf1,color:#2A2F36,stroke:#6C7A89
    style I fill:#0C5DF2,color:#ffffff,stroke:#0945b5
```

---

## 2. Spec File Structure

Updated to match actual spec structure from the plugin.

```mermaid
block-beta
    columns 1

    block:spec["SPEC FILE"]
        columns 1
        A["**Overview & Objectives**<br/>Problem statement and goals"]
        B["**Current State Analysis**<br/>What exists vs. what's needed"]
        C["**Architecture Design**<br/>Conceptual description, mermaid diagrams (no code)"]
        D["**Configuration & Deployment**<br/>Env vars, dependencies, secrets"]
        E["**Implementation Phases**<br/>Phase 1, 2, ... N (each with acceptance criteria)"]
        F["**Final Phase: Clean the House**<br/>Dead code removal, docs update"]
        G["**Validation Phase**<br/>Tools & methods to confirm feature works E2E"]
    end

    style spec fill:#F5F7FA,stroke:#dddddd,stroke-width:2px
```

---

## 3. Workflow 1: Spec Creation (/spec)

Detailed flow matching actual command behavior.

```mermaid
flowchart TB
    Start(["/spec feature_name description"]) --> A1["Analyze existing codebase"]

    A1 --> A2["Check specs/ for patterns"]
    A1 --> A3["Examine src/ structure"]

    A2 --> B1["Generate spec file"]
    A3 --> B1

    subgraph SpecContent["Spec Content Generation"]
        C1["Overview & Objectives"]
        C2["Current State Analysis"]
        C3["Architecture Design"]
        C4["Config & Deployment"]
        C5["Implementation Phases"]
        C1 --> C2 --> C3 --> C4 --> C5
    end

    B1 --> C1

    subgraph PhaseRules["Phase Structure Rules"]
        P1["Incremental"]
        P2["Buildable"]
        P3["Testable"]
        P4["Measurable"]
    end

    C5 -.-> PhaseRules

    C5 --> D1["/spec:design-validation"]

    subgraph ValidationDesign["Validation Design"]
        V1["Infer validation needs from spec"]
        V2["Q&A: deployment, access, tools"]
        V3["validation-researcher agent"]
        V4["Present tool recommendations"]
        V5["Add validation phase to spec"]
        V1 --> V2 --> V3 --> V4 --> V5
    end

    D1 --> V1
    V5 --> Save["specs/YYYY-MM-DD_HH-mm_feature.md"]
    Save --> Done([Draft Spec Complete])

    style SpecContent fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style ValidationDesign fill:#0C5DF2,color:#ffffff,stroke:#0945b5
    style PhaseRules fill:#e8ecf1,color:#2A2F36,stroke:#6C7A89
```

---

## 4. Workflow 2a: Review Phase

The review-executor agent running four sub-commands in sequence.

```mermaid
flowchart TB
    Start(["/execute-wf spec.md"]) --> Parse["Parse spec file"]
    Parse --> Agent["Invoke review-executor agent"]

    Agent --> S1

    subgraph SimplifyPhase["1. spec-simplify"]
        S1["Load spec"]
        S2["Apply YAGNI checklist"]
        S3{"Auto-apply<br/>safe changes?"}
        S4["Remove over-engineering"]
        S5["Commit: simplification"]
        S1 --> S2 --> S3
        S3 -->|Yes| S4 --> S5
        S3 -->|Needs approval| S4
    end

    subgraph TestsPhase["2. spec-tests"]
        T1["Read simplified spec"]
        T2["Generate test guide per phase"]
        T3["Create tests_*.md file"]
        S5 --> T1 --> T2 --> T3
    end

    subgraph DesignPhase["3. spec-review-design"]
        D1["Analyze for patterns"]
        D2["Identify reuse opportunities"]
        D3["Recommend libraries"]
        D4["Apply via take-recommendations"]
        T3 --> D1 --> D2 --> D3 --> D4
    end

    subgraph ImplPhase["4. spec-review-implementation"]
        I1["Review technical decisions"]
        I2["Fill coverage gaps"]
        I3["Verify phase alignment"]
        I4["Apply via take-recommendations"]
        D4 --> I1 --> I2 --> I3 --> I4
    end

    I4 --> Summary["Generate review summary"]
    Summary --> Done([Final Spec Ready])

    P[(PATTERNS.md)] -.->|guides| S2
    P -.->|guides| D1
    P -.->|guides| I1

    style SimplifyPhase fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style TestsPhase fill:#e8ecf1,color:#2A2F36,stroke:#6C7A89
    style DesignPhase fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style ImplPhase fill:#e8ecf1,color:#2A2F36,stroke:#6C7A89
    style P fill:#0C5DF2,color:#ffffff,stroke:#0945b5
```

---

## 5. Workflow 2b: Implementation Phase

The feature-writer agent implementing phases via TDD.

```mermaid
flowchart TB
    Start([Final Spec + Test Spec]) --> Agent["Invoke feature-writer agent"]

    Agent --> Loop

    subgraph Loop["Phase Loop"]
        Q["Get next incomplete phase"]

        subgraph TDD["TDD Cycle"]
            T1["1. Review phase requirements"]
            T2["2. Write failing tests"]
            T3["3. Run tests (red)"]
            T4["4. Implement code"]
            T5["5. Run tests (green)"]
            T6["6. Commit implementation"]
            T1 --> T2 --> T3 --> T4 --> T5 --> T6
        end

        Q --> T1
        T6 --> Mark["Mark phase [COMPLETED: git-sha]"]
        Mark --> Check{"More<br/>phases?"}
        Check -->|Yes| Q
    end

    Check -->|No| Validate

    subgraph Validate["check-work"]
        V1["Analyze implementation"]
        V2["Check acceptance criteria"]
        V3["Run integration tests"]
        V4{"All<br/>passing?"}
        V5["Auto-fix if possible"]
        V1 --> V2 --> V3 --> V4
        V4 -->|No| V5 --> V3
    end

    V4 -->|Yes| Done([Feature Complete])

    style Loop fill:#F5F7FA,color:#2A2F36,stroke:#dddddd
    style TDD fill:#e8ecf1,color:#2A2F36,stroke:#6C7A89
    style Validate fill:#0C5DF2,color:#ffffff,stroke:#0945b5
```

---

## 6. Spec Evolution Through Pipeline

State diagram showing how spec transforms.

```mermaid
stateDiagram-v2
    direction LR

    [*] --> Draft: /spec

    Draft: Draft Spec
    Draft: Full architecture
    Draft: All phases defined
    Draft: Validation phase added

    Draft --> Simplified: spec-simplify

    Simplified: Simplified Spec
    Simplified: YAGNI applied
    Simplified: Over-engineering removed

    Simplified --> WithTests: spec-tests

    WithTests: + Test Spec Created
    WithTests: Test guides per phase
    WithTests: Fixtures defined

    WithTests --> DesignReviewed: spec-review-design

    DesignReviewed: Design Reviewed
    DesignReviewed: Pythonic patterns
    DesignReviewed: Reuse applied

    DesignReviewed --> ImplReviewed: spec-review-implementation

    ImplReviewed: Implementation Ready
    ImplReviewed: Decisions made
    ImplReviewed: Gaps filled

    ImplReviewed --> Implementing: feature-writer

    Implementing: Implementing
    Implementing: TDD per phase
    Implementing: [COMPLETED: sha] markers

    Implementing --> Validated: check-work

    Validated: Validated
    Validated: Acceptance criteria met
    Validated: Tests passing

    Validated --> [*]: Done
```

---

## Summary of Changes from Original

| Original | Proposed | Why |
|----------|----------|-----|
| Generic "Plan Mode" | `/spec` command | Matches actual tool |
| "Generate Spec File" | Detailed spec content sections | Shows actual structure |
| "Design Validation" | `/spec:design-validation` + `validation-researcher` | Accurate flow |
| "Review Phase 1/2/3" | `spec-simplify`, `spec-tests`, `spec-review-design`, `spec-review-implementation` | Actual sub-commands |
| Generic "PATTERNS.md guides" | PATTERNS.md connected to specific steps | Shows where it's used |
| "TDD loop" | 6-step TDD cycle with git-sha marking | Matches implement-phase |
| No validation detail | `check-work` with auto-fix loop | Shows actual behavior |
| 2 agents implied | `review-executor` + `feature-writer` explicit | Accurate architecture |
