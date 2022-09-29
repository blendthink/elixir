## 2.0.1

### Fixed

- Fixed to always delete previous comments.

## 2.0.0

### Changed

- Changed to use "Create a review for a pull request" API.
  - https://docs.github.com/en/rest/pulls/reviews#create-a-review-for-a-pull-request
- Changed to use `dart analyze --format=machine` command.

### Improved

- Supported for Dart SDK 2.15.0.
- Reduced dependent packages.

## 1.0.6

### Fixed

- Fixed `ReviewComment` `line` to nullable.
- Fixed to not use `hashCode` to determine equivalence.

### Improved

- If no issues found, we tried to avoid running unnecessary processes and to output the appropriate logs.

## 1.0.5

### Fixed

- Fixed to filter comments by `diagHashCode` to see if they are identical.

## 1.0.4

### Fixed

- Fixed filter by elixir on whether the comment is a comment or not.

## 1.0.3

### Fixed

- Avoided writing `${{ github.token }}` in the description of GitHub Action.
- Added `RunCommand` in `ElixirCommandRunner`.
- Changed head option abbr to `c`.
- Fixed String to int cast failure.
- Fixed ignore analyze error.
- Fixed `grep` command failure.
- Use `original_commit_id` instead of `commit_id`.

## 1.0.2

### Fixed

- Unify GitHub Action and pub package versions.

## 1.0.1

### Fixed

- Rename GitHub Action's name to 'Elixir for Dart Analyzer'.

## 1.0.0

- Initial release 🎉 
