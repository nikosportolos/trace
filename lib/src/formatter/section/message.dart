part of 'section.dart';

/// **MessageFormatter**
///
/// Formats [Message] input with Ansi formatter.
class MessageFormatter extends LogSectionFormatter {
  const MessageFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.message == null) {
      return '';
    }
    return AnsiText.withTheme(
      entry.message.toString(),
      theme[entry.level]?.messageTheme ?? FormatTheme.defaultTheme.messageTheme,
    ).toString();
  }
}
