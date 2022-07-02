[![Pub Version](https://badgen.net/pub/v/signpost)](https://pub.dev/packages/signpost/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/signpost)](https://pub.dev/packages/signpost/)
[![Pub popularity](https://badgen.net/pub/popularity/signpost)](https://pub.dev/packages/signpost/score)

# Signpost

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
dart pub global activate signpost
```

### 4. Run package

```shell
cd {git-repository-path}
signpost run \
  --repo={repo} \
  --num={num} \
  --base={base} \
  --head={head} \
  --dir={dir}
```
