# Trace


[![Pub Version](https://img.shields.io/pub/v/trace?color=blue&logo=dart)](https://pub.dev/packages/trace)
[![Pub Publisher](https://img.shields.io/pub/publisher/trace)](https://pub.dev/publishers/nikosportolos.com/packages)
[![Pub Points](https://img.shields.io/pub/points/trace?color=blue&logo=dart)](https://pub.dev/packages/trace)

[![Build](https://github.com/nikosportolos/trace/actions/workflows/build.yml/badge.svg)](https://github.com/nikosportolos/trace/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/nikosportolos/trace/graph/badge.svg?token=EA0DRM7F67)](https://codecov.io/gh/nikosportolos/trace)
[![Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**Trace** is a minimalistic logger for your Dart & Flutter projects, that uses 
[AnsiX](https://pub.dev/ansix) to print customizable messages in terminal and export log files. 


## Table of contents

- [How to use](#how-to-use)
  - [Filter](#filter)
  - [Format](#format)
- [Loggers](#loggers)
  - [Console](#console)
  - [File](#file)
  - [Silent](#silent)
- [Examples](#examples)
- [Contribution](#contribution)
- [Changelog](#changelog)


## How to use


- ### Filter


- ### Format


## Loggers

- ### Console

- ### File

- ### Silent
 


## Examples

```dart
import 'package:trace/trace.dart';

void main() async {
  Trace.registerLogger(
    ConsoleLogger(),
  );

  Trace.verbose('This is a verbose test message');
  Trace.debug('This is a debug test message');
  Trace.info('This is an info test message');
  Trace.warning('This is a warning test message');
  Trace.error(
    'This is an error test message',
    Exception('Random exception'),
    StackTrace.current,
  );
  Trace.fatal(
    'This is a fatal test message',
    Exception('Critical exception'),
    StackTrace.current,
  );

  await Trace.dispose();
}
```

<a href="https://raw.githubusercontent.com/nikosportolos/trace/main/assets/images/examples.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/trace/main/assets/images/examples.png" width="300" alt="examples">
</a>



You can also check the [example](https://github.com/nikosportolos/trace/tree/main/example) folder for more samples.


## Contribution

Check the [contribution guide](https://github.com/nikosportolos/trace/tree/main/CONTRIBUTING.md)
if you want to help with **Trace**.


## Changelog

Check the [changelog](https://github.com/nikosportolos/trace/tree/main/CHANGELOG.md)
to learn what's new in **Trace**.
