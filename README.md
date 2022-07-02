[![Pub Version](https://badgen.net/pub/v/elixir)](https://pub.dev/packages/elixir/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/elixir)](https://pub.dev/packages/elixir/)
[![Pub popularity](https://badgen.net/pub/popularity/elixir)](https://pub.dev/packages/elixir/score)

# Elixir

A command-line tool for commenting `dart analyze` results to GitHub PullRequest.

## Usage

This package uses Git and GitHub CLI internally.

If you are using GitHub Actions, you can skip steps 1 and 2.

### 1. Install Git

https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

### 2. Install GitHub CLI

https://github.com/cli/cli#installation

### 3. Active package

```shell
dart pub global activate elixir
```

### 4. Run package

```shell
cd {git-repository-path}
elixir run \
  --repo={repo} \
  --num={num} \
  --base={base} \
  --head={head} \
  --dir={dir}
```
