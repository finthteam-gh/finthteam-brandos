# /route-task

Classify the incoming task and assign it to the right agents and workflow.

## Steps

1. Read CLAUDE.md to confirm which business and client context is active
2. Classify the task:
   - Business: FINTH / AndamanLife / HEARTBAKER / [other]
   - Client: JÄÄDE / [other] / internal FINTH
   - Output type: strategy / proposal / content / research / deck / memo / account review / regulatory / commercial
   - Urgency: immediate / this week / backlog
3. Select the minimum useful agent set:
   - Research needed? → reese-researcher → chris-reviewer
   - Knowledge to store? → vera-auditor → indie-atomizer → libby-librarian
   - Strategic framing? → relevant C-suite council members
   - Content or copy? → cmo-council → relevant specialist
   - Commercial logic? → cfo-council
   - Legal or regulatory? → clo-council
   - Final output production? → relevant FINTH or client specialist
4. Confirm whether query-back will be needed after output is produced
5. Return a one-paragraph routing plan before proceeding

## Output format

```
Task: [one-line description]
Business: [name]
Client: [name or internal]
Output type: [type]
Urgency: [level]
Agents to call: [list in order]
Query-back needed: [yes / no / maybe]
Routing plan: [one paragraph]
```
