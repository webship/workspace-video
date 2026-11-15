/**
 * The Videos workspace for Webship Workspace: the `videos/` folder as a plugin.
 *
 * What the package carries is placed by the installer from the manifest (the folder's settings file,
 * its commands, its docs and its AI items, each in the folder of its kind) and listed by --activate; the dashboard draws the workspace from the
 * settings file like any other. Nothing to register at run time yet: this is where the folder's own
 * rail buttons, row menus or assistant context would go.
 */

import type { PluginApi } from '@webship.co/workspace-plugin-api';

export const WORKSPACE_KEY = 'videos';

/** The AI items the installer places, each in the workspace folder of its kind (ai/ in this package). */
export const AGENTS = ['videos-editor'];
export const SKILLS = ['videos-workflow'];
export const AI_COMMANDS = ['videos-info'];
export const PROMPTS = ['videos-make-a-new-version'];

export function register(api: PluginApi): void {
  api.addAssistantContext(() => `The videos/ workspace is the Videos workspace (a plugin, @webship.co/workspace-video); its commands are the cmd-*.sh scripts in that folder. It comes with AI items for work in this folder: the agent \`videos-editor\` (ai-agents/), the skill \`videos-workflow\` (ai-skills/), the command \`/videos-info\` (ai-commands/) and the prompt \`videos-make-a-new-version\` (ai-prompts/).`);
}
