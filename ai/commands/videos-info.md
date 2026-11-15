---
description: Say what a recording of the videos/ folder of the Webship Workspace is — its size, frame rate and length, its poster and its script — with cmd-tools-video-edit.sh, changing nothing.
argument-hint: '<video>'
---

# /videos-info

Say what the recording of `~/workspace/videos` named in `$ARGUMENTS` is.

The arguments are the text typed after the command: the first word is the video (its file name
in `videos/`, with or without `.mp4`). With no video, stop and list the recordings:
`ls ~/workspace/videos/*.mp4`. The workspace is container-based (DDEV by default); a recording
is a file, and nothing is changed by this command.

## 1. The file

```bash
cd ~/workspace/videos
ls -la <video>*
```

Say which of these are there: the recording, `<name>-poster.jpg`, a voiceover script, earlier
versions.

## 2. What it is

```bash
bash cmd-tools-video-edit.sh --action info --video <video>.mp4
```

If the command fails because `ffprobe` is not on this machine, say so and stop: do not install
anything.

## 3. Report

The size, the frame rate and the length; whether it has a poster (without one the page opens
the video on its first frame, which may be black); whether it has a script. Then what could be
done next, without doing it:

```bash
bash cmd-tools-video-edit.sh --action edit --video <video>.mp4 --out <video>-v2.mp4 --intro-card 3
bash cmd-tools-elevenlabs.sh --action sections --script <video>.md
```

For the edit itself, hand over to the `videos-editor` agent; the `videos-workflow` skill has
every change and every action.
