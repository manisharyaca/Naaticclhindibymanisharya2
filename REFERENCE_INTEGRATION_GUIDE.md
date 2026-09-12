# Supplied Reference-Set Integration Guide

Use this checklist for every additional PDF/MP3 pair.

## Required input

- One complete source-audio MP3.
- One matching PDF script containing the source segments and, where supplied, translations.
- A clear set identifier, domain and scenario.
- Confirmation that the intended deployment has permission to use the supplied material.

## Folder convention

Create one stable lowercase folder under `audio/reference/`:

```text
audio/reference/<reference_key>/
  segment_01.mp3
  segment_02.mp3
  ...
  timing_map.json
  source_info.txt
```

Do not place API keys, the full source PDF or the full source MP3 in the public hosting package.

## Integration steps

1. Inspect and render the PDF; confirm the set identifier, domain, scenario, speakers, languages and segment count.
2. Inspect the complete MP3 and locate the exact start/end boundary of every source segment.
3. Extract each segment in order without clipping speech. Preserve the original human voice and use a consistent web-compatible format.
4. Record the source windows in `timing_map.json` and the input filenames/checksums in `source_info.txt`.
5. Map each segment's direction, role, source text, natural model answer, semantic units and critical numbers/names/dates.
6. Add one builder and one entry to `REFERENCE_SET_REGISTRY` in `index.html`.
7. Confirm that the set appears under **Provided / Reference Practice** and **Single-segment Practice**.
8. Confirm every audio path returns successfully and every MP3 decodes without errors.
9. Confirm source playback completes, the chime finishes, and recording starts automatically.
10. Test local fallback scoring and deployed cloud dual-transcription/semantic scoring.
11. Run JavaScript syntax checks, duplicate-ID checks, archive-integrity checks and a live HTTPS microphone test.

## Scoring labels

Always describe results as **NAATI-aligned practice scoring**. Do not describe them as official NAATI scores or as identical to examiner marking.
