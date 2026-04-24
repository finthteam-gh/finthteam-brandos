# /query-back

Evaluate a completed output and determine whether it contains durable knowledge worth storing in the knowledge base.

## When to run

Run after any approved output that contains:
- A strategic conclusion that will inform future decisions
- A market or client insight that is not already in the KB
- A validated commercial assumption
- A regulatory finding or status update
- A strong synthesis that took significant research effort to produce

Do not run for:
- Draft outputs not yet approved
- Routine task completions with no new insight
- Content that is entirely client-specific and will not generalise

## Steps

1. Read the completed output
2. Identify claims or conclusions that meet the durability test:
   - Will this still be relevant and useful in 3–6 months?
   - Does this change how we approach future similar tasks?
   - Is this not already captured in the knowledge base?
3. If yes to any: send to indie-atomizer for atomisation
4. After atomisation: send to libby-librarian for indexing
5. Report which atoms were created and where they were indexed

## Output format

```
Query-back verdict: [atoms created / no durable knowledge found]
Atoms created: [list atom IDs if created]
Indexed to: [folder paths]
Skipped because: [reason if no atoms created]
```
