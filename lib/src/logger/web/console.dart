import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/logger/web/web.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends WebLogger {
  ConsoleLogger({
    super.filter,
    super.level,
    final LoggerTheme? theme,
  }) : super(
          theme: theme ?? LoggerTheme(colorMap: LoggerTheme.defaultColorMap),
        );
}
