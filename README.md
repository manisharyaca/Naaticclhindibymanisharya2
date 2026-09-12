# NAATI CCL Hindi Simulator V5.1 — Reference-Ready Cloud Edition

## V5.1 repair summary
- Reference 001 is available in both the full dialogue simulator and Single-segment Practice.
- Single-segment Practice plays the supplied human audio when a reference set is selected.
- Single-segment Practice now uses recorded-audio dual transcription and cloud semantic scoring when configured, with local scoring as fallback.
- Recording begins only after the generated chime has fully finished.
- Response-start delay is left unknown, rather than falsely treated as late, when browser speech-start detection is unavailable.
- Supplied practice sets are registered through one reference-set registry so additional sets can populate both selectors consistently.
- Duplicate element identifiers and misleading browser-fallback instructions were removed.

## What changed in V5
- Exam Mode hides both source transcript and live response transcript.
- Recording starts automatically after the source segment and chime.
- The performance clock counts source dialogue audio + candidate response time only.
- Cloud mode transcribes each response twice and reconciles the transcripts before semantic scoring.
- Semantic scoring evaluates meaning transfer, critical entities, direct speech, repeats and response-start delay rather than literal text matching.
- Source audio can use natural neural speech; a human MP3 pack still overrides synthetic speech when selected.
- Local browser scoring remains as a fallback.

## Netlify deployment
1. Push this entire folder to a GitHub repository or drag/deploy it through Netlify.
2. In Netlify: Site configuration -> Environment variables.
3. Add `OPENAI_API_KEY` with your OpenAI API key.
4. Redeploy the site.
5. Open Dashboard -> V5 scoring & audio engine -> Check cloud engine.
6. The badge should show `Cloud engine ready`.

Optional environment variables:
- `OPENAI_TRANSCRIBE_MODEL` (default `gpt-transcribe`)
- `OPENAI_TRANSCRIBE_SECONDARY_MODEL` (default `gpt-4o-transcribe`)
- `OPENAI_SCORE_MODEL` (default `gpt-5.6-luna`)
- `OPENAI_TTS_MODEL` (default `gpt-4o-mini-tts`)
- `OPENAI_TTS_VOICE` (default `alloy`)

## Human source audio
For actual recorded human speech, choose Human MP3 pack and add files such as:
`audio/test001_d1_s01.mp3`
`audio/test001_d1_s02.mp3`
... etc.
If a file is unavailable, the simulator falls back to neural/browser speech.

## Security
Never put your API key in `index.html` or client JavaScript. Keep it only in Netlify environment variables. The included serverless functions use it server-side.

## Important limitation
This is a NAATI-aligned preparation simulator, not an official NAATI assessment platform. Only NAATI examiners can provide official NAATI marks. AI scoring should be treated as training feedback and calibrated over time against assessed practice-test results.

## Reference Practice 001 — Consumer Affairs
This package includes one supplied reference dialogue integrated into the main test selector under **Provided / Reference Practice**.

- Reference: Hindi CCL 2019 #2471
- Domain: Consumer Affairs
- Scenario: restaurant table booking for a daughter's birthday lunch
- 14 source segments
- Original supplied human source audio is split and mapped segment-by-segment under `audio/reference/consumer_affairs_2471/`
- The reference dialogue is scored out of **45**. It is intentionally not treated as a full two-dialogue /90 CCL mock.
- Every source segment is selectable under **Single-segment Practice** in its correct EN -> HI or HI -> EN direction.
- In Exam Mode, the source transcript stays hidden; each original source-audio segment plays, the simulator chimes, and candidate recording starts automatically.
- Hindi-source -> English model translations use the supplied script translation. English-source -> Hindi natural model answers were generated for simulator feedback and are not represented as official NAATI model answers.

## Supplied sets now integrated
Seven further supplied sets (Education x2, Employment, Financial, Health, Housing,
Social Services) are integrated and load at runtime from `data/reference/`.
See `SUPPLIED_SETS_README.md`. Build or rebuild them with
`python3 tools/build_reference_set.py <folder>`.

## Adding further supplied sets
Provide each set as a matching PDF/MP3 pair. Use the same descriptive base filename for both files, for example:

```text
Hindi - Health Appointment.pdf
Hindi - Health Appointment.mp3
```

Each pair must be inspected, segmented, mapped to its source script, assigned semantic units and registered in the reference-set registry. See `REFERENCE_INTEGRATION_GUIDE.md` for the required validation checklist.

### Copyright / public hosting note
The supplied source document is marked © NAATI. The original full PDF and full MP3 are intentionally not bundled. The package still contains segmented source audio and script text, so only publish it to a public GitHub/Netlify site if you have permission to redistribute that material. Otherwise use a private repository/private deployment for reference sets.
