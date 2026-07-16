# Behavior And Loops

Use this reference for activation, adoption, onboarding, retention, engagement, growth
loops, behavioral product design, and user decision psychology.

## Start With the Target Behavior

Define one observable behavior in one context:

```text
[specific user] does [observable action] when [trigger/context]
because it produces [immediate progress or value].
```

Avoid goals such as "increase engagement" until the valuable behavior and natural usage
frequency are clear.

## Behavioral Mechanism Map

Analyze the forces around the behavior rather than naming biases at random.

| Force | Questions |
|---|---|
| Desired progress | What outcome or identity change is the person seeking? |
| Trigger | What event creates intent now? Is the product present then? |
| Capability | Do they have the knowledge, access, time, and ability to act? |
| Opportunity | Does the workflow, organization, device, or environment permit it? |
| Motivation | Is the value urgent and credible enough for this context? |
| Friction | Which effort, uncertainty, risk, coordination, or switching cost blocks action? |
| Immediate payoff | What confirms value before patience expires? |
| Social and identity force | Who observes, approves, benefits, or bears risk? |
| Stored value | What legitimate state improves after use and makes return rational? |

Capability, opportunity, and motivation are diagnostic categories, not magic levers. A
reminder cannot solve missing permissions; a streak cannot create recurring value.

## Intervention Card

For each proposed behavioral intervention, specify:

| Field | Requirement |
|---|---|
| Target behavior | Observable action and context |
| Barrier | Evidence for the force preventing it |
| Mechanism | Why the change should affect that barrier |
| User benefit | How the change helps the user make progress |
| Failure mode | Segment or condition where it may fail or backfire |
| Metric | Behavior and guardrail metrics |
| Test | Comparison, threshold, duration, and decision rule |

Defaults, salience, social norms, framing, commitment, progress, and reduced friction can
change behavior, but effects vary substantially across populations and contexts. Never
attach a universal conversion lift to a mechanism without evidence from the target setting.

## Activation And Retention

### Activation

Define activation as the earliest event that predicts later realized value, not the easiest
event to count. Compare retained and churned cohorts before declaring an "aha moment."

Inspect:

- Trigger-to-first-action time
- Time and steps to first value
- Permission, integration, data, and collaboration setup
- Empty states and missing prerequisite data
- Whether the user can evaluate quality early
- Whether the buyer and user experience value at different times

### Retention

Diagnose retention by cohort and segment. Ask:

- Is the underlying job naturally daily, weekly, monthly, episodic, or one-time?
- Does value repeat, accumulate, or conclude?
- Did users activate before leaving?
- Is churn voluntary, payment-related, seasonal, role-related, or caused by implementation?
- What alternative regained the job?
- Does the product store useful state, improve decisions, coordinate people, or reduce future work?

Do not manufacture daily engagement for an episodic job. The right retention pattern may be
fast successful completion plus return at the next trigger event.

## Loop Test

A loop must close:

```text
trigger -> action -> user value -> changed state or produced artifact ->
qualified re-entry for the same or another user
```

For every claimed loop, identify:

- Entry source
- Action that creates value
- State, artifact, data, inventory, content, collaboration, or reputation produced
- Recipient of the next trigger
- Conversion and cycle time at each edge
- Saturation, decay, abuse, and quality constraints

Distinguish three loops:

- **Usage loop:** repeated behavior creates recurring or accumulating user value
- **Distribution loop:** product use exposes or invites another qualified participant
- **Revenue loop:** captured value funds an input that predictably creates more value

Do not label a funnel, notification schedule, referral button, or paid acquisition campaign
as a product loop unless output from one cycle becomes input to the next.

## Ethical Boundary

Reject designs that rely on:

- Hidden costs, preselection without informed benefit, or confusing consent
- Asymmetric accept/decline paths or cancellation obstruction
- Fake scarcity, fake social proof, disguised advertising, or manufactured urgency
- Shame, coercive streak loss, confirmshaming, or exploitative variable rewards
- Making data export, privacy controls, refunds, or account deletion harder than enrollment
- Notifications whose primary value is recovering attention rather than helping at a real trigger

Use an autonomy check:

1. Would a well-informed user still choose this?
2. Is the mechanism legible when explained plainly?
3. Can the user reverse or decline it with proportionate effort?
4. Does success improve the user's outcome, not only the company's metric?
5. Are trust, complaints, regret, and long-term retention measured as guardrails?

## Example: From Slop To Mechanism

Weak:

> Add daily notifications, streaks, and social proof to improve retention.

Mechanism-based:

> Site supervisors review unresolved safety issues at the start of each shift. Generate a
> shift handoff from yesterday's unresolved items, deliver it in the channel already used by
> the incoming supervisor, and let resolution update the next handoff. Test whether teams
> receiving handoffs resolve more pre-existing issues within one shift without increasing
> muted notifications or false closures.

The second proposal identifies a natural trigger, recurring value, changed state, loop,
behavior metric, and guardrails.

## Research Basis

- Mertens et al., "The effectiveness of nudging," PNAS (2022):
  https://www.pnas.org/doi/10.1073/pnas.2107346118
- Szaszi et al., "Generalizability of choice architecture interventions," Nature Reviews
  Psychology (2025): https://www.nature.com/articles/s44159-025-00471-9
- Doshi and Hauser, "Generative AI enhances individual creativity but reduces the collective
  diversity of novel content," Science Advances (2024):
  https://www.science.org/doi/10.1126/sciadv.adn5290

These sources justify testing context-specific mechanisms and protecting idea diversity;
they do not provide universal product-growth recipes.
