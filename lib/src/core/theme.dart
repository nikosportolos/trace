import 'package:ansix/ansix.dart';
import 'package:trace/src/core/level.dart';

typedef LevelThemeMap = Map<LogLevel, FormatTheme>;

/// **FormatTheme**
///
/// Defines how each log section should be formatted.
class FormatTheme {
  const FormatTheme({
    required this.timestampTheme,
    required this.levelTheme,
    required this.messageTheme,
    required this.errorTheme,
    required this.stacktraceTheme,
  });

  final AnsiTextTheme timestampTheme;
  final AnsiTextTheme levelTheme;
  final AnsiTextTheme messageTheme;
  final AnsiTextTheme errorTheme;
  final AnsiTextTheme stacktraceTheme;

  static const AnsiTextTheme _defaultTextTheme = AnsiTextTheme(fixedWidth: 30);

  /// **DefaultTheme**
  ///
  /// The default [FormatTheme] used by [Trace].
  static const FormatTheme defaultTheme = FormatTheme(
    timestampTheme: _defaultTextTheme,
    levelTheme: AnsiTextTheme(fixedWidth: 10),
    messageTheme: _defaultTextTheme,
    errorTheme: _defaultTextTheme,
    stacktraceTheme: _defaultTextTheme,
  );

  /// **FormatTheme.create**
  ///
  /// Custom [FormatTheme] factory that creates a new instance based on the input colors.
  factory FormatTheme.create({
    final AnsiColor foregroundColor = AnsiColor.none,
    final AnsiColor backgroundColor = AnsiColor.none,
  }) {
    final AnsiTextTheme baseTheme = AnsiTextTheme(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      fixedWidth: 30,
    );
    return FormatTheme(
      timestampTheme: baseTheme,
      levelTheme: baseTheme.copyWith.fixedWidth(10),
      messageTheme: baseTheme,
      errorTheme: baseTheme,
      stacktraceTheme: baseTheme,
    );
  }

  /// **StandardThemeMap**
  ///
  /// The default [LevelThemeMap] with no ANSI formatting.
  static final LevelThemeMap standardThemeMap = <LogLevel, FormatTheme>{
    LogLevel.verbose: FormatTheme.defaultTheme,
    LogLevel.debug: FormatTheme.defaultTheme,
    LogLevel.info: FormatTheme.defaultTheme,
    LogLevel.warning: FormatTheme.defaultTheme,
    LogLevel.error: FormatTheme.defaultTheme,
    LogLevel.fatal: FormatTheme.defaultTheme,
  };

  /// **AnsiThemeMap**
  ///
  /// [LevelThemeMap] with ANSI formatting.
  static final LevelThemeMap ansiThemeMap = <LogLevel, FormatTheme>{
    LogLevel.verbose: FormatTheme.create(
      foregroundColor: AnsiColor.grey74,
    ),
    LogLevel.debug: FormatTheme.create(
      foregroundColor: AnsiColor.skyBlue3,
    ),
    LogLevel.info: FormatTheme.create(
      foregroundColor: AnsiColor.dodgerBlue1,
    ),
    LogLevel.warning: FormatTheme.create(
      foregroundColor: AnsiColor.orange3,
    ),
    LogLevel.error: FormatTheme.create(
      foregroundColor: AnsiColor.red,
    ),
    LogLevel.fatal: FormatTheme.create(
      foregroundColor: AnsiColor.mediumPurple6,
    ),
  };
}
