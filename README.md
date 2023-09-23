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

> This is a pre-release version of **Trace**, so using it in a 
> production environment is not recommended yet.


<a href="https://raw.githubusercontent.com/nikosportolos/trace/main/assets/images/examples.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/trace/main/assets/images/examples.png" width="750" alt="trace-example">
</a>


## Table of contents

- [Usage](#usage)
  - [Trace](#trace-1)
    - [Register/unregister loggers](#registerunregister-loggers)
    - [Log Levels](#log-levels)
    - [Logging methods](#logging)
    - [Stream](#stream)
    - [Dispose](#dispose)
  - [Loggers](#loggers)
    - [Console](#console)
    - [File](#file)
  - [Customization](#customization)
    - [Filter](#filter)
      - [Rules](#rules)
    - [Theme](#theme)
- [Examples](#examples)
- [Contribution](#contribution)
- [Changelog](#changelog)


## Usage

  ### Trace

  **Trace** is a global static class that handles all logging.

  All you need to do is register your desired loggers, 
  customize them if you want and just use the Trace [logging methods](#logging).


  #### Register/unregister loggers

  ```dart
  final Logger logger = ConsoleLogger();
  
  // Register a new console logger
  Trace.registerLogger(logger);
  
  // Unregister the console logger
  Trace.unregisterLogger(logger);
  ```
  
  #### Logging

  ```dart
    Trace.verbose('This is a verbose test message');
    Trace.debug('This is a debug test message');
    Trace.info('This is an info test message');
    Trace.success('This is a success test message');
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
  ```


  #### Log levels

| # | Level   | Description                                                                                                                                                                     |
|---|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0 | none    | No logs will be displayed when this log level is selected.                                                                                                                      |
| 1 | verbose | This log level typically refers to a higher level of detail than the "DEBUG" log level and is used to provide even more information for troubleshooting and debugging purposes. |
| 2 | debug   | This log level is used to provide detailed debugging information that is only useful for developers during the development process.                                             |
| 3 | info    | This log level is used to provide general information about the state  of the system or program, such as when it starts or stops.                                               |
| 4 | success | This log level is used to provide general information about the state of the system or program, such as when it starts or stops.                                                |
| 5 | warning | This log level is used to indicate potential issues or errors that could cause problems, but are not critical.                                                                  |
| 6 | error   | This log level is used to indicate errors that have occurred, but are not fatal to the system or program.                                                                       |
| 7 | fatal   | This log level is used to indicate critical errors that could cause the system or program to fail or crash.                                                                     |


  #### Stream

  ```dart
  Trace.stream.listen((LogEntry entry) {
    // Custom log entry handling
  });
  ```

  #### Dispose

  > Don't forget to dispose Trace so there's no memory leaks, especially when using [FileLogger]. 

  ```dart
  await Trace.dispose();
  ```


  ### Loggers

  - #### Console

  ```dart
  ConsoleLogger({
    final IOSink? ioSink,
    super.filter,
    super.level,
    final LoggerTheme? theme,
  })
  ```

  - #### File

  ```dart
  FileLogger({
    final String? path,
    final String? filename,
    final LoggerTheme? theme,
    super.filter,
    super.level,
  }) 
  ```

  ### Customization

  #### Filter

  Defines a set of rules based on which it will be decided if the logger should print the message.

  ```dart
  LogFilter({this.rules})
  ```


You can also check the [custom_filter.dart](https://github.com/nikosportolos/trace/tree/main/example/custom_filter.dart) 
in the [examples](https://github.com/nikosportolos/trace/tree/main/example) folder for a usage sample.

  ##### Rules

  A **FilterRule** decides whether a log message should be printed or not.

  ```dart
  // Default out-of-the-box rules provided by Trace.

  /// Returns a new instance of [DebugFilterRule].
  factory FilterRule.debug() => const DebugFilterRule();
  
  /// Returns a new instance of [LevelFilterRule].
  factory FilterRule.level(final LogLevel level) => LevelFilterRule(level);
  
  /// Returns a new instance of [ErrorTypeFilterRule].
  factory FilterRule.error(final Type type) => ErrorTypeFilterRule(type);
  ```
    
  
  #### Theme
A collection of properties used by [Trace] in order to format the log messages.

- **colorMap**

  A map of [AnsiColor] for each [LogLevel](#log-levels).

- **timestampFormat**

  The format that will be used to print the timestamp of the log entry.

  Defaults to [H:i:s.vu].

  Accepts the following standard notations:
  - `d` : Day of month (01 - 31)  - `j` : Day of month, without leading 0s (1 - 31)
  - `D` : An abbreviated textual representation of a day (Mon - Sun)
  - `l` : A textual representation of a day (Monday - Sunday)
  - `S` : Suffix of a day (st, th, nd)
  - `z` : The day of the year (starting from 0)
  - `F` : A textual representation of a month (January - December)
  - `M` : An abbreviated textual representation of a month (Jan - Dec)
  - `m` : Numeric representation of a month (01 - 12)
  - `n` : Numeric representation of a month, without leading 0s (1 - 12)
  - `Y` : Full numeric representation of a year (e.g. 2019)
  - `y` : A two digit representation of a year (e.g. 19)
  - `a` : Ante meridiem and post meridiem, lowercase (am or pm)
  - `A` : Ante meridiem and post meridiem, uppercase (AM or PM)
  - `g` : 12-hour format of an hour, without leading 0s (1 - 12)
  - `h` : 12-hour format of an hour (01 - 12)
  - `G` : 24-hour format of an hour, without leading 0s (0 - 23)
  - `H` : 24-hour format of an hour (00 - 23)
  - `i` : Minutes (0 - 59)
  - `s` : Seconds (0 - 59)
  - `v` : Milliseconds (0 - 999)
  - `u` : Microseconds (0 - 999)
  - `e` : System time zone identifier (Returns [DateTime.timeZoneName],
    which is provided by the operating system and may be a name or abbreviation.)
  - `O` : Difference to Greenwich Time (GMT) in hours (±0000)
  - `P` : Difference to Greenwich Time (GMT) in hours with a colon (±00:00)
  - `T` : Time zone abbreviation (Identifies the time zone from [DateTime.timeZoneName].)
  - `c` : ISO 8601 date (e.g. 2019-10-15T19:42:05-08:00)
  - `r` : RFC 2822 date (Tue, 15 Oct 2019 17:42:05 -0800)
  - `U` : Seconds since Unix Epoch
  - `\` : Escape character

- **stacktraceIndent**

  Defines the amount of spaces that will be used to indent the stacktrace.

  Defaults to 4.

- **sections**

  Defines which [LogSection] will be printed and in what order.

  Defaults to [LogSection.timestamp, LogSection.level, LogSection.message]

- **timestampTheme**

  The [AnsiTextTheme] that will be used to print the timestamp of the log entry.

- **timestampFormatter**

  The [LogSectionFormatter] that will be used to format the timestamp of the log entry.

- **levelTheme**

  The [AnsiTextTheme] that will be used to print the level of the log entry.

- **levelFormatter**

  The [LogSectionFormatter] that will be used to format the level of the log entry.

- **messageTheme**

  The [AnsiTextTheme] that will be used to print the message of the log entry.

- **messageFormatter**

  The [LogSectionFormatter] that will be used to format the message of the log entry.


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
  Trace.success('This is a success test message');
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
  <img src="https://raw.githubusercontent.com/nikosportolos/trace/main/assets/images/examples.png" width="800" alt="examples">
</a>


You can also check the [example](https://github.com/nikosportolos/trace/tree/main/example) folder for more samples.


## Contribution

Check the [contribution guide](https://github.com/nikosportolos/trace/tree/main/CONTRIBUTING.md)
if you want to help with **Trace**.


## Changelog

Check the [changelog](https://github.com/nikosportolos/trace/tree/main/CHANGELOG.md)
to learn what's new in **Trace**.
