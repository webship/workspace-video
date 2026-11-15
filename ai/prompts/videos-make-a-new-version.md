Make a new version of a recording in the videos folder, leaving the original as it is.

The launch line is for Claude Code, the default; the text between the triple quotes can be given to another AI CLI as it is.

```
claude --permission-mode bypassPermissions """
Make a new version of the recording <video> in the videos folder: <changes>
# ~/workspace/videos · recordings as files · container-based (DDEV by default)
# the original is never touched: the new version is another file, and an existing file is refused
# nothing that spends credits runs without my yes; never read, print or write a key

1. bash cmd-tools-video-edit.sh --action info --video <video>
   tell me its size, frame rate and length
2. bash cmd-tools-video-edit.sh --help
   tell me which of the changes I asked for the command can make, and with which options
3. bash cmd-tools-video-edit.sh --action edit --video <video> --out <new-name> with those options
   <new-name> is the name of the video with -v2 before its ending
4. bash cmd-tools-video-edit.sh --action info --video <new-name>
   tell me what changed against the original

If a command fails, show what it printed and stop. Do not retry with other options.
If a run prints a plan and stops, show me the plan and wait.
Then ask me whether to keep the new version or remove it.
"""
```
