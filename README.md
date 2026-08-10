# HSMA Quarto Slide Template

This provides a starting point for making HSMA slides using the Quarto platform.

Make your changes to the `slides.qmd` file.

Then run `quarto render`.

The final output can be hosted on Github Pages.

The output of `slides.qmd` is set to automatically be `docs/index.html`, so point your github pages site to the docs folder.

![](assets/2025-06-25-16-29-01.png)

## Notes

After making any changes to the *custom.scss* file (or *title-slide.scss*), close any quarto preview windows and/or terminals you have open, then start the preview from scratch. Updates will not be pulled through when saving the updated file or re-clicking on preview, even if the page appears to reload.

## Publishing, and the docs/ folder

`docs/` is the GitHub Pages source, so **it must be committed** — never add it to `.gitignore`. If you do, every render produces new content-hashed filenames that `git add -A` silently skips, and you end up needing `git add -f` forever.

Quarto's default (non-website) project type copies the **entire project directory** into `docs/` on every render, and it ignores `.gitignore`. Left alone, `docs/` fills up with your source files, `data/` folders, `__pycache__/`, lockfiles and multi-megabyte Jupyter intermediates — all of which get published. `_docs_cleanup.py`, wired in as a `post-render` hook in `_quarto.yml`, is what stops that: after each render it deletes everything in `docs/` that isn't on the `docs-keep` allowlist.

To customise it for your deck, **edit the `docs-keep:` list in `_quarto.yml`, not the Python**. Add any folder your deck links to at runtime (extra images, PDFs, data files, handouts). If you drop something the deck actually needs, the deck breaks silently on the published site — so open `docs/index.html` and click through after changing the list.

Also in `_quarto.yml`, the `render:` list names the deck's entry file. If you rename `slides.qmd`, update it to match.

### Troubleshooting

**`docs/` is still full of junk after a render.** Check for a leftover `quarto preview` process first — a background watcher will keep re-triggering the full-directory copy on every file save, independent of the cleanup hook, and it looks exactly like the fix not working. On Windows: `tasklist | findstr /i "quarto deno"`. Elsewhere: `ps aux | grep quarto`.

**`.quartoignore` doesn't help.** It only applies to `quarto use template` scaffolding and has no effect on `quarto render`.

**The cleanup did nothing and printed a warning.** That's deliberate — if `docs-keep` is missing or empty, the script refuses to guess what's safe to delete rather than emptying your output folder.

## Custom title slide

The first slide of the deck is generated from `title-slide.html` (a Quarto/Pandoc
`template-partials` file) and styled by `title-slide.scss`. It is driven entirely by YAML
frontmatter keys at the top of `slides.qmd`:

| Key | Purpose |
|---|---|
| `title`, `subtitle` | Module / session heading text |
| `author` | As standard; the author name is coloured on the title slide |
| `tagline` | Short strapline shown under the author name |
| `partner-logo`, `partner-logo-alt` | Logo shown on a white plate, top-right |
| `title-image` | Small image/GIF (or `video:`) shown above the title text |
| `title-media-a` | A single image/video panel, top-left of the slide |
| `title-media` | A list of image/video panels, bottom-right of the slide |

Every key is optional — a deck that sets none of them gets the original plain centred
title/author layout. Each media slot accepts `image:` (GIFs work fine) or `video:`, plus
optional `poster:` and `autoplay: true`.

If a deck needs a fully hand-built title slide, add `data-visibility: hidden` to
`title-slide-attributes` to hide the generated one, then build your own slide using the
`.hsma-title` class together with the `.hsma-ts-*` slot classes (`.hsma-ts-text`,
`.hsma-ts-media-a`, `.hsma-ts-partner`, `.hsma-ts-title-image`, `.hsma-ts-media-row`) to reuse
the same styling — see the "Custom title slide layout" slide in `slides.qmd` for an example.


## Installed extensions

Various extensions have been pre-installed for convenience.

These include

- [quarto-stlite](https://github.com/whitphx/quarto-stlite) for embedding of interactive streamlit apps
- [quarto-verticator](https://github.com/Martinomagnifico/quarto-verticator) for visibility and easy navigation of vertical slide stacks
- [reveal-header](https://github.com/shafayetShafee/reveal-header) for adding a header


## Useful shortcuts

- Press 'q' to turn the mouse to/from a laser pointer.
- Press 'f' to put the slides into fullscreen
- Press 's' to bring up the speaker view
- Hold 'Alt' and click somewhere on the slide to zoom in. Click again while holding 'Alt' to return to the original zoom level.
