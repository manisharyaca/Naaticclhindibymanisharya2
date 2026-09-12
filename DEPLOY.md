# Deploying this version

Upload the CONTENTS of this archive to the repository root — not the folder
itself. After upload the repo root must look like:

    index.html
    netlify.toml
    README.md
    SUPPLIED_SETS_README.md
    DEPLOY.md
    .nojekyll
    .gitignore
    data/reference/manifest.json
    data/reference/*.json
    audio/reference/<set>/segment_NN.mp3
    netlify/functions/*.mjs
    tools/build_reference_set.py

`index.html` must sit at the root, exactly where it is now.

## Uploading through the GitHub website

1. Repo → **Add file → Upload files**.
2. Drag in `index.html`, `netlify.toml`, `.nojekyll`, the docs, and then drag the
   `data` and `audio` folders in as folders. Folder structure is preserved.
3. Commit to `main`.
4. Pages redeploys in 1–2 minutes.

Note: the GitHub web uploader does NOT apply `.gitignore`. If you are uploading
through the website, anything you drag in gets published, including
`data/reference/` and `audio/reference/`.

## Uploading with git

    git add index.html netlify.toml README.md SUPPLIED_SETS_README.md DEPLOY.md .nojekyll tools
    git commit -m "V5.1 + 7 supplied reference sets"
    git push

`.gitignore` excludes `data/reference/` and `audio/reference/`, so this pushes the
app WITHOUT the supplied material. To include it in a private repo:

    git add -f data/reference audio/reference

## Why .nojekyll

GitHub Pages runs Jekyll by default and skips files and folders it does not
recognise. `.nojekyll` turns that off so every `.mp3` and `.json` is served
exactly as uploaded.

## Checks after deploying

1. Open `https://<user>.github.io/<repo>/data/reference/manifest.json` — it should
   return JSON listing 7 sets. A 404 means the data folder did not upload.
2. Open the site, press F12 → Console. You should see
   `Loaded 7 supplied reference set(s).`
3. Open the test selector. Under **Provided / Reference Practice** there should be
   8 entries: Reference 001 plus the 7 new ones.
4. Pick one, start it, and confirm the first segment plays real human audio.
5. Hard-refresh (Ctrl+F5) if you see the old version — Pages caches aggressively.
