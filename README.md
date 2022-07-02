[![Pub Version](https://badgen.net/pub/v/signpost)](https://pub.dev/packages/signpost/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/signpost)](https://pub.dev/packages/signpost/)
[![Pub popularity](https://badgen.net/pub/popularity/signpost)](https://pub.dev/packages/signpost/score)

# Signpost

A command-line tool for commenting `dart analyze` results to GitHub PullRequest.

## Usage

```shell
# https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

# https://github.com/cli/cli#installation

dart pub global activate signpost
signpost run \
  --repo={repo} \
  --num={num} \
  --base={base} \
  --head={head} \
  --dir={dir}
```
