# Supplied reference sets — what was added

Seven supplied PDF/MP3 pairs are now integrated the same way Reference 001
(Consumer Affairs) was, and appear under **Provided / Reference Practice** in the
test selector and in **Single-segment Practice**.

| Set | Segments | EN→HI | HI→EN | Scored | Audio |
|---|---|---|---|---|---|
| Education (1) | 12 | 6 | 6 | 12 | 12 clips |
| Education (#2473) | 14 | 7 | 7 | 14 | 14 clips |
| Employment | 15 | 8 | 7 | 15 | 15 clips |
| Financial | 16 | 8 | 8 | 16 | 16 clips |
| Health (#2035) | 14 | 7 | 7 | 14 | 14 clips |
| Housing (#2036) | 12 | 6 | 6 | 12 | 12 clips |
| Social Services | 12 | 6 | 6 | 12 | 12 clips |

All 95 segments are scored in both directions.

## How it differs from Reference 001

Reference 001 has its script written directly into `index.html`. These seven are
loaded at runtime from `data/reference/*.json`, listed in
`data/reference/manifest.json`. Nothing about the scripts lives in `index.html`,
so the page can be shared or updated without carrying the source material, and
adding an eighth set needs no code change at all.

## Where the model answers come from

- **HI→EN segments** use the English translation printed in the source paper.
  Marked `supplied-script translation`.
- **EN→HI segments** use natural Hindi model answers written for this simulator,
  held in `tools/hindi_model_answers.py`. Marked
  `simulator-authored Hindi model answer`. They are feedback material, not
  official NAATI answers, and you should feel free to edit any of them.

After editing `tools/hindi_model_answers.py`, run:

    python3 tools/apply_model_answers.py

which rewrites the model answers and regenerates the meaning units and entity
checks from them.

## Rebuilding or adding sets

```bash
python3 tools/build_reference_set.py /path/to/folder-with-pdf-and-mp3-pairs
# or one pair:
python3 tools/build_reference_set.py "Hindi - Health.pdf" "Hindi - Health.mp3"
```

The script parses the segment table out of the PDF, finds each segment's
boundaries in the MP3, writes the per-segment clips, and regenerates
`manifest.json`. It prints a speech-rate spread per set: values near 0.10–0.20
mean the audio lined up with the script. Anything above about 0.4 means a
segment was mis-cut and that set needs checking.

## Alignment method

Silence detection alone does not work on this material — some recordings have a
noise floor that never trips it, others pause mid-segment. Instead the boundaries
are chosen by dynamic programming: each segment's expected duration is
proportional to its word count, and the cuts are placed at silences so that every
segment lands as close as possible to the length its text implies. The spoken
preamble before segment 1 is found the same way and discarded.

## Copyright — read before deploying

The supplied papers carry a **© NAATI** line. This package now contains segmented
audio and the full scripts in `data/`. That is fine for your own private study.
It is redistribution if you put it on a public site.

**Do not deploy this to public GitHub Pages or a public Netlify site.** Use a
private repository and a password-protected or private deployment. `.gitignore`
in this folder excludes `data/reference/` and `audio/reference/` by default so
they are not committed by accident — remove those lines only for a private repo.
