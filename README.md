# NAATI CCL Hindi Simulator V5 — Exam-Aligned Cloud Edition

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
