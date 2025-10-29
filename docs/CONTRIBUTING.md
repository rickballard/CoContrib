# Contributing



<!-- XREF
{"title":"Contributing guide","type":"guide","repo":"CoContrib","tags":["bpoe","workflow"],"depends_on":["tools/BPOE/Lint-HereStrings.ps1","tools/BPOE/Lint-AssetXref.ps1"],"see_also":["public/bpoe/SESSION_PLAN.md","README.md"]}
XREF -->





## XREF blocks (authoring)

Use this exact shape (keys & types enforced by CI):

<!-- XREF
{ "title":"Short descriptive title",
  "type":"guide|note|index|tool",
  "tags":["one","two"],
  "see_also":["relative/or/absolute/links.md"]
}
XREF -->

Rules:
- **title**: non-empty string
- **type**: non-empty string (use one of: guide, note, index, tool)
- **tags**: array of strings
- **see_also**: array of strings (paths or URLs)
