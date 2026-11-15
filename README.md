# @webship.co/workspace-video

The **Videos** workspace of the [Webship Workspace](https://github.com/webship/workspace) dashboard:
the `videos/` folder (type `media`), its settings file (`core/config/workspace.videos.settings.yml`),
its commands and its docs, as a plugin.

## Use it

```bash
cd ~/workspace
bash core/scripts/plugins.sh --require github:webship/workspace-video
bash core/scripts/plugins.sh --activate video --with-needs     # puts `videos` on the workspaces list of settings.yml
bash core/scripts/plugins.sh --install video      # the folder, its settings file (once), its commands, its docs (once)
```

The settings file and the docs are placed once and never overwritten: they hold what you put there.
`--deactivate` takes the workspace off the list; the folder and its content stay.

## What it needs

The AI items land in the four AI folders, so the manifest needs them (`needs`): `ai-agents`, `ai-skills`, `ai-commands`, `ai-prompts`. `--activate video` and `--install video` stop while one is missing and name it; with `--with-needs` they are required, activated and installed first.

## The AI items

The plugin carries its own AI items (`ai/` in the package, the manifest's `ai` block), written for the work this folder is for. `--install` places each one in the workspace folder of its kind, when that folder is an active workspace folder; `--uninstall` removes them, and keeps one that was edited in its folder.

| Item | Kind | Lands in | What it is for |
| --- | --- | --- | --- |
| `videos-editor` | Agent | `ai-agents/videos-editor.md` | Works on a recording in `videos/`: what it is, a new version (speed, length, trim, cards, music) that never touches the original, its voiceover with a plan before any credits |
| `videos-workflow` | Skill | `ai-skills/videos-workflow/` | How work is done in `videos/`: info, a new version, the free checks before a voiceover, the plan before credits, the poster; both commands with their flags, the settings keys |
| `/videos-info` | Command | `ai-commands/videos-info.md` | `/videos-info <video>`: says the size, frame rate and length of a recording, its poster and its script, changing nothing |
| `videos-make-a-new-version` | Prompt | `ai-prompts/videos-make-a-new-version.md` | A new session that makes a new version of a recording and leaves the original as it is |

From its folder an item is installed into the AI CLI (Claude Code by default) like any other: the folder's page on the dashboard, or `bash cmd-tools-ai-items.sh <name> --install` in the AI folder (`--to dev/<project>` for one project). A prompt is not installed: the New screen form lists it as the start of a new session. The body of every item is plain Markdown any AI CLI can follow; Claude Code is the default shape (the frontmatter, the launch line of a prompt). Every command, flag, settings key and path an item names is checked by `tests/items.test.ts`; the shape of the items is the one of the reference, [`docs/plugin-items-pattern.md` of the WordPress plugin](https://github.com/webship/workspace-wordpress/blob/1.0.x/docs/plugin-items-pattern.md).

## The commands

| Command |
| --- |
| `cmd-tools-elevenlabs.sh` |
| `cmd-tools-video-edit.sh` |

The bash functions these commands call live in the dashboard's `core/scripts/functions`.
