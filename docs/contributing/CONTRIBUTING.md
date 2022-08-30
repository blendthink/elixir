# Welcome to contributing guide

Thank you for investing your time in contributing to our project!

Read our [Code of Conduct] to keep our community approachable and respectable.

## Setup

### Open project

Open project using [IntelliJ IDEA].

### Install Dart SDK

Basically, we develop with the latest stable version. [Get the Dart SDK]

After installation, check the version.

```shell
dart --version
```

### Install dependencies 

```shell
dart pub get
```

### Debug

Use [Run/debug configurations] in [IntelliJ IDEA].\
Please make use of the shared configuration file [elixir.dart.run.xml].

> **Warning**\
> Please set the necessary values for 'Program arguments' in [Run/debug configurations].
> e.g. `--version`

[Breakpoints] allow you to pause program execution at a specific point and examine the state and behavior of the program, which can be very useful.

## Contributing

For simple fixes such as typos and additions to test code, no problem to submit a pull request without creating an issue.

### Open a new Issue

Search if an issue already exists.\
If a related issue doesn't exist, you can open a new issue using a relevant [issue form].


### Commit your update

Once your changes are ready, don't forget to [SELF_REVIEW] speed up the review process.

### Submit a Pull Request

When you're finished with the changes, create a pull request, also known as a PR.

### Your PR is merged!

Congratulations 🎉🎉 Thanks you ✨

<!-- Links -->
[Code of Conduct]: ../CODE_OF_CONDUCT.md
[IntelliJ IDEA]: https://www.jetbrains.com/idea
[Get the Dart SDK]: https://dart.dev/get-dart
[Run/debug configurations]: https://www.jetbrains.com/help/idea/run-debug-configuration.html
[elixir.dart.run.xml]: ../../.run/elixir.dart.run.xml
[Breakpoints]: https://pleiades.io/help/idea/using-breakpoints.html
[issue form]: https://github.com/blendthink/elixir/issues/new/choose
[SELF_REVIEW]: SELF_REVIEW.md
