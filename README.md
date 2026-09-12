# NAATI CCL Hindi Simulator V6 - Integrated Provided Practice Edition

This package contains the complete V5 simulator plus eight supplied Hindi-English
practice dialogues, mapped to 109 original human-audio segments.

## Included supplied dialogues

1. Consumer Affairs - restaurant birthday booking - 14 segments
2. Education 1 - school enrolment interview - 12 segments
3. Education 2 - dance clothing and shoes - 14 segments
4. Employment - Job Active interview - 15 segments
5. Financial - home-loan enquiry - 16 segments
6. Health - speech-therapy appointment - 14 segments
7. Housing - rental house inspection - 12 segments
8. Social Services - Youth Allowance discussion - 12 segments

Every supplied dialogue appears under **Provided Practice - Original Human
Audio** in the test selector. Its original MP3 has been split at the recorded
chime boundaries. The matching supplied PDF is retained in `source/provided/`
and can be opened from the notice above the simulator after selecting the test.

## Microphone permission - one request per session

Do not double-click `index.html` and run it as a `file://` page. Browser privacy
rules can make microphone permission unreliable for local files.

### Windows local use

Double-click `START_SIMULATOR.bat`. It opens the simulator at
`http://127.0.0.1:8765`, which browsers treat as a secure local context. Click
**Enable microphone once** before beginning. Keep the command window open while
practising.

Python 3 or the Windows Python launcher (`py`) must be installed. If neither is
available, deploy the folder to Netlify instead.

### macOS or Linux local use

Double-click or run `START_SIMULATOR.command`, then open
`http://127.0.0.1:8765` if the browser does not open automatically.

### Hosted use

Host the complete folder over HTTPS. In recommended Cloud mode, the simulator
uses one shared `getUserMedia` stream for the whole page session and does not
start a second browser speech-recognition microphone for each segment. Reloading
the page or closing the tab ends the session; whether permission persists on a
future visit remains controlled by the browser's site settings.

## Netlify cloud scoring

1. Deploy this entire folder through Netlify or a connected private repository.
2. Add `OPENAI_API_KEY` in Netlify environment variables.
3. Redeploy.
4. Open **Dashboard -> V6 scoring & audio engine -> Check cloud engine**.
5. Confirm that the badge shows **Cloud engine ready**.

Optional environment variables:

- `OPENAI_TRANSCRIBE_MODEL` (default `gpt-transcribe`)
- `OPENAI_TRANSCRIBE_SECONDARY_MODEL` (default `gpt-4o-transcribe`)
- `OPENAI_SCORE_MODEL` (default `gpt-5.6-luna`)
- `OPENAI_TTS_MODEL` (default `gpt-4o-mini-tts`)
- `OPENAI_TTS_VOICE` (default `alloy`)

Never place an API key in `index.html` or client JavaScript.

## Assessment behaviour

- Exam Mode hides source text and live response transcription.
- Recording begins automatically after each supplied source segment and chime.
- The performance clock counts source dialogue audio plus candidate response time.
- Cloud mode transcribes each recorded response twice and applies semantic scoring.
- Each supplied item is one dialogue scored out of 45; it is not a complete
  two-dialogue `/90` mock by itself.

## Important limitations

This is a preparation simulator, not an official NAATI assessment platform.
Only NAATI examiners can award official marks. Treat AI scoring as training
feedback.

The supplied PDFs and recordings may contain copyrighted material. Use a private
deployment unless you have permission to redistribute them publicly.
