# Commit Convention

`Tag` (`Scope`): `Message`

The `Tag` should be in the list above and be a gitmoji icon.

The `Scope` should define the context of the affected changes.

The `Message` should not be confused with git commit message.

The `Tag` is one of the following:

- `🏗 (:building_construction:)`-> Changes that affect the build system or external dependencies (docker, npm, make…)

- `👷🏻 (:construction_worker:)`-> Changes concerning the integration or configuration files and scripts (Travis, Ansible, BrowserStack ...)

- `✨ (:sparkles:)`-> Added new functionality

- `🐛 (:bug:)`-> Bug fix

- `⚡️ (:zap:)`-> Performance improvement

- `♻️ (:recycle:)`-> Modifications which brings neither new functionality nor performance improvement

- `💄 (:lipstick:)`-> Changes that brings no functional or semantic alteration (indentation, formatting, adding space, renaming of a variable ...)

- `⬆️ (:arrow_up:)`-> Internal dependency upgrade

- `📝 (:memo:)`-> Writing or updating documentation

- `✅ (:white_check_mark:)`-> Adding or modifying tests

- The `scope` should define the context of the affected changes.

- The `message` summaries description of the change in one sentence.

Examples:

```bash
✨ (frontend): Added /category route to access images by category.
🐛 (database): Added migration to correct category structure.
👷🏻 (backend): Added linter tests
```
