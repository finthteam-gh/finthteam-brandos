# /insightscan

Audit the knowledge base for quality, completeness, and hygiene issues.

## When to run

Run weekly or before any major strategic session. Also run when the KB feels slow or outputs feel repetitive.

## Steps

1. Read Knowledge/KB_SCHEMA.md
2. Scan all files in Knowledge/Insights/
3. Scan all files in Knowledge/Topics/
4. Scan all files in Knowledge/Clients/
5. Check for:
   - Duplicate or near-duplicate atoms
   - Atoms with status: provisional older than 30 days (needs Jere review)
   - Atoms missing required frontmatter fields
   - Unsupported claims (confidence: high with no source_refs)
   - Orphaned outputs in Output/ not linked to any atom
   - Topic maps missing recently added atoms
   - Client files not updated in 30+ days

## Output format

```
Scan date: [date]
Total atoms: [count]
Issues found: [count]

Duplicates: [list]
Stale provisionals: [list with last_reviewed dates]
Schema violations: [list with file paths]
Unsupported high-confidence claims: [list]
Orphaned outputs: [list]
Topic map gaps: [list]
Stale client files: [list]

Recommended actions: [prioritised list]
```

Flag everything. Delete nothing. All actions require Jere's approval.
