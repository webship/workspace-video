---
name: videos-workflow
description: How work is done in the `videos/` folder of the Webship Workspace — what an item is there (a recording, its poster frame, its voiceover script), every change `cmd-tools-video-edit.sh` can make as a new version, every action of `cmd-tools-elevenlabs.sh` and which of them spend credits, the plan that comes first, and the settings keys of the folder. Use when asked to "edit this video", "how long is the recording", "add an intro card", "check the voiceover script", or when a command of `videos/` is about to be run.
argument-hint: '[what you are about to do in videos]'
---

# videos-workflow

`~/workspace/videos` is the Videos folder of a Webship Workspace (container-based, DDEV by default).
Videos are screen recordings and their poster frames: recorded walkthroughs and demos, kept as files and played from the folder's page. It comes with the Videos plugin (`@webship.co/workspace-video`), which places the commands below in the folder. Every command finds the workspace from its own path; run it from the folder, and read `bash <command> --help` before quoting a flag.

## The order of work

1. **See what the video is**: `bash cmd-tools-video-edit.sh --action info --video demo.mp4`.
2. **Make a new version**, never a change to the original:
   `bash cmd-tools-video-edit.sh --action edit --video demo.mp4 --out demo-v2.mp4 --speed 1.25`.
3. **For a voiceover, check first, for free**: `bash cmd-tools-elevenlabs.sh --action status`, then
   `bash cmd-tools-elevenlabs.sh --action sections --script demo.md`.
4. **A plan before credits**: a run that spends credits prints its plan and stops; `--confirm`
   only after a yes.
5. **Keep the poster**: `<name>-poster.jpg` beside the video in `~/workspace/videos`.

## Commands

| Command | What it does | Flags |
| --- | --- | --- |
| `cmd-tools-elevenlabs.sh` | The voiceover service. `--action` is `status`, `init`, `sections` (free, nothing sent), `check`, `voices` (no credits), `speak`, `voiceover`, `isolate`, `polish` (a plan first, credits after `--confirm`), `mcp-status`, `mcp-register`, `mcp-unregister` | `--action` `--audio` `--confirm` `--drop-optional` `--force` `--isolate` `--json` `--max-speedup` `--no-normalize` `--out` `--redo` `--script` `--search` `--text-file` `--video` `--voice` |
| `cmd-tools-video-edit.sh` | `--action info`: size, frame rate and length. `--action edit`: a new version (`--out`) with any number of changes; the original is never touched. Needs `ffprobe` and `ffmpeg` on this machine | `--action` `--add-after` `--add-text` `--add-title` `--clone` `--confirm` `--engine` `--force` `--intro-card` `--intro-music` `--intro-seconds` `--intro-subtitle` `--intro-title` `--length` `--music-volume` `--out` `--outro-card` `--outro-music` `--outro-seconds` `--outro-subtitle` `--outro-title` `--remove` `--script` `--script-out` `--speed` `--trim` `--video` `--voice` |

## Settings

| Key | File | What it says |
| --- | --- | --- |
| `doc.name` | `core/config/workspace.videos.settings.yml` | The folder under the workspace root: `videos` |
| `type` | `core/config/workspace.videos.settings.yml` | `media`: the page is a list of media items |
| `presentation.subtitle`, `presentation.noun`, `presentation.kind` | `core/config/workspace.videos.settings.yml` | How the page reads: one item is a `video`, laid out as a list of `files` |
| `assistant.name`, `assistant.placeholder` | `core/config/workspace.videos.settings.yml` | What the assistant is called on this page; `default` takes the workspace's |
| `workspaces` | `core/config/settings.yml` | The active folders; `videos` is on it once the plugin is activated |
| `elevenlabs.voice_id`, `elevenlabs.model_id`, `elevenlabs.region` | `core/config/settings.yml` | The ElevenLabs voice (`ask` means choose one each time), model and region; the key is set on the Settings page and never read here |

## Rules

- **The original is never touched.** An edit is a new file (`--out`), and an existing output is
  refused: `--force` only when asked.
- **A plan before credits.** Anything spoken with ElevenLabs prints a plan and stops; `--confirm`
  is added only after the person agreed to that plan. Piper is free and local.
- **Never read, print or write the key.** It is set on the Settings page of the dashboard, never
  pasted into a session and never put in a file of this folder.
- **Look at a video before it is shared**: nothing personal on screen, and only the product the
  recording is about.
- **Never delete unasked.** Say what you made, and offer to remove it.
- The workspace is container-based (DDEV by default); a recording is a file, not a project.

The Videos plugin places these beside this one, each in the workspace folder of its kind: the agent `videos-editor` (`ai-agents/`), the command `/videos-info` (`ai-commands/`) and the prompt `videos-make-a-new-version` (`ai-prompts/`).

## The book

For any automated functional testing in this work (a Gherkin feature, a step definition, choosing a
step, a test run and its failures), read the book *Automated Functional Testing Recipes* first.

- **Where.** Use the first that exists: `.claude/automated-functional-testing-recipes/` in the project,
  `~/.claude/automated-functional-testing-recipes/` (installed by webship/webship-js-ai-agent,
  webship/webship-js-skills or webship/ai-agents), or
  https://github.com/webship/webship-js-ai-agent/tree/2.0.x/automated-functional-testing-recipes
- **How.** Its `README.md` first, then the chapter that matches the task (one file per chapter,
  named by its subject), not the single complete file.
- **Which wins.** The installed webship-js package and the step pack are the source of truth for
  step phrasing. When they differ from the book, follow them and say so.
