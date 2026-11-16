Feature: The Videos workspace plugin
  Once the plugin is activated and installed, the videos workspace is on the dashboard, and the
  Plugins page lists the plugin with its four steps.

  Scenario: The workspace page is there
    Given I am on "/videos"
     Then the element "h1" should be displayed
      And "#webship-workspace-projects, .items-list, .workspace-page" should be attached

  # The Plugins page names each plugin; the package is on the plugin's own page (the row shows it on hover only).
  Scenario: The plugin is listed on the Plugins page, and its own page names its package
    Given I am on "/settings/plugins"
     Then I should see "Videos"
     When I go to "/settings/plugin/video"
     Then I should see "@webship.co/workspace-video"

  # The AI folders are searched by name: with every plugin on, a folder lists more than one page of items.
  Scenario: The AI Agents folder lists the agent the plugin ships
    Given I am on "/ai-agents?q=videos-editor"
     Then I should see "videos-editor"

  Scenario: The AI Skills folder lists the skill the plugin ships
    Given I am on "/ai-skills?q=videos-workflow"
     Then I should see "videos-workflow"

  Scenario: The AI Commands folder lists the command the plugin ships
    Given I am on "/ai-commands?q=videos-info"
     Then I should see "videos-info"

  Scenario: The AI Prompts folder lists the prompt the plugin ships
    Given I am on "/ai-prompts?q=videos-make-a-new-version"
     Then I should see "videos-make-a-new-version"
