# Videos

Screen recordings and their poster frames.

Part of the **Webship Workspace** (`~/workspace`), a container-based harness (DDEV by default). The rules in the root
`CLAUDE.md` apply here too; what follows is what is specific to this folder.

## What an item is here

A recording, and optionally `<name>-poster.jpg` beside it — the dashboard uses the poster as the
first frame so a video does not open on black.

## Commands here

None — this folder holds content rather than tooling.

## AI items for this folder

The plugin of this folder (`@webship.co/workspace-video`) places its own AI items in the AI folders of the
workspace, when they are active:

- `videos-editor` (`ai-agents/`): Works on a recording in `videos/`: what it is, a new version (speed, length, trim, cards, music) that never touches the original, its voiceover with a plan before any credits
- `videos-workflow` (`ai-skills/`): How work is done in `videos/`: info, a new version, the free checks before a voiceover, the plan before credits, the poster; both commands with their flags, the settings keys
- `/videos-info` (`ai-commands/`): `/videos-info <video>`: says the size, frame rate and length of a recording, its poster and its script, changing nothing
- `videos-make-a-new-version` (`ai-prompts/`): A new session that makes a new version of a recording and leaves the original as it is
